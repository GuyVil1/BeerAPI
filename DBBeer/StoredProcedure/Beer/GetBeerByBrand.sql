CREATE PROCEDURE [dbo].[GetBeerByBrand]
	@Id int
AS
BEGIN
	SELECT * FROM Beer WHERE brandId = @Id
END
