# ERP
ERP
Using the odbc that you wanna create/adapt with this SQL:<br>
**Script Used For Sqlite:**<br>

```SQL
CREATE TABLE erp_usuario(
    idusuario integer,
    login varchar(20) NOT NULL,
    senha varchar(10) NOT NULL,
    nome varchar(80),
    email varchar(80),
    fone varchar(20),
    dtalteracao date NOT NULL,
    hralteracao TIME NOT NULL, 
    CONSTRAINT erp_usuario PRIMARY KEY (idusuario)
);
CREATE UNIQUE INDEX sqlite_autoindex_idusuario ON idusuario (Id) ;


INSERT INTO erp_usuario(
    login,
    senha,
    nome,
    dtalteracao,
    hralteracao
        );
VALUES(
    'Suporte',
   'Suporte',
   'Suporte',
   '03/01/2017',
   '15:0');

CREATE TABLE erp_UltimoUsuario(
    Id integer  NOT NULL,
    Nome varchar(20) NOT NULL,
    Senha varchar(10) NOT NULL,
    CONSTRAINT erp_ultimousuario PRIMARY KEY (Id)
);

CREATE UNIQUE INDEX sqlite_autoindex_ultimoUsuario ON id (erp_UltimoUsuario) ;
INSERT INTO erp_UltimoUsuario(
    Nome,
    senha
        );
VALUES('Usuario',
       'Senha'
       );

CREATE TABLE erp_config_contador (
    chave VARCHAR(20) NOT NULL,
    contador INTEGER NULL,
    CONSTRAINT erp_config_contador PRIMARY KEY (chave)
) ;
CREATE UNIQUE INDEX sqlite_autoindex_erp_config_contador_1 ON erp_config_contador (chave) ;
CREATE TABLE erp_Grupo(
    idgrupo integer NOT NULL,
    descricao varchar(80) NOT NULL,
    idsecao integer NOT NULL,
    dtalteracao date NOT NULL,
    hralteracao TIME NOT NULL,
    CONSTRAINT erp_Grupo PRIMARY KEY (idGrupo)
);
CREATE UNIQUE INDEX sqlite_autoindex_erp_Grupo ON erp_Grupo (IdGrupo);

CREATE TABLE erp_SubGrupo(
    idsubgrupo integer NOT NULL,
    descricao varchar(80) NOT NULL,
    idgrupo integer NOT NULL,
    dtalteracao date NOT NULL,
    hralteracao TIME NOT NULL,
    CONSTRAINT erp_SubGrupo PRIMARY KEY (idSubGrupo)
);

CREATE UNIQUE INDEX sqlite_autoindex_erp_SubGrupo ON erp_SubGrupo (IdSubGrupo);

CREATE TABLE erp_Cliente(
	idcliente integer NOT NULL,
	nome varchar(80) NOT NULL,
	tppessoa varchar(1) NOT NULL,
	cpfcnpj varchar(14),
	rg varchar(15),
	cep integer, endereco varchar(80),
	numero integer, bairro varchar(80),
	cidade varchar(80),
	uf varchar(2),
	email varchar(80),
	nomedamae varchar(80),
	observacao varchar(250),
	dtalteracao date NOT NULL,
	hralteracao TIME NOT NULL,
	CONSTRAINT Erp_Cliente PRIMARY KEY (IdCliente)
);
CREATE UNIQUE INDEX Sqlite_AutoIndex_Erp_Cliente ON Erp_Cliente(IdCliente);

CREATE TABLE erp_Produto (
	IdProduto INTEGER NOT NULL,
	Descricao VARCHAR(80) NOT NULL,
	Marca VARCHAR(80) NOT NULL,
	CodBar DECIMAL(2000000000,10) NOT NULL,
	IdSubGrupo INTEGER NULL,
	Observacao VARCHAR(255) NULL,
	DtAlteracao DATE(2000000000) NOT NULL,
	HrAlteracao TIME(2000000000) NOT NULL,
	CONSTRAINT erp_produto PRIMARY KEY (IdProduto)
) ;
CREATE UNIQUE INDEX Sqlite_AutoIndex_erp_Produto ON Erp_Produto (IdProduto);

CREATE TABLE Erp_Secao (
	IdSecao Integer NOT NULL,  
	Descricao Varchar(80) Not Null,
	DtAlteracao Date Not Null,
	HrAlteracao Time Not Null,
	CONSTRAINT Erp_Secao PRIMARY KEY (IdSecao)
);
CREATE UNIQUE INDEX Sqlite_AutoIndex_Erp_Secao ON Erp_Secao(IdSecao);

CREATE TABLE Erp_FormaPagRec(
	IdRecebimento Integer Not Null,
	Descricao Varchar(80) Not Null,
	Tp_Condicao Varchar(1) Not Null default 'T',
	Flag_Entrada Varchar(1) Not Null,
	QtdParcela Integer Default 0,
	DtAlteracao Date Null,
	HrAlteracao Time Not Null,
	CONSTRAINT Erp_FormaPagRec PRIMARY KEY (IdRecebimento)
);
CREATE UNIQUE INDEX Sqlite_AutoIndex_Erp_ForpmaPagRec ON Erp_FormaPagRec(IdRecebimento);

CREATE TABLE Erp_Estoque_Analitico (
	idproduto INTEGER,
	idplanilha INTEGER,
	tpmovimento VARCHAR(1) NOT NULL,
	quantidade VARCHAR(15) NULL DEFAULT 0,
	observacao VARCHAR(255) NULL,
	idusuario INTEGER NULL,
	dtalteracao DATE(2000000000) NOT NULL,
	hralteracao TIME(2000000000) NOT NULL,
	FOREIGN KEY(idProduto) REFERENCES Erp_Produto(IdProduto)
	CONSTRAINT erp_estoque_analitico_pk PRIMARY KEY (idproduto,idplanilha)
) ;
CREATE UNIQUE INDEX sqlite_autoindex_erp_estoque_analitico_1 ON erp_estoque_analitico (idplanilha) ;


CREATE TABLE Erp_Estoque_Saldo (
	IdProduto INTEGER NOT NULL,
	Saldo VARCHAR(15) NULL DEFAULT 0,
	DtAlteracao DATE(2000000000) NOT NULL,
	HrAlteracao TIME(2000000000) NOT NULL,
	CONSTRAINT erp_estoque_saldo PRIMARY KEY (IdProduto)
) ;

CREATE TABLE Erp_Produto_Preco_Historico(
    IdProduto Integer Not Null,
    IdPlanilha Integer Not Null,
    Valor Decimal(10,2) Default 0,
    Observacao Varchar(255),
    IdUsuario Integer,
    DtAlteracao Date Not Null,
    HrAlteracao Time Not Null,
    CONSTRAINT Erp_Produto_Preco_Historico Primary Key(idproduto, idplanilha)
);

CREATE TABLE Erp_Produto_Preco (
	IdProduto INTEGER NOT NULL,
	Valor VARCHAR(15) NOT NULL,
	IdUsuario INTEGER NOT NULL,
	DtAlteracao DATE(2000000000) NOT NULL,
	HrAlteracao TIME(2000000000) NOT NULL,
	CONSTRAINT erp_produto_preco_pk PRIMARY KEY (IdProduto)
) ;

CREATE TRIGGER tr_ins_estoque_saldo
AFTER INSERT ON Erp_Produto
--WHEN (NEW.t IS NULL)
WHEN Erp_Estoque_Saldo <> Erp_Produto_IdProduto
BEGIN
            INSERT INTO ERP_ESTOQUE_SALDO (IDPRODUTO) SELECT Produto.IdProduto
		 FROM Erp_Produto as Produto 
		 WHERE(NOT EXISTS
		 ( SELECT SALDO.IdProduto
		 FROM erp_Estoque_Saldo as Saldo 
		 WHERE Saldo.IdProduto = Produto.IdProduto
		 ) );
END;

 		
		 
		   
		 
```
