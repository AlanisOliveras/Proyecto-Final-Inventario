DROP DATABASE IF EXISTS gestor_proyectos_freelance;
CREATE DATABASE gestor_proyectos_freelance CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE gestor_proyectos_freelance;

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

CREATE TABLE proyecto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150),
    cliente_id INT,
    presupuesto DECIMAL(10, 2),
    estado ENUM('En progreso', 'Finalizado'),
    fecha_entrega DATE,
    descripcion TEXT,
    FOREIGN KEY (cliente_id) REFERENCES user(id)
);

INSERT INTO role (name) VALUES ('Admin'), ('Freelancer'), ('Cliente');
