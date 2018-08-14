inherited frmFabricante: TfrmFabricante
  Left = 611
  Top = 53
  Caption = 'frmFabricante'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgControl: TPageControl
    ActivePage = tabCadastro
    inherited tabCadastro: TTabSheet
      object Label3: TLabel
        Left = 24
        Top = 32
        Width = 50
        Height = 13
        Caption = 'Fabricante'
        FocusControl = dbFabricante
      end
      object dbFabricante: TDBEdit
        Left = 24
        Top = 48
        Width = 513
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOME_FABRICANTE'
        DataSource = srcRegistro
        TabOrder = 0
      end
    end
    inherited tabConsulta: TTabSheet
      inherited DBGridRegistro: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'ID_FABRICANTE'
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_FABRICANTE'
            Visible = True
          end>
      end
    end
  end
  inherited srcRegistro: TDataSource
    DataSet = DM.cdsFabricante
  end
end
