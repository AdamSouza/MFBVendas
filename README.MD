EFETUAR O DOWNLOAD DO REPOSIT�RIO (OU CLONAR) em C:\
SQL DO BANCO SE ENCONTRA NA PASTA banco 

OBS1: O usu�rio admin j� vai cadastrado na base de dados com a senha 123 (Implementa��o futura para efetuar um cadastro de usu�rio de primeiro acesso com envio por email com login e senha);
OBS2: Criei as tabelas de USUARIOS e PERFIL para enriquecer um pouco mais o sistema. A de PERFIL n�o ficou funcional a tempo. Implementa��o futura;
OBS3: A ideia do perfil era trabalhar com bloqueio de acesso aos menus de acordo com o perfil vinculado ao usu�rio;
OBS4: Criei para esse sistema um form modelo com quase tudo o que eu iria precisar nos outros forms. Desde CRUD at� valida��o de estados de bot�es, etc. 
OBS5: Os relat�rios ficaram como implementa��o futura.

TECNOLOGIAS UTILIZADAS
BANCO DE DADOS: Firebird 2.5;
IDE DO BANCO: IBExpert Vers�o Trial;
NO DELPHI: - DBExpress para acesso ao Banco de Dados (TSQLConnection, TSQLRemote ,TSQLDataSet);
	   - TDataSetProvider, TClientDataSet e TDataSource da guida DataAcess;
	   - Heran�a Visual/Componente e de c�digo;


USO DO SISTEMA

ABA DE CADASTRO 	-> Cont�m os cadastros de CLIENTES, PRODUTOS, FABRICANTES e CATEGORIAS;
ABA DE VENDA		-> Cont�m o acesso � tela de VENDAS;
ABA DE RELAT�RIO	-> Cont�m uma tela de consulta geral onde estar�o os relat�rios do sistema;
ABA DE ADMINISTRATIVO	-> Cont�m os cadastros de USU�RIOS e PERFIS;
ABA DE SISTEMA		-> Cont�m a a��o de sair do sistema;

1)   Primeiro login ser� realizado pelo admin;
2)   Cadastra-se os CLIENTES;
3)   Cadastra-se as CATEGORIAS e FABRICANTES;
4)   Cadastra-se os PRODUTOS;
5)   Acessar o menu de VENDAS:
5.1) A Tela de Vendas possue teclas de atalho intuitivas. F2 para carregar todos os produtos;
5.2) Duplo clique no DBGrid dos produto para abrir uma tela onde ser� informado QTD e VALOR do item, depois OK; -- � poss�vel dar desconto no valor do produto nessa tela que abrir� informando um valor menor que o cadastrado na tabela PRODUTO;
5.3) F5 para iniciar a finaliza��o da venda;
5.4) Na tela de finaliza��o digitar o nome do cliente para pesquisar e selecionar;
5.5) Informar a senha de vendedor para efetuar a venda;	-- Um us�rio pode ser do tipo vendedor ou n�o. Com o PERFIL funcionando quem n�o fosse vendedor n�o acessaria o menu de vendas e por tal n�o seria necess�rio informar essa senha.
5.6) Ap�s finalizar venda a tela de venda entra no estado de aguardando a pr�xima venda;


 

