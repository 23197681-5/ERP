# ERP
ERP
```SQL

CREATE TABLE erp_usuario(idusuario integer PRIMARY KEY GENERATED always AS IDENTITY NOT NULL,
                                                                                    login varchar(20) NOT NULL UNIQUE,
                                                                                                               senha varchar(10) NOT NULL,
                                                                                                                                 nome varchar(80),
                                                                                                                                      email varchar(80),
                                                                                                                                            fone varchar(20),
                                                                                                                                                 dtalteracao date NOT NULL,
                                                                                                                                                                  hralteracao TIME NOT NULL) GO
COMMIT
INSERT INTO ERP_USUARIO(login,
                        senha,
                        nome,
                        dtalteracao,
                        hralteracao)
VALUES('Suporte',
       'Suporte',
       'Suporte',
       '03/01/2017',
       '15:04')
CREATE TABLE erp_UltimoUsuario(Id integer PRIMARY KEY GENERATED always AS IDENTITY NOT NULL,
                                                                                   Nome varchar(20) NOT NULL,
                                                                                                    Senha varchar(10) NOT NULL)
INSERT INTO erp_UltimoUsuario(Nome,
                              senha)
VALUES('Usuario',
       'Senha')
COMMIT
SELECT *
FROM erp_UltimoUsuario
CREATE TABLE erp_config_contador( chave varchar(20)PRIMARY KEY NOT NULL,
                                                               contador integer)
CREATE TABLE ERP_GRUPO( idgrupo integer PRIMARY KEY NOT NULL,
                                                    descricao varchar(80) NOT NULL,
                                                                          idsecao integer NOT NULL,
                                                                                          dtalteracao date NOT NULL,
                                                                                                           hralteracao TIME NOT NULL)
CREATE TABLE EPR_produto_preco_historico( idproduto integer NOT NULL,
                                                            idplanilha integer NOT NULL,
                                                                               valro Decimal(10, 2) DEFAULT 0,
                                                                                                            observacao varchar(255),
                                                                                                                       idusuario integer, dtalteracao date NOT NULL,
                                                                                                                                                           hralteracao TIME NOT NULL,
                                                                                                                                                                            PRIMARY KEY (idproduto,
                                                                                                                                                                                         idplanilha))
CREATE TABLE erp_produto_preco( idproduto integer PRIMARY KEY NOT NULL,
                                                              valor decimal(10, 2) DEFAULT 0,
                                                                                           idusuario integer, dtalteracao date NOT NULL,
                                                                                                                               hralteracao TIME NOT NULL)
CREATE TABLE ERP_CLIENTE( idcliente integer PRIMARY KEY NOT NULL,
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
                                                                                                                                                                                                           hralteracao TIME NOT NULL )
CREATE TABLE erp_secao (
        idsecao integer primary key not null,
        descricao varchar(80)not null,
        dtalteracao date not null,
        hralteracao time not null
 )
CREATE TABLE erp_formapagrec(
        idrecebimento integer not null primary key,
        descricao varchar(80) not null,
        tp_condicao varchar(1) not null default 'T',
        flag_entrada varchar(1) not null,
        qtdparcela integer default 0,
        dtalteracao date null,
        hralteracar time not null
)
```
