import fetch from "cross-fetch";
import { glob } from "glob";
import path from "path";
import fsa from "fs/promises";

export async function postIndexNow({
  apiUrl,
  indexNowKey,
  urlList,
}: {
  apiUrl: string;
  indexNowKey: string;
  urlList: string[];
}) {
  const NEXT_PUBLIC_PRODUCTION_SITE_ORIGIN =
    process.env.NEXT_PUBLIC_PRODUCTION_SITE_ORIGIN || "";
  if (!NEXT_PUBLIC_PRODUCTION_SITE_ORIGIN) {
    throw new Error(
      "Posting by IndexNow protocol: no NEXT_PUBLIC_PRODUCTION_SITE_ORIGIN."
    );
  }
  const m = NEXT_PUBLIC_PRODUCTION_SITE_ORIGIN.match(/\/\/([^\/]+)/im);
  const siteHost = m && m[1] ? m[1] : NEXT_PUBLIC_PRODUCTION_SITE_ORIGIN;
  urlList = urlList.map(
    (url) =>
      `${NEXT_PUBLIC_PRODUCTION_SITE_ORIGIN}/${url.replace(/^\/+|\/+$/g, "")}`
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
        urlList,
      }),
    });
    let text: string = "";
    let json: any;
    try {
      text = await fresp.text();
      try {
        json = JSON.parse(text);
      } catch (e) {}
    } catch (e: any) {
      console.error(e.message || e);
      debugger;
    }
    // console.l//og(text, json);
    // debugger;
    return {
      text,
      json,
      ok: fresp.ok,
      status: fresp.status,
      statusText: fresp.statusText,
      urlList,
      siteHost,
    };
  } catch (e: any) {
    console.error(e.message || e);
    debugger;
    return {
      text: "",
      json: undefined,
      ok: false,
      status: 0,
      statusText: (e.message || e).toString(),
      urlList,
      siteHost,
    };
  }
}
