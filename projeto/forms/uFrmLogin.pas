unit uFrmLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, DB, DBClient;

type
  TfrmLogin = class(TForm)
    edtLoginUsuario: TLabeledEdit;
    edtSenhaUsuario: TLabeledEdit;
    sbtnLogar: TSpeedButton;
    cdsConsultaUsuario: TClientDataSet;
    lblNomeSistema: TLabel;
    Label1: TLabel;
    cdsConsultaUsuarioID_USUARIO: TIntegerField;
    cdsConsultaUsuarioNOME_USUARIO: TStringField;
    cdsConsultaUsuarioEMAIL_USUARIO: TStringField;
    cdsConsultaUsuarioLOGIN_USUARIO: TStringField;
    cdsConsultaUsuarioSENHA_USUARIO: TStringField;
    cdsConsultaUsuarioATIVO_VENDEDOR: TStringField;
    procedure sbtnLogarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses uDM, uFrmPrincipal;

{$R *.dfm}

procedure TfrmLogin.sbtnLogarClick(Sender: TObject);
var s: TStringList;
begin
    if edtLoginUsuario.Text = '' then
    begin
        raise Exception.Create('Campo Login precisa ser informado.');
        edtLoginUsuario.SetFocus;
    end;
    if edtSenhaUsuario.Text = '' then
    begin
        raise Exception.Create('CampoSenha precisa ser informado.');
        edtSenhaUsuario.SetFocus;
    end;
    try
        s:= TStringList.Create;
        cdsConsultaUsuario.Close;
        S.Add(' SELECT U.id_usuario, U.nome_usuario, u.email_usuario, u.login_usuario, u.senha_usuario, u.ativo_vendedor ');
        S.Add(' FROM USUARIOS U ');
        S.Add(' WHERE u.login_usuario = ' + QuotedStr(edtLoginUsuario.Text));
        S.Add(' AND u.senha_usuario = ' + QuotedStr(edtSenhaUsuario.Text));
        cdsConsultaUsuario.CommandText := s.Text;
        cdsConsultaUsuario.Open;
        if cdsConsultaUsuario.IsEmpty then
            raise Exception.Create(' Dados informados n�o conferem com nenhum usu�rio cadastrado. ')
        else
        begin
            frmPrincipal := TfrmPrincipal.Create(Self);
            frmPrincipal.FUsuario       := cdsConsultaUsuarioLOGIN_USUARIO.Value;
            frmPrincipal.FNome_Usuario  := cdsConsultaUsuarioNOME_USUARIO.Value;
            frmPrincipal.FEmail_Usuario := cdsConsultaUsuarioEMAIL_USUARIO.Value;
            frmPrincipal.ShowModal;
            FreeAndNil(frmPrincipal);
        end;
    finally
        FreeAndNil(S);
    end;
end;

procedure TfrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
        sbtnLogarClick(Sender);
end;

end.
