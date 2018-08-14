unit uFrmUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uModelo, DB, ImgList, Menus, ActnList, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls, ComCtrls, ToolWin, Mask, DBCtrls;

type
  TfrmUsuario = class(TfrmModelo)
    Label3: TLabel;
    dbNomeUsuario: TDBEdit;
    Label4: TLabel;
    dbEmailUsuario: TDBEdit;
    Label5: TLabel;
    dbLoginUsuario: TDBEdit;
    Label6: TLabel;
    dbSenhaUsuario: TDBEdit;
    dbAtivoVendedor: TDBCheckBox;
    procedure actIncluirExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsuario: TfrmUsuario;

implementation

uses uDM;

{$R *.dfm}

procedure TfrmUsuario.actIncluirExecute(Sender: TObject);
begin
  inherited;
    if dbNomeUsuario.CanFocus then dbNomeUsuario.SetFocus;
end;

procedure TfrmUsuario.FormCreate(Sender: TObject);
begin
  inherited;
    if dbAtivoVendedor.Enabled then dbAtivoVendedor.Checked;
end;

end.
