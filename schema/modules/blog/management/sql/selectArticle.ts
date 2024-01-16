import { db } from "@src/sql";
export type SelectArticleDraftProps = {
  managerId?: string | number | null;
  articleId?: string | number | null;
  draftArticleId?: string | null;
};
export default async function selectArticle({
  managerId,
  articleId,
  draftArticleId,
}: SelectArticleDraftProps) {
  try {
    const rows =
      articleId &&
      (await db.excuteQuery({
        query: "select * from blog_article_handle Where id=?",
        variables: [articleId],
      }));
    const result = (rows && rows[0]) || {};
    result.existingArticleId = result.existingArticleId || articleId || null;
    result.articleId = result.articleId || articleId || null;
    result.templateId = result.templateId || null;
    if (!result.templateId) {
      const rows = await db.query(
        `select templateId from article_templates Order By templateId ASC Limit 1`
      );
      result.templateId =
        rows && rows[0] && rows[0].templateId ? rows[0].templateId : 1;
    }
    return result;
  } catch (e: any) {
    console.error(e.stack || e.message || e);
    debugger;
    throw e;
  }
}
