object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 39
    Top = 40
    Width = 36
    Height = 15
    Caption = 'NAMA'
  end
  object Label2: TLabel
    Left = 39
    Top = 371
    Width = 96
    Height = 15
    Caption = 'MASUKAN NAMA'
  end
  object Edit1: TEdit
    Left = 152
    Top = 37
    Width = 377
    Height = 23
    TabOrder = 0
  end
  object Button1: TButton
    Left = 143
    Top = 88
    Width = 75
    Height = 41
    Caption = 'INSERT'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 247
    Top = 88
    Width = 75
    Height = 41
    Caption = 'UPDATE'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 351
    Top = 88
    Width = 75
    Height = 41
    Caption = 'DELETE'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Edit2: TEdit
    Left = 168
    Top = 365
    Width = 258
    Height = 23
    TabOrder = 4
    OnChange = Edit2Change
  end
  object Button4: TButton
    Left = 454
    Top = 359
    Width = 75
    Height = 41
    Caption = 'CARI'
    TabOrder = 5
    OnClick = Button4Click
  end
  object DBGrid1: TDBGrid
    Left = 39
    Top = 152
    Width = 490
    Height = 192
    DataSource = DataModule4.dskategori
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
  end
  object Button5: TButton
    Left = 39
    Top = 88
    Width = 75
    Height = 41
    Caption = 'BARU'
    TabOrder = 7
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 454
    Top = 88
    Width = 75
    Height = 41
    Caption = 'BATAL'
    TabOrder = 8
  end
end
