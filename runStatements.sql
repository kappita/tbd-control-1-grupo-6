
--Sentencia 1:
--Lista de clientes que gasta más por edificio.
--Lista de clientes que gasta más por edificio.
SELECT ee.ID_ESTACIONAMIENTO AS Estacionamiento,c.Nombre,SUM(p.Valor) AS Total_Gastado
  
FROM   Cliente c
JOIN  Cliente_Vehiculo cv ON c.ID_CLIENTE = cv.ID_CLIENTE
JOIN Contrato co ON co.ID_CLIENTE_VEHICULO = cv.ID_CLIENTE_VEHICULO
JOIN  Pago p ON p.ID_CONTRATO = co.ID_CONTRATO
JOIN Edificio_Estacionamiento ee ON co.ID_ESTACIONAMIENTO=ee.ID_ESTACIONAMIENTO
GROUP BY c.ID_CLIENTE,ee.ID_ESTACIONAMIENTO
ORDER BY  ee.ID_ESTACIONAMIENTO,Total_Gastado DESC;

 
--Sentencia 2:
--Modelos de auto menos recurrentes por edificio.
 
SELECT ee.ID_ESTACIONAMIENTO AS Estacionamiento,ee.Nombre,m.Nombre_modelo AS Modelo_Auto,COUNT(m.NOMBRE_MODELO) AS Veces_Visto
FROM Edificio_Estacionamiento ee
JOIN Lugar l ON ee.ID_ESTACIONAMIENTO = l.ID_ESTACIONAMIENTO
JOIN Lugar_Cliveh lc ON lc.ID_LUGAR= l.ID_LUGAR
JOIN Cliente_Vehiculo cv ON cv.ID_CLIENTE_VEHICULO= lc.ID_CLIENTE_VEHICULO
JOIN Vehiculo v ON v.ID_VEHICULO = cv.ID_VEHICULO
JOIN Modelo m ON m.ID_MODELO = v.ID_MODELO
GROUP BY m.ID_MODELO, ee.ID_ESTACIONAMIENTO
ORDER BY ee.ID_ESTACIONAMIENTO,Veces_Visto;

--SENTENCIA 3:
--–Empleados con mayor y menor sueldo por edificio.

WITH empleado_sueldo_bruto AS (
	SELECT e.*, s.valor_bruto
	FROM Empleado e 
	INNER JOIN Sueldo s
	ON e.ID_SUELDO = s.ID_SUELDO
),
	high_low_salaries AS (
	SELECT e.id_estacionamiento, max(e.valor_bruto) maximo, min(e.valor_bruto) minimo
	FROM empleado_sueldo_bruto e
	GROUP BY e.id_estacionamiento
), 
	high_employees AS (
	SELECT s.*, e.ID_EMPLEADO id_empleado_mayor, e.nombre nombre_empleado_mayor
	FROM high_low_salaries s
	INNER JOIN empleado_sueldo_bruto e
	ON 
		e.valor_bruto = s.maximo
		AND e.id_estacionamiento = s.id_estacionamiento 
),
	all_employees AS (
	SELECT s.*, e.ID_EMPLEADO id_empleado_menor, e.nombre nombre_empleado_menor
	FROM high_employees s
	INNER JOIN empleado_sueldo_bruto e
	ON 
		e.valor_bruto = s.minimo
		AND e.id_estacionamiento = s.id_estacionamiento 
)
select * from all_employees


--Sentencia 4: 
--– Lista de comunas con la cantidad de clientes que residen en ellas.
SELECT C.Nombre AS Comuna,
COUNT(CL.ID_CLIENTE) AS Cantidad_Clientes
FROM Comuna C
LEFT JOIN Cliente CL ON C.ID_COMUNA = CL.ID_COMUNA
GROUP BY C.Nombre
ORDER BY Cantidad_Clientes DESC;

--Sentencia 5:
--–Lista de edificios con más lugares disponibles 

SELECT h.ID_ESTACIONAMIENTO, NOMBRE, C_ID AS Lugares_disponibles
FROM Edificio_Estacionamiento ee
JOIN
(SELECT
	l.ID_ESTACIONAMIENTO, count(l.ID_ESTACIONAMIENTO) AS C_ID
FROM
	(SELECT ID_LUGAR
	FROM Lugar l
	EXCEPT
	SELECT ID_LUGAR
	FROM Lugar_cliveh lcv) AS x
	INNER JOIN Lugar l ON x.ID_LUGAR = l.ID_LUGAR
	INNER JOIN Edificio_Estacionamiento ee ON l.ID_ESTACIONAMIENTO = ee.ID_ESTACIONAMIENTO    
GROUP BY l.ID_ESTACIONAMIENTO) AS h
ON h.ID_ESTACIONAMIENTO = ee.ID_ESTACIONAMIENTO
ORDER BY C_ID DESC;



