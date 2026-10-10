--Consulta 1 --
select
v.fecha_venta,
c.nombre as 'nombre_cliente',
p.nombre_producto as 'descripcion_producto',
v.cantidad,
v.precio_unitario,
(v.cantidad * v.precio_unitario) as 'total_venta'
from dbo.ventas v
inner join dbo.productos p
on p.id_producto = v.id_producto 
inner join dbo.clientes c
on c.id_cliente = v.id_cliente
