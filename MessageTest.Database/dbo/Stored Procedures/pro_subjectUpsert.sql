/*
	描述: Upsert主題

	exec pro_subjectUpsert
		@title = '我是主旨'
		@content = '我是內容'
		@creatorId = '114060601'
*/

CREATE PROCEDURE [dbo].[pro_subjectUpsert]
	@f_id			INT,
	@f_title		NVARCHAR(20),
	@f_content		NVARCHAR(MAX),
	@f_creatorId	NVARCHAR(20),
	@f_messageCount INT
AS
IF EXISTS (SELECT 1 FROM t_subject WITH (NOLOCK) WHERE f_id = @f_id)
	BEGIN
		UPDATE t_subject WITH (ROWLOCK) SET
			f_title = @f_title,
			f_content = @f_content,
			f_creatorId = @f_creatorId,
			f_messageCount = @f_messageCount
		OUTPUT inserted.*
		WHERE f_id = @f_id
	END
	ELSE
	BEGIN
		INSERT INTO t_subject (f_title, f_content, f_creatorId)
		OUTPUT inserted.*
		VALUES (@f_title, @f_content, @f_creatorId)
	END
RETURN 0