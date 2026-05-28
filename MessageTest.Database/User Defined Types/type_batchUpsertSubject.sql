/*
	描述: 訊息
	建立日期: 2022-03-03
*/

CREATE TYPE [dbo].[type_batchUpsertSubject] AS TABLE (
	[f_id]			INT				NOT NULL,
	[f_title]		NVARCHAR(20)	NOT NULL,
	[f_content]		NVARCHAR(MAX)	NOT NULL,
	[f_creatorId]	NVARCHAR(20)	NOT NULL,
	[f_createdAt]	DATETIME2(7)	NOT NULL,
	[f_messageCount] INT			NOT NULL);
GO

GRANT EXECUTE
    ON TYPE::[dbo].[type_batchUpsertSubject] TO PUBLIC;
GO