import db from "@src/sql/execute-query";
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
    return result;
  } catch (e: any) {
    console.error(e.stack || e.message || e);
    debugger;
    throw e;
  }
}
