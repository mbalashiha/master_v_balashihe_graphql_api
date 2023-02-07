import db from "@src/db/execute-query";
export type SelectArticleDraftProps = {
  managerId?: string | number | null;
  articleId?: string | number | null;
  draftArticleId?: string | null;
};
export default async function selectArticleDraft({
  managerId,
  articleId,
  draftArticleId,
}: SelectArticleDraftProps) {
  try {
    let rows: any;
    if (draftArticleId) {
      rows = await db.excuteQuery({
        query: `select Lower(Hex(d.draftArticleId)) as id, d.* from draft_blog_article d 
                    Where d.draftArticleId=unhex($draftArticleId)`,
        variables: { draftArticleId },
      });
      if (!rows[0] || !rows[0].id) {
        throw new Error("Incorrect article Draft id!");
      }
    }
    if (articleId) {
      rows = await db.excuteQuery({
        query: `select Lower(Hex(d.draftArticleId)) as id, d.* from draft_blog_article d 
                    Where d.isDraftSaved is Null And d.existingArticleId=$articleId And d.managerId=$managerId`,
        variables: { articleId, managerId },
      });
      if (!rows[0] || !rows[0].id) {
        rows = await db.excuteQuery({
          query: `select d.articleId as id, d.articleId as existingArticleId, 
                      d.* from blog_article d Where d.articleId=$articleId`,
          variables: { articleId, managerId },
        });
      }
    } else {
      rows = await db.excuteQuery({
        query: `select Lower(Hex(d.draftArticleId)) as id, d.* from draft_blog_article d 
                    Where d.isDraftSaved is Null And d.existingArticleId Is NULL And d.managerId=$managerId`,
        variables: { articleId, managerId },
      });
    }
    let result = rows[0] && rows[0].id && rows[0];
    // debugger;
    if (!result) {
      result = { id: null, existingArticleId: articleId || null };
    }
    return result;
  } catch (e: any) {
    console.error(e);
    debugger;
    throw e;
  }
}
