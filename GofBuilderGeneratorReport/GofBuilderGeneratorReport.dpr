program GofBuilderGeneratorReport;

uses
  Vcl.Forms,
  Unit7 in 'Unit7.pas' {Form7},
  GofBuilderGeneratorReport.Interfaces in 'GofBuilderGeneratorReport.Interfaces.pas',
  GofBuilderGeneratorReport.FileGenerator in 'GofBuilderGeneratorReport.FileGenerator.pas',
  GorBuilderGeneratorReport.Report in 'GorBuilderGeneratorReport.Report.pas',
  GorBuilderGeneratorReport.Director in 'GorBuilderGeneratorReport.Director.pas',
  GorBuilderGeneratorReport.ConcretBuilder in 'GorBuilderGeneratorReport.ConcretBuilder.pas',
  Unit6 in 'Unit6.pas' {Form6};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
