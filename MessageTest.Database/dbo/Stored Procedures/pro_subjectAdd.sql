/*
	描述: 發布主題

	exec pro_subjectAdd
		@title = '我是主旨'
		@content = '我是內容'
		@creatorId = '114060601'
*/

CREATE PROCEDURE [dbo].[pro_subjectAdd]
	@title NVARCHAR(20),
	@content NVARCHAR(MAX),
	@creatorId NVARCHAR(20)
AS
	INSERT INTO t_subject (f_title, f_content, f_creatorId)
	OUTPUT inserted.*
	VALUES (@title, @content, @creatorId)
RETURN 0