-- CRIAÇÃO DAS TABELAS
CREATE TABLE ContaReceber (
	ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Cliente_ID INT NOT NULL,
	FaturaVendaID INT,
    DataConta DATE NOT NULL,
    DataVencimento DATE NOT NULL,
    Valor DECIMAL NOT NULL,
    Situacao ENUM('1','2','3') NOT NULL
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
    Municipio_ID INT NOT NULL
);

CREATE TABLE Municipio(
	ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Estado_ID INT NOT NULL,
    Nome VARCHAR(80) NOT NULL,
    CodIBGE INT NOT NULL
);

CREATE TABLE Estado(
	ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    UF CHAR(2) NOT NULL
);

-- INSERÇÃO DE DADOS NAS TABELAS

INSERT INTO ContaReceber(
	Cliente_ID,
    FaturaVendaID,
    DataConta,
    DataVencimento,
    Valor,
    Situacao
) VALUES(
	1,
    1235,
    '21/05/2004',
    '21/05/2005',
    '18,2',
    1
);

INSERT INTO ContaReceber(
	Cliente_ID,
    FaturaVendaID,
    DataConta,
    DataVencimento,
    Valor,
    Situacao
) VALUES(
	2,
    2235,
    '11/06/2004',
    '11/06/2005',
    '20,2',
    2
);

INSERT INTO ContaReceber(
	Cliente_ID,
    FaturaVendaID,
    DataConta,
    DataVencimento,
    Valor,
    Situacao
) VALUES(
	3,
    4235,
    '21/05/2020',
    '21/05/2021',
    '12,2',
    3
);

INSERT INTO Cliente(
	Nome,
	CPF,
    Celular,
    EndLogadouro,
    EndNumero,
    EndMunicipio,
    EndCEP,
    Municipio_ID
) VALUES(
	'Edney Araujo',
    '12345678914',
    '14512451248',
    'Franca',
    '654',
    10,
    '14555981'
);

INSERT INTO Cliente(
	Nome,
	CPF,
    Celular,
    EndLogadouro,
    EndNumero,
    EndMunicipio,
    EndCEP,
    Municipio_ID
) VALUES(
	'Alefe',
    '12387467814',
    '14546151248',
    'São Paulo',
    '555',
    1,
    '54813248'
);

INSERT INTO Cliente(
	Nome,
	CPF,
    Celular,
    EndLogadouro,
    EndNumero,
    EndMunicipio,
    EndCEP,
    Municipio_ID
) VALUES(
	'Clevyson',
    '12917678914',
    '14571951248',
    'Campinas',
    '666',
    3,
    '14671981'
);

INSERT INTO Municipio(
	ID,
    Estado_ID,
    Nome,
    CodIBGE
)VALUES(
	10,
    'SP',
    'Franca',
    '3'
);

INSERT INTO Municipio(
	ID,
    Estado_ID,
    Nome,
    CodIBGE
)VALUES(
	1,
    'SP',
    'São Paulo',
    '1'
);

INSERT INTO Municipio(
	ID,
    Estado_ID,
    Nome,
    CodIBGE
)VALUES(
	3,
    'SP',
    'Campinas',
    '5'
);

INSERT INTO Estado(
	ID,
    Nome,
    UF
)VALUES(
	1,
    'São Paulo',
    'SP'
);

INSERT INTO Estado(
	ID,
    Nome,
    UF
)VALUES(
	2,
    'Tocantins',
    'TO'
);

INSERT INTO Estado(
	ID,
    Nome,
    UF
)VALUES(
	3,
    'Santa Catarina',
    'SC'
);