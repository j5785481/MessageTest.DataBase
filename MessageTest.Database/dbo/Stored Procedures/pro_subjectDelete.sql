/*
	描述: 發布主題

	exec pro_subjectAdd
		@title = '我是主旨'
		@content = '我是內容'
		@creatorId = '114060601'
*/

CREATE PROCEDURE [dbo].[pro_subjectDelete]
    @f_id INT,
    @f_creatorId NVARCHAR(20)
AS
BEGIN TRY
    BEGIN TRANSACTION;
        DELETE FROM t_message WHERE f_subjectId = @f_id;
        DELETE FROM t_subject OUTPUT deleted.* WHERE f_id = @f_id;
    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    -- 檢查是否有進行中的交易，有的話就回滾
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    -- 拋出錯誤訊息給後端（如 C#）
    THROW; 
END CATCH