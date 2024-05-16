create database if not exists examen;

use examen;


create table if not exists examen.categorias(
	IdCategoria int auto_increment not null,
    NombreCategoria varchar(15) not null,
    Descripcion varchar(200),
    primary key (Idcategoria)
);

create table if not exists examen.productos(
	IdProductos int auto_increment not null,
    NombreProducto varchar(40) not null,
    categorias_IdCategoria int,
    CantidadPorUnidad varchar(20),
    PrecioUnidad decimal(5,2),
    UnidadesEnExistencia smallint,
    UnidadesEnPedido smallint,
    suspendido tinyint(1),
    primary key (IdProductos),
    foreign key (categorias_IdCategoria) references categorias(IdCategoria) on delete cascade
);



INSERT INTO categorias (NombreCategoria, Descripcion) VALUES
('Electrónica', 'Productos electrónicos y gadgets'),
('Ropa', 'Ropa para hombres, mujeres y niños'),
('Hogar', 'Productos para el hogar y decoración'),
('Deportes', 'Artículos deportivos y equipos'),
('Alimentos', 'Productos alimenticios y comestibles'),
('Libros', 'Libros de distintos géneros'),
('Juguetes', 'Juguetes para niños de todas las edades'),
('Música', 'CDs y vinilos de diferentes artistas'),
('Herramientas', 'Herramientas para bricolaje y construcción'),
('Jardinería', 'Productos para el cuidado del jardín y plantas');

INSERT INTO productos (NombreProducto, categorias_IdCategoria, CantidadPorUnidad, PrecioUnidad, UnidadesEnExistencia, UnidadesEnPedido, suspendido) VALUES
('Teléfono inteligente', 1, '1 unidad', 399.99, 50, 10, 0),
('Camiseta de algodón', 2, '1 unidad', 19.99, 100, 20, 0),
('Juego de sábanas', 3, '1 juego', 29.99, 80, 15, 0),
('Balón de fútbol', 4, '1 unidad', 9.99, 150, 30, 0),
('Arroz integral', 5, '1 kg', 2.99, 200, 40, 0),
('Novela de ficción', 6, '1 libro', 12.99, 50, 5, 0),
('Muñeca Barbie', 7, '1 unidad', 29.99, 30, 10, 0),
('Álbum de música', 8, '1 CD', 14.99, 80, 20, 0),
('Set de herramientas', 9, '1 set', 49.99, 40, 8, 0),
('Semillas de flores', 10, '1 paquete', 5.99, 100, 15, 0);

select nombrecontacto, cargo contacto from clientes;

select nombrecontacto, pais from clientes
where pais = 'alemania';

SELECT nombreContacto
FROM clientes
WHERE pais = 'Alemania' 
AND (CargoContacto = 'Agente de ventas' OR CargoContacto = 'Asistente de marketing')
ORDER BY nombreContacto ASC;

select idpedido, idcliente, destinatario from examen.pedidos
where idcliente = 'anton';

select * from detellespedidos d
inner join pedidos p on p.idpedido = d.idpedido
inner join clientes c on c.idcliente = p.idclientes
where p.ciudad = 'Londres';

select c.mbrecompañia, p.fechapedido from clientes c
inner join pedidos p on p.idcliente = c.idcliente
where fechapedido >'1997-1-1'

select sum(cargo) from pedidos
where nombrecontacto = 'ana trujillo';

SELECT NombreContacto
FROM clientes
WHERE idCliente NOT IN (SELECT idCliente FROM pedidos);




