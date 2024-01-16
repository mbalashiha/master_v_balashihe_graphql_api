import fetch from "cross-fetch";
import { glob } from "glob";
import path from "path";
import fsa from "fs/promises";
import { db } from "@src/sql";
import { v4 as uuidv4 } from "uuid";

type ObjectByIndexNowUrl = {
  apiUrl: string;
  siteHost: string;
  indexNowKey: string;
  urlList: Map<
    string,
    { fullUrl: string; url: string; uuid: string; siteOrigin: string }
  >;
};
type ProductionUuidsByIndexNowType = {
  [key: string]: Array<{ uuid: string; apiUrl: string }>;
};
export const saveRevalidateRequest = async ({
  apiUrl,
  siteHost,
  siteOrigin,
  urlList,
  productionUuidsByIndexNow,
}: {
  apiUrl: string;
  siteHost: string;
  siteOrigin: string;
  urlList: string[];
  productionUuidsByIndexNow?: ProductionUuidsByIndexNowType;
}) => {
  const uuids: string[] = [];
  for (const url of urlList) {
    const uuid = uuidv4();
    const insertSomeRes = await db.query(
      `insert into index_now_request(uuid, apiUrl, siteHost, url, siteOrigin) Values(?, ?, ?, ?, ?)`,
      [uuid, apiUrl, siteHost, url, siteOrigin]
    );
    uuids.push(uuid);
    if (productionUuidsByIndexNow) {
      productionUuidsByIndexNow[apiUrl] =
        productionUuidsByIndexNow[apiUrl] || [];
      productionUuidsByIndexNow[apiUrl].push({ uuid, apiUrl });
    }
  }
  return uuids;
};

