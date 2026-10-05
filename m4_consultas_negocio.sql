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
