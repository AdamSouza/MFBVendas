program MFBVendas;

uses
  Forms,
  uFrmPrincipal in 'forms\uFrmPrincipal.pas' {frmPrincipal},
  uDM in 'module\uDM.pas' {DM: TDataModule},
  uModelo in 'forms\uModelo.pas' {frmModelo},
  uFrmCliente in 'forms\uFrmCliente.pas' {frmCliente},
  uFrmProduto in 'forms\uFrmProduto.pas' {frmProduto},
  uFrmUsuario in 'forms\uFrmUsuario.pas' {frmUsuario},
  uFrmPerfil in 'forms\uFrmPerfil.pas' {frmPerfil},
  uFrmVenda in 'forms\uFrmVenda.pas' {frmVenda},
  uFrmFabricante in 'forms\uFrmFabricante.pas' {frmFabricante},
  uFrmCategoria in 'forms\uFrmCategoria.pas' {frmCategoria},
  uFrmVendaItem in 'forms\uFrmVendaItem.pas' {frmVendaItem},
  uFrmFinalizaVenda in 'forms\uFrmFinalizaVenda.pas' {frmFinalizaVenda},
  uFrmLogin in 'forms\uFrmLogin.pas' {frmLogin},
  uRM in 'module\uRM.pas' {RM: TDataModule},
  uFrmConsultaRelatorios in 'forms\uFrmConsultaRelatorios.pas' {frmConsultaRelatorio};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'MFB Sistem de Vendas';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TRM, RM);
  Application.Run;
end.
