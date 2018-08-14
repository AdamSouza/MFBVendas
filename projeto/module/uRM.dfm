object RM: TRM
  OldCreateOrder = False
  Left = 356
  Top = 125
  Height = 431
  Width = 637
  object RvProj: TRvProject
    Engine = RvSys
    ProjectFile = 'C:\MFBVendas\bin\Relatorio.rav'
    Left = 80
    Top = 40
  end
  object RvSys: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    SystemSetups = [ssAllowCopies, ssAllowCollate, ssAllowDuplex, ssAllowDestPreview, ssAllowDestPrinter, ssAllowDestFile, ssAllowPrinterSetup, ssAllowPreviewSetup]
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.FormState = wsMaximized
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'ReportPrinter Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    Left = 144
    Top = 40
  end
  object RvDsVendas: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = cdsVendas
    Left = 80
    Top = 296
  end
  object sdsVendas: TSQLDataSet
    CommandText = 'select * from VW_VENDAS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Conexao
    Left = 80
    Top = 152
  end
  object cdsVendas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVendas'
    Left = 80
    Top = 248
  end
  object dspVendas: TDataSetProvider
    DataSet = sdsVendas
    Left = 80
    Top = 200
  end
end