--Sentencia 6:
--–Lista de edificios con menos lugares disponibles

WITH lugares_usados as (
	-- DISTINCT ID_LUGAR para evitar contar múltiples contratos sobre el mismo lugar
	SELECT ID_ESTACIONAMIENTO, count(DISTINCT l.ID_LUGAR) usados FROM Lugar l INNER JOIN Lugar_Cliveh lc ON l.ID_LUGAR = lc.ID_LUGAR GROUP BY l.ID_ESTACIONAMIENTO
),
	lugares_totales as (
	SELECT ID_ESTACIONAMIENTO, count(*) totales FROM Lugar GROUP BY ID_ESTACIONAMIENTO
	)


SELECT lu.id_estacionamiento, e.nombre, lt.totales, lu.usados,  lt.totales - lu.usados libres
	FROM lugares_usados lu 
	INNER JOIN lugares_totales lt 
	ON lu.ID_ESTACIONAMIENTO = lt.ID_ESTACIONAMIENTO 
	INNER JOIN edificio_estacionamiento e
	ON e.ID_ESTACIONAMIENTO = lt.ID_ESTACIONAMIENTO 
	ORDER BY libres ASC


--Sentencia 7:
--Lista de clientes con más autos por edificio.

SELECT
    ce.ID_ESTACIONAMIENTO,
    c.ID_CLIENTE,
    c.Nombre AS Nombre_Cliente,
    COUNT(cv.ID_VEHICULO) AS Total_Autos
FROM Cliente c
JOIN Cliente_Vehiculo cv ON c.ID_CLIENTE = cv.ID_CLIENTE
JOIN Vehiculo v ON cv.ID_VEHICULO = v.ID_VEHICULO
JOIN Lugar l ON v.ID_VEHICULO = l.ID_LUGAR
JOIN Edificio_Estacionamiento ce ON l.ID_ESTACIONAMIENTO = ce.ID_ESTACIONAMIENTO
GROUP BY ce.ID_ESTACIONAMIENTO, c.ID_CLIENTE
ORDER BY ce.ID_ESTACIONAMIENTO, Total_Autos DESC;

--Sentencia 8: 
-- Lugar más usado por edificio.
--DADO QUE NOSOTROS ENTENDIMOS LUGAR COMO ESTACIONAMIENTO, LO CONTÉ COMO LAS VECES QUE MÁS SE UTILIZÓ EL ESTACIONAMIENTO.
SELECT L.numero_lugar, L.ID_ESTACIONAMIENTO, COUNT(*) AS Veces_Utilizado
FROM Lugar L INNER JOIN Edificio_Estacionamiento EE ON L.ID_ESTACIONAMIENTO = EE.ID_ESTACIONAMIENTO
GROUP BY L.numero_lugar, L.ID_ESTACIONAMIENTO
ORDER BY Veces_Utilizado DESC, L.ID_ESTACIONAMIENTO;

--Sentencia 9:
--– Edificio con más empleados, indicando el número de empleados de ese edificio.

SELECT
    e.ID_ESTACIONAMIENTO,
    COUNT(e.ID_EMPLEADO) AS Numero_Empleados
FROM Empleado e
GROUP BY e.ID_ESTACIONAMIENTO
ORDER BY Numero_Empleados DESC
LIMIT 1;


--Sentencia 10
--Lista de sueldos de los empleados por tipo de empleado por edificio (resaltando las comunas)
SELECT  e.NOMBRE,c.NOMBRE AS Comuna, e.ID_ESTACIONAMIENTO, s.VALOR_BRUTO, s.VALOR_LIQUIDO, e.Cargo AS Tipo
FROM Comuna c
INNER JOIN Edificio_Estacionamiento ee ON ee.ID_COMUNA = c.ID_COMUNA
INNER JOIN Empleado e ON e.ID_ESTACIONAMIENTO = ee.ID_ESTACIONAMIENTO
INNER JOIN Sueldo s ON e.ID_SUELDO = s.ID_SUELDO
ORDER BY Tipo, e.ID_ESTACIONAMIENTO;
