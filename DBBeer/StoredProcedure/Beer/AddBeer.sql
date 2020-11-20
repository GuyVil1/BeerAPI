CREATE PROCEDURE [dbo].[AddBeer]
	@Name VARCHAR(50),
	@Degree FLOAT,
	@Type VARCHAR(50),
	@BrandId INT
AS
BEGIN
	INSERT INTO Beer ([name], degree, [type], brandId) OUTPUT inserted.Id VALUES (@Name, @Degree, @Type, @BrandId)
END
