DROP DATABASE IF EXISTS seguimiento_tickets;
CREATE DATABASE seguimiento_tickets CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE seguimiento_tickets;

CREATE TABLE role (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(64) UNIQUE
);

CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(64) UNIQUE,
    email VARCHAR(120) UNIQUE,
    password_hash VARCHAR(256),
    role_id INT,
    FOREIGN KEY (role_id) REFERENCES role(id)
);

CREATE TABLE ticket (
    id INT AUTO_INCREMENT PRIMARY KEY,
    asunto VARCHAR(150),
    descripcion TEXT,
    prioridad ENUM('Baja', 'Media', 'Alta'),
    estado ENUM('Abierto', 'En proceso', 'Cerrado'),
    usuario_id INT,
    tecnico_id INT,
    fecha_creacion DATETIME,
    FOREIGN KEY (usuario_id) REFERENCES user(id),
    FOREIGN KEY (tecnico_id) REFERENCES user(id)
);

INSERT INTO role (name) VALUES ('Admin'), ('Usuario'), ('Técnico');
