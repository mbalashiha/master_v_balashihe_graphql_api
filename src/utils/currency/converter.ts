import fsa from "fs/promises";
import path from "path";
import {
  BROWSER_API_URL,
  CB_CURRENCIES_URL,
  CURRENCIES_STORAGE_KEY,
} from "./converter-consts";
import { replacer, reviver } from "@src/utils/json/json-map-reviver";
export type CurrencySearchElement = {
  cource: number;
  currencyCode: string;
  trStartIndex: number;
  trEndIndex: number;
};
import "cross-fetch/polyfill";
import Cache from "stale-lru-cache";

const getOneCurrency = (
  text: string,
  currencyNameIndex: number,
  backward: boolean
): CurrencySearchElement | null => {
  const trStartIndex: number = backward
    ? text.lastIndexOf("<tr>", currencyNameIndex)
    : text.indexOf("<tr>", currencyNameIndex);
  const trEndIndex: number = text.indexOf("</tr>", trStartIndex);
  const trSubstring: string = text.substring(trStartIndex, trEndIndex);
  if (trSubstring) {
    let m;
    const iterRegex = /\<td\>([^\<]+)\<\/td\>/gim;
    const values: string[] = [];
    let cource: number;
    while ((m = iterRegex.exec(trSubstring))) {
      const cellValue: string = m[1];
      if (cellValue) {
        values.push(cellValue.trim());
      }
    }
    if (values.length) {
      cource = parseFloat(values[values.length - 1].trim().replace(",", "."));
      const currencyCode = values[1] && values[1].trim();
      let numberOfCurrency = parseInt(values[2] && values[2].trim());
      numberOfCurrency =
        isNaN(numberOfCurrency) || numberOfCurrency <= 0 ? 1 : numberOfCurrency;
      cource =
        !isNaN(cource) && cource > 0 ? cource / numberOfCurrency : cource;
      if (
        !isNaN(cource) &&
        cource > 0 &&
        currencyCode &&
        currencyCode.length >= 2 &&
        currencyCode.length < 4
      ) {
        return {
          cource,
          currencyCode,
          trStartIndex,
          trEndIndex: backward ? trStartIndex - 5 : trEndIndex + 5,
        };
      }
    }
  }
  return null;
};
const getCurrencyBackward = (
  text: string,
  currencyNameIndex: number
): CurrencySearchElement[] => {
  const result: CurrencySearchElement[] = [];
  let elem: any = {
    trStartIndex: currencyNameIndex,
    trEndIndex: currencyNameIndex,
    cource: null,
    currencyCode: null,
  };
  while ((elem = getOneCurrency(text, elem.trEndIndex, true))) {
    result.push(elem);
  }
  return result;
};
const getCurrencyForward = (
  text: string,
  currencyNameIndex: number
): CurrencySearchElement[] => {
  const result: CurrencySearchElement[] = [];
  let elem: any = {
    trStartIndex: currencyNameIndex,
    trEndIndex: currencyNameIndex,
    cource: null,
    currencyCode: null,
  };
  elem.trEndIndex = text.indexOf("</tr>", currencyNameIndex);
  while ((elem = getOneCurrency(text, elem.trEndIndex, false))) {
    result.push(elem);
  }
  return result;
};
export type CurrencyCourcesMap = Map<
  string,
  { currencyCode: string; cource: number }
>;
const needToRefresh = (currenciesEnv) =>
  !currenciesEnv ||
  !currenciesEnv.currencies ||
  !currenciesEnv.currencies.size ||
  !currenciesEnv.modified ||
  Date.now() - currenciesEnv.modified > (6 * 60 - 1) * 60 * 1000;

export const getCurrencyCources = async (
  searchByCurrencyCode: string = "EUR"
): Promise<CurrencyCourcesMap> => {
  const cacheFilepath = path.join(
    __dirname,
    `cache.${CURRENCIES_STORAGE_KEY}.json`
  );
  let text;
  let currenciesEnv;
  const uri =
    typeof window !== "undefined" ? BROWSER_API_URL : CB_CURRENCIES_URL;
  try {
    const text = await fsa.readFile(cacheFilepath, "utf-8");
    currenciesEnv = JSON.parse(text, reviver);
  } catch (e: any) {
    console.error("getCurrencyCources:", e.stack || e.message);
  }
  if (needToRefresh(currenciesEnv)) {
    try {
      const resp = await fetch(uri);
      if (resp.status !== 200) {
        throw new Error("Response status is not OK (is not 200).");
      }
      text = await resp.text();
      currenciesEnv = {
        modified: Date.now(),
      };
    } catch (e: any) {
      console.error("getCurrencyCources:", e.stack || e.message);
    }
  }
  if (
    !text &&
    currenciesEnv &&
    currenciesEnv.currencies &&
    currenciesEnv.currencies.size
  ) {
    return currenciesEnv.currencies;
  }
  if (!searchByCurrencyCode || searchByCurrencyCode === "RUB") {
    searchByCurrencyCode = "EUR";
  }
  currenciesEnv =
    currenciesEnv && typeof currenciesEnv === "object" ? currenciesEnv : {};
  const currencyNameIndex =
    text && text.indexOf(`<td>${searchByCurrencyCode}</td>`);

  const preResult: CurrencySearchElement[] = [];
  if (currencyNameIndex >= 0) {
    preResult.push(...getCurrencyBackward(text, currencyNameIndex).reverse());
    preResult.push(...getCurrencyForward(text, currencyNameIndex));
  }
  const resultMap: Map<string, { currencyCode: string; cource: number }> =
    new Map();
  for (const elem of preResult) {
    const { currencyCode, cource } = elem;
    if (!resultMap.has(currencyCode)) {
      resultMap.set(currencyCode, { currencyCode, cource });
    }
  }
  // if (!resultMap.has("RUB")) {
  //   resultMap.set("RUB", { currencyCode: "RUB", cource: 1 });
  // }
  currenciesEnv.currencies = resultMap;
  try {
    await fsa.writeFile(cacheFilepath, JSON.stringify(currenciesEnv, replacer));
  } catch (e: any) {
    console.error("getCurrencyCources:", e.stack || e.message);
  }
  return currenciesEnv.currencies as typeof resultMap;
};
const cache = new Cache({
  maxSize: 100,
  maxAge: 6 * 60 * 60 * 1000,
  staleWhileRevalidate: 6 * 60 * 60 * 1000,
  revalidate: async function (url, callback) {
    try {
      const resp = await fetch(url);
      if (resp.status !== 200) {
        callback(resp);
      } else {
        const text = await resp.text();
        callback(null, text);
      }
    } catch (e) {
      callback(e);
    }
  },
});
cache.wrap(CURRENCIES_STORAGE_KEY, revalidate, function (error, html) {
  // Do something with cached response
});
// Only called to fetch the initial response and when the item becomes stale
async function revalidate(_, callback) {
  try {
    const map = await getCurrencyCources();
    return callback(null, map);
  } catch (e) {
    return callback(e);
  }
}
export const normalizePriceCurrency = (price: any) => {
  const currencies = cache.get(
    CURRENCIES_STORAGE_KEY
  ) as any as CurrencyCourcesMap;
  if (currencies && currencies.has(price.currencyCode)) {
    const currency = currencies.get(price.currencyCode);
    if (currency) {
      const cource = currency.cource;
      price.amount = (
        parseFloat(cource as any) * parseFloat(price.amount)
      ).toFixed(4);
      price.currencyCode = "RUB";
    }
  }
  return price;
};
