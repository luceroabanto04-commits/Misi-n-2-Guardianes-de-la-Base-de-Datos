# 📊 Proyecto SQL - Base de datos de ventas

Este proyecto corresponde a la tarea del módulo **SQL II**.  
El objetivo es diseñar y consultar una **base de datos relacional** en **MySQL**, aplicando **joins, subconsultas, vistas y agregaciones**.

---

## 🗄️ Estructura de la base de datos

La base de datos se llama **`ventas`** y contiene 3 tablas principales:

- **cliente**
  - id, nombre, apellido1, apellido2, ciudad, categoría
- **comercial**
  - id, nombre, apellido1, apellido2, comisión
- **pedido**
  - id, total, fecha, id_cliente, id_comercial

### Relaciones
- Un **cliente** puede realizar varios **pedidos**.  
- Un **comercial** puede atender varios **pedidos**.  
- Cada **pedido** pertenece a un cliente y a un comercial.  

---

## 🔎 Consultas implementadas (vistas)

Se crearon varias **vistas** que facilitan el análisis de la información:

1. **`max_venta_cliente`**  
   → Muestra el cliente con la compra más alta.  
   _(Usa `JOIN` y una subconsulta con `MAX`)_.

2. **`Top5_clientes`**  
   → Lista los cinco clientes con mayores compras.  
   _(Usa `JOIN`, `ORDER BY` y `LIMIT`)_.

3. **`total_ventas_ciudades`**  
   → Muestra ventas agrupadas por ciudad, incluyendo el total vendido y número de pedidos.  
   _(Usa `GROUP BY`, `SUM`, `COUNT`)_.

4. **`mes_top_ventas`**  
   → Identifica el mes con más ventas.  
   _(Usa `GROUP BY`, `ORDER BY DESC`, `LIMIT 1`)_.

5. **`comerciales_ganancias_ventas`**  
   → Calcula las ganancias de cada comercial en base a su comisión y total vendido.  
   _(Usa `LEFT JOIN` para incluir comerciales sin pedidos)_.

6. **`ventas_promedio_comercial`**  
   → Calcula el promedio de ventas por cada comercial.  
   _(Usa `AVG`, `GROUP BY`, `LEFT JOIN`)_.

---

## 🚀 Cómo ejecutar el proyecto

1. Clona este repositorio:  
   ```bash
   git clone https://github.com/tu-usuario/ventas-sql.git
   cd ventas-sql```
2. Abre MySQL y ejecuta el script:
     ```bash
    SOURCE script.sql;
    ```
3. Consulta las vistas creadas:
    ```bash
    SELECT * FROM max_venta_cliente;
    SELECT * FROM Top5_clientes;
    SELECT * FROM total_ventas_ciudades;
    SELECT * FROM mes_top_ventas;
    SELECT * FROM comerciales_ganancias_ventas;
    SELECT * FROM ventas_promedio_comercial;
    ```

📚 Habilidades aplicadas
Diseño de modelo MER.

- Creación de base de datos relacional en MySQL.
- Uso de JOINS (INNER JOIN, LEFT JOIN).
- Subconsultas (MAX, AVG).
- Funciones de agregación (SUM, COUNT, AVG).
- Creación de vistas para reutilización de consultas.

✍️ Autor: Lucero Abanto
