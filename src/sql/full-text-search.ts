import db from "@src/sql/execute-query";
const onlyLettersRegexp = new RegExp("[^\\p{L}\\d]+", "gimu");
const keepOnlyLetters = (search: string): string => {
  onlyLettersRegexp.lastIndex = 0;
  return search.replaceAll(onlyLettersRegexp, " ");
};
const oneSearchWordReg = (search: string): RegExp[] => {
  try {
    const lett = keepOnlyLetters(search)
      .split(" ")
      .filter((el) => Boolean(el.length))
      .map((el) => new RegExp(el, "imu"));
    return lett;
  } catch (e: any) {
    console.error(e.stack || e.message || e);
    return [];
  }
};
const checkIsBooleanModeTextQuery = (search: string) => {
  return (
    /^\-[^-]+/im.test(search) ||
    / \-[^-]+/im.test(search) ||
    search.includes("*") ||
    search.includes("+")
  );
};
const normalizeNumber = (val: number, max: number, min: number): number =>
  (val - min) / (max - min);

export const fullTextSearch = async ({
  search,
  naturalLanguageModeQuery,
  booleanModeQuery,
}: {
  search: string;
  naturalLanguageModeQuery: string;
  booleanModeQuery: string;
}) => {
  const originalSearchParam = search;
  const isBooleanMode = checkIsBooleanModeTextQuery(search);
  const resultArray = [];
  if (!isBooleanMode) {
    const articles: any = await db.excuteQuery({
      query: naturalLanguageModeQuery,
      variables: { search },
    });
    resultArray.push(...articles);
  } else {
    try {
      const articles: any = await db.excuteQuery({
        query: booleanModeQuery,
        variables: { search },
      });
      resultArray.push(...articles);
    } catch (e: any) {}
  }
  if (!isBooleanMode && resultArray.length <= 4) {
    search = keepOnlyLetters(search);
    let searchAttempt = search
      .split(/[\s]+/gim)
      .filter((str) => Boolean(str.length))
      .map((str) => `+${str}*`)
      .join(" ");
    const articles: any = await db.excuteQuery({
      query: booleanModeQuery,
      variables: { search: searchAttempt },
    });
    resultArray.push(...articles);
  }
  if (!isBooleanMode && resultArray.length <= 4) {
    let searchAttempt = search
      .split(/[\s]+/gim)
      .filter((str) => Boolean(str.length))
      .map((str) => `${str}*`)
      .join(" ");
    const articles: any = await db.excuteQuery({
      query: booleanModeQuery,
      variables: { search: searchAttempt },
    });
    resultArray.push(...articles);
  }
  if (isBooleanMode && resultArray.length <= 0) {
    try {
      const articles: any = await db.excuteQuery({
        query: naturalLanguageModeQuery,
        variables: { search: originalSearchParam },
      });
      resultArray.push(...articles);
    } catch (e: any) {}
  }
  const scoreArray = resultArray
    .map((elem: { score: number }) => {
      if (elem) {
        return elem.score;
      } else {
        return undefined as any as number;
      }
    })
    .filter((score: any) => typeof score === "number");
  const min = Math.min(...scoreArray);
  const max = Math.max(...scoreArray);
  console.log("min:", min, "max:", max);
  const searchWords: RegExp[] = resultArray.length
    ? oneSearchWordReg(search)
    : [];
  resultArray.forEach((elem: { score: number; fragment: string | null }) => {
    if (typeof elem.score === "number") {
      const before = elem.score;
      elem.score = normalizeNumber(elem.score, max, min);
      if (Number.isNaN(elem.score)) {
        elem.score = before;
      }
      elem.score = Math.round(elem.score * 1000) / 1000;
    }
  });
  const tempMap = new Map<string, any>();
  for (const el of resultArray) {
    if (!el.id) {
      throw new Error('These is no entity id from mysql full text search rows.');
    }
    const fromMap = tempMap.get(el.id);
    if (!fromMap || fromMap.score < el.score) {
      tempMap.set(el.id, el);
    }
  }
  const finalResult = Array.from(tempMap.values());
  finalResult.forEach((elem: { score: number; fragment: string | null }) => {
    if (elem.fragment) {
      elem.fragment = elem.fragment.replace(/\s+/gim, " ");
      let matched = false;
      for (const r of searchWords) {
        const index = elem.fragment.search(r);
        if (index >= 0) {
          elem.fragment = elem.fragment.substring(index).substring(0, 236);
          elem.fragment = elem.fragment.substring(
            0,
            elem.fragment.lastIndexOf(" ")
          );
          matched = true;
          break;
        }
      }
      if (!matched) {
        elem.fragment = null;
      }
    }
  });
  return finalResult;
};
