unit Types;

interface

uses
  System.TypInfo;

type
  TTipoTelefone = (COMERCIAL, CELULAR, RESIDENCIAL);

  TTipoTelefoneHelper = record helper for TTipoTelefone
    function toString : String;
  end;

implementation

{ TTipoTelefoneHelper }

function TTipoTelefoneHelper.toString: String;
begin
  Result := GetEnumName(Typeinfo(TTipoTelefone), Integer(Self));
end;

end.
