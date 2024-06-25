object Form8: TForm8
  Left = 0
  Top = 0
  Caption = 'Form8'
  ClientHeight = 760
  ClientWidth = 573
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 40
    Top = 27
    Width = 19
    Height = 15
    Caption = 'NIK'
  end
  object Label2: TLabel
    Left = 40
    Top = 75
    Width = 36
    Height = 15
    Caption = 'NAMA'
  end
  object Label3: TLabel
    Left = 40
    Top = 123
    Width = 25
    Height = 15
    Caption = 'TELP'
  end
  object Label4: TLabel
    Left = 40
    Top = 171
    Width = 34
    Height = 15
    Caption = 'EMAIL'
  end
  object Label5: TLabel
    Left = 40
    Top = 219
    Width = 46
    Height = 15
    Caption = 'ALAMAT'
  end
  object Label6: TLabel
    Left = 40
    Top = 267
    Width = 76
    Height = 15
    Caption = 'PERUSAHAAN'
  end
  object Label7: TLabel
    Left = 40
    Top = 315
    Width = 70
    Height = 15
    Caption = 'NAMA BANK'
  end
  object Label8: TLabel
    Left = 40
    Top = 363
    Width = 66
    Height = 15
    Caption = 'AKUN BANK'
  end
  object Label9: TLabel
    Left = 40
    Top = 411
    Width = 87
    Height = 15
    Caption = 'NO AKUN BANK'
  end
  object Label10: TLabel
    Left = 40
    Top = 712
    Width = 96
    Height = 15
    Caption = 'MASUKAN NAMA'
  end
  object Edit1: TEdit
    Left = 208
    Top = 24
    Width = 334
    Height = 23
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 208
    Top = 72
    Width = 334
    Height = 23
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 208
    Top = 120
    Width = 334
    Height = 23
    TabOrder = 2
  end
  object Edit4: TEdit
    Left = 208
    Top = 168
    Width = 334
    Height = 23
    TabOrder = 3
  end
  object Edit5: TEdit
    Left = 208
    Top = 216
    Width = 334
    Height = 23
    TabOrder = 4
  end
  object Edit6: TEdit
    Left = 208
    Top = 264
    Width = 334
    Height = 23
    TabOrder = 5
  end
  object Edit7: TEdit
    Left = 208
    Top = 312
    Width = 334
    Height = 23
    TabOrder = 6
  end
  object Edit8: TEdit
    Left = 208
    Top = 360
    Width = 334
    Height = 23
    TabOrder = 7
  end
  object Edit9: TEdit
    Left = 208
    Top = 408
    Width = 334
    Height = 23
    TabOrder = 8
  end
  object Edit10: TEdit
    Left = 189
    Top = 709
    Width = 353
    Height = 23
    TabOrder = 9
    OnChange = Edit10Change
  end
  object DBGrid1: TDBGrid
    Left = 40
    Top = 504
    Width = 502
    Height = 176
    DataSource = DataModule4.dssupplier
    TabOrder = 10
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 40
    Top = 448
    Width = 86
    Height = 33
    Caption = 'NEW'
    TabOrder = 11
  end
  object Button2: TButton
    Left = 144
    Top = 448
    Width = 86
    Height = 33
    Caption = 'INSERT'
    TabOrder = 12
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 248
    Top = 448
    Width = 86
    Height = 33
    Caption = 'UPDATE'
    TabOrder = 13
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 352
    Top = 448
    Width = 86
    Height = 33
    Caption = 'DELETE'
    TabOrder = 14
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 456
    Top = 448
    Width = 86
    Height = 33
    Caption = 'BACK'
    TabOrder = 15
    OnClick = Button5Click
  end
end
