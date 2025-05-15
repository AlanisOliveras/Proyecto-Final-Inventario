DROP DATABASE IF EXISTS publicacion_articulos;
CREATE DATABASE publicacion_articulos CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE publicacion_articulos;

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

CREATE TABLE articulo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150),
    contenido TEXT,
    categoria VARCHAR(50),
    fecha_publicacion DATE,
    estado ENUM('Borrador', 'Publicado'),
    autor_id INT,
    FOREIGN KEY (autor_id) REFERENCES user(id)
);

INSERT INTO role (name) VALUES ('Admin'), ('Autor'), ('Editor');
