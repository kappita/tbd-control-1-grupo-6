-- DROP TABLE IF EXISTS;

CREATE TABLE comuna (
  id SERIAL AUTOINCREMENT PRIMARY KEY,
  nombre TEXT not null
);

CREATE TABLE sueldo (
  id SERIAL AUTOINCREMENT PRIMARY KEY,
  valor_bruto INTEGER NOT NULL,
  valor_liquido INTEGER NOT NULL
)


CREATE TABLE estacionamiento (
  id SERIAL AUTOINCREMENT PRIMARY KEY,
  id_comuna SERIAL NOT NULL,
  FOREIGN KEY (id_comuna) REFERENCES comuna(id),
);

CREATE TABLE empleado (
  id SERIAL AUTOINCREMENT PRIMARY KEY,
  id_estacionamiento SERIAL NOT NULL,
  id_sueldo SERIAL NOT NULL,
  cargo TEXT NOT NULL,
  edad INTEGER NOT NULL,
  n_contacto TEXT NOT NULL,
  FOREIGN KEY (id_estacionamiento) REFERENCES estacionamiento(id),
  FOREIGN KEY (id_sueldo) REFERENCES sueldo(id)
)

CREATE TABLE lugar (
  id SERIAL AUTOINCREMENT PRIMARY KEY,
  id_estacionamiento SERIAL NOT NULL,
  numero_lugar INTEGER NOT NULL,
  FOREIGN KEY (id_estacionamiento) REFERENCES estacionamiento(id)
);


CREATE TABLE contrato (
  id SERIAL AUTOINCREMENT PRIMARY KEY,
  id_estacionamiento SERIAL NOT NULL,
  detalle TEXT,
  fecha DATE NOT NULL DEFAULT CURRENT_DATE
  FOREIGN KEY (id_estacionamiento) REFERENCES estacionamiento(id)
);


CREATE TABLE pago (
  id SERIAL AUTOINCREMENT PRIMARY KEY,
  id_contrato SERIAL NOT NULL,
  valor INTEGER NOT NULL,
  fecha DATE NOT NULL DEFAULT CURRENT_DATE
  FOREIGN KEY (id_contrato) REFERENCES contrato(id)
);

CREATE TABLE cliente (
  id SERIAL AUTOINCREMENT PRIMARY KEY,
  nombre TEXT NOT NULL,
  id_comuna SERIAL NOT NULL,
  FOREIGN KEY (id_comuna) REFERENCES comuna(id)
);

CREATE TABLE modelo (
  id SERIAL AUTOINCREMENT PRIMARY KEY,
  nombre TEXT NOT NULL,
  descripcion TEXT NOT NULL,
  marca TEXT NOT NULL
);

CREATE TABLE vehiculo (
  id SERIAL AUTOINCREMENT PRIMARY KEY,
  id_modelo SERIAL NOT NULL,
  patente TEXT NOT NULL,
  color TEXT NOT NULL,
  estado TEXT NOT NULL
  FOREIGN KEY (id_modelo) REFERENCES modelo(id)
);

CREATE TABLE cliente_vehiculo (
  id SERIAL AUTOINCREMENT PRIMARY KEY,
  id_cliente SERIAL NOT NULL,
  id_vehiculo SERIAL NOT NULL,
  id_contrato SERIAL NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES cliente(id),
  FOREIGN KEY (id_vehiculo) REFERENCES vehiculo(id),
  FOREIGN KEY (id_contrato) REFERENCES contrato(id)
);

CREATE TABLE lugar_cliveh (
  id SERIAL AUTOINCREMENT PRIMARY KEY,
  id_lugar SERIAL NOT NULL,
  id_cliveh SERIAL NOT NULL,
  FOREIGN KEY (id_lugar) REFERENCES lugar(id),
  FOREIGN KEY (id_cliveh) REFERENCES cliente_vehiculo (id)
)




