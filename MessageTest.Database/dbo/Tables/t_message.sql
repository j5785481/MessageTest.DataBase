CREATE TABLE [dbo].[t_message]
(
	[f_id]			UNIQUEIDENTIFIER	NOT NULL,
	[f_subjectId]	INT					NOT NULL,
	[f_content]		NVARCHAR(100)		NOT NULL,
	[f_userId]		NVARCHAR(20)		NOT NULL,
	[f_createdAt]		DATETIME2(7) NOT NULL CONSTRAINT [DF_t_message_f_createdAt] DEFAULT (GETDATE())
	--Primary Key
	CONSTRAINT [PK_message] PRIMARY KEY CLUSTERED ([f_id] ASC)
	--Foreign Key
	CONSTRAINT [FK_message_suject] FOREIGN KEY ([f_subjectId]) 
        REFERENCES [dbo].[t_subject] ([f_id])
		ON DELETE CASCADE
)