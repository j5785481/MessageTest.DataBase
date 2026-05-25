/*
	描述: 獲取留言訊息
	建立日期: 2022-01-12

	exec pro_subjectGetByIds
		@subjectId = null
*/

CREATE PROCEDURE [dbo].[pro_subjectGetByIds]
	@SubjectIds [dbo].[type_batchGetByIdsSubject] READONLY
AS 
SELECT 
	f_id, f_title, f_content, f_creatorId, f_createdAt, f_messageCount
FROM t_subject s WITH (NOLOCK)
INNER JOIN @SubjectIds ids ON s.f_id = ids.f_subjectId;
RETURN 0