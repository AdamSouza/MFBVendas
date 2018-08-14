unit uFrmProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uModelo, DB, ImgList, Menus, ActnList, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls, ComCtrls, ToolWin, Mask, DBCtrls;

type
  TfrmProduto = class(TfrmModelo)
    Label3: TLabel;
    dbDescricaoProduto: TDBEdit;
    Label4: TLabel;
    dbEstoque: TDBEdit;
    Label5: TLabel;
    dbValorProduto: TDBEdit;
    Label6: TLabel;
    DBLKPcATEGORIA: TDBLookupComboBox;
    Label7: TLabel;
    DBLKPFABRICANTE: TDBLookupComboBox;
    procedure actIncluirExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProduto: TfrmProduto;

implementation

uses uDM;

{$R *.dfm}

procedure TfrmProduto.actIncluirExecute(Sender: TObject);
begin
  inherited;
    if dbDescricaoProduto.CanFocus then dbDescricaoProduto.SetFocus;
end;

end.
