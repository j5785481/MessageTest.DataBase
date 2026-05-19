/*
	描述: 獲取留言訊息
	建立日期: 2022-01-12

	exec pro_messageCountIncrement
		@f_subjectId = 1
*/

CREATE PROCEDURE [dbo].[pro_messageCountIncrement]
    @f_subjectId INT  -- 主題ID
AS 
	UPDATE t_subject
	SET f_messageCount = f_messageCount + 1
	OUTPUT inserted.f_messageCount AS UpdatedCount
	WHERE (f_id = @f_subjectId)
RETURN 0