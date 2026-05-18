/*
	描述: 獲取留言訊息
	建立日期: 2022-01-12

	exec pro_messagesQuery
		@subjectId = null
*/

CREATE PROCEDURE [dbo].[pro_subjectGetById]
    @f_Id INT = NULL  -- 設定預設值為 NULL
AS 
SELECT 
	f_id, f_title, f_content, f_creatorId, f_createdAt, f_messageCount
FROM t_subject WITH (NOLOCK)
WHERE (@f_Id IS NULL OR f_id = @f_Id)
RETURN 0