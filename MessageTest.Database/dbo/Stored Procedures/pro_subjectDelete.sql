/*
	´y­z: §R°£¥DÃD

	exec pro_subjectDelete
		@id = 1
		@creatorId = '114060601'
*/

CREATE PROCEDURE [dbo].[pro_subjectDelete]
    @f_id INT
AS
	DELETE FROM t_subject WITH (ROWLOCK) 
	OUTPUT deleted.* 
	WHERE f_id = @f_id;
RETURN 0