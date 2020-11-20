CREATE TABLE [dbo].[User]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [lastName] VARCHAR(50) NOT NULL, 
    [firstName] VARCHAR(50) NOT NULL, 
    [email] VARCHAR(50) NOT NULL, 
    [password] VARCHAR(15) NOT NULL, 
    [creation_date] TIMESTAMP NOT NULL
)
