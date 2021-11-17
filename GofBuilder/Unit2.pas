unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  FormAbstractBuilder;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Create3ComponentFormusingBuilder(aBuilder: iFormBuilder);
  end;

var
  Form2: TForm2;

implementation

uses
  FormBlueBuilder, FormRedBuilder;

{$R *.dfm}

{ TForm2 }


procedure TForm2.Button1Click(Sender: TObject);
begin
  Create3ComponentFormusingBuilder(TFormBlueBuilder.New);
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  Create3ComponentFormusingBuilder(TFormRedBuilder.New);
end;

procedure TForm2.Create3ComponentFormusingBuilder(
  aBuilder: iFormBuilder);
begin
  abuilder
    .CreateForm(Application)
    .CreateEdit
    .CreateLabel
    .CreateSpeedButton
    .Form.ShowModal;
end;

end.
