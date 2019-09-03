object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 337
  ClientWidth = 616
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 29
    Width = 76
    Height = 13
    Caption = 'Banco de dados'
  end
  object Edit1: TEdit
    Left = 24
    Top = 48
    Width = 441
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object Button1: TButton
    Left = 471
    Top = 46
    Width = 106
    Height = 25
    Caption = 'Localizar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 24
    Top = 88
    Width = 441
    Height = 193
    Lines.Strings = (
      '')
    TabOrder = 2
  end
  object Button2: TButton
    Left = 471
    Top = 86
    Width = 106
    Height = 25
    Caption = 'Executar backup'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 471
    Top = 117
    Width = 106
    Height = 25
    Caption = 'Formatar data'
    TabOrder = 4
    OnClick = Button3Click
  end
  object OpenDialog1: TOpenDialog
    Left = 296
    Top = 176
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 488
    Top = 8
  end
end
