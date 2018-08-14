EFETUAR O DOWNLOAD DO REPOSITÓRIO (OU CLONAR) em C:\
SQL DO BANCO SE ENCONTRA NA PASTA banco 

OBS1: O usuário admin já vai cadastrado na base de dados com a senha 123 (Implementação futura para efetuar um cadastro de usuário de primeiro acesso com envio por email com login e senha);
OBS2: Criei as tabelas de USUARIOS e PERFIL para enriquecer um pouco mais o sistema. A de PERFIL não ficou funcional a tempo. Implementação futura;
OBS3: A ideia do perfil era trabalhar com bloqueio de acesso aos menus de acordo com o perfil vinculado ao usuário;
OBS4: Criei para esse sistema um form modelo com quase tudo o que eu iria precisar nos outros forms. Desde CRUD até validação de estados de botões, etc. 
OBS5: Os relatórios ficaram como implementação futura.

TECNOLOGIAS UTILIZADAS
BANCO DE DADOS: Firebird 2.5;
IDE DO BANCO: IBExpert Versão Trial;
NO DELPHI: - DBExpress para acesso ao Banco de Dados (TSQLConnection, TSQLRemote ,TSQLDataSet);
	   - TDataSetProvider, TClientDataSet e TDataSource da guida DataAcess;
	   - Herança Visual/Componente e de código;


USO DO SISTEMA

ABA DE CADASTRO 	-> Contém os cadastros de CLIENTES, PRODUTOS, FABRICANTES e CATEGORIAS;
ABA DE VENDA		-> Contém o acesso à tela de VENDAS;
ABA DE RELATÓRIO	-> Contém uma tela de consulta geral onde estarão os relatórios do sistema;
ABA DE ADMINISTRATIVO	-> Contém os cadastros de USUÁRIOS e PERFIS;
ABA DE SISTEMA		-> Contém a ação de sair do sistema;

1)   Primeiro login será realizado pelo admin;
2)   Cadastra-se os CLIENTES;
3)   Cadastra-se as CATEGORIAS e FABRICANTES;
4)   Cadastra-se os PRODUTOS;
5)   Acessar o menu de VENDAS:
5.1) A Tela de Vendas possue teclas de atalho intuitivas. F2 para carregar todos os produtos;
5.2) Duplo clique no DBGrid dos produto para abrir uma tela onde será informado QTD e VALOR do item, depois OK; -- é possível dar desconto no valor do produto nessa tela que abrirá informando um valor menor que o cadastrado na tabela PRODUTO;
5.3) F5 para iniciar a finalização da venda;
5.4) Na tela de finalização digitar o nome do cliente para pesquisar e selecionar;
5.5) Informar a senha de vendedor para efetuar a venda;	-- Um usário pode ser do tipo vendedor ou não. Com o PERFIL funcionando quem não fosse vendedor não acessaria o menu de vendas e por tal não seria necessário informar essa senha.
5.6) Após finalizar venda a tela de venda entra no estado de aguardando a próxima venda;


 

