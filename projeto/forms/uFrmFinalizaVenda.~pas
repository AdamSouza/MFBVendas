unit uFrmFinalizaVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DBCtrls, DB,
  DBClient;

type
  TfrmFinalizaVenda = class(TForm)
    edtNomeCliente: TLabeledEdit;
    dbGridCliente: TDBGrid;
    edtSenhaVendedor: TLabeledEdit;
    bbtnFinalizarVenda: TBitBtn;
    Label2: TLabel;
    DBText2: TDBText;
    cdsCliente: TClientDataSet;
    srcCliente: TDataSource;
    cdsClienteID_CLIENTE: TIntegerField;
    cdsClienteNOME_CLIENTE: TStringField;
    cdsClienteENDERECO_CLIENTE: TStringField;
    cdsClienteBAIRRO_CLIENTE: TStringField;
    cdsClienteTELEFONE_CLIENTE: TStringField;
    cdsConsultaUsuario: TClientDataSet;
    cdsConsultaUsuarioID_USUARIO: TIntegerField;
    cdsConsultaUsuarioATIVO_VENDEDOR: TStringField;
    procedure edtNomeClienteChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnFinalizarVendaClick(Sender: TObject);
    procedure edtSenhaVendedorKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFinalizaVenda: TfrmFinalizaVenda;

implementation

uses uFrmVenda, uDM;

{$R *.dfm}

procedure TfrmFinalizaVenda.edtNomeClienteChange(Sender: TObject);
var s: TStringList;
begin
    try
        s := TStringList.Create;
        if edtNomeCliente.Text <> EmptyStr then
        begin
            cdsCliente.Close;
            s.Add(' SELECT C.ID_CLIENTE, C.NOME_CLIENTE, C.ENDERECO_CLIENTE, C.BAIRRO_CLIENTE, C.TELEFONE_CLIENTE ');
            s.Add(' FROM CLIENTES C');
            s.Add(' WHERE C.NOME_CLIENTE LIKE ' + QuotedStr(edtNomeCliente.Text+'%'));
            cdsCliente.CommandText := S.Text;
            cdsCliente.Open;
        end;
    finally
        FreeAndNil(s);
    end;
end;

procedure TfrmFinalizaVenda.FormShow(Sender: TObject);
begin
    edtNomeCliente.SetFocus;
end;

procedure TfrmFinalizaVenda.bbtnFinalizarVendaClick(Sender: TObject);
var s: TStringList;
begin
    if edtSenhaVendedor.Text = EmptyStr then
    begin
        Raise Exception.Create('Campo Senha do Vendedor precisa ser informado.');
    end;

    if cdsCliente.IsEmpty then
    begin
        raise Exception.Create('Campo Cliente precisa ser informado.');
        edtNomeCliente.SetFocus;
    end;

    try
        s:= TStringList.Create;
        cdsConsultaUsuario.Close;
        S.Add(' SELECT U.ID_USUARIO, U.ATIVO_VENDEDOR FROM USUARIOS U ');
        S.Add(' WHERE U.SENHA_USUARIO = ' + QuotedStr(edtSenhaVendedor.Text));
        cdsConsultaUsuario.CommandText := S.Text;
        cdsConsultaUsuario.Open;
        if not (cdsConsultaUsuarioATIVO_VENDEDOR.AsString = 'S') then
        begin
            raise Exception.Create('A Senha informada não permite realizar venda.');
            edtSenhaVendedor.SetFocus;
        end;
    finally
        FreeAndNil(s);
    end;

    with DM do
    begin
        cdsVendas.Open;
        cdsVendas.Append;
        cdsVendasID_CLIENTE.Value           := Self.cdsClienteID_CLIENTE.Value;
        cdsVendasID_USUARIO.Value           := cdsConsultaUsuarioID_USUARIO.Value;
        cdsVendasDATA_CADASTRO_VENDA.Value  := Date;
        cdsVendas.Post;

        frmVenda.cdsVendaItem.RecordCount;
        frmVenda.cdsVendaItem.First;
        while not frmVenda.cdsVendaItem.Eof do
        begin
            cdsVendaItem.Open;
            cdsVendaItem.Append;
            cdsVendaItemID_PRODUTO.Value            := frmVenda.cdsVendaItemCodigo.Value;
            cdsVendaItemQTD_ITEM.AsFloat            := frmVenda.cdsVendaItemQuantidade.AsFloat;
            cdsVendaItemVALOR_PRECO_ITEM.AsFloat    := frmVenda.cdsVendaItemPreco.AsFloat;
            cdsVendaItem.Post;

            frmVenda.cdsVendaItem.Next;
        end;
        cdsVendas.ApplyUpdates(0);
        cdsVendas.Close;
        frmVenda.cdsConsultaProduto.EmptyDataSet;
        frmVenda.cdsVendaItem.EmptyDataSet;
        Close;
    end;
end;

procedure TfrmFinalizaVenda.edtSenhaVendedorKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = #13 then
        bbtnFinalizarVendaClick(Sender);
end;

end.
