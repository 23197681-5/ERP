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

```
**Script to ibm db2:** <br>
```SQL

CREATE TABLE erp_usuario(
        idusuario integer PRIMARY KEY GENERATED always AS IDENTITY NOT NULL,
        login varchar(20) NOT NULL UNIQUE,
        senha varchar(10) NOT NULL,
        nome varchar(80),
        email varchar(80),
        fone varchar(20),
        dtalteracao date NOT NULL,
        hralteracao TIME NOT NULL
        )
INSERT INTO erp_usuario(
        login,
        senha,
        nome,
        dtalteracao,
        hralteracao
        )
VALUES(
        'Suporte',
       'Suporte',
       'Suporte',
       '03/01/2017',
       '15:04'
       )
CREATE TABLE erp_UltimoUsuario(
        Id integer PRIMARY KEY GENERATED always AS IDENTITY NOT NULL,
        Nome varchar(20) NOT NULL,
        Senha varchar(10) NOT NULL)
INSERT INTO erp_UltimoUsuario(
        Nome,
        senha
        )
VALUES('Usuario',
       'Senha'
       )
CREATE TABLE erp_config_contador( 
        chave varchar(20)PRIMARY KEY NOT NULL,
        contador integer
        )
CREATE TABLE erp_Grupo(
        idgrupo integer PRIMARY KEY GENERATED always AS IDENTITY NOT NULL,
        descricao varchar(80) NOT NULL,
        idsecao integer NOT NULL,
        dtalteracao date NOT NULL,
        hralteracao TIME NOT NULL
        )
CREATE TABLE erp_SubGrupo(
        idsubgrupo integer PRIMARY KEY GENERATED always AS IDENTITY NOT NULL,
        descricao varchar(80) NOT NULL,
        idgrupo integer NOT NULL,
        dtalteracao date NOT NULL,
        hralteracao TIME NOT NULL
        )
CREATE TABLE erp_Cliente(
        idcliente integer PRIMARY KEY GENERATED always AS IDENTITY NOT NULL,
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
        hralteracao TIME NOT NULL
)
CREATE TABLE erp_Secao (
        idsecao integer PRIMARY KEY GENERATED always AS IDENTITY NOT NULL,	
        descricao varchar(80)not null,
        dtalteracao date not null,
        hralteracao time not null
 )
 CREATE TABLE erp_Formapagrec(
        idrecebimento integer not null primary key,
        descricao varchar(80) not null,
        tp_condicao varchar(1) not null default 'T',
        flag_entrada varchar(1) not null,
        qtdparcela integer default 0,
        dtalteracao date null,
        hralteracao time not null
)
CREATE TABLE erp_estoque_analitico(
        idproduto integer not null,
        idplanilha integer not null,
        tpmovimento varchar(1)  not null,
        quantidade Decimal(10,3) default 0,
        obcervacao varchar(255),
        idusuario integer,
        dtalteracao date not null,
        hralteracao time not null,
        PRIMARY KEY (idproduto,idplanilha)
 )
CREATE TABLE erp_estoque_saldo(
        idproduto integer primary key not null,
        saldo decimal(10, 2) default 0,
        dtalteracao date not null,
        hralteracao time not null
)
CREATE TABLE erp_produto_preco_historico(
        idproduto integer not null,
        idplanilha integer not null,
        valor decimal(10,2) default 0,
        observacao varchar(255),
        idusuario integer,
        dtalteracao date not null,
        hralteracao time not null,
        primary key(idproduto, idplanilha)
)
CREATE TABLE erp_produto_preco(
        idproduto integer not null primary key,
        valor decimal(10, 2) default 0,
        idusuario integer,
        dtalteracao date not null,
        hralteracao time not null
)
```
