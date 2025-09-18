
-- Consultas exigidas (1 a 11)

USE AutosNARLA;
GO

-- 1) Lista de todos los vehículos que se encuentran en stock.
SELECT * FROM autos.Vehiculo WHERE Estado = 'EN_STOCK' ORDER BY FechaIngreso DESC;
GO

-- 2) Información detallada de un vehículo por código (@codigo)
DECLARE @codigo VARCHAR(20) = 'NARLA-0001';
SELECT v.*, m.Nombre AS Marca, t.Nombre AS Tipo
FROM autos.Vehiculo v
JOIN autos.Marca m ON v.MarcaId = m.MarcaId
JOIN autos.TipoVehiculo t ON v.TipoId = t.TipoId
WHERE v.Codigo = @codigo;
GO

-- 3) Insertar nuevo vehículo 
INSERT INTO autos.Vehiculo (Codigo, MarcaId, TipoId, Modelo, AnoProduccion, Ano, NumeroChasis, TipoCombustible, Cilindraje, PrecioAdquisicion, PrecioVenta, Estado)
VALUES ('NARLA-9999', 1, 1, 'Ejemplo Model', 2020, 2020, 'CHS9999000', 'Gasolina', 1600, 8000.00, 11000.00, 'EN_STOCK');
GO

-- 4) Mostrar inventario ordenado por Modelo, Marca o Año (ejemplos)
-- Orden por Modelo
SELECT * FROM autos.Vehiculo WHERE Estado='EN_STOCK' ORDER BY Modelo;
GO
-- Orden por Marca
SELECT v.*, m.Nombre AS Marca FROM autos.Vehiculo v JOIN autos.Marca m ON v.MarcaId=m.MarcaId WHERE v.Estado='EN_STOCK' ORDER BY m.Nombre;
GO
-- Orden por Año
SELECT * FROM autos.Vehiculo WHERE Estado='EN_STOCK' ORDER BY Ano DESC;
GO

-- 5) Filtro por Modelo y Año
SELECT * FROM autos.Vehiculo WHERE Estado='EN_STOCK' AND Modelo LIKE '%Corolla%' AND Ano = 2016;
GO

-- 6) Filtro por rango de precio y categoría (tipo)
SELECT v.*, t.Nombre AS Categoria
FROM autos.Vehiculo v
JOIN autos.TipoVehiculo t ON v.TipoId = t.TipoId
WHERE v.Estado='EN_STOCK' AND v.PrecioVenta BETWEEN 5000 AND 15000 AND t.Nombre = 'Sedan';
GO

-- 7) Al realizar la venta:

DECLARE @vehId INT = (SELECT VehiculoId FROM autos.Vehiculo WHERE Codigo='NARLA-0001');
DECLARE @clienteId INT = 1; -- María López
DECLARE @empleadoId INT = 2; -- Ana Gomez
DECLARE @precio DECIMAL(12,2) = (SELECT PrecioVenta FROM autos.Vehiculo WHERE VehiculoId = @vehId);
DECLARE @descuento DECIMAL(5,4) = 0.05;

INSERT INTO autos.Venta (VehiculoId, ClienteId, EmpleadoId, PrecioVentaFinal, DescuentoPct)
VALUES (@vehId, @clienteId, @empleadoId, @precio, @descuento);
GO

-- 8) Aplicar descuento máximo 10% 
DECLARE @monto DECIMAL(12,2) = 20000.00; -- ejemplo
DECLARE @pctMax DECIMAL(5,4) = 0.10;
SELECT @monto AS MontoOriginal, @pctMax AS PctMax, @monto*(1-@pctMax) AS MontoConDescuento;
GO

-- 9) Vehículo más antiguo en stock
SELECT TOP 1 * FROM autos.Vehiculo WHERE Estado='EN_STOCK' ORDER BY Ano ASC, FechaIngreso ASC;
GO

-- 10) Vehículo de mayor cilindraje en stock
-- Si hay NULLs, los ordenamos detrás usando CASE
SELECT TOP 1 * FROM autos.Vehiculo WHERE Estado='EN_STOCK' ORDER BY CASE WHEN Cilindraje IS NULL THEN 1 ELSE 0 END, Cilindraje DESC;
GO

-- 11) Vehículo con precio más bajo en stock
SELECT TOP 1 * FROM autos.Vehiculo WHERE Estado='EN_STOCK' ORDER BY PrecioVenta ASC;
GO
