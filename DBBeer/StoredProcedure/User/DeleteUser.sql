﻿CREATE PROCEDURE [dbo].[DeleteUser]
	@Id INT
AS
BEGIN
	DELETE FROM [User] WHERE Id = @Id
END
