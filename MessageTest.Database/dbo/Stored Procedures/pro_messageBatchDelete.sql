/*
	描述: 批次刪除留言

	exec pro_messageDelete
		@id = 21ec2020-3aea-1069-a2dd-08002b30309d
*/
CREATE PROCEDURE [dbo].[pro_messageBatchDelete]
	@MessageIds [dbo].[type_message] READONLY -- 接收傳進來的字串型態 TVP
AS
	DELETE m
    OUTPUT deleted.*
    FROM t_message m 
    INNER JOIN @MessageIds ids ON m.f_id = ids.f_messageId;
RETURN 0