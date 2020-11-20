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

INSERT INTO [User] (lastName, firstName, email, [password]) VALUES ('Richez', 'Marion', 'richez.m@gmail.com', 'test123')
INSERT INTO [User] (lastName, firstName, email, [password]) VALUES ('Dacosse', 'Jonathan', 'dacosse.j@gmail.com', '123test')

INSERT INTO Brand (name) VALUES ('AB InBev')
INSERT INTO Brand (name) VALUES ('Liefmans')
INSERT INTO Brand (name) VALUES ('Caulier')
INSERT INTO Brand (name) VALUES ('La Binchoise')

INSERT INTO Beer (name, degree, type, brandId) VALUES ('Jupiler', 5.2 , 'Blonde', 1)
INSERT INTO Beer (name, degree, type, brandId) VALUES ('Liefmans', 3.8 , 'Fruité', 2)
INSERT INTO Beer (name, degree, type, brandId) VALUES ('Paix Dieu', 10 , 'Blonde', 3)
INSERT INTO Beer (name, degree, type, brandId) VALUES ('Binchoise Brune', 7.5 , 'Brune', 4)


