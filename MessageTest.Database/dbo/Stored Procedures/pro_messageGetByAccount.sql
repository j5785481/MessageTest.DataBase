/*
	描述: 獲取留言訊息
	建立日期: 2022-01-12

	exec pro_messageGetByAccount
		@f_userId = '115051901'
*/

CREATE PROCEDURE [dbo].[pro_messageGetByAccount]
    @f_userId NVARCHAR(20)  -- 留言的使用者ID
AS 
	SELECT 
		f_id, f_subjectId, f_content, f_userId, f_createdAt
	FROM t_message WITH (NOLOCK)
	WHERE (f_userId = @f_userId)
RETURN 0