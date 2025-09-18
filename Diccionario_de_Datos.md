# Diccionario_de_Datos

Resumen de tablas y campos principales.

## autos.Marca
- MarcaId (INT, PK, Identity)
- Nombre (VARCHAR(100), único)

## autos.TipoVehiculo
- TipoId (INT, PK, Identity)
- Nombre (VARCHAR(50), único)

## autos.Vehiculo
- VehiculoId (INT, PK, Identity)
- Codigo (VARCHAR(20), único): código legible para negocio (ej. NARLA-0001)
- MarcaId (FK a autos.Marca)
- TipoId (FK a autos.TipoVehiculo)
- Modelo (VARCHAR(100))
- AnoProduccion (INT)
- Ano (INT)
- NumeroChasis (VARCHAR(100))
- TipoCombustible (VARCHAR(50))
- Cilindraje (INT)
- PrecioAdquisicion (DECIMAL(12,2))
- PrecioVenta (DECIMAL(12,2))
- Estado (VARCHAR(20)): 'EN_STOCK','VENDIDO','RESERVADO'
- FechaIngreso (DATETIME)
- Observaciones (VARCHAR(500))

## autos.FotoVehiculo
- FotoId (INT, PK)
- VehiculoId (FK)
- UrlFoto (VARCHAR(500))
- Orden (INT)

## autos.Cliente
- ClienteId (INT, PK)
- Nombre, Telefono, Email, Direccion

## autos.Empleado
- EmpleadoId (INT, PK)
- Nombre, Rol, Usuario

## autos.Venta
- VentaId (INT, PK)
- VehiculoId (INT, FK único)
- ClienteId (INT, FK)
- EmpleadoId (INT, FK)
- FechaVenta (DATETIME)
- PrecioVentaFinal (DECIMAL)
- DescuentoPct (DECIMAL) CHECK <= 0.10
- MontoDescuento (Computed PERSISTED)
