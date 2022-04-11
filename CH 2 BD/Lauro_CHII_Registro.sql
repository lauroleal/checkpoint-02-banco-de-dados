   -- ###
-- 1 ###### Criação do banco de dados ######
   -- ###
   
-- CRIANDO A BASE DE DADOS
CREATE DATABASE RegistroNascimento;

-- SELECIONANDO O BANCO QUE ACABAMOS DE CRIAR
USE RegistroNascimento;

   -- ###
--  ###### Criação das tabelas com chaves primárias e estrangeiras ######
   -- ###
   
-- ## TABELA MAE ##

CREATE TABLE tabela_mae (
	id_mae INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    endereco_mae VARCHAR(255),
    telefone VARCHAR(45) NOT NULL,
    PRIMARY KEY(id_mae));
    
-- ## TABELA MEDICO ##

CREATE TABLE tabela_medico (
	id_medico INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    CRM VARCHAR(45) NOT NULL,
    telefone VARCHAR(45) NOT NULL,
	especialidade_medico VARCHAR(45) NOT NULL,
    PRIMARY KEY(id_medico));

-- ## TABELA BEBE + AS FK ##

CREATE TABLE tabela_bebe (
	id_bebe INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    dt_nascimento DATETIME NOT NULL,
	peso DOUBLE NOT NULL,
    altura DOUBLE NOT NULL,
    id_mae INT NOT NULL,
    id_medico INT NOT NULL,
    PRIMARY KEY(id_bebe),
    CONSTRAINT FK_Mae_id FOREIGN KEY (id_mae) REFERENCES tabela_mae (id_mae),
    CONSTRAINT FK_medico_id FOREIGN KEY (id_medico) REFERENCES tabela_medico (id_medico));

-- ## TABELA HOSPITAL ##

CREATE TABLE tabela_hospital (
  id_hospital INT NOT NULL AUTO_INCREMENT,
  nome_hospital VARCHAR(150) NOT NULL,
  CNPJ_hospital VARCHAR(25) NOT NULL,
  PRIMARY KEY (id_hospital));
  
  -- ## TABELA CONSULTA ##

CREATE TABLE tabela_consulta (
id_hospital INT NOT NULL,
id_mae INT NOT NULL,
id_medico INT NOT NULL,
CONSTRAINT FK_hospital FOREIGN KEY (id_hospital) REFERENCES tabela_hospital (id_hospital),
CONSTRAINT FK_Mae_consulta FOREIGN KEY (id_mae) REFERENCES tabela_mae (id_mae),
CONSTRAINT FK_medico_consulta FOREIGN KEY (id_medico) REFERENCES tabela_medico (id_medico));


   -- ###
--  ###### Inserção de dados nas tabelas. ######
   -- ###
      
-- INSERT INTO NA TABELA MAE --
		
INSERT INTO tabela_mae ( nome, endereco_mae , telefone )
VALUES
('Maia S. pereira', 'Rua alguma coisa 04','1163859078'),
('Aria silva pereira', 'Rua alguma coisa 05','1163859078'),
('Ana Araujo pereira', 'Rua alguma coisa 06','1163859078'),
('Luana Prado', 'Rua alguma coisa 09','1163859078'),
('Cida Manuele pereira', 'Rua alguma coisa 07','1163859078'),
('Angela Baffa', 'Rua alguma coisa 10','1163859048');

     
-- INSERT INTO NA TABELA MEDICO --
  

INSERT INTO tabela_medico  ( nome, CRM , telefone, especialidade_medico)
VALUES
('Dr. Carlos', '234567ds','1163859078','Pediatra'),
('Dr. pereira', '234567ds','1163859078','Pediatra'),
('Dr. Ana', '234567ds','1163859078','obstétrica'),
('Dr. Cida ', '234567ds','1163859078','obstétrica');

      
-- INSERT INTO NA TABELA HOSPITAL --

   select * from tabela_hospital;
   INSERT INTO tabela_hospital  ( nome_hospital, CNPJ_hospital)
VALUES
('Hosp. do coracao', '27.865.757/0001-02'),
('Hosp. pereira','27.865.757/0001-02'),
('Hosp. Ana', '27.865.757/0001-02'),
('Hosp. Cida ','27.865.757/0001-02');

     
-- INSERT INTO NA TABELA BEBE --

   
   INSERT INTO  tabela_bebe ( nome, dt_nascimento, peso,altura,id_mae, id_medico)
VALUES
   ('Igor silva pereira', '9999-12-31 23:59:59','3.5','10',1,2),
('Lino silva pereira', '9999-12-31 23:59:59','1.6','19',2,3),
('Ana Julia pereira', '9999-12-31 23:59:59','1.4','11',4,1),
('Celita silva pereira', '9999-12-31 23:59:59','1.9','10',3,4);

    
-- INSERT INTO NA TABELA CONSULTA --
   
   INSERT INTO  tabela_consulta ( id_hospital, id_mae,id_medico)
VALUES (1,2,3), (2,3,2), (3,3,2), (2,3,1);
   
