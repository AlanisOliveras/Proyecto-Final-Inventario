DROP DATABASE IF EXISTS encuestas_votaciones;
CREATE DATABASE encuestas_votaciones CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE encuestas_votaciones;

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

CREATE TABLE encuesta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150),
    pregunta TEXT,
    tipo ENUM('única', 'múltiple'),
    opciones TEXT,
    fecha_cierre DATE
);

INSERT INTO role (name) VALUES ('Admin'), ('Moderador'), ('Votante');
