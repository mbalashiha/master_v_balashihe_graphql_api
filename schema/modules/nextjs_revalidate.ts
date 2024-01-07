import { createModule, gql } from "graphql-modules";
import util from "util";
import db from "@src/sql/execute-query";
import { GraphqlContext } from "@root/types/express-custom";
import { GraphQLResolveInfo } from "graphql";
import { getYaIndexNowKey } from "@src/utils/index-now/get-yandex-index-now-key";
import { postIndexNow } from "@src/utils/index-now/post-index-now";

export const nextjs_revalidate_module = createModule({
  id: "nextjs_revalidate_module",
  dirname: __dirname,
  typeDefs: [
    gql`
      type GetNextjsRevalidateResponse {
        urls: [String]!
      }
      input ProductionUuidIndexNowInput {
        uuid: String!
        apiUrl: String!
      }
      type SendIndexNowRequestResponse {
        apiUrl: String
        ok: Boolean!
        status: Int!
        statusText: String!
        urlList: [String]!
        siteHost: String
        message: String
        error: String
        code: String
      }
      type Mutation {
        sendIndexNowRequest(
          apiUrl: String!
          nodes: [ProductionUuidIndexNowInput]!
        ): SendIndexNowRequestResponse
        getNextjsRevalidateUrls(
          uuids: [String]!
          secret: String!
        ): GetNextjsRevalidateResponse
      }
    `,
  ],
  resolvers: {
    Mutation: {
      sendIndexNowRequest: async (
        parent: void,
        variables: {
          apiUrl: string;
          nodes: Array<{ uuid: string; apiUrl: String }>;
        },
        context: GraphqlContext,
        info: GraphQLResolveInfo
      ) => {
        if (!context.manager || !context.manager.id) {
          throw new Error("Manager Unauthorized");
        }
        const { apiUrl: requestApiUrl, nodes } = variables;
        try {
          const revalidateUuids = nodes.map(({ uuid, apiUrl: loopApiUrl }) => {
            if (loopApiUrl !== requestApiUrl) {
              throw new Error(
                "element loop apiUrl doesn't equal to apiUrl input variable!"
              );
            }
            return uuid;
          });
          const indexNowKey = await getYaIndexNowKey(requestApiUrl);
          const result = await postIndexNow({
            apiUrl: requestApiUrl,
            indexNowKey,
            revalidateUuids,
          });
          const {
            apiUrl,
            ok,
            status,
            statusText,
            urlList,
            siteHost,
            text,
            json,
          } = result;
          return {
            apiUrl,
            ok,
            status,
            statusText,
            urlList,
            siteHost,
            message:
              status && status !== 200
                ? `${apiUrl}: ${
                    json?.message
                      ? `${json?.message} (${status})`
                      : json?.error
                      ? `${json?.error} (${status})`
                      : json?.code
                      ? `${json?.code} (${status})`
                      : statusText
                      ? `${statusText} (${status})`
                      : status
                      ? status
                      : ""
                  }`
                : null,
            error: ok
              ? null
              : json?.error ||
                json?.message ||
                json?.code ||
                statusText ||
                status ||
                text,
            json,
            code: json?.code,
          };
        } catch (e: any) {
          console.error(e.stack || e.message || e.stack || e);
          let errorMessage = e.message || e.stack || e;
          throw e;
        } finally {
          
        }
      },
      getNextjsRevalidateUrls: async (
        parent: void,
        variables: {
          uuids: string[];
          secret: string;
        },
        context: void,
        info: void
      ) => {
        const { uuids, secret } = variables;
        if (secret !== process.env.MY_SECRET_TOKEN) {
          throw new Error("Unautherized.");
        }
        const urls = new Set<string>();
        for (const uuid of uuids) {
          const rows = await db.query(
            `select url from index_now_request where uuid=? And revalidated is Null`,
            [uuid]
          );
          const url = rows && rows[0] && rows[0].url;
          if (url) {
            urls.add(url);
            await db.query(
              `Update index_now_request Set revalidated=1 where uuid=? And revalidated is Null`,
              [uuid]
            );
          }
        }
        return { urls: Array.from(urls) };
      },
    },
  },
});
