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
(3, 'SUV', 'Vehículo utilitario deportivo', 'Honda'),
(4,'Camaro','Vehiculo Deportivo','Chevrolet');



-- Población de la tabla Vehiculo
INSERT INTO Vehiculo (ID_VEHICULO, ID_MODELO, Patente, Color, Estado) VALUES
(1, 1, 'AB1234', 'Negro', 'Disponible'),
(2, 2, 'CD5678', 'Blanco', 'En Mantenimiento'),
(3, 3, 'EF91011', 'Gris', 'En Uso'),
(4, 3, 'JPCI34', 'Rojo', 'Disponible'),
(5, 1, 'GGGG78', 'Verde', 'En Uso'),
(6, 3, 'ABCD12', 'Amarillo', 'En Mantenimiento'),
(7, 3, 'EFGH34', 'Naranjo', 'Disponible'),
(8,4,'VTVA82','Amarillo','Disponible');


-- Población de la tabla Cliente
INSERT INTO Cliente (ID_CLIENTE, Nombre, ID_COMUNA) VALUES
(1, 'Juan Pérez', 1),
(2, 'María González', 2),
(3, 'Pedro Rodríguez', 3),
(4, 'Amazona Silva', 4),
(5, 'Camilo Silva', 2),
(6, 'Jaime Contreras', 2),
(7, 'Felipe Avila', 1);

-- Población de la tabla Cliente_Vehiculo
INSERT INTO Cliente_Vehiculo (ID_CLIENTE_VEHICULO, ID_CLIENTE, ID_VEHICULO) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 7, 8);


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
(9, '1B', 1),
(10,'1C',2);

-- Población de la tabla Sueldo
INSERT INTO Sueldo (ID_SUELDO, Valor_Bruto, Valor_Liquido) VALUES
(1, 300000, 250000),
(2, 350000, 300000),
(3, 370000, 320000),
(4, 310000, 260000),
(5, 320000, 270000);

-- Población de la tabla Empleado
--Un mayordomo toma el turno de noche
INSERT INTO Empleado (ID_EMPLEADO, ID_ESTACIONAMIENTO, ID_SUELDO, Nombre, Edad, N_Contacto,Cargo) VALUES
(1, 1, 1, 'Luis Martínez', 30, ' 912345678','Conserje'),
(2, 1, 2, 'Daniel Henriquez', 45, '987654321','Mayordomo'),
(3, 1, 3, 'Javier Santaolalla', 34, '998765432','Mayordomo'),
(4, 2, 2, 'Ana López', 25, '987654321','Conserje'),
(5, 2, 4, 'Sara Vergara', 44, '909876543','Mayordomo'),
(6, 3, 3, 'Carlos Sánchez', 47, '654987321','Mayordomo'),
(8, 3, 4, 'Pedro Chandia', 31, '123456789','Conserje');

-- Población de la tabla Lugar_Cliveh
INSERT INTO Lugar_Cliveh (ID_LUGAR_CLIVEH, ID_CLIENTE_VEHICULO, ID_LUGAR) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 10);



-- Población de la tabla Contrato
INSERT INTO Contrato (ID_CONTRATO, ID_ESTACIONAMIENTO, ID_CLIENTE_VEHICULO, Detalle, Fecha) VALUES
(1, 1, 1,'Contrato de arriendo mensual', '2024-04-01'),
(2, 2, 2,'Contrato de arriendo diario', '2024-04-02'),
(3, 3, 3,'Contrato de arriendo mensual', '2024-04-03'),
(4, 4, 4,'Contrato de arriendo mensual', '2024-04-04'),
(5, 5, 5,'Contrato de arriendo mensual', '2024-04-12'),
(6, 3, 6,'Contrato de arriendo mensual', '2024-04-13'),
(7, 2, 7,'Contrato de arriendo mensual', '2024-04-14'),
(8, 2, 8,'Contrato de arriendo mensual', '2024-04-16');



-- Población de la tabla Pago
INSERT INTO Pago (ID_PAGO, ID_CONTRATO, Valor, Fecha_pago) VALUES
(1, 1, 100000, '2024-04-05'),
(2, 2, 50000, '2024-04-06'),
(3, 3, 200000, '2024-04-07'),
(4, 4, 210000, '2024-04-17'),
(5, 5, 190000, '2024-04-13'),
(6, 6, 200000, '2024-04-16'),
(7, 7, 50000, '2024-04-18'),
(8, 8, 101000, '2024-04-18');

