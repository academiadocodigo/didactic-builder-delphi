object Form6: TForm6
  Left = 0
  Top = 0
  Caption = 'Form6'
  ClientHeight = 670
  ClientWidth = 988
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 177
    Height = 670
    Align = alLeft
    BevelOuter = bvNone
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    TabOrder = 0
    object Button1: TButton
      Left = 5
      Top = 621
      Width = 167
      Height = 44
      Align = alBottom
      Caption = 'Gerar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object LabeledEdit1: TLabeledEdit
      Left = 6
      Top = 21
      Width = 166
      Height = 21
      EditLabel.Width = 27
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome'
      TabOrder = 1
    end
    object LabeledEdit2: TLabeledEdit
      Left = 6
      Top = 66
      Width = 75
      Height = 21
      EditLabel.Width = 51
      EditLabel.Height = 13
      EditLabel.Caption = 'Data Inicio'
      TabOrder = 2
    end
    object LabeledEdit3: TLabeledEdit
      Left = 97
      Top = 66
      Width = 75
      Height = 21
      EditLabel.Width = 42
      EditLabel.Height = 13
      EditLabel.Caption = 'Data Fim'
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 177
    Top = 0
    Width = 811
    Height = 670
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    TabOrder = 1
    object WebBrowser1: TWebBrowser
      Left = 5
      Top = 5
      Width = 801
      Height = 660
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 88
      ExplicitTop = 144
      ExplicitWidth = 300
      ExplicitHeight = 150
      ControlData = {
        4C000000C9520000374400000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126208000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
  end
end
