{
  Criando a classe PessoaBuilderInterface
    Na classe PessoaBuilder foi utilizado os padrões trabalhando diretamente com classes,
    e nessa nossa classe eu me preocupei em utilizar interfaces, por este motivo deixei sua
    nomenclatura como PessoaBuilerInterface.

    Dando maior abstração dos métodos utilizados dentro da nossa classe.

    Usando o padrão builder podemos facilitar a criação de um objeto pessoa, deixando que as instancias
    das classes envolvidas, assim como, lista de telefones sejam criadas em um pondo central.

    Assim podemos ter relacionamentos tranquilamente, e com o builder, podemos ter um método service
    que persiste os dados no banco, utilizando um orm, ou até mesmo uma classe mais abstrata de DAO,
    onde você simplesmente passa o objeto, e ele por si só já faz as persistencias.

    Com o padrão builder, e seguindo essas implementações descritas em nosso exemplo, você tem um código
    mais limpo, de facil entendimento.
}
unit PessoaBuilderInterface;

interface

uses
  Types,
  Pessoa,
  Endereco,
  Telefone,
  System.SysUtils,
  System.Generics.Collections;

type
  iPessoaBuiler = interface
    function Nome(Value: String): iPessoaBuiler;
    function SobreNome(Value: String): iPessoaBuiler;
    function DataNascimento(Value: String): iPessoaBuiler;
    function Logradouro(Value: String = ''): iPessoaBuiler;
    function Numero(Value: String = ''): iPessoaBuiler;
    function Complemento(Value: String = ''): iPessoaBuiler;
    function Bairro(Value: String = ''): iPessoaBuiler;
    function Cidade(Value: String = ''): iPessoaBuiler;
    function Pais(Value: String = ''): iPessoaBuiler;
    function Telefone(vDDD, vTel: Integer; Tipo: TTipoTelefone): iPessoaBuiler;
    function getPessoa: TPessoa;
  end;

  TPessoaBuilerInterface = class(TInterfacedObject, iPessoaBuiler)
  private
    FPessoa: TPessoa;
    FEndereco: TEndereco;
    FTelefone: TObjectList<TTelefone>;

    procedure addTel(vDDD, vNumero: Integer; vTipo: TTipoTelefone);
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iPessoaBuiler;
    function Nome(Value: String): iPessoaBuiler;
    function SobreNome(Value: String): iPessoaBuiler;
    function DataNascimento(Value: String): iPessoaBuiler;
    function Logradouro(Value: String = ''): iPessoaBuiler;
    function Numero(Value: String = ''): iPessoaBuiler;
    function Complemento(Value: String = ''): iPessoaBuiler;
    function Bairro(Value: String = ''): iPessoaBuiler;
    function Cidade(Value: String = ''): iPessoaBuiler;
    function Pais(Value: String = ''): iPessoaBuiler;
    function Telefone(vDDD, vTel: Integer; Tipo: TTipoTelefone): iPessoaBuiler;
    function getPessoa: TPessoa;
  end;

implementation

procedure TPessoaBuilerInterface.addTel(vDDD, vNumero: Integer; vTipo: TTipoTelefone);
var
  I : Integer;
begin
  FTelefone.Add(TTelefone.Create);
  I := FTelefone.Count -1;
  FTelefone.Items[I].DDD := vDDD;
  FTelefone.Items[I].Numero := vNumero;
  FTelefone.Items[I].Tipo := vTipo;
end;

function TPessoaBuilerInterface.Bairro(Value: String): iPessoaBuiler;
begin
  FEndereco.Bairro := Value;
  Result := Self;
end;

function TPessoaBuilerInterface.Cidade(Value: String): iPessoaBuiler;
begin
  FEndereco.Cidade := Value;
  Result := Self;
end;

function TPessoaBuilerInterface.Complemento(Value: String): iPessoaBuiler;
begin
  FEndereco.Complemento := Value;
  Result := Self;
end;

constructor TPessoaBuilerInterface.Create;
begin
  FPessoa := TPessoa.Create;
  FEndereco := TEndereco.Create;
  FTelefone := TObjectList<TTelefone>.Create;
end;

function TPessoaBuilerInterface.DataNascimento(Value: String): iPessoaBuiler;
begin
  FPessoa.Dia := Copy(Value,1,2).ToInteger;
  FPessoa.Mes := Copy(Value,4,2).ToInteger;
  FPessoa.Ano := Copy(Value,7,4).ToInteger;
  Result := Self;
end;

destructor TPessoaBuilerInterface.Destroy;
begin
  FPessoa.DisposeOf;
  FEndereco.DisposeOf;
  FTelefone.DisposeOf;
  inherited;
end;

function TPessoaBuilerInterface.getPessoa: TPessoa;
begin
  FPessoa.Endereco := FEndereco;
  FPessoa.Telefone := FTelefone;
  Result := Self.FPessoa;
end;

function TPessoaBuilerInterface.Logradouro(Value: String): iPessoaBuiler;
begin
  FEndereco.Logradouro := Value;
  Result := Self;
end;

class function TPessoaBuilerInterface.New: iPessoaBuiler;
begin
  Result := Self.Create;
end;

function TPessoaBuilerInterface.Nome(Value: String): iPessoaBuiler;
begin
  FPessoa.Nome := Value;
  Result := Self;
end;

function TPessoaBuilerInterface.Numero(Value: String): iPessoaBuiler;
begin
  FEndereco.Numero := Value;
  Result := Self;
end;

function TPessoaBuilerInterface.Pais(Value: String): iPessoaBuiler;
begin
  FEndereco.Pais := Value;
  Result := Self;
end;

function TPessoaBuilerInterface.SobreNome(Value: String): iPessoaBuiler;
begin
  FPessoa.SobreNome := Value;
  Result := Self;
end;

function TPessoaBuilerInterface.Telefone(vDDD, vTel: Integer; Tipo: TTipoTelefone)
  : iPessoaBuiler;
begin
  addTel(vDDD,vTel,Tipo);
  Result := Self;
end;

end.
