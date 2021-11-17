object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Builder Pattern'
  ClientHeight = 314
  ClientWidth = 649
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'RED'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 48
    Width = 75
    Height = 25
    Caption = 'BLUE'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 89
    Top = 8
    Width = 551
    Height = 161
    Lines.Strings = (
      
        'A funcionalidade usada no VCL ou FMX do Delphi para criar formul' +
        #225'rios e componentes '#233' semelhante em '
      'conceito ao constructor.'
      
        'O Delphi cria formul'#225'rios usando interface comum, por "Applicati' +
        'on.CreateForm" meio do TForm construtor de '
      'classes.'
      
        'TForm implmenta um construtor comum usando as informa'#231#245'es de rec' +
        'ursos (arquivo DFM/FMX) para instaciar os '
      'componentes pertecentes ao formul'#225'rio.'
      
        'Muitas classes descendentes reutilizam esse mesmo processo de co' +
        'nstru'#231#227'o para criar diferentes '
      'representa'#231#245'es.'
      'O Delphi tamb'#233'm facilita as extens'#245'es do desenvolvedor.'
      
        'O evento OnCreate do TForm  tamb'#233'm adiciona um gancho ao process' +
        'o do construtor para tornar a '
      'funcionalidade f'#225'cil de estender.')
    TabOrder = 2
  end
  object Memo2: TMemo
    Left = 89
    Top = 175
    Width = 551
    Height = 122
    Lines.Strings = (
      
        'Esse nosso exemplo a seguir inclui um classe TAbstractFormBuilde' +
        'r e duas classes concretas TRedFormBuilder e '
      'TBlueFormBuilder.'
      
        'Para facilitar o desenvolvimento, algumas funcionalidades comuns' +
        ' das classes concretas foram movidas para a '
      'classe TAbstractFormBuilder compartilhar.'
      ''
      
        'Em tempo de execu'#231#227'o, o aplicativo cliente instrui uma das class' +
        'es concretas a criar componentes usando os '
      'procedimentos de cria'#231#227'o de componentes p'#250'blicas.'
      
        'A inst'#226'ncia do construtor concreto '#233' passada por parametro ao m'#233 +
        'todo Create3ComponentFormUsingBuilder')
    TabOrder = 3
  end
end
