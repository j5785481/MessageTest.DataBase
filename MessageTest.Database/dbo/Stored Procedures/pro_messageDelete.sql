/*
	´y­z: §R°£¯d¨¥

	exec pro_messageDelete
		@id = 21ec2020-3aea-1069-a2dd-08002b30309d
*/
CREATE PROCEDURE [dbo].[pro_messageDelete]
	@f_id UNIQUEIDENTIFIER
AS
	DELETE FROM t_message WITH (ROWLOCK) 
	OUTPUT deleted.* 
	WHERE f_id = @f_id;
RETURN 0