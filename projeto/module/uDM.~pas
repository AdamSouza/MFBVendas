unit uDM;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, FMTBcd, DBClient,
  Provider, Dialogs, TConnect;

type
  TDM = class(TDataModule)
    Conexao: TSQLConnection;
    sdsClientes: TSQLDataSet;
    dspClientes: TDataSetProvider;
    cdsClientes: TClientDataSet;
    cdsProdutos: TClientDataSet;
    dspProdutos: TDataSetProvider;
    sdsProdutos: TSQLDataSet;
    sdsUsuarios: TSQLDataSet;
    dspUsuarios: TDataSetProvider;
    cdsUsuarios: TClientDataSet;
    sdsPerfil: TSQLDataSet;
    dspPerfil: TDataSetProvider;
    cdsPerfil: TClientDataSet;
    sdsVendas: TSQLDataSet;
    dspVendas: TDataSetProvider;
    cdsVendas: TClientDataSet;
    sdsVendaItem: TSQLDataSet;
    cdsVendaItem: TClientDataSet;
    sdsPerfilConfig: TSQLDataSet;
    cdsPerfilConfig: TClientDataSet;
    cdsClientesID_CLIENTE: TIntegerField;
    cdsClientesNOME_CLIENTE: TStringField;
    cdsClientesENDERECO_CLIENTE: TStringField;
    cdsClientesBAIRRO_CLIENTE: TStringField;
    cdsClientesUF_CLIENTE: TStringField;
    cdsClientesCIDADE_CLIENTE: TStringField;
    cdsClientesCEP_CLIENTE: TStringField;
    cdsClientesEMAIL_CLIENTE: TStringField;
    cdsClientesTELEFONE_CLIENTE: TStringField;
    cdsClientesCELULAR_CLIENTE: TStringField;
    cdsProdutosID_PRODUTO: TIntegerField;
    cdsProdutosDESCRICAO_PRODUTO: TStringField;
    cdsProdutosESTOQUE_PRODUTO: TFMTBCDField;
    cdsProdutosVALOR_PRECO_PRODUTO: TFMTBCDField;
    cdsUsuariosID_USUARIO: TIntegerField;
    cdsUsuariosNOME_USUARIO: TStringField;
    cdsUsuariosEMAIL_USUARIO: TStringField;
    cdsUsuariosLOGIN_USUARIO: TStringField;
    cdsUsuariosSENHA_USUARIO: TStringField;
    cdsUsuariosATIVO_VENDEDOR: TStringField;
    cdsPerfilID_PERFIL: TIntegerField;
    cdsPerfilNOME_PERFIL: TStringField;
    cdsPerfilDESCRICAO_PERFIL: TStringField;
    cdsVendasID_VENDA: TIntegerField;
    cdsVendasID_CLIENTE: TIntegerField;
    cdsVendasID_USUARIO: TIntegerField;
    cdsVendasDATA_CADASTRO_VENDA: TDateField;
    srcPerfil_PerfilConfig: TDataSource;
    cdsPerfilsdsPerfilConfig: TDataSetField;
    srcVenda_ItemVenda: TDataSource;
    cdsVendassdsVendaItem: TDataSetField;
    cdsPerfilConfigID_PERFIL: TIntegerField;
    cdsPerfilConfigCAPTION_PERFIL: TStringField;
    cdsPerfilConfigPERMISSAO_PERFIL: TStringField;
    sdsFabrincate: TSQLDataSet;
    dspFabricante: TDataSetProvider;
    cdsFabricante: TClientDataSet;
    cdsFabricanteID_FABRICANTE: TIntegerField;
    cdsFabricanteNOME_FABRICANTE: TStringField;
    sdsCategoria: TSQLDataSet;
    dspCategoria: TDataSetProvider;
    cdsCategoria: TClientDataSet;
    cdsCategoriaID_CATEGORIA: TIntegerField;
    cdsCategoriaNOME_CATEGORIA: TStringField;
    cdsPerfilConfigACTION_PERFIL: TStringField;
    cdsProdutosDESC_CATEGORIA: TStringField;
    cdsProdutosDESC_FABRICANTE: TStringField;
    cdsProdutosID_FABRICANTE: TIntegerField;
    cdsProdutosID_CATEGORIA: TIntegerField;
    sdsConsulta: TSQLDataSet;
    dspConsulta: TDataSetProvider;
    ConexaoLocal: TLocalConnection;
    cdsVendaItemID_VENDA: TIntegerField;
    cdsVendaItemID_PRODUTO: TIntegerField;
    cdsVendaItemQTD_ITEM: TFMTBCDField;
    cdsVendaItemVALOR_PRECO_ITEM: TFMTBCDField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    function GerarID(Tabela: String): Integer;
    procedure GetID(DataSet: TDataSet);
    procedure GetError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
var i: Integer;
begin
    if not Conexao.Connected then
        Conexao.Connected := True;
    {Se em qualquer momento for chamado o evento OnNewRecord de um TClientDataSey set
     será chamada a função GetID para pegar o ID do generator correspondente;
     Se qualquer TClientDataSet retornar algum erro durante seu uso será chamada a função GetError
     mostrando ao usuário uma mensagem}
    for i:= 0 to Pred(ComponentCount) do
        if Components[i] is TClientDataSet then
        begin
            TClientDataSet(Components[i]).OnNewRecord := GetID;
            TClientDataSet(Components[i]).OnReconcileError := GetError;
        end;
    {Apenas os TClientDataSet que fazem Master Detail não sofrerão ação da função GetID}        
    cdsPerfilConfig.OnNewRecord     := nil;
    cdsVendaItem.OnNewRecord        := nil;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
    if Conexao.Connected then
        Conexao.Connected := False;
end;

function TDM.GerarID(Tabela: String): Integer;
var qry: TSQLQuery;
begin
    {A função funciona de acordo com o padrão de geração do generator no IBExpert
     GEN_ID+NOME_TABELA+_ID
     Se o generator for modificado essa função deixará de existir e terá que ser
     criado no OnNewRecord de cada ClientDataSet;
    }
    qry := TSQLQuery.Create(Self);
    qry.SQLConnection := Conexao;
    qry.SQL.Add('SELECT GEN_ID(GEN_' + UpperCase(Tabela) + '_ID,1) FROM RDB$DATABASE');
    qry.Open;
    Result := qry.Fields[0].Value;//sempre meu primeiro campo do cds é o campo de chave primária;    
end;

procedure TDM.GetError(DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
    ShowMessage('Um Erro ocorreu ao tentar manipular dados. ' + #13 +
      ' Mesangem do erro: ' + E.Message);
end;

procedure TDM.GetID(DataSet: TDataSet);
begin
    {O copy só funcionará se o ClienteDataSet estivern o padrão cdsNOMETABELA}
    DataSet.Fields[0].AsInteger := GerarID( Copy(DataSet.Name,4, Length(DataSet.Name) - 3) );
end;

end.
