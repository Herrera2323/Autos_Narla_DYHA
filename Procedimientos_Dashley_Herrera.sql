USE AutosNARLA;
GO

------------------------
-- TABLA: autos.Marca --
------------------------
CREATE OR ALTER PROCEDURE autos.sp_ListarMarcas
AS
BEGIN
    SELECT * FROM autos.Marca ORDER BY Nombre;
END;
GO

CREATE OR ALTER PROCEDURE autos.sp_BuscarMarca
    @Nombre VARCHAR(100)
AS
BEGIN
    SELECT * FROM autos.Marca WHERE Nombre LIKE '%' + @Nombre + '%';
END;
GO

CREATE OR ALTER PROCEDURE autos.sp_ActualizarMarca
    @MarcaId INT,
    @NuevoNombre VARCHAR(100)
AS
BEGIN
    UPDATE autos.Marca SET Nombre = @NuevoNombre WHERE MarcaId = @MarcaId;
END;
GO
-------------------------------
-- TABLA: autos.TipoVehiculo --
-------------------------------
CREATE OR ALTER PROCEDURE autos.sp_ListarTiposVehiculo
AS
BEGIN
    SELECT * FROM autos.TipoVehiculo ORDER BY Nombre;
END;
GO

CREATE OR ALTER PROCEDURE autos.sp_FiltrarTipoVehiculo
    @Nombre VARCHAR(50)
AS
BEGIN
    SELECT * FROM autos.TipoVehiculo WHERE Nombre LIKE '%' + @Nombre + '%';
END;
GO

CREATE OR ALTER PROCEDURE autos.sp_ActualizarTipoVehiculo
    @TipoId INT,
    @NuevoNombre VARCHAR(50)
AS
BEGIN
    UPDATE autos.TipoVehiculo SET Nombre = @NuevoNombre WHERE TipoId = @TipoId;
END;
GO

---------------------------
-- TABLA: autos.Vehiculo --
---------------------------
CREATE OR ALTER PROCEDURE autos.sp_ListarVehiculos
AS
BEGIN
    SELECT v.*, m.Nombre AS Marca, t.Nombre AS Tipo
    FROM autos.Vehiculo v
    JOIN autos.Marca m ON v.MarcaId = m.MarcaId
    JOIN autos.TipoVehiculo t ON v.TipoId = t.TipoId
    ORDER BY v.Modelo;
END;
GO

CREATE OR ALTER PROCEDURE autos.sp_FiltrarVehiculosPorPrecio
    @Min DECIMAL(12,2),
    @Max DECIMAL(12,2)
AS
BEGIN
    SELECT v.Codigo, v.Modelo, v.PrecioVenta, m.Nombre AS Marca
    FROM autos.Vehiculo v
    JOIN autos.Marca m ON v.MarcaId = m.MarcaId
    WHERE v.PrecioVenta BETWEEN @Min AND @Max AND v.Estado = 'EN_STOCK'
    ORDER BY v.PrecioVenta;
END;
GO

CREATE OR ALTER PROCEDURE autos.sp_ActualizarPrecioVehiculo
    @VehiculoId INT,
    @NuevoPrecio DECIMAL(12,2)
AS
BEGIN
    UPDATE autos.Vehiculo SET PrecioVenta = @NuevoPrecio WHERE VehiculoId = @VehiculoId;
END;
GO

--------------------------
-- TABLA: autos.Cliente --
--------------------------
CREATE OR ALTER PROCEDURE autos.sp_ListarClientes
AS
BEGIN
    SELECT * FROM autos.Cliente ORDER BY Nombre;
END;
GO

CREATE OR ALTER PROCEDURE autos.sp_BuscarCliente
    @Nombre VARCHAR(200)
AS
BEGIN
    SELECT * FROM autos.Cliente WHERE Nombre LIKE '%' + @Nombre + '%';
END;
GO

CREATE OR ALTER PROCEDURE autos.sp_ActualizarCliente
    @ClienteId INT,
    @Telefono VARCHAR(50),
    @Email VARCHAR(200)
AS
BEGIN
    UPDATE autos.Cliente
    SET Telefono = @Telefono, Email = @Email
    WHERE ClienteId = @ClienteId;
END;
GO

---------------------------
-- TABLA: autos.Empleado --
---------------------------
CREATE OR ALTER PROCEDURE autos.sp_ListarEmpleados
AS
BEGIN
    SELECT * FROM autos.Empleado ORDER BY Nombre;
END;
GO

CREATE OR ALTER PROCEDURE autos.sp_FiltrarEmpleadoPorRol
    @Rol VARCHAR(100)
AS
BEGIN
    SELECT * FROM autos.Empleado WHERE Rol LIKE '%' + @Rol + '%';
END;
GO

CREATE OR ALTER PROCEDURE autos.sp_ActualizarRolEmpleado
    @EmpleadoId INT,
    @NuevoRol VARCHAR(100)
AS
BEGIN
    UPDATE autos.Empleado SET Rol = @NuevoRol WHERE EmpleadoId = @EmpleadoId;
END;
GO

------------------------
-- TABLA: autos.Venta --
------------------------
CREATE OR ALTER PROCEDURE autos.sp_ListarVentas
AS
BEGIN
    SELECT v.VentaId, ve.Codigo, ve.Modelo, c.Nombre AS Cliente, e.Nombre AS Empleado,
           v.PrecioVentaFinal, v.DescuentoPct, v.FechaVenta
    FROM autos.Venta v
    JOIN autos.Vehiculo ve ON v.VehiculoId = ve.VehiculoId
    JOIN autos.Cliente c ON v.ClienteId = c.ClienteId
    JOIN autos.Empleado e ON v.EmpleadoId = e.EmpleadoId
    ORDER BY v.FechaVenta DESC;
END;
GO

CREATE OR ALTER PROCEDURE autos.sp_FiltrarVentasPorCliente
    @ClienteNombre VARCHAR(200)
AS
BEGIN
    SELECT v.*, c.Nombre AS Cliente
    FROM autos.Venta v
    JOIN autos.Cliente c ON v.ClienteId = c.ClienteId
    WHERE c.Nombre LIKE '%' + @ClienteNombre + '%';
END;
GO

CREATE OR ALTER PROCEDURE autos.sp_ActualizarDescuentoVenta
    @VentaId INT,
    @NuevoDescuento DECIMAL(5,4)
AS
BEGIN
    UPDATE autos.Venta SET DescuentoPct = @NuevoDescuento WHERE VentaId = @VentaId;
END;
GO

---------------------------------------
-- CONSULTAS CON FUNCIONES AGREGADAS --
---------------------------------------
SELECT COUNT(*) AS TotalVehiculos 
FROM autos.Vehiculo 
WHERE Estado='EN_STOCK';

SELECT AVG(PrecioVenta) AS PromedioPrecio 
FROM autos.Vehiculo 
WHERE Estado='EN_STOCK';

SELECT MAX(PrecioVenta) AS PrecioMaximo, MIN(PrecioVenta) AS PrecioMinimo 
FROM autos.Vehiculo;

SELECT SUM(PrecioVentaFinal - (PrecioVentaFinal * DescuentoPct)) AS TotalIngresos 
FROM autos.Venta;

SELECT e.Nombre AS Empleado, COUNT(*) AS VentasRealizadas, SUM(v.PrecioVentaFinal) AS MontoTotal
FROM autos.Venta v
JOIN autos.Empleado e ON v.EmpleadoId = e.EmpleadoId
GROUP BY e.Nombre
ORDER BY MontoTotal DESC;
GO
