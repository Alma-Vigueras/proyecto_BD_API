create database papeleria_system;

--Conect at Database
\c papeleria_system;

CREATE TABLE CLIENTE ( 
    id_Cliente serial NOT NULL,
    nombre varchar(40) NOT NULL,
    ap_Pat varchar(20) NOT NULL,
    ap_Mat varchar(20),
    razon_Social text,
    email varchar(80) NOT NULL,
    PRIMARY KEY(id_Cliente)
    );

CREATE TABLE DOMICILIO ( 
    id_Domicilio serial NOT NULL,
    estado varchar(40) NOT NULL,
    colonia varchar(40) NOT NULL,
    calle varchar(40) NOT NULL,
    numero smallint NOT NULL,
    cp smallint NOT NULL,
    PRIMARY KEY(id_Domicilio)
    );
    
CREATE TABLE DOMICILIO_CLIENTE ( 
    id_Domicilio_Cliente serial NOT NULL,
    id_cliente serial NOT NULL,
    id_Domicilio serial NOT NULL,
    PRIMARY KEY (id_Domicilio_Cliente),
    FOREIGN KEY(id_Client) REFERENCES CLIENTE(id_Cliente),
    FOREIGN KEY(id_Domicilio) REFERENCES DOMICILIO(id_Domicilio)
    );
    
CREATE TABLE DOMICILIO_PROVEEDOR( 
    id_Domicilio_Proveedor serial NOT NULL,
    id_Proveedor serial NOT NULL,
    id_Domicilio serial NOT NULL,
    PRIMARY KEY (id_Domicilio_Proveedor),
    FOREIGN KEY(id_Proveedor) REFERENCES CLIENTE(id_Proveedor),
    FOREIGN KEY(id_Domicilio) REFERENCES DOMICILIO(id_Domicilio)
    );
    
CREATE TABLE PROVEEDOR ( 
    id_Proveedor serial NOT NULL,
    nombre varchar(40) NOT NULL,
    ap_Pat varchar(20) NOT NULL,
    ap_Mat varchar(20),
    razon_Social text,
    PRIMARY KEY (id_Proveedor)
    );
    
CREATE TABLE TELEFONO ( 
    id_Telefono serial NOT NULL,
    num_Telefono varchar(10) NOT NULL,
    PRIMARY KEY (id_Telefono)
    );

CREATE TABLE TELEFONO_PROVEEDOR (  
    id_Telefono_Proveedor serial NOT NULL,
    id_Telefono serial NOT NULL,
    id_Proveedor serial NOT NULL,
    PRIMARY KEY (id_Telefono_Proveedor),
    FOREIGN KEY (id_Telefono) REFERENCES TELEFONO(id_Telefono),
    FOREIGN KEY(id_Proveedor) REFERENCES PROVEEDOR(id_Proveedor)
    );
    
CREATE TABLE VENTA ( 
    id_Venta serial NOT NULL DEFAULT  'VENT-'||nextval('num_Venta'),
    cant_Art_Total smallint NOT NULL,
    precio_Art money NOT NULL,
    precio_Total money NOT NULL,
    fecha_Venta date NOT NULL,
    PRIMARY KEY (id_Venta)
    );
    
CREATE SEQUENCE num_Venta
    START WITH 1,
    INCREMENT BY 1;
    

CREATE TABLE COMPRA( 
    id_Compra serial NOT NULL,
    id_Venta serial NOT NULL,
    id_Cliente serial NOT NULL,
    id_Producto serial NOT NULL,
    PRIMARY KEY (id_Compra),
    FOREIGN KEY(id_Venta) REFERENCES VENTA(id_Venta),
    FOREIGN KEY(id_Cliente) REFERENCES CLIENTE(id_Cliente),
    FOREIGN KEY(id_Producto) REFERENCES PRODUCTO(id_Producto)
    );
        
        
CREATE TABLE INVENTARIO_PRODUCTO ( 
    id_Inventario_Producto serial NOT NULL ,
    id_Inventario int NOT NULL,
    id_Producto int NOT NULL,
    descripcion text NOT NULL,
    cantidad smallint NOT NULL,
    marca varchar(25) NOT NULL,
    PRIMARY KEY (id_Inventario_Producto),
    FOREIGN KEY (id_Inventario) REFERENCES CLIENTE(id_Inventario),
    FOREIGN KEY (id_Producto) REFERENCES CLIENTE(id_Producto)
    );

CREATE TABLE DOMICILIO_INVENTARIO ( 
    id_Inventario serial NOT NULL,
    id_Domicilio_Inventario serial NOT NULL,
    id_Domicilio serial NOT NULL,
    PRIMARY KEY (id_Inventario),
    FOREIGN KEY (id_Domicilio_Inventario) REFERENCES INVENTARIO(id_Domicilio_Inventario),
    FOREIGN KEY (id_Domicilio) REFERENCES DOMICILIO(id_Domicilio)
    );
    
    
 CREATE TABLE INVENTARIO (
    id_Inventario serial NOT NULL,
    id_Domicilio_Inventario serial NOT NULL,
    PRIMARY KEY(id_Inventario),
    FOREIGN KEY(id_Domicilio_Inventario) REFERENCES DOMICILIO_INVENTARIO(id_Domicilio_Inventario)
    );
    
    
CREATE TABLE PROVEE ( 
    id_Provee serial NOT NULL,
    id_Proveedor serial NOT NULL,
    id_Producto serial NOT NULL,
    cant_Compra smallint,
    precio_Compra smallint,
    fecha_Compra date,
    PRIMARY KEY (id_Provee),
    FOREIGN KEY (id_Poveedor) REFERENCES PROVEEDOR(id_Proveedor),
    FOREIGN KEY (id_Producto) REFERENCES PRODUCTO(id_Producto)
);
    
    
CREATE TABLE PRODUCTO (
    id_Producto serial NOT NULL,
    precio_Venta money NOT NULL,
    tipo_Articulo varchar(5) NOT NULL,
    codigo_Barras varchar(20) NOT NULL,
    PRIMARY KEY (codigo_Barras),
    FOREIGN KEY(id_Inventario_Po) REFERENCES INTENTARIO(id_Inventario)
    );






