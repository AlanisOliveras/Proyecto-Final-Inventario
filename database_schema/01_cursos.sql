-- Borrar y crear la base de datos
DROP DATABASE IF EXISTS gestion_cursos;

CREATE DATABASE gestion_cursos CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE gestion_cursos;

-- Crear tabla de roles
CREATE TABLE role (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(64) UNIQUE
);

-- Crear tabla de usuarios
CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(64) UNIQUE,
    email VARCHAR(120) UNIQUE,
    password_hash VARCHAR(256),
    role_id INT,
    FOREIGN KEY (role_id) REFERENCES role(id)
);

-- Crear tabla de cursos
CREATE TABLE curso (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    descripcion TEXT,
    profesor_id INT,
    FOREIGN KEY (profesor_id) REFERENCES user(id)
);

-- Insertar roles
INSERT INTO role (name) VALUES ('Admin'), ('Professor'), ('Student');
