/*
Script de déploiement pour DBBeer

Ce code a été généré par un outil.
La modification de ce fichier peut provoquer un comportement incorrect et sera perdue si
le code est régénéré.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "DBBeer"
:setvar DefaultFilePrefix "DBBeer"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Détectez le mode SQLCMD et désactivez l'exécution du script si le mode SQLCMD n'est pas pris en charge.
Pour réactiver le script une fois le mode SQLCMD activé, exécutez ce qui suit :
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'Le mode SQLCMD doit être activé de manière à pouvoir exécuter ce script.';
        SET NOEXEC ON;
    END


GO
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Création de $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'Impossible de modifier les paramètres de base de données. Vous devez être administrateur système pour appliquer ces paramètres.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'Impossible de modifier les paramètres de base de données. Vous devez être administrateur système pour appliquer ces paramètres.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET TEMPORAL_HISTORY_RETENTION ON 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Création de [dbo].[Beer]...';


GO
CREATE TABLE [dbo].[Beer] (
    [Id]      INT          IDENTITY (1, 1) NOT NULL,
    [name]    VARCHAR (50) NOT NULL,
    [degree]  FLOAT (53)   NOT NULL,
    [type]    VARCHAR (50) NOT NULL,
    [brandId] INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Création de [dbo].[Brand]...';


GO
CREATE TABLE [dbo].[Brand] (
    [Id]   INT          IDENTITY (1, 1) NOT NULL,
    [name] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Création de [dbo].[User]...';


GO
CREATE TABLE [dbo].[User] (
    [Id]            INT          IDENTITY (1, 1) NOT NULL,
    [lastName]      VARCHAR (50) NOT NULL,
    [firstName]     VARCHAR (50) NOT NULL,
    [email]         VARCHAR (50) NOT NULL,
    [password]      VARCHAR (15) NOT NULL,
    [creation_date] TIMESTAMP    NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Création de [dbo].[FK_Beer_Brand]...';


GO
ALTER TABLE [dbo].[Beer]
    ADD CONSTRAINT [FK_Beer_Brand] FOREIGN KEY ([brandId]) REFERENCES [dbo].[Brand] ([Id]);


GO
PRINT N'Création de [dbo].[AddBeer]...';


GO
CREATE PROCEDURE [dbo].[AddBeer]
	@Name VARCHAR(50),
	@Degree FLOAT,
	@Type VARCHAR(50),
	@BrandId INT
AS
BEGIN
	INSERT INTO Beer ([name], degree, [type], brandId) OUTPUT inserted.Id VALUES (@Name, @Degree, @Type, @BrandId)
END
GO
PRINT N'Création de [dbo].[AddBrand]...';


GO
CREATE PROCEDURE [dbo].[AddBrand]
	@Name VARCHAR(50)
AS
BEGIN
	INSERT INTO Brand ([name]) OUTPUT inserted.Id VALUES (@Name)
END
GO
PRINT N'Création de [dbo].[AddUser]...';


GO
CREATE PROCEDURE [dbo].[AddUser]
	@LastName VARCHAR(50),
	@FirstName VARCHAR(50),
	@Email VARCHAR(50),
	@Password VARCHAR(15)
AS
BEGIN
	INSERT INTO [User] (lastName, firstName, email, [password]) OUTPUT inserted.Id VALUES (@LastName, @FirstName, @Email, @Password)
END
GO
PRINT N'Création de [dbo].[DeleteBeer]...';


GO
CREATE PROCEDURE [dbo].[DeleteBeer]
	@Id INT
AS
BEGIN
	DELETE FROM Beer WHERE Id = @Id
END
GO
PRINT N'Création de [dbo].[DeleteBrand]...';


GO
CREATE PROCEDURE [dbo].[DeleteBrand]
	@Id INT
AS
BEGIN
	DELETE FROM Brand WHERE Id = @Id
END
GO
PRINT N'Création de [dbo].[DeleteUser]...';


GO
CREATE PROCEDURE [dbo].[DeleteUser]
	@Id INT
AS
BEGIN
	DELETE FROM [User] WHERE Id = @Id
END
GO
PRINT N'Création de [dbo].[GetAllBeer]...';


GO
CREATE PROCEDURE [dbo].[GetAllBeer]
AS
BEGIN
	SELECT * FROM Beer
END
GO
PRINT N'Création de [dbo].[GetAllBrand]...';


GO
CREATE PROCEDURE [dbo].[GetAllBrand]
AS
BEGIN
	SELECT * FROM Brand
END
GO
PRINT N'Création de [dbo].[GetAllUser]...';


GO
CREATE PROCEDURE [dbo].[GetAllUser]
AS
BEGIN
	SELECT * FROM [User]
END
GO
PRINT N'Création de [dbo].[GetBeerByBrand]...';


GO
CREATE PROCEDURE [dbo].[GetBeerByBrand]
	@Id int
AS
BEGIN
	SELECT * FROM Beer WHERE brandId = @Id
END
GO
PRINT N'Création de [dbo].[GetBeerById]...';


GO
CREATE PROCEDURE [dbo].[GetBeerById]
	@Id INT
AS
BEGIN
	SELECT * FROM Beer 
	WHERE Beer.Id = @Id
END
GO
PRINT N'Création de [dbo].[GetBrandById]...';


GO
CREATE PROCEDURE [dbo].[GetBrandById]
	@Id INT
AS
BEGIN
 SELECT * FROM Brand WHERE Id = @Id
END
GO
PRINT N'Création de [dbo].[GetUserById]...';


GO
CREATE PROCEDURE [dbo].[GetUserById]
	@Id INT
AS
BEGIN
	SELECT * FROM [User] WHERE Id = @Id
END
GO
PRINT N'Création de [dbo].[UpdateBeer]...';


GO
CREATE PROCEDURE [dbo].[UpdateBeer]
	@Id INT,
	@Name VARCHAR(50),
	@Degree FLOAT,
	@Type VARCHAR(50)
AS
BEGIN
	UPDATE Beer set [name] = @Name, degree = @Degree, [type] = @Type WHERE Id = @Id
END
GO
PRINT N'Création de [dbo].[UpdateBrand]...';


GO
CREATE PROCEDURE [dbo].[UpdateBrand]
	@Id INT,
	@Name VARCHAR(50)
AS
BEGIN
	UPDATE Brand SET [name] = @Name WHERE Id = @Id
END
GO
PRINT N'Création de [dbo].[UpdateUser]...';


GO
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
GO
-- Étape de refactorisation pour mettre à jour le serveur cible avec des journaux de transactions déployés

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '565b50dd-b895-4f4e-be85-b11ce541bb30')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('565b50dd-b895-4f4e-be85-b11ce541bb30')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '33386df4-74b7-4978-8eaa-d909ec421fb1')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('33386df4-74b7-4978-8eaa-d909ec421fb1')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '5593a000-73a4-4d99-a5f8-8dfa1228f58b')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('5593a000-73a4-4d99-a5f8-8dfa1228f58b')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'b93f25a9-7003-4c0d-9233-a62a343673a8')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('b93f25a9-7003-4c0d-9233-a62a343673a8')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '55e2ef6c-b0a0-4290-bb26-5b59fddc2831')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('55e2ef6c-b0a0-4290-bb26-5b59fddc2831')

GO

GO
/*
Modèle de script de post-déploiement							
--------------------------------------------------------------------------------------
 Ce fichier contient des instructions SQL qui seront ajoutées au script de compilation.		
 Utilisez la syntaxe SQLCMD pour inclure un fichier dans le script de post-déploiement.			
 Exemple :      :r .\monfichier.sql								
 Utilisez la syntaxe SQLCMD pour référencer une variable dans le script de post-déploiement.		
 Exemple :      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

USE DBBeer
GO

INSERT INTO [User] (lastName, firstName, email, [password])
VALUES ('Richez', 'Marion', 'richez.m@gmail.com', 'test123')

INSERT INTO Brand (name)
VALUES ('AB InBev')

INSERT INTO Brand (name)
VALUES ('Duval')

INSERT INTO Beer (name, degree, type, brandId)
VALUES ('Liefmans', 5.2 , 'Blonde', 1)

INSERT INTO Beer (name, degree, type, brandId)
VALUES ('Liefmans', 3.8 , 'Fruité', 2)


GO

GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Mise à jour terminée.';


GO
