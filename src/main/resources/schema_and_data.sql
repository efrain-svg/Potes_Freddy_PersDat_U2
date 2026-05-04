CREATE DATABASE IF NOT EXISTS bd_componentes_electronicos;
USE bd_componentes_electronicos;

CREATE TABLE IF NOT EXISTS tb_categoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS tb_ubicacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    bodega VARCHAR(100) NOT NULL,
    estanteria VARCHAR(50),
    fila VARCHAR(50),
    columna VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS tb_producto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo_componente VARCHAR(100),
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    categoria_id INT NOT NULL,
    ubicacion_id INT UNIQUE,
    CONSTRAINT fk_producto_categoria
        FOREIGN KEY (categoria_id) REFERENCES tb_categoria(id),
    CONSTRAINT fk_producto_ubicacion
        FOREIGN KEY (ubicacion_id) REFERENCES tb_ubicacion(id)
);

CREATE TABLE IF NOT EXISTS tb_proyecto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_proyecto VARCHAR(150) NOT NULL,
    descripcion VARCHAR(255),
    fecha_inicio DATE
);

CREATE TABLE IF NOT EXISTS tb_proyecto_producto (
    proyecto_id INT NOT NULL,
    producto_id INT NOT NULL,
    PRIMARY KEY (proyecto_id, producto_id),
    CONSTRAINT fk_pp_proyecto
        FOREIGN KEY (proyecto_id) REFERENCES tb_proyecto(id),
    CONSTRAINT fk_pp_producto
        FOREIGN KEY (producto_id) REFERENCES tb_producto(id)
);

INSERT INTO tb_categoria (nombre) VALUES
    ('Microcontroladores'),
    ('Sensores'),
    ('Actuadores');

INSERT INTO tb_ubicacion (bodega, estanteria, fila, columna) VALUES
    ('Laboratorio 1', 'A', '1', '1'),
    ('Laboratorio 1', 'A', '1', '2'),
    ('Laboratorio 2', 'B', '2', '1'),
    ('Laboratorio 2', 'B', '2', '2'),
    ('Laboratorio 3', 'C', '3', '1');

INSERT INTO tb_producto (nombre, tipo_componente, precio, stock, categoria_id, ubicacion_id) VALUES
    ('ESP32', 'MCU', 12.50, 50, 1, 1),
    ('Arduino Nano', 'MCU', 9.95, 30, 1, 2),
    ('Sensor Ultrasonico HC-SR04', 'Sensor', 3.40, 100, 2, 3),
    ('Motor DC 12V', 'Actuador', 8.20, 20, 3, 4),
    ('Servo SG90', 'Actuador', 4.15, 60, 3, 5);

INSERT INTO tb_proyecto (nombre_proyecto, descripcion, fecha_inicio) VALUES
    ('Robot Seguidor', 'Robot autonomo con sensores de linea', '2026-05-01'),
    ('Estacion Meteorologica', 'Monitoreo ambiental con sensores', '2026-05-02');

INSERT INTO tb_proyecto_producto (proyecto_id, producto_id) VALUES
    (1, 1),
    (1, 3),
    (1, 5),
    (2, 2),
    (2, 3),
    (2, 4);

