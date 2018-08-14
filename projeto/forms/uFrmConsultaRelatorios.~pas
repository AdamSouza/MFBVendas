unit uFrmConsultaRelatorios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, ImgList;

type
  TfrmConsultaRelatorio = class(TForm)
    pnlFIltroConsulta: TPanel;
    rgFIltroData: TRadioGroup;
    dtpInicio: TDateTimePicker;
    dtpFim: TDateTimePicker;
    bbtnPesquisar: TBitBtn;
    lblPeriodo: TLabel;
    cbxFiltroMes: TComboBox;
    pbnBotoes: TPanel;
    sbtnImprimir: TSpeedButton;
    DBGridConsulta: TDBGrid;
    SpeedButton1: TSpeedButton;
    rgTipoRelatorio: TRadioGroup;
    procedure rgFIltroDataClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaRelatorio: TfrmConsultaRelatorio;

implementation

uses uRM;

{$R *.dfm}

procedure TfrmConsultaRelatorio.rgFIltroDataClick(Sender: TObject);
begin
    case rgFIltroData.ItemIndex of
        0:
        begin
            dtpInicio.Visible       := True;
            dtpInicio.Date          := Date;
            lblPeriodo.Visible      := False;
            dtpFim.Visible          := False;
            cbxFiltroMes.Visible    := False;
        end;
        1:
        begin
            dtpInicio.Visible       := True;
            dtpInicio.Date          := Date;
            lblPeriodo.Visible      := True;
            dtpFim.Visible          := True;
            dtpFim.DateTime         := Date;
            cbxFiltroMes.Visible    := False;
        end;
        2:
        begin
            dtpInicio.Visible       := False;
            lblPeriodo.Visible      := False;
            dtpFim.Visible          := False;
            cbxFiltroMes.Visible    := True;
        end;
    end;
end;

procedure TfrmConsultaRelatorio.SpeedButton1Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmConsultaRelatorio.FormCreate(Sender: TObject);
begin
    rgFIltroDataClick(Sender);
    bbtnPesquisar.Enabled   := True;
end;


procedure TfrmConsultaRelatorio.sbtnImprimirClick(Sender: TObject);
begin
        case rgTipoRelatorio.ItemIndex of
        0:
        begin
            RM.RvProj.ExecuteReport('ReportVendaGeral');
        end;
        1:
        begin
            {chamar o relatório de vendas por cliente}
        end;
        2:
        begin
            {chamar o relatório de vendas por usuário}
        end;
    end;
end;

end.
