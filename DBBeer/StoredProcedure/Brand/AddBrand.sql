CREATE PROCEDURE [dbo].[AddBrand]
	@Name VARCHAR(50)
AS
BEGIN
	INSERT INTO Brand ([name]) OUTPUT inserted.Id VALUES (@Name)
END
