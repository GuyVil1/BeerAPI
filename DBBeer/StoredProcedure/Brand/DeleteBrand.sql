﻿CREATE PROCEDURE [dbo].[DeleteBrand]
	@Id INT
AS
BEGIN
	DELETE FROM Brand WHERE Id = @Id
END
