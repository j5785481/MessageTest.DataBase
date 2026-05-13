/*
	描述: 獲取留言訊息
	建立日期: 2022-01-12

	exec pro_messagesQuery
		@subjectId = null
*/

CREATE PROCEDURE [dbo].[pro_messagesQuery]
    @subjectId INT = NULL  -- 設定預設值為 NULL
AS 
BEGIN
    SET NOCOUNT ON;

    SELECT 
        s.f_id, 
        s.f_title, 
        s.f_content AS f_subjectContent, -- 避免與留言內容欄位衝突
        s.f_creatorId, 
        s.f_createdAt,
        s.f_messageCount,
        m.f_id AS f_messageId,           -- 留言 ID
        m.f_content AS f_messageContent, -- 留言內容
        m.f_userId AS f_messageUserId,
        m.f_createdAt AS f_messageCreatedAt
    FROM t_subject s WITH (NOLOCK)
    LEFT JOIN t_message m WITH (NOLOCK) ON s.f_id = m.f_subjectId
    WHERE (@subjectId IS NULL OR s.f_id = @subjectId)
    ORDER BY s.f_createdAt DESC, m.f_createdAt ASC;
END