unit GorBuilderGeneratorReport.Report;

interface

uses
  SHDocVw,
  ActiveX,
  Datasnap.DBClient,
  System.SysUtils,
  GofBuilderGeneratorReport.Interfaces,
  GorBuilderGeneratorReport.Director,
  GorBuilderGeneratorReport.ConcretBuilder,
  System.Classes,
  Registry,
  Winapi.Windows;

type
  iGeneretedReport = interface
    function ClientDataSet(aClientDataSet: TClientDataSet): iGeneretedReport;
    procedure Genereted(aWebBrowser: TWebBrowser);
  end;

  TGeneretedReport = class(TInterfacedObject, iGeneretedReport)
  private
    FDataset: TClientDataSet;
    FNameReport: String;
    FPathReport: String;

    procedure GeneretedReport;
    procedure ChargeHtml(aWebBrowser: TWebBrowser; htmlCode: String);
    procedure DefineIEVersion;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iGeneretedReport;
    function ClientDataSet(aClientDataSet: TClientDataSet): iGeneretedReport;
    procedure Genereted(aWebBrowser: TWebBrowser);
  end;

implementation

procedure TGeneretedReport.ChargeHtml(aWebBrowser: TWebBrowser;
  htmlCode: String);
var
  sl: TStringList;
  ms: TMemoryStream;
begin
  aWebBrowser.Navigate('about:blank');
  if Assigned(aWebBrowser.Document) then
  begin
    sl := TStringList.Create;
    try
      ms := TMemoryStream.Create;
      try
        sl.LoadFromFile(htmlCode);
        sl.SaveToStream(ms);
        ms.Seek(0, 0);
        (aWebBrowser.Document as IPersistStreamInit)
          .Load(TStreamAdapter.Create(ms));
      finally
        ms.Free;
      end;
    finally
      sl.Free;
    end;
  end;
end;

function TGeneretedReport.ClientDataSet(aClientDataSet: TClientDataSet)
  : iGeneretedReport;
begin
  Result := Self;
  FDataset := aClientDataSet;

  GeneretedReport;
end;

constructor TGeneretedReport.Create;
begin

end;

procedure TGeneretedReport.DefineIEVersion;
const
  REG_KEY = 'Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION';

var
  Reg: TRegistry;
  AppName: String;
begin
  AppName := ExtractFileName(ExtractFileName(ParamStr(0)));
  Reg := nil;
  try
    Reg := TRegistry.Create();
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(REG_KEY, True) then
    begin
      Reg.WriteInteger(AppName, 11000);
      Reg.CloseKey;
    end;
  except

  end;

  if (Assigned(Reg)) then
    FreeAndNil(Reg);
end;

destructor TGeneretedReport.Destroy;
begin

  inherited;
end;

procedure TGeneretedReport.Genereted(aWebBrowser: TWebBrowser);
begin
  ChargeHtml(aWebBrowser, FPathReport);
end;

procedure TGeneretedReport.GeneretedReport;
var
  lDiretor: iDirector;
  lConcretBuilder: iBuilder;
  lFile: iFileGenerator;
begin
  lDiretor := TDirector.New;
  lConcretBuilder := TConcretBuilder.New(FDataset.Data);

  lDiretor.Construct(lConcretBuilder);
  lFile := lConcretBuilder.GetReport;

  lFile.FileName('fornecedor').FilePath(FPathReport).SaveToFile;
end;

class function TGeneretedReport.New: iGeneretedReport;
begin
  Result := Self.Create;
end;

end.
