-- USE ReportServer$CASTROFERREIRA;

GO
	CREATE SCHEMA GESTAO_INFANTARIO
GO
-- DROP SCHEMA GESTAO_INFANTARIO;

CREATE TABLE GESTAO_INFANTARIO.FICHEIRO(
	ID					INT IDENTITY(1,1)	PRIMARY KEY,
	ComprovativoMorada	bit					NOT NULL, -- VER ISTO
	BIdigitalizado		bit					NOT NULL, -- VER ISTO
	Fotografia			bit					NOT NULL, -- VER ISTO
	ID_Pessoa			INT					NOT NULL	FOREIGN KEY REFERENCES GESTAO_INFANTARIO.PESSOA(ID),
);

CREATE TABLE GESTAO_INFANTARIO.PESSOA(
	ID					INT IDENTITY(1,1)	PRIMARY KEY,
	Nome				VARCHAR(50)			NOT NULL,
	DataNascimento		DATE				NOT NULL,
	Sexo				VARCHAR(10)			NOT NULL	CHECK(Sexo='Feminino' OR Sexo='Masculino'),
	NIF					INT					NOT NULL,
	ContactoPrimario	INT					NOT NULL,
	ContactoSecundario	INT					NOT NULL,
	MORADA				VARCHAR(100)		NOT NULL,
	ID_Ficheiro			INT					NOT NULL	FOREIGN KEY REFERENCES GESTAO_INFANTARIO.FICHEIRO(ID)
);

CREATE TABLE GESTAO_INFANTARIO.CRIANCA(
	ID					INT IDENTITY(1,1)	PRIMARY KEY,
	Doencas				VARCHAR(50)			NOT NULL,
	Medicacao			VARCHAR(50)			NOT NULL,
	Habitos				VARCHAR(50)			NOT NULL,
	DataInscricao		SMALLDATETIME		NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	ID_Pessoa			INT					NOT NULL	FOREIGN KEY REFERENCES GESTAO_INFANTARIO.PESSOA(ID)
);

CREATE TABLE GESTAO_INFANTARIO.ENCARREGADO_DE_EDUCACAO(
	ID					INT IDENTITY(1,1)	PRIMARY KEY,
	ID_Pessoa			INT					NOT NULL	FOREIGN KEY REFERENCES GESTAO_INFANTARIO.PESSOA(ID)
);

CREATE TABLE GESTAO_INFANTARIO.HORARIO(
	ID					INT IDENTITY(1,1)	PRIMARY KEY,
	PDF					bit					NOT NULL, -- ver isto
);


CREATE TABLE GESTAO_INFANTARIO.FUNCIONARIO(
	ID					INT IDENTITY(1,1)	PRIMARY KEY,
	Funcao				VARCHAR(50)			NOT NULL,
	NumeroContrato		INT					NOT NULL,
	NIB					INT					NOT NULL,
	DataContrato		SMALLDATETIME		NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	ID_Pessoa			INT					NOT NULL	FOREIGN KEY REFERENCES GESTAO_INFANTARIO.PESSOA(ID),
	ID_Horario			INT					NOT NULL	FOREIGN KEY REFERENCES GESTAO_INFANTARIO.HORARIO(ID)
);

CREATE TABLE GESTAO_INFANTARIO.CODIGO(
	ID					INT IDENTITY(1,1)	PRIMARY KEY,
	ID_EncEducacao		INT					NOT NULL	FOREIGN KEY REFERENCES GESTAO_INFANTARIO.ENCARREGADO_DE_EDUCACAO(ID),
	ID_Funcionario		INT					NOT NULL	FOREIGN KEY REFERENCES GESTAO_INFANTARIO.FUNCIONARIO(ID)
);

CREATE TABLE GESTAO_INFANTARIO.MENSALIDADE(
	ID					INT IDENTITY(1,1)	PRIMARY KEY,
	Valor				MONEY				NOT NULL,
	Mes					VARCHAR(10)			NOT NULL CHECK(Mes='Janeiro' OR Mes='Fevereiro' OR Mes='Marco' OR Mes='Abril' OR Mes='Maio' OR Mes='Junho' OR Mes='Julho' OR Mes='Agosto' OR Mes='Setembro' OR Mes='Outubro' OR Mes='Novembro' OR Mes='Dezembro'),
	ID_EncEducacao		INT					NOT NULL	FOREIGN KEY REFERENCES GESTAO_INFANTARIO.ENCARREGADO_DE_EDUCACAO(ID),
);

CREATE TABLE GESTAO_INFANTARIO.EVENTO(
	ID					INT IDENTITY(1,1)	PRIMARY KEY,
	Nome				VARCHAR(50)			NOT NULL,
	Tipo				VARCHAR(50)			NOT NULL,
	Descricao			VARCHAR(200)		NOT NULL,
); --TEM UMA EDUCADORA RESPONSAVEL

CREATE TABLE GESTAO_INFANTARIO.PARTICIPA_EM_EVENTO(
	ID					INT IDENTITY(1,1)	PRIMARY KEY,
	ID_CRIANCA			INT					NOT NULL	FOREIGN KEY REFERENCES GESTAO_INFANTARIO.CRIANCA(ID),
	ID_Evento			INT					NOT NULL	FOREIGN KEY REFERENCES GESTAO_INFANTARIO.EVENTO(ID),
); --TEM UMA EDUCADORA RESPONSAVEL

CREATE TABLE GESTAO_INFANTARIO.SALA(
	ID					INT IDENTITY(1,1)	PRIMARY KEY,
	ID_CRIANCA			INT					NOT NULL	FOREIGN KEY REFERENCES GESTAO_INFANTARIO.CRIANCA(ID),
); --TEM UMA EDUCADORA RESPONSAVEL

CREATE TABLE GESTAO_INFANTARIO.PLANO_INDIVIDUAL(
	ID					INT IDENTITY(1,1)	PRIMARY KEY,
	ID_CRIANCA			INT					NOT NULL	FOREIGN KEY REFERENCES GESTAO_INFANTARIO.CRIANCA(ID),
	Descricao			VARCHAR(200)		NOT NULL,
); --TEM UMA EDUCADORA RESPONSAVEL
