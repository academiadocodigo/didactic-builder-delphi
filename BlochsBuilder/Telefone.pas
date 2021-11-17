unit Telefone;

interface

uses
  Types;

type
  TTelefone = class
    private
      FDDD: Integer;
      FNumero: Integer;
      FTipo: TTipoTelefone;
    public
      property DDD : Integer read FDDD write FDDD;
      property Numero : Integer read FNumero write FNumero;
      property Tipo : TTipoTelefone read FTipo write FTipo;
  end;

implementation

end.
