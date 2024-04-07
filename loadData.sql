-- Población de la tabla Comuna
INSERT INTO Comuna (ID_COMUNA, Nombre) VALUES
(1, 'Santiago'),
(2, 'Providencia'),
(3, 'Las Condes'),
(4, 'Ñuñoa');


-- Población de la tabla Modelo
INSERT INTO Modelo (ID_MODELO, Nombre_modelo, Descripcion_modelo, Marca) VALUES
(1, 'Sedán', 'Automóvil de cuatro puertas', 'Toyota'),
(2, 'Camioneta', 'Vehículo utilitario con espacio de carga trasero', 'Ford'),
(3, 'SUV', 'Vehículo utilitario deportivo', 'Honda');

-- Población de la tabla Vehiculo
INSERT INTO Vehiculo (ID_VEHICULO, ID_MODELO, Patente, Color, Estado) VALUES
(1, 1, 'AB1234', 'Negro', 'Disponible'),
(2, 2, 'CD5678', 'Blanco', 'En Mantenimiento'),
(3, 3, 'EF91011', 'Gris', 'En Uso'),
(4, 3, 'JPCI34', 'Rojo', 'Disponible'),
(5, 1, 'GGGG78', 'Verde', 'En Uso'),
(6, 3, 'ABCD12', 'Amarillo', 'En Mantenimiento'),
(7, 3, 'EFGH34', 'Naranjo', 'Disponible');

-- Población de la tabla Cliente
INSERT INTO Cliente (ID_CLIENTE, Nombre, ID_COMUNA) VALUES
(1, 'Juan Pérez', 1),
(2, 'María González', 2),
(3, 'Pedro Rodríguez', 3),
(4, 'Amazona Silva', 4),
(5, 'Camilo Silva', 2),
(6, 'Jaime Contreras', 2),
(7, 'Felipe Avila', 1),
(8, 'Constanza Paredes', 4);

-- Población de la tabla Cliente_Vehiculo
INSERT INTO Cliente_Vehiculo (ID_CLIENTE_VEHICULO, ID_CLIENTE, ID_VEHICULO) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7);

-- Población de la tabla Edificio_Estacionamiento
INSERT INTO Edificio_Estacionamiento (ID_ESTACIONAMIENTO, Nombre, ID_COMUNA) VALUES
(1, 'Edificio 1', 1),
(2, 'Edificio 2', 2),
(3, 'Edificio 3', 3),
(4, 'Edificio 4', 4),
(5, 'Edificio 5', 2),
(6, 'Edificio 6', 2),
(7, 'Edificio 7', 1);

-- Población de la tabla Lugar
INSERT INTO Lugar (ID_LUGAR, Numero_lugar, ID_ESTACIONAMIENTO) VALUES
(1, '1B', 1),
(2, '2A', 2),
(3, '3C', 3),
(4, '3F', 2),
(5, '4C', 4),
(6, '2C', 3),
(7, '5F', 2),
(8, '2A', 2),
(9, '1B', 1);

-- Población de la tabla Sueldo
INSERT INTO Sueldo (ID_SUELDO, Valor_Bruto, Valor_Liquido) VALUES
(1, 300000, 250000),
(2, 350000, 300000),
(3, 400000, 350000);

-- Población de la tabla Empleado
INSERT INTO Empleado (ID_EMPLEADO, ID_ESTACIONAMIENTO, ID_SUELDO, Nombre, Edad, N_Contacto) VALUES
(1, 1, 1, 'Luis Martínez', 30, '123456789'),
(2, 2, 2, 'Ana López', 25, '987654321'),
(3, 3, 3, 'Carlos Sánchez', 35, '654987321');

-- Población de la tabla Lugar_Cliveh
INSERT INTO Lugar_Cliveh (ID_LUGAR_CLIVEH, ID_CLIENTE_VEHICULO, ID_LUGAR) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- Población de la tabla Contrato
INSERT INTO Contrato (ID_CONTRATO, ID_ESTACIONAMIENTO, Detalle, Fecha) VALUES
(1, 1, 'Contrato de arriendo mensual', '2024-04-01'),
(2, 2, 'Contrato de arriendo diario', '2024-04-02'),
(3, 3, 'Contrato de arriendo mensual', '2024-04-03');

-- Población de la tabla Pago
INSERT INTO Pago (ID_PAGO, ID_CONTRATO, Valor, Fecha_pago) VALUES
(1, 1, 100000, '2024-04-05'),
(2, 2, 50000, '2024-04-06'),
(3, 3, 200000, '2024-04-07');
