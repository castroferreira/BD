USE p4g1;

GO
	CREATE SCHEMA Guiao4_3;
GO

CREATE TABLE Guiao4_3.Produto(
Codigo					INT			NOT NULL,
Nome					VARCHAR(30)	NOT NULL,
Iva						INT			NOT NULL,
Preco					INT			NOT NULL,
Unidades_Armazenadas	INT			NOT NULL,
PRIMARY KEY(Codigo)
);

CREATE TABLE Guiao4_3.TipoFornecedor(
Codigo					INT			NOT NULL,
Designacao				VARCHAR(15)	NOT NULL,
PRIMARY KEY(Codigo)
);

CREATE TABLE Guiao4_3.Fornecedor(
Nif						INT			NOT NULL,
Nome					VARCHAR(30)	NOT NULL,
Endereco				VARCHAR(30) NOT NULL,
CondicoesPagamento		VARCHAR(30)	NOT NULL,
Fax						INT			NOT NULL,
CodigoFornecedor		INT			NOT NULL,
PRIMARY KEY(Nif),
FOREIGN KEY(CodigoFornecedor) REFERENCES Guiao4_3.TipoFornecedor(Codigo),
);

CREATE TABLE Guiao4_3.Encomenda(
Num			INT			NOT NULL,
DataEncomenda			DATE		NOT NULL,
CodigoProduto			INT			NOT NULL,
NifFornecedor			INT			NOT NULL,
PRIMARY KEY(Num),
FOREIGN KEY(NifFornecedor) REFERENCES Guiao4_3.Fornecedor(Nif),
FOREIGN KEY(CodigoProduto) REFERENCES Guiao4_3.Produto(Codigo)
);

CREATE TABLE Guiao4_3.Contem(
CodigoProduto			INT			NOT NULL,
NumEncomenda			INT			NOT NULL,
FOREIGN KEY(CodigoProduto) REFERENCES Guiao4_3.Produto(Codigo),
FOREIGN KEY(NumEncomenda) REFERENCES Guiao4_3.Encomenda(Num)
);