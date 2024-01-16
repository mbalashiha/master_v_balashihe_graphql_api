import { createModule, gql } from "graphql-modules";
import util from "util";
import { db } from "@src/sql";
import { GraphQLError, GraphQLResolveInfo } from "graphql";

export const BlogArticleTemplatesModule = createModule({
  id: "blog-article-templates",
  dirname: __dirname,
  typeDefs: [
    gql`
      type ArticleTemplate {
        templateId: ID
        templateName: String
        lastUsed: Int
      }
      type Query {
        managementArticleTemplates(articleId: ID): [ArticleTemplate]
      }
    `,
  ],
  resolvers: {
    Mutation: {},
    Query: {
      managementArticleTemplates: async (
        parent: void,
        variables: void,
        context: { manager: { id: string | number } },
        info: GraphQLResolveInfo
      ) => {
        if (!context.manager || !context.manager.id) {
          throw new GraphQLError("Manager Unauthorized");
        }
        const managerId = context.manager.id;
        return await db.excuteQuery({
          query: `select t.templateId, t.templateName, IF(l.templateId is not null, 1, null) as lastUsed from article_templates t
                        Left Join last_used_article_template l On managerId=$managerId And l.templateId=t.templateId`,
          variables: { managerId },
        });
      },
    },
  },
});
