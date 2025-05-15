DROP DATABASE IF EXISTS administrador_eventos;
CREATE DATABASE administrador_eventos CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE administrador_eventos;

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

CREATE TABLE evento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150),
    ubicacion VARCHAR(200),
    fecha_hora DATETIME,
    capacidad INT,
    descripcion TEXT
);

INSERT INTO role (name) VALUES ('Admin'), ('Organizador'), ('Participante');
