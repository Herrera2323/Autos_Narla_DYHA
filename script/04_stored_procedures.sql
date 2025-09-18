
-- Procedimientos almacenados para AutosNARLA
USE AutosNARLA;
GO

-- SP para insertar nuevo vehículo
CREATE OR ALTER PROCEDURE autos.sp_InsertVehiculo
    @Codigo VARCHAR(20),
    @MarcaId INT,
    @TipoId INT,
    @Modelo VARCHAR(100),
    @AnoProduccion INT,
    @Ano INT,
    @NumeroChasis VARCHAR(100),
    @TipoCombustible VARCHAR(50),
    @Cilindraje INT,
    @PrecioAdquisicion DECIMAL(12,2),
    @PrecioVenta DECIMAL(12,2),
    @Observaciones VARCHAR(500) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        INSERT INTO autos.Vehiculo (Codigo, MarcaId, TipoId, Modelo, AnoProduccion, Ano, NumeroChasis, TipoCombustible, Cilindraje, PrecioAdquisicion, PrecioVenta, Estado, Observaciones)
        VALUES (@Codigo, @MarcaId, @TipoId, @Modelo, @AnoProduccion, @Ano, @NumeroChasis, @TipoCombustible, @Cilindraje, @PrecioAdquisicion, @PrecioVenta, 'EN_STOCK', @Observaciones);
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO

-- SP para registrar venta de un vehículo
CREATE OR ALTER PROCEDURE autos.sp_RealizarVenta
    @CodigoVehiculo VARCHAR(20),
    @ClienteId INT,
    @EmpleadoId INT,
    @DescuentoPct DECIMAL(5,4) = 0
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @VehiculoId INT;
    DECLARE @Precio DECIMAL(12,2);

    SELECT @VehiculoId = VehiculoId, @Precio = PrecioVenta
    FROM autos.Vehiculo
    WHERE Codigo = @CodigoVehiculo AND Estado = 'EN_STOCK';

    IF @VehiculoId IS NULL
    BEGIN
        RAISERROR('Vehículo no disponible en stock o ya vendido.',16,1);
        RETURN;
    END

    IF @DescuentoPct > 0.10
    BEGIN
        RAISERROR('El descuento no puede superar el 10%.',16,1);
        RETURN;
    END

    INSERT INTO autos.Venta (VehiculoId, ClienteId, EmpleadoId, PrecioVentaFinal, DescuentoPct)
    VALUES (@VehiculoId, @ClienteId, @EmpleadoId, @Precio, @DescuentoPct);
END
GO

-- SP para consultar vehículos por filtros (modelo, año, precio)
CREATE OR ALTER PROCEDURE autos.sp_ConsultarVehiculos
    @Modelo VARCHAR(100) = NULL,
    @Ano INT = NULL,
    @PrecioMin DECIMAL(12,2) = NULL,
    @PrecioMax DECIMAL(12,2) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    SELECT v.*, m.Nombre AS Marca, t.Nombre AS Tipo
    FROM autos.Vehiculo v
    JOIN autos.Marca m ON v.MarcaId = m.MarcaId
    JOIN autos.TipoVehiculo t ON v.TipoId = t.TipoId
    WHERE v.Estado = 'EN_STOCK'
      AND (@Modelo IS NULL OR v.Modelo LIKE '%' + @Modelo + '%')
      AND (@Ano IS NULL OR v.Ano = @Ano)
      AND (@PrecioMin IS NULL OR v.PrecioVenta >= @PrecioMin)
      AND (@PrecioMax IS NULL OR v.PrecioVenta <= @PrecioMax)
    ORDER BY v.Modelo;
END
GO
