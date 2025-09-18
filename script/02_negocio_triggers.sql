
-- Triggers de negocio para AutosNARLA

USE AutosNARLA;
GO

-- Trigger AFTER INSERT o UPDATE en Vehiculo para validar cantidad en stock por Modelo y Marca
CREATE OR ALTER TRIGGER autos.trg_Vehiculo_Max4Modelos
ON autos.Vehiculo
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM (
            SELECT i.Modelo, i.MarcaId
            FROM inserted i
        ) t
        JOIN autos.Vehiculo v ON v.Modelo = t.Modelo AND v.MarcaId = t.MarcaId
        WHERE v.Estado = 'EN_STOCK'
        GROUP BY v.Modelo, v.MarcaId
        HAVING COUNT(*) > 4
    )
    BEGIN
        RAISERROR('No se puede tener más de 4 unidades del mismo modelo en inventario.',16,1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END
GO

-- Trigger AFTER INSERT en Venta para marcar Vehiculo como VENDIDO
CREATE OR ALTER TRIGGER autos.trg_Venta_MarcarVendido
ON autos.Venta
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE autos.Vehiculo
    SET Estado = 'VENDIDO'
    FROM autos.Vehiculo v
    JOIN inserted i ON v.VehiculoId = i.VehiculoId;
END
GO
