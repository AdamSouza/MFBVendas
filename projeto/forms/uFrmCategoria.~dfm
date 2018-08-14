inherited frmCategoria: TfrmCategoria
  Caption = 'frmCategoria'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgControl: TPageControl
    ActivePage = tabCadastro
    inherited tabCadastro: TTabSheet
      object Label3: TLabel
        Left = 24
        Top = 32
        Width = 45
        Height = 13
        Caption = 'Categoria'
        FocusControl = dbCategoria
      end
      object dbCategoria: TDBEdit
        Left = 24
        Top = 48
        Width = 337
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOME_CATEGORIA'
        DataSource = srcRegistro
        TabOrder = 0
      end
    end
    inherited tabConsulta: TTabSheet
      inherited DBGridRegistro: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'ID_CATEGORIA'
            Width = 95
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_CATEGORIA'
            Width = 456
            Visible = True
          end>
      end
    end
  end
  inherited srcRegistro: TDataSource
    DataSet = DM.cdsCategoria
  end
end
