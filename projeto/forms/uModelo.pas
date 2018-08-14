unit uModelo;
{Unit modelo para ser usada como herança e dinamizar a confecção da aplicação}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ImgList, Menus, ToolWin, ComCtrls, Grids, DBGrids,
  ExtCtrls, StdCtrls, Buttons, DB, DBClient;

type
  TfrmModelo = class(TForm)
    Acoes: TActionList;
    mmModelo: TMainMenu;
    imgAcoes: TImageList;
    actIncluir: TAction;
    actExcluir: TAction;
    actEditar: TAction;
    actConsultar: TAction;
    actGravar: TAction;
    actCancelar: TAction;
    actSair: TAction;
    ToolBar1: TToolBar;
    Manuteno1: TMenuItem;
    actIncluir1: TMenuItem;
    actExcluir1: TMenuItem;
    actEditar1: TMenuItem;
    actConsultar1: TMenuItem;
    actGravar1: TMenuItem;
    N1: TMenuItem;
    actSair1: TMenuItem;
    tbtnIncluir: TToolButton;
    tbtnExcluir: TToolButton;
    tbtnEditar: TToolButton;
    tbtnSelecionar: TToolButton;
    tbtnCancelar: TToolButton;
    tbtnSalvar: TToolButton;
    tbtnSair: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    pgControl: TPageControl;
    tabCadastro: TTabSheet;
    tabConsulta: TTabSheet;
    Panel1: TPanel;
    DBGridRegistro: TDBGrid;
    cbxFiltro: TComboBox;
    edtFiltro: TEdit;
    btnPesquisar: TBitBtn;
    tbtnImprimir: TToolButton;
    actImprimir: TAction;
    srcRegistro: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    lblDesativaFiltro: TLabel;
    procedure actIncluirExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actConsultarExecute(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure actIncluirUpdate(Sender: TObject);
    procedure actGravarUpdate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure lblDesativaFiltroClick(Sender: TObject);
    procedure DBGridRegistroDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGridRegistroDblClick(Sender: TObject);
    procedure DBGridRegistroTitleClick(Column: TColumn);
    procedure srcRegistroDataChange(Sender: TObject; Field: TField);
    procedure tabConsultaShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmModelo: TfrmModelo;

implementation


{$R *.dfm}

procedure TfrmModelo.actIncluirExecute(Sender: TObject);
begin
    pgControl.ActivePage := tabCadastro;
    if not srcRegistro.DataSet.Active then
    begin
        srcRegistro.DataSet.Open;
    end
    else
        srcRegistro.DataSet.Filtered := False;
    srcRegistro.DataSet.Insert;
end;

procedure TfrmModelo.actExcluirExecute(Sender: TObject);
begin
    if not srcRegistro.DataSet.IsEmpty then
    begin
        if MessageDlg('Deseja Excluir o registro selecionado?',mtInformation,[mbYes,mbNo],0) = mrYes then
        begin
            srcRegistro.DataSet.Delete;
            if srcRegistro.DataSet is TClientDataSet then TClientDataSet(srcRegistro.DataSet).ApplyUpdates(0);
        end;
    end;
end;

procedure TfrmModelo.actEditarExecute(Sender: TObject);
begin
    if (srcRegistro.DataSet.Active) and (srcRegistro.DataSet.RecordCount > 0) then
    begin
        pgControl.ActivePage := tabCadastro;
        srcRegistro.DataSet.Edit;
    end;
end;

procedure TfrmModelo.actConsultarExecute(Sender: TObject);
begin
    if pgControl.ActivePage = tabConsulta then
        pgControl.ActivePage := tabCadastro
    else
        pgControl.ActivePage := tabConsulta;
end;

procedure TfrmModelo.actGravarExecute(Sender: TObject);
begin
    TClientDataSet(srcRegistro.DataSet).ApplyUpdates(0);
    pgControl.ActivePage := tabConsulta;
end;

procedure TfrmModelo.actCancelarExecute(Sender: TObject);
begin
    TClientDataSet(srcRegistro.DataSet).Cancel;
    pgControl.ActivePage := tabConsulta;
end;

procedure TfrmModelo.actSairExecute(Sender: TObject);
begin
    Close;
end;

procedure TfrmModelo.actIncluirUpdate(Sender: TObject);
begin
    //TAction(Sender).Enabled := srcRegistro.State in [dsInactive,dsBrowse];
end;

procedure TfrmModelo.actGravarUpdate(Sender: TObject);
begin
    //TAction(Sender).Enabled := srcRegistro.State in [dsInsert,dsEdit];
    lblDesativaFiltro.Visible := srcRegistro.DataSet.Filtered;
end;

procedure TfrmModelo.FormCreate(Sender: TObject);
var i: Integer;
begin
    //Loop usado para popular o combobox com os campos de tipo string da tabela vinculada ao datasource;
    for i:= 0 to Pred(srcRegistro.DataSet.FieldCount) do
    begin
        if srcRegistro.DataSet.Fields[i].DataType in [ftString,ftWideString,ftFixedChar] then
            cbxFiltro.Items.Add(srcRegistro.DataSet.Fields[i].FieldName);
    end;
    cbxFiltro.ItemIndex := 0;
    // Por padrão será setado o tabsheet de Consulta
    pgControl.ActivePage := tabConsulta;
end;

procedure TfrmModelo.btnPesquisarClick(Sender: TObject);
begin
    if (cbxFiltro.Text <> EmptyStr) and (edtFiltro.Text <> EmptyStr) then
    begin
        srcRegistro.DataSet.Filter := 'Upper('+ cbxFiltro.Text + ') like ' + QuotedStr(UpperCase(edtFiltro.Text)+'%');
        srcRegistro.DataSet.Filtered := True;
        if not srcRegistro.DataSet.Active then
            srcRegistro.DataSet.Open;
    end
    else
        Raise Exception.Create('Campos de Filtro e Valor precisam ser preechidos.');
end;

procedure TfrmModelo.lblDesativaFiltroClick(Sender: TObject);
begin
    srcRegistro.DataSet.Filtered := False;
end;

procedure TfrmModelo.DBGridRegistroDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    if (DBGridRegistro.DataSource.DataSet.RecordCount > 0) and not (gdSelected in State) then
    begin
        if ((DBGridRegistro.DataSource.DataSet.RecNo mod 2) = 0) then DBGridRegistro.Canvas.Brush.Color := DBGridRegistro.Color else DBGridRegistro.Canvas.Brush.Color := TColor(16776160);
        DBGridRegistro.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
end;

procedure TfrmModelo.DBGridRegistroDblClick(Sender: TObject);
begin
    if (srcRegistro.State = dsBrowse) and tabConsulta.TabVisible then tabConsulta.SetFocus;
     // Editar Registro
     TClientDataSet(srcRegistro.DataSet).Edit;
end;

procedure TfrmModelo.DBGridRegistroTitleClick(Column: TColumn);
var Contador :Integer;
begin
     // Modificar Campo da Pesquisa
    if (TClientDataSet(srcRegistro.DataSet).FieldByName(Column.FieldName).FieldKind = fkData)  then
    begin
          for Contador := 0 to DBGridRegistro.Columns.Count -1 do DBGridRegistro.Columns[Contador].Title.Font.Style := [];
          TClientDataSet(srcRegistro.DataSet).IndexFieldNames := Column.FieldName;
          Column.Title.Font.Style := [fsBold, fsUnderline];
          cbxFiltro.ItemIndex := Column.Index;
    end;
end;

procedure TfrmModelo.srcRegistroDataChange(Sender: TObject; Field: TField);
begin
    Application.ProcessMessages;
    tbtnIncluir.Enabled        := (srcRegistro.State = dsBrowse) and (TClientDataSet(srcRegistro.DataSet).Active);
    tbtnExcluir.Enabled        := (srcRegistro.State = dsBrowse) and (TClientDataSet(srcRegistro.DataSet).RecordCount > 0);
    tbtnEditar.Enabled         := (srcRegistro.State = dsBrowse) and (TClientDataSet(srcRegistro.DataSet).RecordCount > 0);
    tbtnSalvar.Enabled         := (srcRegistro.State = dsInsert)  or (srcRegistro.State = dsEdit);
    tbtnCancelar.Enabled       := (srcRegistro.State = dsInsert)  or (srcRegistro.State = dsEdit);
    tbtnImprimir.Enabled       := (srcRegistro.State = dsBrowse) and (TClientDataSet(srcRegistro.DataSet).RecordCount > 0);
    tbtnSelecionar.Enabled     := (srcRegistro.State = dsBrowse) and (TClientDataSet(srcRegistro.DataSet).RecordCount > 0);
    tbtnSair.Enabled           := true;
    //
    tabCadastro.TabVisible     := (srcRegistro.State = dsInsert) or (srcRegistro.State = dsEdit);
    tabConsulta.TabVisible     := (not (tabCadastro.TabVisible));
    //
    edtFiltro.Enabled          := (not (tabCadastro.TabVisible));
    cbxFiltro.Enabled          := (not (tabCadastro.TabVisible));
    btnPesquisar.Enabled       := (not (tabCadastro.TabVisible)); 
end;

procedure TfrmModelo.tabConsultaShow(Sender: TObject);
begin
    if edtFiltro.Enabled then
    edtFiltro.Clear;
end;

end.
