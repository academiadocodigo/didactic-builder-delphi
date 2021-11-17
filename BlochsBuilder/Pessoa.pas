unit Pessoa;

interface

uses
  Types,
  Endereco,
  Telefone,
  System.SysUtils,
  System.Generics.Collections;

type
  TPessoa = class
  private
    FSobreNome: String;
    FMes: Integer;
    FAno: Integer;
    FDia: Integer;
    FNome: string;
    FEndereco: TEndereco;
    FTelefone: TObjectList<TTelefone>;
    procedure SetEndereco(const Value: TEndereco);
    procedure SetTelefone(const Value: TObjectList<TTelefone>);
  public
    property Nome : string read FNome write FNome;
    property SobreNome : String read FSobreNome write FSobreNome;
    property Dia : Integer read FDia write FDia;
    property Mes : Integer read FMes write FMes;
    property Ano : Integer read FAno write FAno;
    property Endereco : TEndereco read FEndereco write SetEndereco;
    property Telefone : TObjectList<TTelefone> read FTelefone write SetTelefone;
  end;

  TPessoaHelper = class helper for TPessoa
    function toString : String; overload;
  end;

implementation

{ TPessoaHelper }

function TPessoaHelper.toString: String;
var
  I : Integer;
begin
  Result := 'Pessoa(' +
            'nome: ' + Self.Nome +
            ', sobrenome: ' + Self.SobreNome +
            ', dia: ' + Self.Dia.ToString +
            ', mes: ' + Self.Mes.ToString +
            ', ano: ' + Self.Ano.ToString +
            ', endereco: ' + Self.Endereco.Logradouro +
            ' '+Self.Endereco.Numero+' '+Self.Endereco.Complemento +
            ', Bairro: '+ Self.Endereco.Bairro+
            ', Cidade: '+ Self.Endereco.Cidade+
            ', Pais: ' + Self.Endereco.Pais;
  for I := 0 to Self.Telefone.Count -1 do
    Result := Result +', Telefone: ' +
              '('+Self.Telefone.Items[I].DDD.ToString+')'+
              Self.Telefone.Items[I].Numero.ToString+
              ', Tipo: ' + Self.Telefone.Items[I].Tipo.toString+')';
end;

{ TPessoa }

procedure TPessoa.SetEndereco(const Value: TEndereco);
begin
  FEndereco := Value;
end;

procedure TPessoa.SetTelefone(const Value: TObjectList<TTelefone>);
begin
  FTelefone := Value;
end;

end.
