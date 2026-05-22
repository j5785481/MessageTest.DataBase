/*
	描述: 訊息
	建立日期: 2022-03-03
*/

CREATE TYPE [dbo].[type_batchMessage] AS TABLE (
	[f_id]			NVARCHAR(36)	NOT NULL,
	[f_subjectId]	INT					NOT NULL,
	[f_content]		NVARCHAR(100)		NOT NULL,
	[f_userId]		NVARCHAR(20)		NOT NULL,
	[f_createdAt]		DATETIME2(7) NOT NULL);
GO

GRANT EXECUTE
    ON TYPE::[dbo].[type_batchMessage] TO PUBLIC;
GO