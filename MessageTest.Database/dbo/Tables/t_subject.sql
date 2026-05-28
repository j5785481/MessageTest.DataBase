CREATE TABLE [dbo].[t_subject]
(
	[f_id]				INT	IDENTITY (1, 1)	NOT NULL,
	[f_title]			NVARCHAR(20)		NOT NULL,
	[f_content]			NVARCHAR(MAX)		NOT NULL,
	[f_creatorId]		NVARCHAR(20)		NOT NULL,
	[f_createdAt]		DATETIME2(7) NOT NULL CONSTRAINT [DF_t_suject_f_createdAt] DEFAULT (GETDATE()),
	[f_messageCount]	INT NOT NULL CONSTRAINT [DF_t_subject_f_messageCount] DEFAULT (0)
									 CONSTRAINT [CK_f_messageCount_Positive] CHECK ([f_messageCount] >= 0),
	CONSTRAINT [PK_suject] PRIMARY KEY CLUSTERED ([f_id] ASC)
)