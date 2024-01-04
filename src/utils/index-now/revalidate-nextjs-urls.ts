const nextjsRevalidateRequest = async ({
  apiUrl,
  postBody,
}: {
  apiUrl: string;
  postBody: string;
}) => {
  const response = await fetch(apiUrl, {
    method: "POST",
    headers: {
      "Content-Type": "application/json; charset=utf-8",
    },
    body: postBody,
  });
  let text: string = "";
  let json: any;
  try {
    text = await response.text();
  } catch (e) {}
  try {
    if (text) {
      json = JSON.parse(text);
    }
  } catch (e) {}
  return {
    ok: response.ok,
    status: response.status,
    text,
    json,
    statusText: response.statusText,
  };
};
export const revalidateNextjsUrls = async ({
  hostOrigin,
  NEXT_PUBLIC_PRODUCTION_SITE_ORIGIN,
  revalidateUuids,
  secret,
}: {
  hostOrigin: string;
  NEXT_PUBLIC_PRODUCTION_SITE_ORIGIN: string;
  revalidateUuids: {
    [key: string]: string[];
  };
  secret: string;
}) => {
  if (hostOrigin && hostOrigin !== NEXT_PUBLIC_PRODUCTION_SITE_ORIGIN) {
    const uuidsLocalhost = revalidateUuids[hostOrigin];
    const uuidsProduction = revalidateUuids[NEXT_PUBLIC_PRODUCTION_SITE_ORIGIN];
    if (!Array.isArray(uuidsProduction)) {
      throw new Error("Not Array!");
    } else if (uuidsProduction.length <= 0) {
      throw new Error("empty");
    }
    if (!Array.isArray(uuidsLocalhost)) {
      throw new Error("Not Array!");
    } else if (uuidsLocalhost.length <= 0) {
      throw new Error("empty");
    }
    const results = await Promise.all([
      nextjsRevalidateRequest({
        apiUrl: `${hostOrigin}${process.env.REVALIDATE_API_URL}`,
        postBody: JSON.stringify({
          revalidateUuids: uuidsLocalhost,
          secret,
        }),
      }),
      nextjsRevalidateRequest({
        apiUrl: `${NEXT_PUBLIC_PRODUCTION_SITE_ORIGIN}${process.env.REVALIDATE_API_URL}`,
        postBody: JSON.stringify({
          revalidateUuids: uuidsProduction,
          secret,
        }),
      }),
    ]);
    return results;
  } else {
    const siteOrigin = hostOrigin || NEXT_PUBLIC_PRODUCTION_SITE_ORIGIN;
    const uuidsForSiteOrigin = revalidateUuids[siteOrigin];
    const fresp = await nextjsRevalidateRequest({
      apiUrl: `${siteOrigin}${process.env.REVALIDATE_API_URL}`,
      postBody: JSON.stringify({
        revalidateUuids: uuidsForSiteOrigin,
        secret,
      }),
    });
    return [fresp];
  }
};
