USE p4g1;

GO
	CREATE SCHEMA Guiao4_4;
GO

CREATE TABLE Guiao4_4.Paciente(
Num					INT			NOT NULL,
Endereco			VARCHAR(30)	NOT NULL,
NomePaciente		VARCHAR(30)	NOT NULL,
DataNascimento		DATE		NOT NULL,
PRIMARY KEY(Num)
);

CREATE TABLE Guiao4_4.Medico(
Num					INT			NOT NULL,
Nome				VARCHAR(30)	NOT NULL,
Especialidade		VARCHAR(30)	NOT NULL,
PRIMARY KEY(Num)
);

CREATE TABLE Guiao4_4.Farmaco(
Formula				VARCHAR(100)NOT NULL,
Nome				VARCHAR(30)	NOT NULL,
NumFarmaceutica		INT			NOT NULL,
PRIMARY KEY(Nome),
Unique(Formula)
);

CREATE TABLE Guiao4_4.Farmacia(
NumPrescricao		INT			NOT NULL,
Nome				VARCHAR(30)	NOT NULL,
Endereco			VARCHAR(50)	NOT NULL,
Telefone			INT			NOT NULL,
PRIMARY KEY(Nome)
);

CREATE TABLE Guiao4_4.Prescricao(
Num					INT			NOT NULL,
NumPaciente			INT			NOT NULL,
DataPrescricao		DATE		NOT NULL,
NumMedico			INT			NOT NULL,
NomeFarmacia		VARCHAR(30)	NOT NULL,
PRIMARY KEY(Num),
FOREIGN KEY(NumPaciente)	REFERENCES Guiao4_4.Paciente(Num),
FOREIGN KEY(NumMedico)		REFERENCES Guiao4_4.Medico(Num),
FOREIGN KEY(NomeFarmacia)	REFERENCES Guiao4_4.Farmacia(Nome),
);

CREATE TABLE Guiao4_4.Farmaceutica(
NumRegisto			INT			NOT NULL,
Nome				VARCHAR(30)	NOT NULL,
Endereco			VARCHAR(30)	NOT NULL,
NomeFarmaco			VARCHAR(30)	NOT NULL,
FormulaFarmaco		VARCHAR(100)NOT NULL,
PRIMARY KEY(NumRegisto),
FOREIGN KEY(NomeFarmaco)	REFERENCES Guiao4_4.Farmaco(Nome),
FOREIGN KEY(FormulaFarmaco) REFERENCES Guiao4_4.Farmaco(Formula),
);

CREATE TABLE Guiao4_4.Tem(
NumPrescricao		INT			NOT NULL,
NumPaciente			INT			NOT NULL,
NumMedico			INT			NOT NULL,
FormulaFarmaco		VARCHAR(100)NOT NULL,
NomeFarmaco			VARCHAR(30)	NOT NULL,
FOREIGN KEY(NumPrescricao)	REFERENCES Guiao4_4.Prescricao(Num),
FOREIGN KEY(NumPaciente)	REFERENCES Guiao4_4.Paciente(Num),
FOREIGN KEY(NumMedico)		REFERENCES Guiao4_4.Medico(Num),
FOREIGN KEY(FormulaFarmaco) REFERENCES Guiao4_4.Farmaco(Formula),
FOREIGN KEY(NomeFarmaco)	REFERENCES Guiao4_4.Farmaco(Nome),
);