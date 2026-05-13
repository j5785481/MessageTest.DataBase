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
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- 直接執行刪除，並加入權限判斷
        -- 因為設定了 CASCADE，這行執行成功時，相關的 t_message 會自動被刪除
        DELETE FROM t_subject 
        WHERE f_id = @f_id AND f_creatorId = @f_creatorId;

        -- 檢查是否有資料被刪除 (如果 ID 錯或 creatorId 不對，@@ROWCOUNT 會是 0)
        IF @@ROWCOUNT = 0
        BEGIN
            ;THROW 50001, N'無權刪除或項目不存在', 1;
        END

    END TRY
    BEGIN CATCH
        -- 拋出錯誤讓呼叫端處理
        ;THROW;
    END CATCH
END