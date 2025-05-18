-- Active: 1747263922499@@127.0.0.1@3306@mysql
DROP DATABASE IF EXISTS inventario_personal;
CREATE DATABASE inventario_personal CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE inventario_personal;

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

CREATE TABLE item (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    categoria VARCHAR(50),
    cantidad INT,
    precio_estimado DECIMAL(10, 2),
    ubicacion VARCHAR(100),
    fecha_adquisicion DATE,
    owner_id INT,
    FOREIGN KEY (owner_id) REFERENCES user(id)
);

INSERT INTO role (name) VALUES ('Admin'), ('User'), ('Owner');


