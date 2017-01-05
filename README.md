# ERP
ERP
```SQL

Create table erp_usuario(
idusuario integer primary key generated always as identity not null,
login varchar(20) not null unique,
senha varchar(10) not null,
nome varchar(80),
email varchar(80),
fone varchar(20),
dtalteracao date not null,
hralteracao time not null
)
Go
Commit

    INSERT INTO
    ERP_USUARIO(login, senha, nome, dtalteracao, hralteracao)
    VALUES('Suporte', 'Suporte', 'Suporte', '03/01/2017', '15:04')

DROP TABLE ERP_ULTIMOUSUARIO
Create table erp_UltimoUsuario(
Id integer primary key generated always as identity not null,
Nome varchar(20) not null,
Senha varchar(10) not null
)
INSERT INTO erp_UltimoUsuario(Nome, senha) VALUES('Usuario', 'Senha')
COMMIT
SELECT *
FROM
         erp_UltimoUsuario

Create Table erp_config_contador(
        chave varchar(20)primary key not null,
        contador integer
)
CREATE TABLE ERP_GRUPO(
        idgrupo integer primary key not null,
        descricao varchar(80) not null,
        idsecao integer not null,
        dtalteracao date not null,
        hralteracao time not null
)
CREATE TABLE
        EPR_produto_preco_historico(
        idproduto integer not null,
        idplanilha integer not null,
        valro Decimal(10, 2) Default 0,
        observacao varchar(255),
        idusuario integer,
        dtalteracao date not null,
        hralteracao time not null,
        primary key (idproduto, idplanilha)
)

CREATE table erp_produto_preco(
        idproduto integer primary key not null,
        valor decimal(10, 2) DEFAULT 0,
        idusuario integer,
        dtalteracao date not null,
        hralteracao time not null
)

CREATE TABLE
        ERP_CLIENTE(
        idcliente integer primary key not null,
        nome varchar(80) not null,
        tppessoa varchar(1) not null,
        cpfcnpj varchar(14),
        rg varchar(15),
        cep integer,
        endereco varchar(80),
        numero integer,
        bairro varchar(80),
        cidade varchar(80),
        uf varchar(2),
        email varchar(80),
        nomedamae varchar(80),
        observacao varchar(250),
        dtalteracao date not null,
        hralteracao time not null
      )


```
