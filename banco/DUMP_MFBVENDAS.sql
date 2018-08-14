/******************************************************************************/
/***                                Domains                                 ***/
/******************************************************************************/

CREATE DOMAIN DMN_TEXTO_PEQUENO AS 
VARCHAR(20);

CREATE DOMAIN DMN_TEXTO_LONGO AS 
VARCHAR(75);



/******************************************************************************/
/***                               Exceptions                               ***/
/******************************************************************************/

/******************************************************************************/
/***                               Procedures                               ***/
/******************************************************************************/

SET TERM ^ ;

SET TERM ; ^



/******************************************************************************/
/***                            Tables and Views                            ***/
/******************************************************************************/

CREATE TABLE CLIENTES (
    ID_CLIENTE INTEGER NOT NULL,
    NOME_CLIENTE DMN_TEXTO_LONGO,
    ENDERECO_CLIENTE DMN_TEXTO_LONGO,
    BAIRRO_CLIENTE DMN_TEXTO_PEQUENO,
    UF_CLIENTE DMN_TEXTO_PEQUENO,
    CIDADE_CLIENTE DMN_TEXTO_PEQUENO,
    CEP_CLIENTE VARCHAR(9),
    EMAIL_CLIENTE DMN_TEXTO_LONGO,
    TELEFONE_CLIENTE DMN_TEXTO_PEQUENO,
    CELULAR_CLIENTE DMN_TEXTO_PEQUENO);


CREATE TABLE PERFIL (
    ID_PERFIL INTEGER NOT NULL,
    NOME_PERFIL DMN_TEXTO_PEQUENO,
    DESCRICAO_PERFIL DMN_TEXTO_LONGO);


CREATE TABLE PERFIL_CONFIG (
    ID_PERFIL INTEGER NOT NULL,
    ACTION_PERFIL DMN_TEXTO_PEQUENO,
    CAPTION_PERFIL DMN_TEXTO_LONGO,
    PERMISSAO_PERFIL CHAR(1));


CREATE TABLE PRODUTOS (
    ID_PRODUTO INTEGER NOT NULL,
    DESCRICAO_PRODUTO DMN_TEXTO_LONGO,
    ESTOQUE_PRODUTO NUMERIC(5,3),
    VALOR_PRECO_PRODUTO NUMERIC(9,2));


CREATE TABLE USUARIOS (
    ID_USUARIO INTEGER NOT NULL,
    ID_PERFIL INTEGER NOT NULL,
    NOME_USUARIO DMN_TEXTO_LONGO,
    EMAIL_USUARIO DMN_TEXTO_LONGO,
    LOGIN_USUARIO VARCHAR(10),
    SENHA_USUARIO VARCHAR(10),
    ATIVO_VENDEDOR CHAR(1));


CREATE TABLE VENDA_ITEM (
    ID_VENDA INTEGER NOT NULL,
    ID_PRODUTO INTEGER NOT NULL,
    QTD_ITEM NUMERIC(5,3),
    VALOR_PRECO_ITEM NUMERIC(9,2));


CREATE TABLE VENDAS (
    ID_VENDA INTEGER NOT NULL,
    ID_CLIENTE INTEGER NOT NULL,
    ID_USUARIO INTEGER NOT NULL,
    DATA_CADASTRO_VENDA DATE);




/******************************************************************************/
/***                              Primary keys                              ***/
/******************************************************************************/


ALTER TABLE CLIENTES ADD CONSTRAINT PK_CLIENTES PRIMARY KEY (ID_CLIENTE);
ALTER TABLE PERFIL ADD CONSTRAINT PK_PERFIL PRIMARY KEY (ID_PERFIL);
ALTER TABLE PERFIL_CONFIG ADD CONSTRAINT PK_PERFIL_CONFIG PRIMARY KEY (ID_PERFIL);
ALTER TABLE PRODUTOS ADD CONSTRAINT PK_PRODUTOS PRIMARY KEY (ID_PRODUTO);
ALTER TABLE USUARIOS ADD CONSTRAINT PK_TABLE4 PRIMARY KEY (ID_USUARIO);
ALTER TABLE VENDA_ITEM ADD CONSTRAINT PK_VENDA_ITEM PRIMARY KEY (ID_VENDA, ID_PRODUTO);
ALTER TABLE VENDAS ADD CONSTRAINT PK_VENDAS PRIMARY KEY (ID_VENDA);

/******************************************************************************/
/***                           Unique constraints                           ***/
/******************************************************************************/



/******************************************************************************/
/***                              Foreign keys                              ***/
/******************************************************************************/


ALTER TABLE PERFIL_CONFIG ADD CONSTRAINT FK_PERFIL_CONFIG_1 FOREIGN KEY (ID_PERFIL) REFERENCES PERFIL (ID_PERFIL);
ALTER TABLE USUARIOS ADD CONSTRAINT FK_USUARIOS_1 FOREIGN KEY (ID_PERFIL) REFERENCES PERFIL (ID_PERFIL);
ALTER TABLE VENDA_ITEM ADD CONSTRAINT FK_VENDA_ITEM_1 FOREIGN KEY (ID_VENDA) REFERENCES VENDAS (ID_VENDA);
ALTER TABLE VENDA_ITEM ADD CONSTRAINT FK_VENDA_ITEM_2 FOREIGN KEY (ID_PRODUTO) REFERENCES PRODUTOS (ID_PRODUTO);
ALTER TABLE VENDAS ADD CONSTRAINT FK_VENDAS_1 FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTES (ID_CLIENTE);
ALTER TABLE VENDAS ADD CONSTRAINT FK_VENDAS_2 FOREIGN KEY (ID_USUARIO) REFERENCES USUARIOS (ID_USUARIO);

/******************************************************************************/
/***                           Check constraints                            ***/
/******************************************************************************/



/******************************************************************************/
/***                                Indices                                 ***/
/******************************************************************************/



/******************************************************************************/
/***                                Triggers                                ***/
/******************************************************************************/

SET TERM ^ ;

SET TERM ; ^

/******************************************************************************/
/***                               Procedures                               ***/
/******************************************************************************/

SET TERM ^ ;

SET TERM ; ^



/******************************************************************************/
/***                          Object descriptions                           ***/
/******************************************************************************/
