﻿CREATE PROCEDURE [dbo].[GetBrandById]
	@Id INT
AS
BEGIN
 SELECT * FROM Brand WHERE Id = @Id
END