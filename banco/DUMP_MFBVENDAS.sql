/******************************************************************************/
/***          Generated by IBExpert 2012.02.21 13/08/2018 21:56:55          ***/
/******************************************************************************/

SET SQL DIALECT 3;

SET NAMES ISO8859_1;

CREATE DATABASE 'LOCALHOST:C:\MFBVendas\banco\mfbvendas.fdb'
USER 'SYSDBA' PASSWORD 'masterkey'
PAGE_SIZE 16384
DEFAULT CHARACTER SET ISO8859_1 COLLATION ISO8859_1;



/******************************************************************************/
/***                                Domains                                 ***/
/******************************************************************************/

CREATE DOMAIN DMN_TEXTO_LONGO AS
VARCHAR(75);

CREATE DOMAIN DMN_TEXTO_PEQUENO AS
VARCHAR(20);



/******************************************************************************/
/***                               Generators                               ***/
/******************************************************************************/

CREATE GENERATOR GEN_CATEGORIA_ID;
SET GENERATOR GEN_CATEGORIA_ID TO 0;

CREATE GENERATOR GEN_CLIENTES_ID;
SET GENERATOR GEN_CLIENTES_ID TO 0;

CREATE GENERATOR GEN_FABRICANTE_ID;
SET GENERATOR GEN_FABRICANTE_ID TO 0;

CREATE GENERATOR GEN_PERFIL_ID;
SET GENERATOR GEN_PERFIL_ID TO 0;

CREATE GENERATOR GEN_PRODUTOS_ID;
SET GENERATOR GEN_PRODUTOS_ID TO 0;

CREATE GENERATOR GEN_USUARIOS_ID;
SET GENERATOR GEN_USUARIOS_ID TO 1;

CREATE GENERATOR GEN_VENDAS_ID;
SET GENERATOR GEN_VENDAS_ID TO 0;



/******************************************************************************/
/***                                 Tables                                 ***/
/******************************************************************************/



CREATE TABLE CATEGORIA (
    ID_CATEGORIA    INTEGER NOT NULL,
    NOME_CATEGORIA  DMN_TEXTO_PEQUENO
);

CREATE TABLE CLIENTES (
    ID_CLIENTE        INTEGER NOT NULL,
    NOME_CLIENTE      DMN_TEXTO_LONGO,
    ENDERECO_CLIENTE  DMN_TEXTO_LONGO,
    BAIRRO_CLIENTE    DMN_TEXTO_PEQUENO,
    UF_CLIENTE        DMN_TEXTO_PEQUENO,
    CIDADE_CLIENTE    DMN_TEXTO_PEQUENO,
    CEP_CLIENTE       VARCHAR(9),
    EMAIL_CLIENTE     DMN_TEXTO_LONGO,
    TELEFONE_CLIENTE  DMN_TEXTO_PEQUENO,
    CELULAR_CLIENTE   DMN_TEXTO_PEQUENO
);

CREATE TABLE FABRICANTE (
    ID_FABRICANTE    INTEGER NOT NULL,
    NOME_FABRICANTE  DMN_TEXTO_LONGO
);

CREATE TABLE PERFIL (
    ID_PERFIL         INTEGER NOT NULL,
    NOME_PERFIL       DMN_TEXTO_PEQUENO,
    DESCRICAO_PERFIL  DMN_TEXTO_LONGO
);

CREATE TABLE PERFIL_CONFIG (
    ID_PERFIL         INTEGER NOT NULL,
    ACTION_PERFIL     DMN_TEXTO_LONGO NOT NULL,
    CAPTION_PERFIL    DMN_TEXTO_LONGO,
    PERMISSAO_PERFIL  CHAR(1)
);

CREATE TABLE PRODUTOS (
    ID_PRODUTO           INTEGER NOT NULL,
    DESCRICAO_PRODUTO    DMN_TEXTO_LONGO,
    ESTOQUE_PRODUTO      NUMERIC(5,3),
    VALOR_PRECO_PRODUTO  NUMERIC(9,2),
    ID_FABRICANTE        INTEGER NOT NULL,
    ID_CATEGORIA         INTEGER NOT NULL
);

CREATE TABLE USUARIOS (
    ID_USUARIO      INTEGER NOT NULL,
    NOME_USUARIO    DMN_TEXTO_LONGO,
    EMAIL_USUARIO   DMN_TEXTO_LONGO,
    LOGIN_USUARIO   VARCHAR(10),
    SENHA_USUARIO   VARCHAR(10),
    ATIVO_VENDEDOR  CHAR(1)
);

CREATE TABLE VENDA_ITEM (
    ID_VENDA          INTEGER NOT NULL,
    ID_PRODUTO        INTEGER NOT NULL,
    QTD_ITEM          NUMERIC(5,3),
    VALOR_PRECO_ITEM  NUMERIC(9,2)
);

