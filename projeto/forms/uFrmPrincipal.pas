unit uFrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, XPStyleActnCtrls, ActnMan, ImgList, ToolWin,
  ActnCtrls, ActnMenus, ExtCtrls, Jpeg, ComCtrls;

type
  TfrmPrincipal = class(TForm)
    Acoes: TActionManager;
    actCadastroCliente: TAction;
    actCadastroProduto: TAction;
    actAdministrativoUsuario: TAction;
    actSair: TAction;
    Imagens: TImageList;
    ActionMainMenuBar1: TActionMainMenuBar;
    actVendaPedidoVenda: TAction;
    actRelatorioVendaGeral: TAction;
    actAdministrativoPerfil: TAction;
    actCadastroFabricante: TAction;
    actCadastroCategoria: TAction;
    imgLogo: TImage;
    sBar: TStatusBar;
    procedure actCadastroClienteExecute(Sender: TObject);
    procedure actCadastroProdutoExecute(Sender: TObject);
    procedure actAdministrativoUsuarioExecute(Sender: TObject);
    procedure actAdministrativoPerfilExecute(Sender: TObject);
    procedure actVendaPedidoVendaExecute(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure actCadastroFabricanteExecute(Sender: TObject);
    procedure actCadastroCategoriaExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actRelatorioVendaGeralExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FUsuario, FNome_Usuario, FEmail_Usuario: String;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses uFrmCliente, uFrmProduto, uFrmUsuario, uFrmPerfil, uFrmVenda,
  uFrmCategoria, uFrmFabricante, uRM, uFrmConsultaRelatorios;

{$R *.dfm}

procedure TfrmPrincipal.actCadastroClienteExecute(Sender: TObject);
begin
    frmCliente := TfrmCliente.Create(Self);
    frmCliente.ShowModal;
    FreeAndNil(frmCliente);
end;

procedure TfrmPrincipal.actCadastroProdutoExecute(Sender: TObject);
begin
    frmProduto := TfrmProduto.Create(Self);
    frmProduto.ShowModal;
    FreeAndNil(frmProduto);
end;

procedure TfrmPrincipal.actAdministrativoUsuarioExecute(Sender: TObject);
begin
    frmUsuario := TfrmUsuario.Create(Self);
    frmUsuario.ShowModal;
    FreeAndNil(frmUsuario);
end;

procedure TfrmPrincipal.actAdministrativoPerfilExecute(Sender: TObject);
begin
    frmPerfil := TfrmPerfil.Create(Self, Acoes);
    frmPerfil.ShowModal;
    FreeAndNil(frmPerfil);
end;

procedure TfrmPrincipal.actVendaPedidoVendaExecute(Sender: TObject);
begin
    frmVenda := TfrmVenda.Create(Self);
    frmVenda.ShowModal;
    FreeAndNil(frmVenda);
end;

procedure TfrmPrincipal.actSairExecute(Sender: TObject);
begin
    if MessageDlg('Deseja sair do sistema?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
        Application.Terminate;
end;

procedure TfrmPrincipal.actCadastroFabricanteExecute(Sender: TObject);
begin
    frmFabricante := TfrmFabricante.Create(Self);
    frmFabricante.ShowModal;
    FreeAndNil(frmFabricante);
end;

procedure TfrmPrincipal.actCadastroCategoriaExecute(Sender: TObject);
begin
    frmCategoria := TfrmCategoria.Create(Self);
    frmCategoria.ShowModal;
    FreeAndNil(frmCategoria);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
    sBar.Panels[0].Text     := ExtractFileName(Application.ExeName);
    sBar.Panels[1].Text     := 'USU�RIO:   ' + FNome_Usuario;
    sBar.Panels[2].Text     := 'LOGIN:   ' + FUsuario;
    sBar.Panels[3].Text     := 'E-MAIL:   ' + FEmail_Usuario;
    sBar.Panels[4].Text     := 'DATA:   ' + DateToStr(Date);
end;

procedure TfrmPrincipal.actRelatorioVendaGeralExecute(Sender: TObject);
begin
    frmConsultaRelatorio := TfrmConsultaRelatorio.Create(Self);
    frmConsultaRelatorio.ShowModal;
    FreeAndNil(frmConsultaRelatorio);
end;

end.



