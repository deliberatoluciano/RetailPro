--Consulta 1 -- 
select
month (fecha_venta) as mes,
count (id_venta) as cantidad_pedidos, 
avg (cantidad * precio_unitario) as ticket_promedio,
sum (cantidad * precio_unitario) as total_facturado
from ventas
group by month(fecha_venta)

--Consulta 2 --
select top 5
id_producto as producto,
sum(cantidad) as unidades_vendidas,
sum(cantidad * precio_unitario) as total_facturado
from ventas
group by id_producto
order by total_facturado desc

-- Consulta 3 --
select 
id_cliente as cliente,
count (*) as cantidad_pedidos,
sum (cantidad * precio_unitario) as total_gastado
from ventas
group by id_cliente
having count(*) > 1

-- Consulta 4 --
SELECT
    mes,
    total_facturado,
    CASE
        WHEN total_facturado > promedio_mensual THEN 'Por encima'
        ELSE 'Por debajo'
    END AS comparacion_promedio
FROM (
    SELECT
        MONTH(fecha_venta) AS mes,
        SUM(cantidad * precio_unitario) AS total_facturado,
        AVG(SUM(cantidad * precio_unitario)) OVER () AS promedio_mensual
    FROM ventas
    GROUP BY MONTH(fecha_venta)
) AS resumen_mensual;


-- Bloque de cierre - Hallazgos
-- 1. El mes 3 concentró toda la facturación registrada, con un total de $6444 y un ticket promedio de $644,40.
-- 2. El producto 1 fue el más vendido, con 3600 de facturación, representando aproximadamente el 56% del total mensual.
-- 3. El cliente 1 fue el que más gastó entre los clientes recurrentes, con un total de $2640, equivalente a aproximadamente el 41% de la facturación mensual.
