/*
	描述: 訊息
	建立日期: 2022-03-03
*/

CREATE TYPE [dbo].[type_message] AS TABLE (
	[f_messageId]		NVARCHAR(36) NOT NULL);
GO

GRANT EXECUTE
    ON TYPE::[dbo].[type_message] TO PUBLIC;
GO