
-- Inserción de datos maestros y 50 vehículos de ejemplo para AutosNARLA.

USE AutosNARLA;
GO

-- Insertar Marcas
INSERT INTO autos.Marca (Nombre) VALUES
('Toyota'),('Honda'),('Ford'),('Chevrolet'),('Nissan'),('Volkswagen'),('BMW'),('Mercedes'),('Jeep'),('Suzuki');
GO

-- Insertar Tipos
INSERT INTO autos.TipoVehiculo (Nombre) VALUES
('Sedan'),('Hatchback'),('Camioneta Cerrada'),('Minivan'),('Camioneta Extracabina'),('Doble Cabina'),('Doble Traccion'),('Microbus'),('Moto'),('Camion'),('Clasico');
GO

-- Empleados de ejemplo
INSERT INTO autos.Empleado (Nombre, Rol, Usuario) VALUES
('Luis Perez','Gerente','lperez'),
('Ana Gomez','Vendedor','agomez'),
('Carlos Ruiz','Vendedor','cruiz');
GO

-- Clientes de ejemplo
INSERT INTO autos.Cliente (Nombre, Telefono, Email, Direccion) VALUES
('María López','+50512345678','maria.lopez@example.com','Managua, Nicaragua'),
('Juan Torres','+50587654321','juan.torres@example.com','Managua, Nicaragua'),
('Empresa XYZ','+5055550001','contacto@xyz.com','León, Nicaragua');
GO

