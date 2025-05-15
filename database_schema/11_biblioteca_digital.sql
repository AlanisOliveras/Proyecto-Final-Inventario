DROP DATABASE IF EXISTS biblioteca_digital_personal;
CREATE DATABASE biblioteca_digital_personal CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE biblioteca_digital_personal;

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

CREATE TABLE libro_personal (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150),
    autor VARCHAR(100),
    genero VARCHAR(50),
    anio_publicacion INT,
    url VARCHAR(255),
    notas TEXT,
    etiquetas VARCHAR(255),
    usuario_id INT,
    FOREIGN KEY (usuario_id) REFERENCES user(id)
);

INSERT INTO role (name) VALUES ('Admin'), ('Moderador'), ('Lector');