CREATE TABLE VENDAS (
    ID_VENDA             INTEGER NOT NULL,
    ID_CLIENTE           INTEGER NOT NULL,
    ID_USUARIO           INTEGER NOT NULL,
    DATA_CADASTRO_VENDA  DATE
);



/******************************************************************************/
/***                                 Views                                  ***/
/******************************************************************************/


/* View: VW_VENDAS */
CREATE OR ALTER VIEW VW_VENDAS(
    DATA,
    CLIENTE,
    VENDEDOR,
    QTD,
    PRECO,
    DESCRICAO)
AS
select 
    v.data_cadastro_venda data,
    c.nome_cliente cliente,
    u.nome_usuario vendedor,
    vi.qtd_item qtd,
    vi.valor_preco_item preco,
    p.descricao_produto descricao
from produtos p
   inner join venda_item vi on (p.id_produto = vi.id_produto)
   inner join vendas v on (vi.id_venda = v.id_venda)
   inner join clientes c on (v.id_cliente = c.id_cliente)
   inner join usuarios u on (v.id_usuario = u.id_usuario)
;


INSERT INTO USUARIOS (ID_USUARIO, NOME_USUARIO, EMAIL_USUARIO, LOGIN_USUARIO, SENHA_USUARIO, ATIVO_VENDEDOR) VALUES (1, 'ADMINISTRADOR', 'admin@admin.com', 'admin', '123', 'N');

COMMIT WORK;



/******************************************************************************/
/***                              Primary Keys                              ***/
/******************************************************************************/

ALTER TABLE CATEGORIA ADD CONSTRAINT PK_CATEGORIA PRIMARY KEY (ID_CATEGORIA);
ALTER TABLE CLIENTES ADD CONSTRAINT PK_CLIENTES PRIMARY KEY (ID_CLIENTE);
ALTER TABLE FABRICANTE ADD CONSTRAINT PK_FABRICANTE PRIMARY KEY (ID_FABRICANTE);
ALTER TABLE PERFIL ADD CONSTRAINT PK_PERFIL PRIMARY KEY (ID_PERFIL);
ALTER TABLE PERFIL_CONFIG ADD CONSTRAINT PK_PERFIL_CONFIG PRIMARY KEY (ID_PERFIL, ACTION_PERFIL);
ALTER TABLE PRODUTOS ADD CONSTRAINT PK_PRODUTOS PRIMARY KEY (ID_PRODUTO);
ALTER TABLE USUARIOS ADD CONSTRAINT PK_TABLE4 PRIMARY KEY (ID_USUARIO);
ALTER TABLE VENDAS ADD CONSTRAINT PK_VENDAS PRIMARY KEY (ID_VENDA);
ALTER TABLE VENDA_ITEM ADD CONSTRAINT PK_VENDA_ITEM PRIMARY KEY (ID_VENDA, ID_PRODUTO);


/******************************************************************************/
/***                              Foreign Keys                              ***/
/******************************************************************************/

ALTER TABLE PERFIL_CONFIG ADD CONSTRAINT FK_PERFIL_CONFIG_1 FOREIGN KEY (ID_PERFIL) REFERENCES PERFIL (ID_PERFIL);
ALTER TABLE PRODUTOS ADD CONSTRAINT FK_PRODUTOS_1 FOREIGN KEY (ID_FABRICANTE) REFERENCES FABRICANTE (ID_FABRICANTE);
ALTER TABLE PRODUTOS ADD CONSTRAINT FK_PRODUTOS_2 FOREIGN KEY (ID_CATEGORIA) REFERENCES CATEGORIA (ID_CATEGORIA);
ALTER TABLE VENDAS ADD CONSTRAINT FK_VENDAS_1 FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTES (ID_CLIENTE);
ALTER TABLE VENDAS ADD CONSTRAINT FK_VENDAS_2 FOREIGN KEY (ID_USUARIO) REFERENCES USUARIOS (ID_USUARIO);
ALTER TABLE VENDA_ITEM ADD CONSTRAINT FK_VENDA_ITEM_1 FOREIGN KEY (ID_VENDA) REFERENCES VENDAS (ID_VENDA);
ALTER TABLE VENDA_ITEM ADD CONSTRAINT FK_VENDA_ITEM_2 FOREIGN KEY (ID_PRODUTO) REFERENCES PRODUTOS (ID_PRODUTO);


/******************************************************************************/
/***                                Triggers                                ***/
/******************************************************************************/


SET TERM ^ ;



/******************************************************************************/
/***                          Triggers for tables                           ***/
/******************************************************************************/



/* Trigger: TRG_ATUALIZA_ESTOQUE */
CREATE OR ALTER TRIGGER TRG_ATUALIZA_ESTOQUE FOR VENDA_ITEM
ACTIVE AFTER INSERT POSITION 0
AS
begin
  /* Trigger text */
  update produtos set produtos.estoque_produto = produtos.estoque_produto - new.qtd_item
  where produtos.id_produto = new.id_produto;
end
^

SET TERM ; ^

