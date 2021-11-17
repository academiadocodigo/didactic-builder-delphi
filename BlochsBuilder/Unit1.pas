{
Umas das melhores coisas no desenvolvimento de sistemas em Delphi � aproveitar
os diversos padr�es de projetos existentes, da melhor forma poss�vel, de modo que,
facilitem tanto o processo de desenvolvimento quanto os processo de atualiza��o e
manuten��o de aplicativos.

Um padr�o bastante util � o Builder.

Este tem como objetivo eliminar a complexidade na cria��o de objetos e tamb�m
deixar mais intuitivo este processo.
}

unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Generics.Collections,
  Vcl.StdCtrls, PessoaBuilder, Types, Pessoa, Endereco, Telefone,
  PessoaBuilderInterface;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{
Embora o processo apresentado seja o mais natural a se fazer, eu utilizei objetos,
mas normalmente muitos de voc�s utilizam clientdataset e por ai vai.
Podemos utilizar o padr�o Builder para reduzir o n�mero de linhas exigidas e a
complexidade deste c�digo.
}
procedure TForm1.Button1Click(Sender: TObject);
var
  lpessoa : TPessoa;
  lendereco : TEndereco;
  ltelefone : TObjectList<TTelefone>;
  I: Integer;
begin
  memo1.Clear;
  lpessoa := TPessoa.Create;
  lpessoa.Nome := 'Alicia';
  lpessoa.SobreNome := 'Medeiros';
  lpessoa.Dia := 26;
  lpessoa.Mes := 1;
  lpessoa.Ano := 2022;

  lendereco := TEndereco.Create;
  lendereco.Logradouro := 'Rua dos teste';
  lendereco.Numero := '235';
  lendereco.Complemento := '';
  lendereco.Cidade := 'Toronto';
  lendereco.Bairro := 'Teste';
  lendereco.Pais := 'Canada';

  lpessoa.Endereco := lendereco;

  ltelefone := TObjectList<TTelefone>.Create;

  ltelefone.Add(TTelefone.Create);
  ltelefone.Items[0].DDD := 21;
  ltelefone.Items[0].Numero := 22223333;
  ltelefone.Items[0].Tipo := RESIDENCIAL;

  ltelefone.Add(TTelefone.Create);
  ltelefone.Items[1].DDD := 22;
  ltelefone.Items[1].Numero := 3216548;
  ltelefone.Items[1].Tipo := COMERCIAL;

  lpessoa.Telefone := ltelefone;
  Memo1.Lines.Add(lpessoa.toString);

  lpessoa.DisposeOf;
  ltelefone.DisposeOf;
  lendereco.DisposeOf;
end;

{
A maneira demonstrada do padr�o Builder, demonstra ser interessante e inteligente
para simplificar cria��o de objetos que podem ser complexos.
Pode tamb�m tonar os m�todos mais intuitivos para inser��o de valores, do que
fica chamando cada set do objeto para ter que ficar inserindo informa��es.
Como o exemplo da lista de telefones, onde quando instanciamos normalmente, temos
que criar diversas chamadas da lista para depois passa para a classe pessoa.
Com o Builder fica melhor pelo fato de criarmos somente um m�todo e o mesmo fazer
as inclu��es da lista sem ter que ficar chamando todas as vezes.

A forma utilizada nesse exemplo n�o � GoF Builder e sim como Bloch's Builder
Autor desse padr�o � Joshua Bloch do Effective Java
}

procedure TForm1.Button2Click(Sender: TObject);
var
  lPessoa : TPessoaBuilder;
begin
  lPessoa := TPessoaBuilder.builder;
  Memo1.Clear;
  Memo1.Lines.Add(
    lPessoa
      .Nome('Alessandro')
      .SobreNome('Medeiros')
      .DataNascimento('17/12/1982')
      .Logradouro('Rua dos Teste')
      .Numero('123')
      .Bairro('Teste')
      .Cidade('Testes')
      .Pais('Brasil')
      .Telefone(21,234567,RESIDENCIAL)
      .Telefone(22,12345678,COMERCIAL)
      .Telefone(22,98765432,CELULAR)
    .getPessoa
    .toString);
  lPessoa.DisposeOf;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  lPessoa : iPessoaBuiler;
begin
  lPessoa := TPessoaBuilerInterface.New;

  Memo1.Clear;
  Memo1
    .Lines
    .Add(
      lPessoa
        .Nome('Jo�o')
        .SobreNome('Medeiros')
        .DataNascimento('20/01/2000')
        .Logradouro('Rua dos Teste')
        .Numero('123')
        .Bairro('Teste')
        .Cidade('Testes')
        .Pais('Brasil')
        .Telefone(21,234567,RESIDENCIAL)
        .Telefone(22,12345678,COMERCIAL)
        .Telefone(22,98765432,CELULAR)
      .getPessoa
      .toString);
end;

end.
