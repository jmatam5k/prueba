--CREACIÓN BASE DE DATOS
CREATE DATABASE prueba;

--CREACIÓN ENTIDAD CLIENTE
CREATE TABLE cliente(id SERIAL, nombre VARCHAR(30),rut VARCHAR(11),direccion VARCHAR(100), PRIMARY KEY(id));

--CREACIÓN ENTIDAD FACTURA
CREATE TABLE factura(id SERIAL, fecha_creacion TIMESTAMP, subtotal INT, iva INT,total INT, id_cliente INT, PRIMARY KEY (id), FOREIGN KEY (id_cliente) REFERENCES cliente(id));

--CREACIÓN ENTIDAD CATEGORÍA
CREATE TABLE categoria(id SERIAL, nombre VARCHAR(50), descripcion VARCHAR(150), PRIMARY KEY(id));

--CREACIÓN ENTIDAD PRODUCTO
CREATE TABLE producto(id SERIAL, nombre VARCHAR(40), descripcion VARCHAR(150), precio_unitario INT, id_categoria INT, PRIMARY KEY (id), FOREIGN KEY (id_categoria) REFERENCES categoria(id) );

--CREACIÓN TABLA INTERMEDIA
CREATE TABLE factura_producto(id SERIAL, cantidad INT, total INT, id_factura INT, id_producto INT, PRIMARY KEY(id), FOREIGN KEY(id_factura) REFERENCES factura(id), FOREIGN KEY (id_producto) REFERENCES producto(id));

--INSERTAR CLIENTES (5)
INSERT INTO cliente(nombre, rut, direccion) VALUES ('cliente 1', 111111111, 'direccion cliente 1' );
INSERT INTO cliente(nombre, rut, direccion) VALUES ('cliente 2', 222222222, 'direccion cliente 2' );
INSERT INTO cliente(nombre, rut, direccion) VALUES ('cliente 3', 333333333, 'direccion cliente 3' );
INSERT INTO cliente(nombre, rut, direccion) VALUES ('cliente 4', 444444444, 'direccion cliente 4' );
INSERT INTO cliente(nombre, rut, direccion) VALUES ('cliente 5', 555555555, 'direccion cliente 5' );

--INSERTAR CATEGORIAS (3)
INSERT INTO categoria(nombre, descripcion) VALUES ('Categoria 1', 'Descripcion categoria 1');
INSERT INTO categoria(nombre, descripcion) VALUES ('Categoria 2', 'Descripcion categoria 2');
INSERT INTO categoria(nombre, descripcion) VALUES ('Categoria 3', 'Descripcion categoria 3');

--INSERTAR PRODUCTOS (8)
INSERT INTO producto(nombre, descripcion, precio_unitario, id_categoria) VALUES ('Producto 1', 'Descripcion producto 1', 111, 1);
INSERT INTO producto(nombre, descripcion, precio_unitario, id_categoria) VALUES ('Producto 2', 'Descripcion producto 2', 222, 2);
INSERT INTO producto(nombre, descripcion, precio_unitario, id_categoria) VALUES ('Producto 3', 'Descripcion producto 3', 333, 3);
INSERT INTO producto(nombre, descripcion, precio_unitario, id_categoria) VALUES ('Producto 4', 'Descripcion producto 4', 444, 1);
INSERT INTO producto(nombre, descripcion, precio_unitario, id_categoria) VALUES ('Producto 5', 'Descripcion producto 5', 555, 2);
INSERT INTO producto(nombre, descripcion, precio_unitario, id_categoria) VALUES ('Producto 6', 'Descripcion producto 6', 666, 3);
INSERT INTO producto(nombre, descripcion, precio_unitario, id_categoria) VALUES ('Producto 7', 'Descripcion producto 7', 777, 1);
INSERT INTO producto(nombre, descripcion, precio_unitario, id_categoria) VALUES ('Producto 8', 'Descripcion producto 8', 888, 2);

--INSERTAR 10 facturas
    --2 para el cliente 1, con 2 y 3 productos
    INSERT INTO factura(fecha_creacion, subtotal, iva, total, id_cliente) VALUES (current_timestamp,11111,111,11222,1);

    INSERT INTO factura_producto(cantidad, total, id_factura, id_producto) VALUES (2,1111,1,1);

    INSERT INTO factura(fecha_creacion, subtotal, iva, total, id_cliente) VALUES (current_timestamp,11111,111,11222,1);

    INSERT INTO factura_producto(cantidad, total, id_factura, id_producto) VALUES (3,33333,2,1);

    --3 para el cliente 2, con 3, 2 y 3 productos
    INSERT INTO factura(fecha_creacion, subtotal, iva, total, id_cliente) VALUES (current_timestamp,2928,190,3118,2);
    INSERT INTO factura(fecha_creacion, subtotal, iva, total, id_cliente) VALUES (current_timestamp,3000,100,3100,2);
    INSERT INTO factura(fecha_creacion, subtotal, iva, total, id_cliente) VALUES (current_timestamp,6000,200,4200,2);

    INSERT INTO factura_producto(cantidad, total, id_factura, id_producto) VALUES (3,976,3,4);
    INSERT INTO factura_producto(cantidad, total, id_factura, id_producto) VALUES (2,1500,4,5);
    INSERT INTO factura_producto(cantidad, total, id_factura, id_producto) VALUES (3,2000,5,6);


    --1 para el cliente 3, con 1 producto
    INSERT INTO factura(fecha_creacion, subtotal, iva, total, id_cliente) VALUES (current_timestamp,4500,500,5000,3);
    
    INSERT INTO factura_producto(cantidad, total, id_factura, id_producto) VALUES (1,4500,6,7);

    --4 para el cliente 4, con 2, 3, 4 y 1 producto
    INSERT INTO factura(fecha_creacion, subtotal, iva, total, id_cliente) VALUES (current_timestamp,1500,100,1600,4);
    INSERT INTO factura(fecha_creacion, subtotal, iva, total, id_cliente) VALUES (current_timestamp,3000,100,3100,4);
    INSERT INTO factura(fecha_creacion, subtotal, iva, total, id_cliente) VALUES (current_timestamp,6000,200,4200,4);
    INSERT INTO factura(fecha_creacion, subtotal, iva, total, id_cliente) VALUES (current_timestamp,6000,200,4200,4);

    INSERT INTO factura_producto(cantidad, total, id_factura, id_producto) VALUES (2,750,7,4);
    INSERT INTO factura_producto(cantidad, total, id_factura, id_producto) VALUES (3,1000,8,5);
    INSERT INTO factura_producto(cantidad, total, id_factura, id_producto) VALUES (4,1500,9,6);
    INSERT INTO factura_producto(cantidad, total, id_factura, id_producto) VALUES (1,6000,10,8);

--CONSULTAS
--¿Que cliente realizó la compra más cara?
SELECT nombre FROM cliente AS A JOIN factura AS B ON A.id = B.id_cliente ORDER BY B.total DESC LIMIT 1;
--¿Que cliente pagó sobre 100 de monto?
SELECT DISTINCT nombre FROM cliente AS A JOIN factura AS B ON A.id = B.id_cliente WHERE b.total >= 100;
--¿Cuantos clientes han comprado el producto 6?
SELECT COUNT (*) FROM factura AS C JOIN factura_producto as D ON C.id = D.id_factura WHERE D.id_producto = 6;

