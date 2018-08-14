inherited frmProduto: TfrmProduto
  Caption = 'Cadastro de Produto'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgControl: TPageControl
    inherited tabCadastro: TTabSheet
      object Label3: TLabel
        Left = 8
        Top = 24
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbDescricaoProduto
      end
      object Label4: TLabel
        Left = 8
        Top = 64
        Width = 39
        Height = 13
        Caption = 'Estoque'
        FocusControl = dbEstoque
      end
      object Label5: TLabel
        Left = 248
        Top = 64
        Width = 64
        Height = 13
        Caption = 'Valor Produto'
        FocusControl = dbValorProduto
      end
      object Label6: TLabel
        Left = 8
        Top = 112
        Width = 45
        Height = 13
        Caption = 'Categoria'
        FocusControl = DBLKPcATEGORIA
      end
      object Label7: TLabel
        Left = 8
        Top = 152
        Width = 50
        Height = 13
        Caption = 'Fabricante'
        FocusControl = DBLKPFABRICANTE
      end
      object dbDescricaoProduto: TDBEdit
        Left = 8
        Top = 40
        Width = 450
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DESCRICAO_PRODUTO'
        DataSource = srcRegistro
        TabOrder = 0
      end
      object dbEstoque: TDBEdit
        Left = 8
        Top = 80
        Width = 212
        Height = 21
        CharCase = ecUpperCase
        DataField = 'ESTOQUE_PRODUTO'
        DataSource = srcRegistro
        TabOrder = 1
      end
      object dbValorProduto: TDBEdit
        Left = 248
        Top = 80
        Width = 212
        Height = 21
        CharCase = ecUpperCase
        DataField = 'VALOR_PRECO_PRODUTO'
        DataSource = srcRegistro
        TabOrder = 2
      end
      object DBLKPcATEGORIA: TDBLookupComboBox
        Left = 8
        Top = 128
        Width = 274
        Height = 21
        DataField = 'DESC_CATEGORIA'
        DataSource = srcRegistro
        TabOrder = 3
      end
      object DBLKPFABRICANTE: TDBLookupComboBox
        Left = 8
        Top = 168
        Width = 274
        Height = 21
        DataField = 'DESC_FABRICANTE'
        DataSource = srcRegistro
        TabOrder = 4
      end
    end
    inherited tabConsulta: TTabSheet
      inherited DBGridRegistro: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'ID_PRODUTO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO_PRODUTO'
            Width = 228
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESC_CATEGORIA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESC_FABRICANTE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ESTOQUE_PRODUTO'
            Visible = True
          end>
      end
    end
  end
  inherited srcRegistro: TDataSource
    DataSet = DM.cdsProdutos
  end
end
