unit Unit6;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.OleCtrls,
  SHDocVw,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Datasnap.DBClient,
  GorBuilderGeneratorReport.Report;

type
  TForm6 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    Panel2: TPanel;
    WebBrowser1: TWebBrowser;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FGenereted: iGeneretedReport;
  public
    ClientDataSet: TClientDataSet;
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

procedure TForm6.Button1Click(Sender: TObject);
begin
  FGenereted
    .ClientDataSet(ClientDataSet)
    .Genereted(WebBrowser1);
end;

procedure TForm6.FormCreate(Sender: TObject);
begin
  FGenereted := TGeneretedReport.New;
end;

end.
