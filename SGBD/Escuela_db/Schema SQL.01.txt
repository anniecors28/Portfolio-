CREATE TABLE Cliente(

Id_cliente INT NOT NULL AUTO_INCREMENT,
Nombre VARCHAR(100) NOT NULL,
Id_escuela INT NOT NULL,
Provincia VARCHAR(100) NOT NULL,
Direccion_envio VARCHAR(100) NOT NULL,
Telefono VARCHAR(15) NOT NULL,

PRIMARY KEY (Id_cliente),
FOREIGN KEY (Id_escuela) REFERENCES Escuela (Id_escuela)
);


CREATE TABLE Escuela(

Id_escuela INT NOT NULL AUTO_INCREMENT,
Nombre VARCHAR(100) NOT NULL,

PRIMARY KEY (Id_escuela)
);


CREATE TABLE Producto(

Id_producto INT NOT NULL AUTO_INCREMENT,
Nombre VARCHAR(50) NOT NULL,
Id_tipo INT NOT NULL,
Precio_producto DECIMAL(10,2) NOT NULL,
Stock INT NOT NULL,
Modelo VARCHAR(20) NOT NULL,

PRIMARY KEY (Id_producto),
FOREIGN KEY (Id_tipo) REFERENCES Tipo_producto (Id_tipo)
);


CREATE TABLE Tipo_producto(

Id_tipo INT NOT NULL AUTO_INCREMENT,
Nombre VARCHAR(20) NOT NULL,

PRIMARY KEY (Id_tipo)
);

CREATE TABLE Pedido(

Id_pedido INT NOT NULL AUTO_INCREMENT,
Id_cliente INT NOT NULL,
Fecha_solicitud DATETIME NOT NULL,
Fecha_recibo DATETIME,

PRIMARY KEY (Id_pedido),
FOREIGN KEY (Id_cliente) REFERENCES Cliente (Id_cliente)
);


CREATE TABLE Detalle_pedido(

Id_pedido INT NOT NULL,
Id_producto INT NOT NULL,
Talla VARCHAR(5) NOT NULL,
Cantidad INT NOT NULL,
Precio_unitario DECIMAL(10,2) NOT NULL,

PRIMARY KEY (Id_pedido, Id_producto, Talla),
FOREIGN KEY (Id_pedido) REFERENCES Pedido (Id_pedido),
FOREIGN KEY (Id_producto) REFERENCES Producto (Id_producto)
);


CREATE TABLE Envio(

Id_envio INT NOT NULL AUTO_INCREMENT,
Id_pedido INT NOT NULL,
Fecha_envio DATETIME NOT NULL,

PRIMARY KEY (Id_envio),
FOREIGN KEY (Id_pedido) REFERENCES Pedido (Id_pedido)
);
