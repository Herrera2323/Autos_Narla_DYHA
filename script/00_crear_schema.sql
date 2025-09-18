
IF DB_ID('AutosNARLA') IS NULL
BEGIN
    CREATE DATABASE AutosNARLA;
END
GO

USE AutosNARLA;
GO

IF NOT EXISTS(SELECT 1 FROM sys.schemas WHERE name = 'autos')
    EXEC('CREATE SCHEMA autos');
GO

-- TABLA Marca
CREATE TABLE autos.Marca (
    MarcaId INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL UNIQUE
);
GO

-- TABLA TipoVehiculo
CREATE TABLE autos.TipoVehiculo (
    TipoId INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL UNIQUE
);
GO

-- TABLA Vehiculo
CREATE TABLE autos.Vehiculo (
    VehiculoId INT IDENTITY(1,1) PRIMARY KEY,
    Codigo VARCHAR(20) NOT NULL UNIQUE,
    MarcaId INT NOT NULL,
    TipoId INT NOT NULL,
    Modelo VARCHAR(100) NOT NULL,
    AnoProduccion INT NULL,
    Ano INT NOT NULL,
    NumeroChasis VARCHAR(100) NULL,
    TipoCombustible VARCHAR(50) NULL,
    Cilindraje INT NULL,
    PrecioAdquisicion DECIMAL(12,2) NULL,
    PrecioVenta DECIMAL(12,2) NOT NULL,
    Estado VARCHAR(20) NOT NULL DEFAULT('EN_STOCK'),
    FechaIngreso DATETIME NOT NULL DEFAULT(GETDATE()),
    Observaciones VARCHAR(500) NULL,
    CONSTRAINT FK_Vehiculo_Marca FOREIGN KEY (MarcaId) REFERENCES autos.Marca(MarcaId),
    CONSTRAINT FK_Vehiculo_Tipo FOREIGN KEY (TipoId) REFERENCES autos.TipoVehiculo(TipoId)
);
GO

-- TABLA FotoVehiculo
CREATE TABLE autos.FotoVehiculo (
    FotoId INT IDENTITY(1,1) PRIMARY KEY,
    VehiculoId INT NOT NULL,
    UrlFoto VARCHAR(500) NOT NULL,
    Orden INT NOT NULL DEFAULT(1),
    CONSTRAINT FK_FotoVehiculo_Vehiculo FOREIGN KEY (VehiculoId) REFERENCES autos.Vehiculo(VehiculoId)
);
GO

-- TABLA Cliente
CREATE TABLE autos.Cliente (
    ClienteId INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(200) NOT NULL,
    Telefono VARCHAR(50) NULL,
    Email VARCHAR(200) NULL,
    Direccion VARCHAR(300) NULL
);
GO

-- TABLA Empleado
CREATE TABLE autos.Empleado (
    EmpleadoId INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(200) NOT NULL,
    Rol VARCHAR(100) NULL,
    Usuario VARCHAR(100) NULL
);
GO

-- TABLA Venta
CREATE TABLE autos.Venta (
    VentaId INT IDENTITY(1,1) PRIMARY KEY,
    VehiculoId INT NOT NULL UNIQUE,
    ClienteId INT NOT NULL,
    EmpleadoId INT NOT NULL,
    FechaVenta DATETIME NOT NULL DEFAULT(GETDATE()),
    PrecioVentaFinal DECIMAL(12,2) NOT NULL,
    DescuentoPct DECIMAL(5,4) NOT NULL DEFAULT(0),
    MontoDescuento AS (PrecioVentaFinal * DescuentoPct) PERSISTED,
    CONSTRAINT FK_Venta_Vehiculo FOREIGN KEY (VehiculoId) REFERENCES autos.Vehiculo(VehiculoId),
    CONSTRAINT FK_Venta_Cliente FOREIGN KEY (ClienteId) REFERENCES autos.Cliente(ClienteId),
    CONSTRAINT FK_Venta_Empleado FOREIGN KEY (EmpleadoId) REFERENCES autos.Empleado(EmpleadoId),
    CONSTRAINT CK_Venta_Descuento CHECK (DescuentoPct >= 0 AND DescuentoPct <= 0.10)
);
GO

-- Índices útiles
CREATE INDEX IX_Vehiculo_Estado ON autos.Vehiculo(Estado);
CREATE INDEX IX_Vehiculo_Modelo ON autos.Vehiculo(Modelo);
CREATE INDEX IX_Vehiculo_Ano ON autos.Vehiculo(Ano);
GO
