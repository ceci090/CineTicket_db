USE CleanArchDb;
GO

-- 1) Ajustar columnas existentes según tu código .NET
ALTER TABLE dbo.Users
ALTER COLUMN Username NVARCHAR(100) NOT NULL;

ALTER TABLE dbo.Users
ALTER COLUMN Password NVARCHAR(MAX) NOT NULL;

ALTER TABLE dbo.Users
ALTER COLUMN Role NVARCHAR(50) NOT NULL;

-- 2) Crear índice único en Username si no existe
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Users_Username' AND object_id = OBJECT_ID('dbo.Users'))
BEGIN
    CREATE UNIQUE INDEX IX_Users_Username ON dbo.Users(Username);
END
GO

-- 3) Insertar usuarios de prueba con hash SHA-256
-- admin123 -> 240BE518FABD2724DDB6F04EEB1DA5967448D7E831C08C8FA822809F74C720A9
-- user123  -> E606E38B0D8C19B24CF0EE3808183162EA7CD63FF7912DBB22B5E803286B4446

IF NOT EXISTS (SELECT 1 FROM dbo.Users WHERE Username = 'admin')
BEGIN
    INSERT INTO dbo.Users (Username, Password, Role)
    VALUES ('admin', '240BE518FABD2724DDB6F04EEB1DA5967448D7E831C08C8FA822809F74C720A9', 'Administrador');
END

IF NOT EXISTS (SELECT 1 FROM dbo.Users WHERE Username = 'user')
BEGIN
    INSERT INTO dbo.Users (Username, Password, Role)
    VALUES ('user', 'E606E38B0D8C19B24CF0EE3808183162EA7CD63FF7912DBB22B5E803286B4446', 'Usuario');
END
GO

-- 4) Comprobar contenido
SELECT Id, Username, Role FROM dbo.Users;
GO
