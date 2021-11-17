program GofBuilderarquivos;

uses
  Vcl.Forms,
  Unit5 in 'Unit5.pas' {Form5},
  FileGeneretor in 'FileGeneretor.pas',
  Builder in 'Builder.pas',
  ConcreteBuilder in 'ConcreteBuilder.pas',
  Diretor in 'Diretor.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
