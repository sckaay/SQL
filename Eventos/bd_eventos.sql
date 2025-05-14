CREATE DATABASE eventos;
USE eventos;

CREATE TABLE Organizadores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    contato_email VARCHAR(255) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    cargo VARCHAR(100)
);

CREATE TABLE Eventos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome_evento VARCHAR(255) NOT NULL,
    descricao TEXT,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    local VARCHAR(255) NOT NULL,
    organizador_id INT,
    tipo_evento VARCHAR(100),
    FOREIGN KEY (organizador_id) REFERENCES Organizadores(id)
);

CREATE TABLE Participantes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    data_inscricao DATE NOT NULL
);

CREATE TABLE Inscricoes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_evento INT,
    id_participante INT,
    data_inscricao DATE NOT NULL,
    status_pagamento VARCHAR(50),
    FOREIGN KEY (id_evento) REFERENCES Eventos(id),
    FOREIGN KEY (id_participante) REFERENCES Participantes(id)
);

INSERT INTO Organizadores (nome, contato_email, telefone, cargo)
VALUES 
('João Silva', 'joao@evento.com', '9999-9999', 'Coordenador'),
('Maria Souza', 'maria@evento.com', '8888-8888', 'Palestrante'),
('Pedro Almeida', 'pedro@evento.com', '7777-7777', 'Organizador'),
('Ana Costa', 'ana@evento.com', '6666-6666', 'Palestrante');

INSERT INTO Eventos (nome_evento, descricao, data_inicio, data_fim, local, organizador_id, tipo_evento)
VALUES 
('Workshop de Inovação', 'Workshop sobre novas tecnologias', '2025-06-01', '2025-06-03', 'Centro de Convenções', 1, 'Workshop'),
('Palestra sobre Empreendedorismo', 'Palestra com grandes nomes do mercado', '2025-06-10', '2025-06-10', 'Auditório Principal', 2, 'Palestra'),
('Conferência de TI', 'Conferência internacional sobre tecnologia da informação', '2025-07-01', '2025-07-03', 'Palácio de Convenções', 3, 'Conferência'),
('Seminário de Sustentabilidade', 'Seminário sobre práticas ambientais sustentáveis', '2025-08-10', '2025-08-11', 'Hotel Eco', 4, 'Seminário');

INSERT INTO Participantes (nome, email, telefone, data_inscricao)
VALUES 
('Carlos Oliveira', 'carlos@dominio.com', '9876-5432', '2025-04-15'),
('Fernanda Costa', 'fernanda@dominio.com', '9867-1234', '2025-04-16'),
('Lucas Silva', 'lucas@dominio.com', '9356-7890', '2025-04-17'),
('Juliana Pereira', 'juliana@dominio.com', '9456-4567', '2025-04-18'),
('Eduardo Rocha', 'eduardo@dominio.com', '9267-2345', '2025-04-19');

INSERT INTO Inscricoes (id_evento, id_participante, data_inscricao, status_pagamento)
VALUES 
(1, 1, '2025-04-15', 'Pago'),
(1, 2, '2025-04-16', 'Pendente'),
(2, 3, '2025-04-17', 'Pago'),
(2, 4, '2025-04-18', 'Pendente'),
(3, 5, '2025-04-19', 'Pago');
