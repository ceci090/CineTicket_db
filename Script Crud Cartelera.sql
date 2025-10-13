USE CleanArchDb;
GO

-- 🔹 Crear la tabla Peliculas
CREATE TABLE [dbo].[Peliculas] (
    [IdPelicula] INT IDENTITY(1,1) PRIMARY KEY,
    [Titulo] NVARCHAR(150) NOT NULL,
    [Descripcion] NVARCHAR(MAX) NULL,
    [Duracion] INT NULL,                -- duración en minutos
    [Clasificacion] NVARCHAR(50) NULL,  -- ejemplo: PG-13, R, A, B, C
    [Genero] NVARCHAR(100) NULL,        -- ejemplo: Acción, Drama, Comedia
    [Estado] NVARCHAR(50) NULL,         -- ejemplo: Activa, Inactiva
    [FechaEstreno] DATE NULL,
    [ImagenUrl] NVARCHAR(250) NULL      -- ruta o URL de la imagen
);
GO

