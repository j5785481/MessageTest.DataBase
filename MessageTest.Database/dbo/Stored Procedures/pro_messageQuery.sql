/*
	描述: 獲取留言訊息
	建立日期: 2022-01-12

	exec pro_messageQuery
		@subjectId = null
*/

CREATE PROCEDURE [dbo].[pro_messageQuery]
	@f_subjectId INT --SubjectId
AS 
SELECT 
	f_id, f_subjectId, f_content, f_userId, f_createdAt
FROM t_message WITH (NOLOCK)
WHERE (f_subjectId = @f_subjectId)
RETURN 0