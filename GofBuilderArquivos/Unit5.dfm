object Form5: TForm5
  Left = 0
  Top = 0
  Caption = 'Form5'
  ClientHeight = 506
  ClientWidth = 737
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 40
    Width = 713
    Height = 457
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 8
    Top = 9
    Width = 153
    Height = 25
    Caption = 'Gerar relatorio'
    TabOrder = 1
    OnClick = Button1Click
  end
  object ClientDataSet1: TClientDataSet
    PersistDataPacket.Data = {
      420A00009619E0BD01000000180000000B0017000000030000006C010856656E
      646F724E6F08000400100000000A56656E646F724E616D650100490010000100
      055749445448020002001E000841646472657373310100490010000100055749
      445448020002001E000841646472657373320100490010000100055749445448
      020002001E000443697479010049001000010005574944544802000200140005
      53746174650100490010000100055749445448020002001400035A6970010049
      0010000100055749445448020002000A0007436F756E74727901004900100001
      00055749445448020002000F000550686F6E6501004900100001000557494454
      48020002000F00034641580100490010000100055749445448020002000F0009
      507265666572726564020003001000000003000D44454641554C545F4F524445
      520400820001000000010000000B5052494D4152595F4B455904008200010000
      0001000000044C434944020001000904004000000000000000789F4011436163
      6F7220436F72706F726174696F6E1131363120536F7574686669656C64205264
      0A536F7574686669656C64024F4805363030393306552E532E412E0C3730382D
      3535352D393535350C3730382D3535352D373534370100004000040000000000
      A2A4400A556E64657277617465720F3530204E20337264205374726565740C49
      6E6469616E61706F6C697302494E05343632303806552E532E412E0C3331372D
      3535352D343532330100004000000000000000E4A440124A2E572E20204C7573
      63686572204D66672E10363520416464616D7320537472656574074265726B65
      6C79024D4105303237373906552E532E412E0C3830302D3535352D343734340C
      3530382D3535352D3839343900000040000400000000006EAB40135363756261
      2050726F66657373696F6E616C730F3331303520456173742042726163651052
      616E63686F20446F6D696E6775657A02434105393032323106552E532E412E0C
      3231332D3535352D373835300100004000000000000000D6AD40144469766572
      73272020537570706C792053686F70123532303820556E697665727369747920
      4472054D61636F6E02474105323038363506552E532E412E0C3931322D353535
      2D363739300C3931322D3535352D383437340000004000000000000000D8AD40
      0A546563686E697175657310353220446F6C7068696E2044726976650C526564
      776F6F6420436974790243410A39343036352D3130383606552E532E412E0C34
      31352D3535352D313431300C3431352D3535352D313237360000004000000000
      000000A9B1400B50657272792053637562610E33343433204A616D6573204176
      65094861706576696C6C6502474105333033353406552E532E412E0C3830302D
      3535352D363232300C3430342D3535352D383238300100004000000000000000
      22B2400E42656175636861742C20496E632E10343539303020535720326E6420
      4176650D4674204C617564657264616C6502464C05333333313506552E532E41
      2E0C3330352D3535352D373234320C3330352D3535352D363733390100004000
      0000000000002BB24009416D6F72204171756113343220576573742032397468
      20537472656574084E657720596F726B024E5905313030313106552E532E412E
      0C3830302D3535352D363838300C3231322D3535352D37323836010000400004
      00000000002CB240134171756120526573656172636820436F72702E0C502E4F
      2E20426F782039393807436F726E697368024E4805303337343506552E532E41
      2E0C3630332D3535352D3232353401000040000000000000002FB2401242264B
      20556E6465727365612050686F746F1031313620572037746820537472656574
      084E657720596F726B024E5905313030313106552E532E412E0C3830302D3535
      352D353636320C3231322D3535352D37343734000000400004000000000049B2
      401E446976696E6720496E7465726E6174696F6E616C20556E6C696D69746564
      10313134382044617669642044726976650953616E20446965676F0244410539
      3231303206552E532E412E0C3830302D3535352D383433390100004000000000
      0000004AB240144E6175746963616C20436F6D70726573736F7273103635204E
      572031363720537472656574054D69616D6902464C05333330313506552E532E
      412E0C3330352D3535352D353535340C3330352D3535352D3032363801000040
      0000000000000009B54016476C656E205370656369616C746965732C20496E63
      2E1331373636332043616D7062656C6C204C616E651048756E74696E67746F6E
      20426561636802434105393236343706552E532E412E0C3731342D3535352D35
      3130300C3731342D3535352D36353339010000400000000000000009B6400944
      6976652054696D650E3230204D6972616D6172204176650A4C6F6E6720426561
      636802434105393038313506552E532E412E0C3231332D3535352D333730380C
      3231332D3535352D3133393001000040000400000000000FB94016556E646572
      7365612053797374656D732C20496E632E13313831313220476F7468616D2053
      74726565741048756E74696E67746F6E20426561636802434105393236343806
      552E532E412E0C3830302D3535352D33343833010000400000000000000033B9
      400C46656C697820446976696E67123331302053204D6963686967616E204176
      65074368696361676F02494C05363036303706552E532E412E0C3830302D3535
      352D333534390C3331322D3535352D31353836000000400004000000000034B9
      401A43656E7472616C2056616C6C657920536B696E2044697665727310313630
      204A616D6573746F6E20417665074A616D61696361024E590531313433320655
      2E532E412E0C3731382D3535352D35373732000000400004000000000051B940
      115061726B77617920446976652053686F7010323431204B656C6C7920537472
      6565740B536F75746820416D626F79024E4A05303838373906552E532E412E0C
      3930382D3535352D35333030010000400000000000000052B940144D6172696E
      652043616D657261202620446976651331313720536F7574682056616C6C6579
      2052640953616E20446965676F02434105393231323106552E532E412E0C3631
      392D3535352D303630340C3631392D3535352D36343939010000400000000000
      0000BCB9400B446976652043616E6164610F3237352057204E696E7468204176
      650956616E636F75766572104272697469736820436F6C756D6269610756364B
      203150390643616E6164610C3630342D3535352D323638310C3630342D353535
      2D333734390100004000040000000000D6BC400B44697665202620537572660E
      502E4F2E20426F782032303231300C496E6469616E61706F6C697302494E0534
      3632303806552E532E412E0C3331372D3535352D343532330000004000000000
      00000005BE401246697368205265736561726368204C6162731632392057696C
      6B696E7320526420446570742E205344094C6F732042616E6F73024341053933
      36333506552E532E412E0C3230392D3535352D333239320C3230332D3535352D
      303431360100}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 400
    Top = 72
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 272
    Top = 72
  end
end
