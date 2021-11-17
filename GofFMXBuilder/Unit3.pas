unit Unit3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FormAbstractBuilder;

type
  TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Create3ComponentFormusingBuilder(aBuilder: iFormBuilder);
  end;

var
  Form3: TForm3;

implementation

uses
  FormBlueBuilder, FormRedBuilder;

{$R *.fmx}

{ TForm3 }

procedure TForm3.Button1Click(Sender: TObject);
begin
  Create3ComponentFormusingBuilder(TFormRedBuilder.New);
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  Create3ComponentFormusingBuilder(TFormBlueBuilder.New);
end;

procedure TForm3.Create3ComponentFormusingBuilder(aBuilder: iFormBuilder);
begin
  abuilder
    .CreateForm(Application)
    .CreateEdit
    .CreateLabel
    .CreateButton
    .Form.ShowModal;
end;

end.