-- Insertar 50 Vehículos
INSERT INTO autos.Vehiculo (Codigo, MarcaId, TipoId, Modelo, AnoProduccion, Ano, NumeroChasis, TipoCombustible, Cilindraje, PrecioAdquisicion, PrecioVenta, Estado)
VALUES
('NARLA-0001', 1, 1, 'Corolla LE', 2016, 2016, 'CHS0001001', 'Gasolina', 1800, 8000.00, 11000.00, 'EN_STOCK'),
('NARLA-0002', 2, 1, 'Civic LX', 2015, 2015, 'CHS0001002', 'Gasolina', 1800, 7500.00, 10500.00, 'EN_STOCK'),
('NARLA-0003', 3, 3, 'Ranger XLT', 2018, 2018, 'CHS0001003', 'Diesel', 3200, 14000.00, 18000.00, 'EN_STOCK'),
('NARLA-0004', 4, 1, 'Malibu', 2014, 2014, 'CHS0001004', 'Gasolina', 2000, 6000.00, 9000.00, 'EN_STOCK'),
('NARLA-0005', 5, 2, 'Sentra SR', 2019, 2019, 'CHS0001005', 'Gasolina', 1600, 9000.00, 12500.00, 'EN_STOCK'),
('NARLA-0006', 6, 1, 'Vento', 2013, 2013, 'CHS0001006', 'Gasolina', 1600, 5000.00, 8000.00, 'EN_STOCK'),
('NARLA-0007', 7, 7, '3 Series', 2017, 2017, 'CHS0001007', 'Gasolina', 2000, 15000.00, 22000.00, 'EN_STOCK'),
('NARLA-0008', 8, 1, 'C200', 2016, 2016, 'CHS0001008', 'Gasolina', 1800, 16000.00, 23000.00, 'EN_STOCK'),
('NARLA-0009', 9, 3, 'Wrangler', 2012, 2012, 'CHS0001009', 'Gasolina', 3500, 12000.00, 17000.00, 'EN_STOCK'),
('NARLA-0010', 10, 9, 'Gixxer', 2020, 2020, 'CHS0001010', 'Gasolina', 155, 900.00, 1500.00, 'EN_STOCK'),
('NARLA-0011', 1, 3, 'Hilux', 2019, 2019, 'CHS0001011', 'Diesel', 2400, 17000.00, 21500.00, 'EN_STOCK'),
('NARLA-0012', 2, 1, 'Accord', 2014, 2014, 'CHS0001012', 'Gasolina', 2200, 7000.00, 10000.00, 'EN_STOCK'),
('NARLA-0013', 3, 4, 'Sienna', 2015, 2015, 'CHS0001013', 'Gasolina', 3500, 11000.00, 15000.00, 'EN_STOCK'),
('NARLA-0014', 4, 5, 'Silverado', 2018, 2018, 'CHS0001014', 'Gasolina', 4800, 20000.00, 26000.00, 'EN_STOCK'),
('NARLA-0015', 5, 2, 'March', 2017, 2017, 'CHS0001015', 'Gasolina', 1200, 3000.00, 4500.00, 'EN_STOCK'),
('NARLA-0016', 6, 1, 'Golf', 2016, 2016, 'CHS0001016', 'Gasolina', 1400, 7000.00, 9800.00, 'EN_STOCK'),
('NARLA-0017', 7, 1, 'X1', 2018, 2018, 'CHS0001017', 'Gasolina', 2000, 18000.00, 24000.00, 'EN_STOCK'),
('NARLA-0018', 8, 3, 'GLA', 2017, 2017, 'CHS0001018', 'Gasolina', 1800, 17000.00, 23500.00, 'EN_STOCK'),
('NARLA-0019', 9, 3, 'Grand Cherokee', 2015, 2015, 'CHS0001019', 'Gasolina', 3600, 14000.00, 19000.00, 'EN_STOCK'),
('NARLA-0020', 10, 9, 'Hayabusa', 2011, 2011, 'CHS0001020', 'Gasolina', 1340, 4000.00, 7000.00, 'EN_STOCK'),
('NARLA-0021', 1, 1, 'Corolla XLE', 2012, 2012, 'CHS0001021', 'Gasolina', 1600, 5500.00, 8200.00, 'EN_STOCK'),
('NARLA-0022', 2, 1, 'Fit', 2013, 2013, 'CHS0001022', 'Gasolina', 1300, 4500.00, 7000.00, 'EN_STOCK'),
('NARLA-0023', 3, 3, 'F-150', 2014, 2014, 'CHS0001023', 'Gasolina', 5000, 13000.00, 18500.00, 'EN_STOCK'),
('NARLA-0024', 4, 1, 'Cruze', 2016, 2016, 'CHS0001024', 'Diesel', 1600, 6000.00, 9000.00, 'EN_STOCK'),
('NARLA-0025', 5, 2, 'Altima', 2018, 2018, 'CHS0001025', 'Gasolina', 2000, 10000.00, 14000.00, 'EN_STOCK'),
('NARLA-0026', 6, 1, 'Polo', 2015, 2015, 'CHS0001026', 'Gasolina', 1400, 5000.00, 8000.00, 'EN_STOCK'),
('NARLA-0027', 7, 7, 'M4', 2019, 2019, 'CHS0001027', 'Gasolina', 3000, 35000.00, 48000.00, 'EN_STOCK'),
('NARLA-0028', 8, 3, 'E200', 2014, 2014, 'CHS0001028', 'Gasolina', 2000, 12000.00, 17000.00, 'EN_STOCK'),
('NARLA-0029', 9, 3, 'Cherokee', 2013, 2013, 'CHS0001029', 'Gasolina', 3600, 11000.00, 15500.00, 'EN_STOCK'),
('NARLA-0030', 10, 9, 'Duke', 2019, 2019, 'CHS0001030', 'Gasolina', 390, 1500.00, 2600.00, 'EN_STOCK'),
('NARLA-0031', 1, 1, 'Corolla Classic', 1998, 1998, 'CHS0001031', 'Gasolina', 1600, 1200.00, 4500.00, 'EN_STOCK'),
('NARLA-0032', 2, 1, 'Civic Coupe', 2001, 2001, 'CHS0001032', 'Gasolina', 1800, 1500.00, 5200.00, 'EN_STOCK'),
('NARLA-0033', 3, 3, 'Explorer', 2010, 2010, 'CHS0001033', 'Gasolina', 3500, 3000.00, 7800.00, 'EN_STOCK'),
('NARLA-0034', 4, 1, 'Impala', 2005, 2005, 'CHS0001034', 'Gasolina', 3600, 2500.00, 6500.00, 'EN_STOCK'),
('NARLA-0035', 5, 2, 'Versa', 2012, 2012, 'CHS0001035', 'Gasolina', 1600, 3200.00, 6000.00, 'EN_STOCK'),
('NARLA-0036', 6, 1, 'Tiguan', 2016, 2016, 'CHS0001036', 'Gasolina', 2000, 9000.00, 13000.00, 'EN_STOCK'),
('NARLA-0037', 7, 1, '7 Series', 2011, 2011, 'CHS0001037', 'Gasolina', 3000, 12000.00, 18000.00, 'EN_STOCK'),
('NARLA-0038', 8, 3, 'Sprinter', 2019, 2019, 'CHS0001038', 'Diesel', 2200, 20000.00, 26000.00, 'EN_STOCK'),
('NARLA-0039', 9, 3, 'Compass', 2018, 2018, 'CHS0001039', 'Gasolina', 2400, 12000.00, 16500.00, 'EN_STOCK'),
('NARLA-0040', 10, 9, 'Ninja', 2017, 2017, 'CHS0001040', 'Gasolina', 650, 3000.00, 5000.00, 'EN_STOCK'),
('NARLA-0041', 1, 11, 'Classic Supra', 1993, 1993, 'CHS0001041', 'Gasolina', 3000, 8000.00, 25000.00, 'EN_STOCK'),
('NARLA-0042', 2, 11, 'Classic Civic 1969', 1969, 1969, 'CHS0001042', 'Gasolina', 1500, 4000.00, 22000.00, 'EN_STOCK'),
('NARLA-0043', 3, 3, 'Transit', 2013, 2013, 'CHS0001043', 'Diesel', 2200, 7000.00, 11000.00, 'EN_STOCK'),
('NARLA-0044', 4, 1, 'Spark', 2015, 2015, 'CHS0001044', 'Gasolina', 1000, 2500.00, 4200.00, 'EN_STOCK'),
('NARLA-0045', 5, 2, 'Kicks', 2020, 2020, 'CHS0001045', 'Gasolina', 1600, 9500.00, 13500.00, 'EN_STOCK'),
('NARLA-0046', 6, 1, 'T-Cross', 2019, 2019, 'CHS0001046', 'Gasolina', 1400, 10000.00, 14500.00, 'EN_STOCK'),
('NARLA-0047', 7, 1, 'i8', 2015, 2015, 'CHS0001047', 'Hibrido', 1500, 30000.00, 42000.00, 'EN_STOCK'),
('NARLA-0048', 8, 3, 'GLS', 2016, 2016, 'CHS0001048', 'Gasolina', 3000, 22000.00, 29000.00, 'EN_STOCK'),
('NARLA-0049', 9, 3, 'Renegade', 2017, 2017, 'CHS0001049', 'Gasolina', 1800, 10000.00, 14500.00, 'EN_STOCK'),
('NARLA-0050', 10, 9, 'CBR600', 2014, 2014, 'CHS0001050', 'Gasolina', 600, 3500.00, 6000.00, 'EN_STOCK');
GO
