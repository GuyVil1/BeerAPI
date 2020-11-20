CREATE PROCEDURE [dbo].[AddUser]
	@LastName VARCHAR(50),
	@FirstName VARCHAR(50),
	@Email VARCHAR(50),
	@Password VARCHAR(15)
AS
BEGIN
	INSERT INTO [User] (lastName, firstName, email, [password]) OUTPUT inserted.Id VALUES (@LastName, @FirstName, @Email, @Password)
END
