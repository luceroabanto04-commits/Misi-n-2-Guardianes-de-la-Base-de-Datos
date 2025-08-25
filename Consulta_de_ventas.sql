-- Cliente con la mayor compra
CREATE OR REPLACE VIEW max_venta_cliente AS
SELECT 
    c.id, 
    c.nombre AS Nombre, 
    c.apellido1 AS `Apellido paterno`, 
    c.apellido2 AS `Apellido materno`, 
    p.total AS `Monto de pedido`
FROM cliente c
JOIN pedido p ON c.id = p.id_cliente
WHERE p.total = (SELECT MAX(total) FROM pedido);
SELECT * FROM max_venta_cliente;

-- El top 5 clientes que mas compran
CREATE OR REPLACE VIEW Top5_clientes AS
SELECT     
    c.id, 
    c.nombre AS Nombre, 
    c.apellido1 AS `Apellido paterno`, 
    c.apellido2 AS `Apellido materno`,
    c.ciudad AS Ciudad, 
    p.total AS `Monto de compra`
FROM cliente c
JOIN pedido p ON c.id = p.id_cliente
ORDER BY p.total DESC
LIMIT 5;
SELECT * FROM Top5_clientes;

-- Tabla de total de ventas por ciudades
CREATE OR REPLACE VIEW total_ventas_ciudades AS
SELECT 
	c.ciudad AS `Ciudad`,
    ROUND(SUM(p.total),2) AS `Total vendido`,
    COUNT(p.id) AS `Numero de pedidos`
FROM cliente c
JOIN pedido p ON c.id = p.id_cliente
GROUP BY c.ciudad							-- Va si o si - Ordenado por c.ciudad
ORDER BY `Total vendido` DESC;				-- Ordenado por renombre AS
SELECT * FROM total_ventas_ciudades; 

-- Mes con más ventas
CREATE OR REPLACE VIEW mes_top_ventas AS
SELECT 
    DATE_FORMAT(p.fecha, '%Y-%m') AS Periodo,
    ROUND(SUM(p.total), 2) AS `Total vendido`
FROM pedido p
GROUP BY Periodo
ORDER BY `Total vendido` DESC
LIMIT 1;
SELECT * FROM mes_top_ventas; 

-- Tabla de ganancias de comerciales
CREATE OR REPLACE VIEW comerciales_ganancias_ventas AS
SELECT 
    c.id, 
    c.nombre AS Nombre, 
    c.apellido1 AS `Apellido paterno`, 
    c.apellido2 AS `Apellido materno`,
    c.comisión AS `Porcentaje de comisión`,
    ROUND(SUM(p.total),2) AS `Total vendido`,
    ROUND(SUM(p.total * c.comisión),2) AS `Total ganancias`
FROM comercial c
LEFT JOIN pedido p ON c.id = p.id_comercial		-- Usando LEFT JOIN porque quiero que aparezcan todos los Comerciales
GROUP BY c.id, c.nombre, c.apellido1, c.apellido2, c.comisión;		-- Ordenado por renombre AS
SELECT * FROM comerciales_ganancias_ventas
ORDER BY `Total ganancias` DESC;

-- Promedio de ventas por comercial
CREATE OR REPLACE VIEW ventas_promedio_comercial AS 
SELECT 
	c.id, 
    c.nombre AS Nombre, 
    c.apellido1 AS `Apellido paterno`, 
    c.apellido2 AS `Apellido materno`,
    c.comisión AS `Porcentaje de comisión`, 
    ROUND(AVG(p.total), 2) AS `Promedio por pedido`
FROM comercial c
LEFT JOIN pedido p ON c.id = p.id_comercial  -- LEFT JOIN para incluir comerciales sin pedidos
GROUP BY c.id, Nombre, `Apellido paterno`, `Apellido materno`
ORDER BY `Promedio por pedido` DESC;
SELECT * FROM ventas_promedio_comercial;

