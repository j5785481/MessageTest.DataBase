/*
	描述: 批次刪除留言

	exec pro_messageBatchUpsert
		@id = 21ec2020-3aea-1069-a2dd-08002b30309d
*/
CREATE PROCEDURE [dbo].[pro_messageBatchUpsert]
	@BatchMessages [dbo].[type_batchMessage] READONLY -- 接收傳進來的字串型態 TVP
AS
BEGIN
	-- 步驟 1：批次更新（Update）
	-- 把實體表和傳進來的 TVP 內聯（JOIN），存在相同 f_id 的就直接更新
	UPDATE target
	SET 
		target.f_subjectId = source.f_subjectId,
		target.f_content   = source.f_content,
		target.f_userId    = source.f_userId,
		target.f_createdAt = source.f_createdAt
	OUTPUT inserted.*
	FROM t_message AS target
	INNER JOIN @BatchMessages AS source ON target.f_id = source.f_id;


	-- 步驟 2：批次新增（Insert）
	-- 完全模仿前輩的寫法，但用 LEFT JOIN 排除掉剛剛已經更新過（已存在）的 f_id
	INSERT INTO t_message (f_id, f_subjectId, f_content, f_userId, f_createdAt)
	OUTPUT inserted.*
	SELECT 
		source.f_id, 
		source.f_subjectId, 
		source.f_content, 
		source.f_userId, 
		source.f_createdAt 
	FROM @BatchMessages AS source
	LEFT JOIN t_message AS target ON source.f_id = target.f_id
	WHERE target.f_id IS NULL; -- 只挑出實體表裡面沒有的資料

	RETURN 0;
END