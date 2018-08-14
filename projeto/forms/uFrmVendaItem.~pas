unit uFrmVendaItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmVendaItem = class(TForm)
    edtQuantidadeItem: TLabeledEdit;
    edtPrecoVendaItem: TLabeledEdit;
    bbtnOK: TBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVendaItem: TfrmVendaItem;

implementation

{$R *.dfm}

procedure TfrmVendaItem.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #27 then
        ModalResult := mrCancel;
end;

end.
