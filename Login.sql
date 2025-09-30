CREATE DATABASE CleanArchDb;
USE CleanArchDb;
GO

CREATE TABLE Users
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(100) NOT NULL UNIQUE,
    Password NVARCHAR(256) NOT NULL,  -- para almacenar la contraseña (puede ser hash más adelante)
    Role NVARCHAR(50) NOT NULL
);
INSERT INTO Users (Username, Password, Role)
VALUES ('ceci', '123456', 'User');
