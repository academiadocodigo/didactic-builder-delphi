object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 85
  ClientWidth = 186
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 16
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Chama Blue'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 97
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Chama Red'
    TabOrder = 1
    OnClick = Button2Click
  end
end
