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
  object Label2: TLabel
    Left = 16
    Top = 125
    Width = 115
    Height = 13
    Caption = 'Local arquivo de backup'
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
  object Button2: TButton
    Left = 471
    Top = 86
    Width = 106
    Height = 25
    Caption = 'Executar backup'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 359
    Top = 86
    Width = 106
    Height = 25
    Caption = 'Formatar data'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Edit2: TEdit
    Left = 16
    Top = 144
    Width = 441
    Height = 21
    TabOrder = 4
    Text = 'Edit2'
  end
  object Button4: TButton
    Left = 463
    Top = 142
    Width = 106
    Height = 25
    Caption = 'Localizar Backup'
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 463
    Top = 173
    Width = 106
    Height = 25
    Caption = 'Iniciar restaura'#231#227'o'
    TabOrder = 6
    OnClick = Button5Click
  end
  object Memo1: TMemo
    Left = 392
    Top = 256
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 7
  end
  object OpenDialog1: TOpenDialog
    Left = 192
    Top = 224
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 488
    Top = 8
  end
end
