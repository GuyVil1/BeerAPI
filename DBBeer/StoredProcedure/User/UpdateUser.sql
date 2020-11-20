CREATE PROCEDURE [dbo].[UpdateUser]
	@Id INT,
	@LastName VARCHAR(50),
	@FirstName VARCHAR(50),
	@Email VARCHAR(50),
	@Password VARCHAR(15)
AS
BEGIN
	UPDATE [User] SET lastName = @LastName, firstName = @FirstName, email = @Email, [password] = @Password WHERE Id = @Id
END
