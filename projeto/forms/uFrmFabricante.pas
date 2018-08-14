unit uFrmFabricante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uModelo, DB, ImgList, Menus, ActnList, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls, ComCtrls, ToolWin, Mask, DBCtrls;

type
  TfrmFabricante = class(TfrmModelo)
    Label3: TLabel;
    dbFabricante: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFabricante: TfrmFabricante;

implementation

uses uDM;

{$R *.dfm}

end.
