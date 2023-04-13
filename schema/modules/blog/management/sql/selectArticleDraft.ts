import db from "@src/sql/execute-query";
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
    if (result && result.id && result.existingArticleId) {
      const rows = await db.excuteQuery({
        query: "select * from blog_article_handle Where id=?",
        variables: [result.existingArticleId],
      });
      const existingArticle = rows && rows[0];
      if (
        existingArticle &&
        existingArticle.blogCategoryId == result.blogCategoryId &&
        existingArticle.title == result.title &&
        existingArticle.autoHandleSlug == result.autoHandleSlug &&
        existingArticle.handle == result.handle &&
        existingArticle.absURL == result.absURL &&
        existingArticle.text == result.text &&
        existingArticle.textHtml == result.textHtml &&
        existingArticle.imageId == result.imageId &&
        existingArticle.orderNumber == result.orderNumber &&
        existingArticle.keyTextHtml == result.keyTextHtml && 
        Boolean(existingArticle.notInList) == Boolean(result.notInList) &&
        Boolean(existingArticle.notSearchable) ==
          Boolean(result.notSearchable) &&
        Boolean(existingArticle.unPublished) == Boolean(result.unPublished)
      ) {
        /** try {
          const delRes = await db.excuteQuery({
            query: `delete from draft_blog_article where draftArticleId=$draftArticleId`,
            variables: {
              draftArticleId: result.draftArticleId,
            },
          });
          console.log("delete Result:", delRes);
        } catch (e: any) {
          console.error("delete Result error:", e.stack || e.message);
          debugger;
        } ** */
        result = {
          ...result,
          ...existingArticle,
          id: null,
          draftArticleId: null,
          existingArticle,
        };
      }
    }
    return result;
  } catch (e: any) {
    console.error(e.stack || e.message || e);
    debugger;
    throw e;
  }
}
