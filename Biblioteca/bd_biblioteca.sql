CREATE DATABASE biblioteca DEFAULT CHARACTER SET utf8;
USE biblioteca;

-- Tabela autor
CREATE TABLE autor (
  id_autor INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(60) NOT NULL,
  nacionalidade VARCHAR(30) NOT NULL,
  dt_nascimento DATE NOT NULL,
  livros_publicados INT NOT NULL);

-- Tabela genero
CREATE TABLE genero (
  id_genero INT AUTO_INCREMENT PRIMARY KEY,
  genero VARCHAR(45) NOT NULL);

-- Tabela livro
CREATE TABLE livro (
  id_livro INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(60) NOT NULL,
  ano_publicacao DATE NOT NULL,
  descricao TEXT NOT NULL,
  disponibilidade INT NOT NULL,
  num_pag INT NOT NULL,
  genero_id_genero INT NOT NULL,
  autor_id_autor INT NOT NULL,
  FOREIGN KEY (genero_id_genero) REFERENCES genero(id_genero),
  FOREIGN KEY (autor_id_autor) REFERENCES autor(id_autor));

-- Tabela usuario
CREATE TABLE usuario (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(60) NOT NULL,
  email VARCHAR(45) NOT NULL,
  telefone CHAR(11) NOT NULL,
  dt_nascimento DATE NOT NULL,
  cpf CHAR(11) NOT NULL);

-- Tabela emprestimo
CREATE TABLE emprestimo (
  id_emp INT AUTO_INCREMENT PRIMARY KEY,
  dt_emp DATE NOT NULL,
  dt_dev_prev DATE NOT NULL,
  dt_dev_real DATE,
  status_emp VARCHAR(30) NOT NULL,
  multa DECIMAL(10,2),
  usuario_id_usuario INT NOT NULL,
  livro_id_livro INT NOT NULL,
  FOREIGN KEY (usuario_id_usuario) REFERENCES usuario(id_usuario),
  FOREIGN KEY (livro_id_livro) REFERENCES livro(id_livro));

-- Tabela reserva
CREATE TABLE reserva (
  id_reserva INT AUTO_INCREMENT PRIMARY KEY,
  dt_reserva DATE NOT NULL,
  status_reserva VARCHAR(30) NOT NULL,
  hora_reserva TIME NOT NULL,
  livro_id_livro INT NOT NULL,
  usuario_id_usuario INT NOT NULL,
  FOREIGN KEY (livro_id_livro) REFERENCES livro(id_livro),
  FOREIGN KEY (usuario_id_usuario) REFERENCES usuario(id_usuario));