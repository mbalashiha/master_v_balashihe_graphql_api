import { saveIndexNowRequests } from "./post-index-now";
import { revalidateNextjsUrls } from "./revalidate-nextjs-urls";

export async function graphqlProductionUuidsByIndexNow({
  handlesToRevalidate,
  hostOrigin,
  NEXT_PUBLIC_PRODUCTION_SITE_ORIGIN,
}: {
  handlesToRevalidate: string[];
  hostOrigin: string;
  NEXT_PUBLIC_PRODUCTION_SITE_ORIGIN: string;
}) {
  try {
    if (
      handlesToRevalidate.length &&
      hostOrigin &&
      process.env.REVALIDATE_API_URL
    ) {
      const { revalidateUuids, productionUuidsByIndexNow } =
        await saveIndexNowRequests({
          apiUrl: [
            `https://yandex.com/indexnow`,
            `https://www.bing.com/indexnow`,
            `https://api.indexnow.org/indexnow`,
          ],
          urlList: handlesToRevalidate,
          NEXT_PUBLIC_PRODUCTION_SITE_ORIGIN,
          hostOrigin,
        });
      // const apiUrl = `${hostOrigin}${process.env.REVALIDATE_API_URL}`;
      const frespArray = await revalidateNextjsUrls({
        hostOrigin,
        NEXT_PUBLIC_PRODUCTION_SITE_ORIGIN,
        revalidateUuids,
        secret: process.env.MY_SECRET_TOKEN || "",
      });
      // console.l//og(frespArray);
      /*const indexNowKey = await getYaIndexNowKey();
            const indexNowResults = await postIndexNow({
              indexNowKey,
              revalidateUuids,
              hostOrigin,
              NEXT_PUBLIC_PRODUCTION_SITE_ORIGIN,
            });*/
      // console.l//og("indexNowResults:", indexNowResults);
      // const indexNowKey = await getYaIndexNowKey();
      // const indexNowResults = await postIndexNow({
      //   indexNowKey,
      //   revalidateUuids,
      // });
      return productionUuidsByIndexNow;
    } else {
      return null;
    }
  } catch (e: any) {
    console.error(e.stack || e.message || e);
    debugger;
    throw e;
  }
}
