CREATE TABLE [dbo].[Beer]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [name] VARCHAR(50) NOT NULL, 
    [degree] FLOAT NOT NULL, 
    [type] VARCHAR(50) NOT NULL, 
    [brandId] INT NOT NULL, 
    CONSTRAINT [FK_Beer_Brand] FOREIGN KEY (brandId) REFERENCES Brand(Id)
)
