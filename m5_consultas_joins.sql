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

--Consulta 2 --
select
c.nombre as 'nombre_cliente',
c.email,
c.fecha_registro
from dbo.clientes c
left join dbo.ventas v
on c.id_cliente = v.id_cliente
where v.id_cliente is null 

--Consulta 3 --
select
p.nombre_producto,
t.nombre_categoria,
p.precio
from dbo.productos p
left join dbo.ventas v
on p.id_producto = v.id_producto
inner join dbo.categorias t
on t.id_categoria = p.id_categoria
where v.id_producto is null 
