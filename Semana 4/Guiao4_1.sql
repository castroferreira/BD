USE p4g1;

GO
	CREATE SCHEMA Guiao4_1
GO

CREATE TABLE Guiao4_1.Cliente(
Nif						INT						NOT NULL,
Nome					VARCHAR(30)				NOT NULL,
Endereço				VARCHAR(30)				NOT NULL,
Num_carta				INT						NOT NULL,
PRIMARY KEY(Nif),
UNIQUE(Num_carta),
);

CREATE TABLE Guiao4_1.Balcao(
Numero					INT						NOT NULL,
Nome					VARCHAR(30)				NOT NULL,
Endereço				VARCHAR(30)				NOT NULL,
PRIMARY KEY(Numero),
);

CREATE TABLE Guiao4_1.Veiculo(
Matricula				CHAR(8)					NOT NULL,
Ano						SMALLINT				NOT NULL,
Marca					VARCHAR(15)				NOT NULL,
PRIMARY KEY(Matricula),
);

CREATE TABLE Guiao4_1.Aluguer(
Numero					INT						NOT NULL,
Duraçao					INT						NOT NULL,
DataAluguer				DATE					NOT NULL,
Nif_cliente				INT						NOT NULL,
Numero_balcao			INT						NOT NULL,
Matricula_veiculo		CHAR(8)					NOT NULL,
PRIMARY KEY(Numero),
FOREIGN KEY(Nif_cliente)		REFERENCES Guiao4_1.Cliente(Nif),
FOREIGN KEY(Numero_Balcao)		REFERENCES Guiao4_1.Balcao(Numero),
FOREIGN KEY(Matricula_veiculo)	REFERENCES Guiao4_1.Veiculo(Matricula),
);

CREATE TABLE Guiao4_1.TipoVeículo(
Codigo					INT						NOT NULL,
Designaçao				VARCHAR(15)				NOT NULL,
ArCondicionado			BIT						NOT NULL,
Matricula_veiculo		CHAR(8)					NOT NULL,
PRIMARY KEY(Codigo),
FOREIGN KEY (Matricula_veiculo) REFERENCES Guiao4_1.Veiculo(Matricula)
);

CREATE TABLE Guiao4_1.Ligeiro(
NumLugares				TINYINT					NOT NULL,
Portas					TINYINT					NOT NULL,
Combustivel				VARCHAR(15)				NOT NULL,
Codigo_tipoveiculo		INT						NOT NULL,
FOREIGN KEY (Codigo_tipoveiculo) REFERENCES Guiao4_1.TipoVeículo(Codigo),
);

CREATE TABLE Guiao4_1.Pesado(
Peso					INT 					NOT NULL,
Passageiros				TINYINT					NOT NULL,
Combustivel				VARCHAR(15)				NOT NULL,
Codigo_tipoveiculo		INT						NOT NULL,
FOREIGN KEY (Codigo_tipoveiculo) REFERENCES Guiao4_1.TipoVeículo(Codigo),
);

CREATE TABLE Guiao4_1.Similaridade(
Codigo_tipoveiculo		INT						NOT NULL,
FOREIGN KEY (Codigo_tipoveiculo) REFERENCES Guiao4_1.TipoVeículo(Codigo),
);