unit Endereco;

interface

type
  TEndereco = class
    private
      FLogradouro: String;
      FBairro: String;
      FNumero: String;
      FComplemento: String;
      FCidade: String;
      FPais: String;
    public
      property Logradouro : String read FLogradouro write FLogradouro;
      property Numero : String read FNumero write FNumero;
      property Complemento : String read FComplemento write FComplemento;
      property Bairro : String read FBairro write FBairro;
      property Cidade : String read FCidade write FCidade;
      property Pais : String read FPais write FPais;
  end;

implementation

end.
