CREATE DATABASE biblioteca;
USE biblioteca;

-- Tabela autor --
CREATE TABLE autor (
  id_autor INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(60) NOT NULL,
  nacionalidade VARCHAR(30) NOT NULL,
  dt_nascimento DATE NOT NULL,
  livros_publicados INT NOT NULL
);

-- Tabela genero --
CREATE TABLE genero (
  id_genero INT AUTO_INCREMENT PRIMARY KEY,
  genero VARCHAR(45) NOT NULL
);

-- Tabela livro --
CREATE TABLE livro (
  id_livro INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(60) NOT NULL,
  ano_publicacao DATE NOT NULL,
  descricao TEXT NOT NULL,
  disponibilidade INT NOT NULL,
  num_pag INT NOT NULL,
  id_genero INT NOT NULL,
  id_autor INT NOT NULL,
  FOREIGN KEY (id_genero) REFERENCES genero(id_genero),
  FOREIGN KEY (id_autor) REFERENCES autor(id_autor)
);

-- Tabela usuario --
CREATE TABLE usuario (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(60) NOT NULL,
  email VARCHAR(45) NOT NULL,
  telefone CHAR(11) NOT NULL,
  dt_nascimento DATE NOT NULL,
  cpf CHAR(11) NOT NULL
);

-- Tabela tipo_mov --
CREATE TABLE tipo_mov (
  id_tipo INT AUTO_INCREMENT PRIMARY KEY,
  tipo VARCHAR(60) NOT NULL
);

-- Tabela movimentacao --
CREATE TABLE movimentacao (
  id_mov INT AUTO_INCREMENT PRIMARY KEY,
  dt_mov DATE NOT NULL,
  hora_mov TIME NOT NULL,
  dt_dev_prev DATE NOT NULL,
  dt_dev_real DATE NOT NULL,
  status VARCHAR(45) NOT NULL,
  multa DECIMAL(10, 2),
  id_usuario INT NOT NULL,
  id_livro INT NOT NULL,
  id_tipo INT NOT NULL,
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
  FOREIGN KEY (id_livro) REFERENCES livro(id_livro),
  FOREIGN KEY (id_tipo) REFERENCES tipo_mov(id_tipo)
);
