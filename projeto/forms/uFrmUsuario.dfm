inherited frmUsuario: TfrmUsuario
  Caption = 'Cadastro de Usu'#225'rios'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgControl: TPageControl
    ActivePage = tabCadastro
    inherited tabCadastro: TTabSheet
      object Label3: TLabel
        Left = 8
        Top = 16
        Width = 36
        Height = 13
        Caption = 'Usu'#225'rio'
        FocusControl = dbNomeUsuario
      end
      object Label4: TLabel
        Left = 8
        Top = 56
        Width = 28
        Height = 13
        Caption = 'E-mail'
        FocusControl = dbEmailUsuario
      end
      object Label5: TLabel
        Left = 8
        Top = 96
        Width = 26
        Height = 13
        Caption = 'Login'
        FocusControl = dbLoginUsuario
      end
      object Label6: TLabel
        Left = 8
        Top = 136
        Width = 31
        Height = 13
        Caption = 'Senha'
        FocusControl = dbSenhaUsuario
      end
      object dbNomeUsuario: TDBEdit
        Left = 8
        Top = 32
        Width = 350
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOME_USUARIO'
        DataSource = srcRegistro
        TabOrder = 0
      end
      object dbEmailUsuario: TDBEdit
        Left = 8
        Top = 72
        Width = 225
        Height = 21
        CharCase = ecLowerCase
        DataField = 'EMAIL_USUARIO'
        DataSource = srcRegistro
        TabOrder = 1
      end
      object dbLoginUsuario: TDBEdit
        Left = 8
        Top = 112
        Width = 134
        Height = 21
        DataField = 'LOGIN_USUARIO'
        DataSource = srcRegistro
        TabOrder = 2
      end
      object dbSenhaUsuario: TDBEdit
        Left = 8
        Top = 152
        Width = 134
        Height = 21
        DataField = 'SENHA_USUARIO'
        DataSource = srcRegistro
        MaxLength = 10
        TabOrder = 3
      end
      object dbAtivoVendedor: TDBCheckBox
        Left = 8
        Top = 184
        Width = 93
        Height = 17
        Caption = 'Vendedor'
        DataField = 'ATIVO_VENDEDOR'
        DataSource = srcRegistro
        TabOrder = 4
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
    inherited tabConsulta: TTabSheet
      inherited DBGridRegistro: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'ID_USUARIO'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LOGIN_USUARIO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMAIL_USUARIO'
            Width = 368
            Visible = True
          end>
      end
    end
  end
  inherited srcRegistro: TDataSource
    DataSet = DM.cdsUsuarios
    Top = 177
  end
end