function postIndexNowApiPromise({
  apiUrl,
  siteHost,
  indexNowKey,
  urlList,
}: ObjectByIndexNowUrl): Promise<{
  apiUrl: string;
  ok: boolean;
  status: number;
  statusText: string;
  urlList: string[];
  siteHost: string;
  text: string;
  json: any;
}> {
  return new Promise(async (resolve, reject) => {
    if (urlList.size <= 0) {
      return resolve({
        apiUrl,
        ok: true,
        status: 0,
        statusText: "",
        urlList: [],
        siteHost,
        json: undefined,
        text: "",
      });
    }
    const urlListArray = Array.from(urlList.values()).map(
      (value) => value.fullUrl
    );
    try {
      const fresp = await fetch(apiUrl, {
        method: "POST",
        headers: {
          "Content-Type": "application/json; charset=utf-8",
        },
        body: JSON.stringify({
          host: siteHost,
          key: indexNowKey,
          // keyLocatio//n: "https://www.example.com/myIndexNowKey63638.html",
          urlList: urlListArray,
        }),
      });
      let text: string = "";
      let json: any;
      try {
        text = await fresp.text();
        try {
          if (text) {
            json = JSON.parse(text);
          }
        } catch (e) {}
      } catch (e: any) {
        console.error(e.message || e);
        debugger;
      }
      // console.l//og(text, json);
      // debugger;
      const indexNowStatus = fresp.status;
      if (fresp.ok) {
        // console.l//og("\nindexNow success:", {
        //   apiUrl,
        //   urlListArray,
        //   indexNowStatus,
        // });
        for (const value of Array.from(urlList.values())) {
          const { url, siteOrigin, uuid } = value;
          await db.query(
            `Update index_now_request 
                Set indexNowSended=1,
                    indexNowStatus=$indexNowStatus
                WHERE indexNowSended is Null And
                      (uuid=$uuid OR (url=$url And siteOrigin=$siteOrigin And apiUrl=$apiUrl))`,
            {
              url,
              siteOrigin,
              apiUrl,
              indexNowStatus,
              uuid,
            }
          );
        }
      }
      return resolve({
        apiUrl,
        ok: fresp.ok,
        status: fresp.status,
        statusText: fresp.statusText,
        urlList: urlListArray,
        siteHost,
        json,
        text,
      });
    } catch (e: any) {
      console.error(e.message || e);
      debugger;
      return resolve({
        apiUrl,
        ok: false,
        status: 0,
        statusText: (e.message || e).toString(),
        urlList: urlListArray,
        siteHost,
        json: undefined,
        text: "",
      });
    }
  });
}
export async function postIndexNow({
  indexNowKey,
  apiUrl,
  revalidateUuids,
}: {
  indexNowKey: string;
  apiUrl: string;
  revalidateUuids: Array<string>;
}) {
  const rows = await db.query(
    `select uuid, apiUrl, siteHost, siteOrigin, url from index_now_request where uuid in ? And indexNowSended is Null And apiUrl=?`,
    [revalidateUuids, apiUrl]
  );
  const objectByIndexNowUrl: ObjectByIndexNowUrl = {
    apiUrl,
    indexNowKey,
    siteHost: "",
    urlList: new Map(),
  };
  for (const row of rows) {
    const { uuid, apiUrl, siteHost, siteOrigin, url } = row as {
      uuid: string;
      apiUrl: string;
      siteHost: string;
      siteOrigin: string;
      url: string;
    };
    if (!apiUrl) {
      throw new Error("apiUrl can not be null.");
    }
    if (!siteOrigin) {
      throw new Error("siteOrigin can not be null.");
    }
    if (!siteHost) {
      throw new Error("siteHost can not be null.");
    }
    if (!url) {
      throw new Error("url can not be null.");
    }
    const test = await db.query(
      `select 1 from index_now_request 
         WHERE indexNowSended is Not Null And 
               created > DATE_SUB(Now(), INTERVAL 18 hour) And
               url=$url And siteOrigin=$siteOrigin And apiUrl=$apiUrl`,
      {
        url,
        siteOrigin,
        apiUrl,
      }
    );
    if (test.length <= 0) {
      if (!objectByIndexNowUrl.siteHost) {
        objectByIndexNowUrl.siteHost = siteHost;
      }
      const fullUrl = `${siteOrigin}/${url}`;
      objectByIndexNowUrl.urlList.set(fullUrl, {
        fullUrl,
        url,
        uuid,
        siteOrigin,
      });
    }
  }
  return await postIndexNowApiPromise(objectByIndexNowUrl);
}
export async function saveIndexNowRequests({
  apiUrl: inApiUrl,
  urlList,
  hostOrigin,
  NEXT_PUBLIC_PRODUCTION_SITE_ORIGIN: inNEXT_PUBLIC_PRODUCTION_SITE_ORIGIN,
}: {
  apiUrl: string | string[];
  urlList: string[];
  hostOrigin: string;
  NEXT_PUBLIC_PRODUCTION_SITE_ORIGIN?: string;
}) {
  const apiUrl: string[] = Array.isArray(inApiUrl) ? inApiUrl : [inApiUrl];
  const NEXT_PUBLIC_PRODUCTION_SITE_ORIGIN =
    inNEXT_PUBLIC_PRODUCTION_SITE_ORIGIN ||
    process.env.NEXT_PUBLIC_PRODUCTION_SITE_ORIGIN ||
    "";
  if (!NEXT_PUBLIC_PRODUCTION_SITE_ORIGIN) {
    throw new Error(
      "Posting by IndexNow protocol: no NEXT_PUBLIC_PRODUCTION_SITE_ORIGIN."
    );
  }
  if (!process.env.NEXT_PUBLIC_PRODUCTION_SITE_ORIGIN_siteHost) {
    const m = NEXT_PUBLIC_PRODUCTION_SITE_ORIGIN.match(/\/\/([^\/]+)/im);
    const siteHost = m && m[1] ? m[1] : NEXT_PUBLIC_PRODUCTION_SITE_ORIGIN;
    process.env.NEXT_PUBLIC_PRODUCTION_SITE_ORIGIN_siteHost = siteHost;
  }
  const siteHost: string =
    process.env.NEXT_PUBLIC_PRODUCTION_SITE_ORIGIN_siteHost;
  urlList = urlList.map((url) => url.replace(/^\/+|\/+$/g, ""));
  const uuids: { [key: string]: string[] } = {};
  const productionUuidsByIndexNow: ProductionUuidsByIndexNowType = {};
  if (hostOrigin && hostOrigin !== NEXT_PUBLIC_PRODUCTION_SITE_ORIGIN) {
    uuids[hostOrigin] = [];
    uuids[NEXT_PUBLIC_PRODUCTION_SITE_ORIGIN] = [];
    const localhostUuids = await saveRevalidateRequest({
      apiUrl: "",
      siteHost,
      urlList,
      siteOrigin: hostOrigin,
    });
    uuids[hostOrigin].push(...localhostUuids);
    for (const oneApiUrl of apiUrl) {
      const productionUuids2 = await saveRevalidateRequest({
        apiUrl: oneApiUrl,
        siteHost,
        urlList,
        siteOrigin: NEXT_PUBLIC_PRODUCTION_SITE_ORIGIN,
        productionUuidsByIndexNow,
      });
      uuids[NEXT_PUBLIC_PRODUCTION_SITE_ORIGIN].push(...productionUuids2);
    }
  } else {
    const siteOrigin = hostOrigin || NEXT_PUBLIC_PRODUCTION_SITE_ORIGIN;
    uuids[siteOrigin] = [];
    for (const oneApiUrl of apiUrl) {
      const currentUuids = await saveRevalidateRequest({
        apiUrl: oneApiUrl,
        siteHost,
        urlList,
        siteOrigin,
        productionUuidsByIndexNow,
      });
      uuids[siteOrigin].push(...currentUuids);
    }
  }
  return { revalidateUuids: uuids, productionUuidsByIndexNow };
}
