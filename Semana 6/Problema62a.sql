USE p4g1;

-- Problema 6.2
-- a) Crie as base de dados em SQL Server utilizando a linguagem SQL DDL. 
-- Tenha em atenção as restrições de integridade ao nível do domínio, 
-- entidade e referencial.

-- Exercício 5.1 : Empresa
GO
	CREATE SCHEMA empresa
GO

CREATE TABLE empresa.Employee(
	Fname		VARCHAR(15)		NOT NULL,
	Minit		CHAR,
	Lname		VARCHAR(15)		NOT NULL,
	Ssn			CHAR(9)			NOT NULL,
	Bdate		DATE,
	[Address]	VARCHAR(30),
	Sex			CHAR,
	Salary		DECIMAL(10,2),
	Super_ssn	CHAR(9),
	Dno			INT				NOT NULL,
	PRIMARY KEY (Ssn)
	);

--EMPRESA DEPARTMENT FOREIGN KEY - EDFK
ALTER TABLE empresa.Employee
	ADD CONSTRAINT EDFK FOREIGN KEY (Dno) REFERENCES empresa.Department(Dnumber);

-- DEPARTMENT MGR FOREIGN KEY - DMFK
ALTER TABLE empresa.Department
	ADD CONSTRAINT DMFK FOREIGN KEY (Mgr_ssn) REFERENCES empresa.Employee(Ssn);

CREATE TABLE empresa.Department(
	Dname			VARCHAR(15)		NOT NULL,
	Dnumber			INT				NOT NULL,
	Mgr_ssn			CHAR(9)			NOT NULL,
	Mgr_start_date	DATE,
	PRIMARY KEY (Dnumber),
	UNIQUE (Dname)
	);

CREATE TABLE empresa.Dept_Loc(
	Dnumber			INT				NOT NULL, 
	Dlocation		VARCHAR(15)		NOT NULL, 
	PRIMARY KEY (Dnumber, Dlocation),
	FOREIGN KEY (Dnumber) REFERENCES empresa.Department(Dnumber) 
	);

CREATE TABLE empresa.Project(
	Pname			VARCHAR(15)		NOT NULL,
	Pnumber			INT				NOT NULL,
	Plocation		VARCHAR(15),
	Dnum			INT				
	PRIMARY KEY (Pnumber),
	UNIQUE (Pname),
	FOREIGN KEY (Dnum) REFERENCES empresa.Department(Dnumber)
	);

CREATE TABLE empresa.WorksON(
	Essn			CHAR(9)			NOT NULL,
	Pno				INT				NOT NULL,
	[Hours]			DECIMAL(3,1)	NOT NULL,
	PRIMARY KEY (Essn, Pno),
	FOREIGN KEY (Essn) REFERENCES empresa.Employee(Ssn), 
	FOREIGN KEY (Pno) REFERENCES empresa.Project(Pnumber)
	);

CREATE TABLE empresa.[Dependent](
	Essn			CHAR(9)			NOT NULL,
	Dependent_name	VARCHAR(15)		NOT NULL,
	Sex				CHAR,
	Bdate			DATE,
	Relationship	VARCHAR(8),
	PRIMARY KEY (Essn, Dependent_name),
	FOREIGN KEY (Essn) REFERENCES empresa.Employee(Ssn)
	);


-- Exercício 5.2 : Encomenda

-- Exercício 5.3 : Sistema de Prescrição Electrónica de Medicamentos