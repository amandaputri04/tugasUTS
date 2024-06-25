object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 215
  ClientWidth = 374
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
    Left = 24
    Top = 43
    Width = 61
    Height = 15
    Caption = 'USERNAME'
  end
  object Edit1: TEdit
    Left = 144
    Top = 40
    Width = 121
    Height = 23
    TabOrder = 0
  end
  object Button1: TButton
    Left = 144
    Top = 96
    Width = 75
    Height = 25
    Caption = 'LOGIN'
    TabOrder = 1
    OnClick = Button1Click
  end
end
