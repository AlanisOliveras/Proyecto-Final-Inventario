DROP DATABASE IF EXISTS recetas_culinarias;
CREATE DATABASE recetas_culinarias CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE recetas_culinarias;

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

CREATE TABLE receta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    ingredientes TEXT,
    instrucciones TEXT,
    tiempo_preparacion INT,
    porciones INT,
    imagen_url VARCHAR(255),
    categoria VARCHAR(50),
    usuario_id INT,
    FOREIGN KEY (usuario_id) REFERENCES user(id)
);

INSERT INTO role (name) VALUES ('Admin'), ('Chef'), ('Usuario');
