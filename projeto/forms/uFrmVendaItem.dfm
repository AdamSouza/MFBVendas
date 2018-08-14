object frmVendaItem: TfrmVendaItem
  Left = 386
  Top = 236
  Width = 364
  Height = 176
  Caption = 'frmVendaItem'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object edtQuantidadeItem: TLabeledEdit
    Left = 40
    Top = 56
    Width = 121
    Height = 21
    EditLabel.Width = 55
    EditLabel.Height = 13
    EditLabel.Caption = 'Quantidade'
    TabOrder = 0
  end
  object edtPrecoVendaItem: TLabeledEdit
    Left = 184
    Top = 56
    Width = 121
    Height = 21
    EditLabel.Width = 28
    EditLabel.Height = 13
    EditLabel.Caption = 'Pre'#231'o'
    TabOrder = 1
  end
  object bbtnOK: TBitBtn
    Left = 40
    Top = 96
    Width = 89
    Height = 25
    Caption = '&Salvar'
    TabOrder = 2
    Kind = bkOK
  end
end
