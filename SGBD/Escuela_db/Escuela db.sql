BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Cliente" (
	"Id_cliente"	INTEGER NOT NULL,
	"Nombre"	TEXT NOT NULL,
	"Id_escuela"	INTEGER NOT NULL,
	"Provincia"	TEXT NOT NULL,
	"Direccion_envio"	TEXT NOT NULL,
	"Telefono"	TEXT NOT NULL UNIQUE,
	PRIMARY KEY("Id_cliente" AUTOINCREMENT),
	CONSTRAINT "FK cliente_escuela" FOREIGN KEY("Id_escuela") REFERENCES "Escuela"("Id_escuela")
);
CREATE TABLE IF NOT EXISTS "Detalle_pedido" (
	"Id_pedido"	INTEGER NOT NULL,
	"Id_producto"	INTEGER NOT NULL,
	"Talla"	TEXT NOT NULL,
	"Cantidad"	INTEGER NOT NULL,
	"Precio_unitario"	REAL NOT NULL,
	PRIMARY KEY("Id_pedido","Id_producto","Talla"),
	CONSTRAINT "fk_pedido_detalle" FOREIGN KEY("Id_pedido") REFERENCES "Pedido"("Id_pedido"),
	CONSTRAINT "fk_producto_detalle" FOREIGN KEY("Id_producto") REFERENCES "Producto"("Id_producto"),
	CONSTRAINT "check_cantidad" CHECK("Cantidad" > 0),
	CONSTRAINT "check_precio" CHECK("Precio_unitario" >= 0)
);
CREATE TABLE IF NOT EXISTS "Envio" (
	"Id_envio"	INTEGER NOT NULL,
	"Id_pedido"	INTEGER NOT NULL,
	"Fecha_envio"	TEXT NOT NULL,
	PRIMARY KEY("Id_envio" AUTOINCREMENT),
	CONSTRAINT "fk_envio_pedido" FOREIGN KEY("Id_pedido") REFERENCES "Pedido"("Id_pedido")
);
CREATE TABLE IF NOT EXISTS "Escuela" (
	"Id_escuela"	INTEGER NOT NULL,
	"Nombre"	TEXT NOT NULL UNIQUE,
	PRIMARY KEY("Id_escuela" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Pedido" (
	"Id_pedido"	INTEGER NOT NULL,
	"Id_cliente"	INTEGER NOT NULL,
	"Fecha_solicitud"	TEXT NOT NULL,
	"Fecha_recibo"	TEXT,
	PRIMARY KEY("Id_pedido" AUTOINCREMENT),
	CONSTRAINT "fk_cliente_pedido" FOREIGN KEY("Id_cliente") REFERENCES "Cliente"("Id_cliente") ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS "Producto" (
	"Id_producto"	INTEGER NOT NULL,
	"Nombre"	TEXT NOT NULL,
	"Id_tipo"	INTEGER NOT NULL,
	"Precio"	REAL NOT NULL,
	"Stock"	INTEGER NOT NULL,
	"Modelo"	TEXT NOT NULL,
	PRIMARY KEY("Id_producto" AUTOINCREMENT),
	CONSTRAINT "fk_producto_tipo" FOREIGN KEY("Id_tipo") REFERENCES "Tipo_producto"("Id_tipo"),
	CONSTRAINT "check_precio" CHECK("Precio" > 0),
	CONSTRAINT "check_stock" CHECK("Stock" >= 0)
);
CREATE TABLE IF NOT EXISTS "Tipo_producto" (
	"Id_tipo"	INTEGER NOT NULL,
	"Nombre"	TEXT NOT NULL,
	PRIMARY KEY("Id_tipo" AUTOINCREMENT)
);
COMMIT;
