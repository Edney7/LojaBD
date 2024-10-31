-- Criando e utilizando o banco de dados
CREATE DATABASE Loja;
USE Loja;
-- Criando as tabelas
CREATE TABLE Estado(
	ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    UF CHAR(2) NOT NULL
);
CREATE TABLE Municipio(
	ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Estado_ID INT NOT NULL,
    Nome VARCHAR(80) NOT NULL,
    CodIBGE INT NOT NULL,
    FOREIGN KEY (Estado_ID) references Estado(ID) 
    ON DELETE CASCADE
);
CREATE TABLE Cliente (
	ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(80) NOT NULL,
	CPF CHAR(11) NOT NULL,
    Celular CHAR(11),
    EndLogadouro VARCHAR(100) NOT NULL,
    EndNumero VARCHAR(10) NOT NULL,
    EndMunicipio INT NOT NULL,
    EndCEP CHAR(8),
    Municipio_ID INT NOT NULL,
    FOREIGN KEY (Municipio_ID) REFERENCES
    Municipio(ID) ON DELETE CASCADE
);
CREATE TABLE ContaReceber (
	ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Cliente_ID INT NOT NULL,
	FaturaVendaID INT,
    DataConta DATE NOT NULL,
    DataVencimento DATE NOT NULL,
    Valor DECIMAL NOT NULL,
    Situacao ENUM('1','2','3') NOT NULL,
    FOREIGN KEY (Cliente_ID) REFERENCES
    Cliente(ID) ON DELETE CASCADE
);

-- INSERÇÃO DE DADOS NAS TABELAS

INSERT INTO Estado(Nome,UF)
VALUES
('São Paulo','SP'),
('Minas Gerais','MG'),
('Espírito Santo','ES'),
('Rio de Janeiro','RJ');

SELECT * FROM Municipio;

INSERT INTO Municipio(Estado_ID,Nome,CodIBGE)
VALUES
(1,'Ipuã',123456),
(2,'Uberaba',234567),
(3,'Vitória',345678),
(4,'Rio de Janeiro',456789);

INSERT INTO Cliente(Nome,CPF,Celular,EndLogadouro,
EndNumero,EndMunicipio,EndCEP,Municipio_ID)
VALUES
('Edney Araujo',12345678910,03215467894,'Rua das Anilhas',
'905',1,12345678,1),
('Renan Silva',12345688911,33215477894,'Rua das Galinhas',
'9005',2,12344678,2),
('Yasmin Pereira',22445678910,33215477899,'Rua das Máquinas',
'509',3,12245688,3),
('Thaissa Campos',33557778910,33777477899,'Rua da Lua',
'5009',4,22211188,4);

INSERT INTO ContaReceber(Cliente_ID,FaturaVendaID,DataConta,DataVencimento,Valor,Situacao)
VALUES
(1,2035,'2020-05-05','2021-05-05',18.25,1),
(2,1035,'2021-05-05','2022-05-05',17.25,2),
(3,3035,'2022-05-05','2023-05-05',16.25,3),
(4,4035,'2023-05-05','2024-05-05',18.25,1);

-- Criando a VIEW para consultar ID da conta que não foi paga, nome e CPF do cliente vinculado à conta

CREATE VIEW NaoPagas AS
SELECT cr.ID AS ContaID,
c.Nome AS ClienteNome,
c.CPF AS ClienteCPF,
cr.DataVencimento,
cr.Valor
FROM ContaReceber cr
JOIN
Cliente c ON cr.Cliente_ID = c.ID
WHERE 
cr.Situacao = '1';

SELECT * FROM NaoPagas;