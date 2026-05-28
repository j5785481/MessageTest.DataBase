/*
	描述: 批次刪除留言

	exec pro_subjectBatchUpsert
		@id = 21ec2020-3aea-1069-a2dd-08002b30309d
*/
CREATE PROCEDURE [dbo].[pro_subjectBatchUpsert]
	@BatchSubjects [dbo].[type_batchUpsertSubject] READONLY -- 接收傳進來的字串型態 TVP
AS
BEGIN
	-- 步驟 1：批次更新（Update）
	-- 把實體表和傳進來的 TVP 內聯（JOIN），存在相同 f_id 的就直接更新
	UPDATE target
	SET 
		target.f_title   = source.f_title,
		target.f_content    = source.f_content,
		target.f_creatorId = source.f_creatorId,
		target.f_createdAt = source.f_createdAt,
		target.f_messageCount = source.f_messageCount
	OUTPUT inserted.*
	FROM t_subject AS target
	INNER JOIN @BatchSubjects AS source ON target.f_id = source.f_id;


	-- 步驟 2：批次新增（Insert）
	-- 完全模仿前輩的寫法，但用 LEFT JOIN 排除掉剛剛已經更新過（已存在）的 f_id
	INSERT INTO t_subject (f_title, f_content, f_creatorId)
	OUTPUT inserted.* 
	SELECT 
		source.f_title,  
		source.f_content, 
		source.f_creatorId
	FROM @BatchSubjects AS source
	LEFT JOIN t_subject AS target ON source.f_id = target.f_id
	WHERE target.f_id IS NULL; -- 只挑出實體表裡面沒有的資料

	RETURN 0;
END