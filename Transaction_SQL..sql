USE AutosNARLA;
GO

select *
from autos.Vehiculo
where VehiculoId='0010';

---------------------------------------
--registro de la venta de un vehiculo--
--Agregar el registro de la venta y cambiar el estado del vehiculo de EN_STOCK a Vendido--

BEGIN TRANSACTION;

BEGIN TRY
    DECLARE @VehiculoId INT = (SELECT VehiculoId FROM autos.Vehiculo WHERE Codigo = 'NARLA-0010' AND Estado = 'EN_STOCK');
    DECLARE @ClienteId INT = 2;   -- Ejemplo: Juan Torres
    DECLARE @EmpleadoId INT = 3;  -- Ejemplo: Carlos Ruiz
    DECLARE @Precio DECIMAL(12,2) = (SELECT PrecioVenta FROM autos.Vehiculo WHERE VehiculoId = @VehiculoId);

    IF @VehiculoId IS NULL
        THROW 50001, 'Vehiculo fuera de Stock.', 1;

    INSERT INTO autos.Venta (VehiculoId, ClienteId, EmpleadoId, PrecioVentaFinal, DescuentoPct)
    VALUES (@VehiculoId, @ClienteId, @EmpleadoId, @Precio, 0.05);

    UPDATE autos.Vehiculo
    SET Estado = 'VENDIDO'
    WHERE VehiculoId = @VehiculoId;

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Error de venta: ' + ERROR_MESSAGE();
END CATCH;



-------------------------------------------------------------------------		
--Actualizar el Precio de Adquicion y el precio de venta de un vehiculo--
-------------------------------------------------------------------------
select *
from autos.Vehiculo
where VehiculoId='0015';


BEGIN TRANSACTION;

BEGIN TRY
    DECLARE @VehiculoId2 INT = (SELECT VehiculoId 
                               FROM autos.Vehiculo 
                               WHERE Codigo = 'NARLA-0015' AND Estado = 'EN_STOCK');

    IF @VehiculoId2 IS NULL
        THROW 50002, 'El vehículo no existe o ya está vendido.', 1;

    -- Nuevo costo de adquisición
    UPDATE autos.Vehiculo
    SET PrecioAdquisicion = 3500.00
    WHERE VehiculoId = @VehiculoId2;

    -- Nuevo precio de venta (por ejemplo, un aumento del 10%)
    UPDATE autos.Vehiculo
    SET PrecioVenta = PrecioVenta * 1.10
    WHERE VehiculoId = @VehiculoId2;

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Error en la actualización de precios: ' + ERROR_MESSAGE();
END CATCH;



------------------------------------------------------------------------
--Registrar un vehículo de una nueva marca y un nuevo tipo de vehiculo--
--pero quiero que marca, tipo y vehículo se inserten juntos--

select *
from autos.Marca;

BEGIN TRANSACTION;

BEGIN TRY
    DECLARE @MarcaId INT, @TipoId INT;

    INSERT INTO autos.Marca (Nombre) VALUES ('Honda');--esta es una marca ya registrada se probo asi para que no inserte vehiculo nuevo
    SET @MarcaId = SCOPE_IDENTITY();

    INSERT INTO autos.TipoVehiculo (Nombre) VALUES ('SUV Compacta');
    SET @TipoId = SCOPE_IDENTITY();

    INSERT INTO autos.Vehiculo
        (Codigo, MarcaId, TipoId, Modelo, AnoProduccion, Ano, NumeroChasis, TipoCombustible, Cilindraje,
         PrecioAdquisicion, PrecioVenta)
    VALUES
        ('NARLA-0101', @MarcaId, @TipoId, '2008 Allure', 2023, 2023,
         'CHS0101010', 'Gasolina', 1600, 18000.00, 25000.00);

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Error al insertar vehículo: ' + ERROR_MESSAGE();
END CATCH;