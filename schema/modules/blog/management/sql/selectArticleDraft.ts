import { db } from "@src/sql";
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
        query: `select d.* from draft_blog_article_view d 
                    Where d.draftArticleId=unhex($draftArticleId)`,
        variables: { draftArticleId },
      });
      if (!rows[0] || !rows[0].id) {
        throw new Error("Incorrect article Draft id!");
      }
    }
    if (articleId) {
      rows = await db.excuteQuery({
        query: `select d.* from draft_blog_article_view d 
                    Where d.isDraftSaved is Null And d.existingArticleId=$articleId And d.managerId=$managerId`,
        variables: { articleId, managerId },
      });
      if (!rows[0] || !rows[0].id) {
        rows = await db.excuteQuery({
          query: `select ba.* from null_draft_blog_article ba Where ba.existingArticleId=$articleId`,
          variables: { articleId, managerId },
        });
      }
    } else {
      rows = await db.excuteQuery({
        query: `select d.* from draft_blog_article_view d 
                    Where d.isDraftSaved is Null And d.existingArticleId Is NULL And d.managerId=$managerId`,
        variables: { articleId, managerId },
      });
    }
    const isEmpty = !(rows[0] && (rows[0].id || rows[0].existingArticleId));

    let result;
    if (isEmpty) {
      result = {
        id: null,
        existingArticleId: articleId || null,
        articleId: articleId || null,
      };
    } else {
      result = rows[0];
    }
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
