CREATE PROCEDURE [dbo].[UpdateBeer]
	@Id INT,
	@Name VARCHAR(50),
	@Degree FLOAT,
	@Type VARCHAR(50),
	@BrandId INT
AS
BEGIN
	UPDATE Beer set [name] = @Name, degree = @Degree, [type] = @Type, brandId = @BrandId WHERE Id = @Id
END
