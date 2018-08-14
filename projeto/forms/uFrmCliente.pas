unit uFrmCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uModelo, DB, ImgList, Menus, ActnList, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls, ComCtrls, ToolWin, Mask, DBCtrls;

type
  TfrmCliente = class(TfrmModelo)
    Label3: TLabel;
    dbCliente: TDBEdit;
    Label4: TLabel;
    dbEnderecoCliente: TDBEdit;
    Label5: TLabel;
    dbBairroCliente: TDBEdit;
    Label6: TLabel;
    dbUFCliente: TDBEdit;
    Label7: TLabel;
    dbCidadeCliente: TDBEdit;
    Label8: TLabel;
    dbCEPCliente: TDBEdit;
    Label9: TLabel;
    dbEmailCliente: TDBEdit;
    Label10: TLabel;
    dbTelefoneCliente: TDBEdit;
    Label11: TLabel;
    dbCelularCliente: TDBEdit;
    procedure actIncluirExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCliente: TfrmCliente;

implementation

uses uDM;

{$R *.dfm}

procedure TfrmCliente.actIncluirExecute(Sender: TObject);
begin
  inherited;
    if dbCliente.CanFocus then dbCliente.SetFocus;    
end;

end.
