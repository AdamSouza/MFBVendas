unit uFrmVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB, DBClient,
  DBCtrls;

type
  TfrmVenda = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    dbGridProduto: TDBGrid;
    edtCodigoProduto: TLabeledEdit;
    edtDescricaoProduto: TLabeledEdit;
    edtCategoriaProduto: TLabeledEdit;
    edtFabricanteProduto: TLabeledEdit;
    bbtnPesquisarProduto: TBitBtn;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    bbtnLimpar: TBitBtn;
    bbtnFinalizar: TBitBtn;
    bbtnFechar: TBitBtn;
    cdsConsultaProduto: TClientDataSet;
    srcConsultaProduto: TDataSource;
    cdsConsultaProdutoCODIGO: TIntegerField;
    cdsConsultaProdutoDESCRICAO: TStringField;
    cdsConsultaProdutoESTOQUE_PRODUTO: TFMTBCDField;
    cdsConsultaProdutoVALOR_PRECO_PRODUTO: TFMTBCDField;
    cdsConsultaProdutoCATEGORIA: TStringField;
    cdsConsultaProdutoFABRICANTE: TStringField;
    cdsVendaItem: TClientDataSet;
    srcVendaItem: TDataSource;
    cdsVendaItemCodigo: TIntegerField;
    cdsVendaItemDescricao: TStringField;
    cdsVendaItemQuantidade: TFloatField;
    cdsVendaItemPreco: TFloatField;
    cdsVendaItemTotalItens: TAggregateField;
    cdsVendaItemSubTotal: TAggregateField;
    cdsVendaItemValorTotal: TFloatField;
    DBText1: TDBText;
    DBText2: TDBText;
    procedure bbtnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbtnPesquisarProdutoClick(Sender: TObject);
    procedure dbGridProdutoDblClick(Sender: TObject);
    procedure cdsVendaItemCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbtnFinalizarClick(Sender: TObject);
    procedure srcVendaItemDataChange(Sender: TObject; Field: TField);
    procedure bbtnLimparClick(Sender: TObject);
  private
    { Private declarations }
  protected
    { Protect declarations}
    procedure ConsultaProduto;Virtual;
  public
    { Public declarations }
  end;

var
  frmVenda: TfrmVenda;

implementation

uses uDM, uFrmVendaItem, uFrmFinalizaVenda;

{$R *.dfm}

procedure TfrmVenda.bbtnFecharClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmVenda.ConsultaProduto;
var s: TStringList;
begin
    s := TStringList.Create;
    s.Add(' SELECT p.id_produto as codigo, p.descricao_produto as descricao, p.estoque_produto, p.valor_preco_produto, ');
    s.Add(' c.nome_categoria as categoria, f.nome_fabricante as fabricante ');
    s.Add(' FROM produtos P ');
    s.Add(' inner join fabricante f on p.id_fabricante = f.id_fabricante ');
    s.Add(' inner join categoria c on p.id_categoria = c.id_categoria ');
    s.Add(' WHERE 1=1 ');
    if edtCodigoProduto.Text <> EmptyStr then
        s.Add(' and p.id_produto = ' + edtCodigoProduto.Text);
    if edtDescricaoProduto.Text <> EmptyStr then
        s.Add(' and p.descricao_produto like ' + QuotedStr(edtDescricaoProduto.Text+'%'));
    if edtCategoriaProduto.Text <> EmptyStr then
        s.Add(' and c.nome_categoria like ' + QuotedStr(edtCategoriaProduto.Text+'%'));
    if edtFabricanteProduto.Text <> EmptyStr then
        s.Add(' and f.nome_fabricate = ' + QuotedStr(edtFabricanteProduto.Text+'%'));
    cdsConsultaProduto.Close;
    cdsConsultaProduto.CommandText := s.Text;
    cdsConsultaProduto.Open;
    FreeAndNil(s);
end;

procedure TfrmVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case Key of
    VK_F6: Close;
    VK_F2: ConsultaProduto;
    VK_F5: bbtnFinalizarClick(Sender);
    VK_F3: bbtnLimparClick(Sender);
    end;
end;

procedure TfrmVenda.bbtnPesquisarProdutoClick(Sender: TObject);
begin
    ConsultaProduto;
end;

procedure TfrmVenda.dbGridProdutoDblClick(Sender: TObject);
begin
    frmVendaItem.edtQuantidadeItem.Text := '1';
    frmVendaItem.edtPrecoVendaItem.Text := cdsConsultaProdutoVALOR_PRECO_PRODUTO.AsString;
    if frmVendaItem.ShowModal = mrOk then
    begin
        cdsVendaItem.Append;
        cdsVendaItemCodigo.Value        := cdsConsultaProdutoCODIGO.Value;
        cdsVendaItemDescricao.Value     := cdsConsultaProdutoDESCRICAO.Value;
        cdsVendaItemQuantidade.AsString := frmVendaItem.edtQuantidadeItem.Text;
        cdsVendaItemPreco.AsString      := frmVendaItem.edtPrecoVendaItem.Text;
        cdsVendaItem.Post;
    end;
end;

procedure TfrmVenda.cdsVendaItemCalcFields(DataSet: TDataSet);
begin
    cdsVendaItemValorTotal.Value := (cdsVendaItemQuantidade.Value * cdsVendaItemPreco.Value);
end;

procedure TfrmVenda.FormCreate(Sender: TObject);
begin
    frmVendaItem := TfrmVendaItem.Create(Self);
end;

procedure TfrmVenda.FormDestroy(Sender: TObject);
begin
    FreeAndNil(frmVendaItem);
end;

procedure TfrmVenda.bbtnFinalizarClick(Sender: TObject);
begin
    frmFinalizaVenda := TfrmFinalizaVenda.Create(Self);
    frmFinalizaVenda.ShowModal;
    FreeAndNil(frmFinalizaVenda);
end;

procedure TfrmVenda.srcVendaItemDataChange(Sender: TObject; Field: TField);
begin
    bbtnLimpar.Enabled    := (srcVendaItem.DataSet.RecordCount > 0);
    bbtnFinalizar.Enabled := (srcVendaItem.DataSet.RecordCount > 0);
end;

procedure TfrmVenda.bbtnLimparClick(Sender: TObject);
var i: Integer;
begin
    cdsConsultaProduto.EmptyDataSet;
    cdsVendaItem.EmptyDataSet;
    for i := 0 to Pred(frmVenda.ComponentCount) do
        if frmVenda.Components[i].ClassName = 'TLabeledEdit' then
        TLabeledEdit(frmVenda.Components[i]).Clear;
end;

end.
