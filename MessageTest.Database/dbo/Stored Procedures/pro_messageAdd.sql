/*
	描述: 發布主題

	exec pro_messageAdd
		@userId = '115051801'
		@content = '我是留言'
		@subjectId = 1
		@id = 21ec2020-3aea-1069-a2dd-08002b30309d
*/

CREATE PROCEDURE [dbo].[pro_messageAdd]
	@f_userId NVARCHAR(20),
	@f_content NVARCHAR(MAX),
	@f_subjectId INT,
	@f_id UNIQUEIDENTIFIER
AS
	INSERT INTO t_message (f_userId, f_content, f_subjectId, f_id)
	OUTPUT inserted.*
	VALUES (@f_userId, @f_content, @f_subjectId, @f_id);
RETURN 0