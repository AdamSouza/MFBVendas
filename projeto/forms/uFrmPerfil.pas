unit uFrmPerfil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uModelo, DB, ImgList, Menus, ActnList, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls, ComCtrls, ToolWin, Mask, DBCtrls, DBClient;

type
  TTipoPermissao = (tpCheck, tpUncheck, tpInvert); {Tipo de dado criado para ser usado na função MudarPermissao}
  TfrmPerfil = class(TfrmModelo)
    Label3: TLabel;
    dbNomePerfil: TDBEdit;
    Label4: TLabel;
    dbDescricaoPerfil: TDBEdit;
    DBGridPerfilConfig: TDBGrid;
    srcPerfilConfig: TDataSource;
    Panel2: TPanel;
    bbtnCarregarMenuPadrao: TBitBtn;
    sbtnPermitirTodos: TSpeedButton;
    sbtnNegarTodos: TSpeedButton;
    sbtnInverterTodos: TSpeedButton;
    imgPermissao: TImageList;
    procedure actIncluirExecute(Sender: TObject);
    procedure bbtnCarregarMenuPadraoClick(Sender: TObject);
    procedure sbtnPermitirTodosClick(Sender: TObject);
    procedure sbtnNegarTodosClick(Sender: TObject);
    procedure sbtnInverterTodosClick(Sender: TObject);
    procedure DBGridPerfilConfigDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGridPerfilConfigCellClick(Column: TColumn);
    procedure srcRegistroDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    FAcoes : TCustomActionList;
    procedure CarregarMenusPadrao;
    procedure MudarPermissao(TipoPermissao: TTipoPermissao);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; ActionList: TCustomActionList); reintroduce;
  end;

var
  frmPerfil: TfrmPerfil;

implementation

uses uDM;

{$R *.dfm}

procedure TfrmPerfil.actIncluirExecute(Sender: TObject);
begin
  inherited;
    if dbNomePerfil.CanFocus then dbNomePerfil.SetFocus;
end;

procedure TfrmPerfil.CarregarMenusPadrao;
var i: Integer;
begin
    {Função criada para carregar todas as Actions do FrmPrincipal dentro do cdsPerfilConfig}
    TClientDataSet(srcPerfilConfig.DataSet).EmptyDataSet;
    for i:=0 to Pred(FAcoes.ActionCount) do
    begin
        with srcPerfilConfig.DataSet do
        begin
            Append;
            FieldByName('ACTION_PERFIL').AsString := TAction(FAcoes.Actions[i]).Name;
            FieldByName('CAPTION_PERFIL').AsString := TAction(FAcoes.Actions[i]).Caption;
            FieldByName('PERMISSAO_PERFIL').AsString := 'F';
            Post;
        end;
    end;
end;

constructor TfrmPerfil.Create(AOwner: TComponent;
  ActionList: TCustomActionList);
begin
    inherited Create(AOwner);
    FAcoes := ActionList;
end;

procedure TfrmPerfil.MudarPermissao(TipoPermissao: TTipoPermissao);
var i: Integer;
begin
    {Função criada para setar V, F ou inverter esses valores em todo o ClientDataSet}
    with srcPerfilConfig.DataSet do
    begin
        if not IsEmpty then
        begin
            First;
            DisableControls;
            while not Eof do
            begin
                Edit;
                case TipoPermissao of
                tpCheck: FieldByName('PERMISSAO_PERFIL').AsString := 'V';
                tpUncheck: FieldByName('PERMISSAO_PERFIL').AsString := 'F';
                tpInvert: if FieldByName('PERMISSAO_PERFIL').AsString = 'V' then
                             FieldByName('PERMISSAO_PERFIL').AsString := 'F'
                             else
                             FieldByName('PERMISSAO_PERFIL').AsString := 'V';
                end;
                Post;
                Next;
            end;
            EnableControls;
        end;
    end;
end;

procedure TfrmPerfil.bbtnCarregarMenuPadraoClick(Sender: TObject);
begin
  inherited;
    CarregarMenusPadrao;
end;

procedure TfrmPerfil.sbtnPermitirTodosClick(Sender: TObject);
begin
  inherited;
    MudarPermissao(tpCheck);
end;

procedure TfrmPerfil.sbtnNegarTodosClick(Sender: TObject);
begin
  inherited;
    MudarPermissao(tpUncheck);
end;

procedure TfrmPerfil.sbtnInverterTodosClick(Sender: TObject);
begin
  inherited;
    MudarPermissao(tpInvert);
end;

procedure TfrmPerfil.DBGridPerfilConfigDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
    if Column.FieldName = 'PERMISSAO_PERFIL' then
    begin
        DBGridPerfilConfig.Canvas.FillRect(Rect);
        imgPermissao.Draw(DBGridPerfilConfig.Canvas,Rect.Left+10,Rect.Top,-1);
        if Column.Field.AsString = 'V' then
            imgPermissao.Draw(DBGridPerfilConfig.Canvas,Rect.Left+10,Rect.Top,0)
        else
            imgPermissao.Draw(DBGridPerfilConfig.Canvas,Rect.Left+10,Rect.Top,1);
    end;
end;

procedure TfrmPerfil.DBGridPerfilConfigCellClick(Column: TColumn);
begin
  inherited;
    if Column.FieldName = 'PERMISSAO_PERFIL' then
    begin
        srcPerfilConfig.DataSet.Edit;
        if Column.Field.AsString = 'V' then
            Column.Field.AsString := 'F'
        else
            Column.Field.AsString := 'V';
        srcPerfilConfig.DataSet.Post;
    end;
end;

procedure TfrmPerfil.srcRegistroDataChange(Sender: TObject; Field: TField);
begin
  inherited;
    sbtnPermitirTodos.Enabled       := (srcRegistro.State = dsInsert)  or (srcRegistro.State = dsEdit);
    sbtnNegarTodos.Enabled          := (srcRegistro.State = dsInsert)  or (srcRegistro.State = dsEdit);
    sbtnInverterTodos.Enabled       := (srcRegistro.State = dsInsert)  or (srcRegistro.State = dsEdit);
    bbtnCarregarMenuPadrao.Enabled  := (srcRegistro.State = dsInsert)  or (srcRegistro.State = dsEdit);
    DBGridPerfilConfig. Enabled     := (srcRegistro.State = dsInsert)  or (srcRegistro.State = dsEdit);
end;

end.
