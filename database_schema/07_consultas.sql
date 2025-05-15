DROP DATABASE IF EXISTS consultas_medicas;
CREATE DATABASE consultas_medicas CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE consultas_medicas;

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

CREATE TABLE cita (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha_hora DATETIME,
    medico_id INT,
    paciente_id INT,
    motivo TEXT,
    estado ENUM('Agendada', 'Cancelada', 'Realizada'),
    observaciones TEXT,
    FOREIGN KEY (medico_id) REFERENCES user(id),
    FOREIGN KEY (paciente_id) REFERENCES user(id)
);

INSERT INTO role (name) VALUES ('Admin'), ('Médico'), ('Paciente');
