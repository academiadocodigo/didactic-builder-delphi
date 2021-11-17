program GofBuilderFMXInterfaces;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit3 in 'Unit3.pas' {Form3},
  FormAbstractBuilder in 'FormAbstractBuilder.pas',
  FormBlueBuilder in 'FormBlueBuilder.pas',
  FormRedBuilder in 'FormRedBuilder.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
