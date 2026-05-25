/*
	描述: 訊息
	建立日期: 2022-03-03
*/

CREATE TYPE [dbo].[type_batchGetByIdsSubject] AS TABLE (
	[f_subjectId]	INT					NOT NULL);
GO

GRANT EXECUTE
    ON TYPE::[dbo].[type_batchGetByIdsSubject] TO PUBLIC;
GO