program BlochsBuilder;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Types in 'Types.pas',
  Endereco in 'Endereco.pas',
  Telefone in 'Telefone.pas',
  Pessoa in 'Pessoa.pas',
  PessoaBuilder in 'PessoaBuilder.pas',
  PessoaBuilderInterface in 'PessoaBuilderInterface.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := true;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
