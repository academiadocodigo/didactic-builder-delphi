unit GorBuilderGeneratorReport.Director;

interface

uses
  GofBuilderGeneratorReport.Interfaces;

type
  TDirector = class(TInterfacedObject, iDirector)
    private
      FBuilder : iBuilder;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iDirector;
      function Construct(aBuilder : iBuilder) : iDirector;
  end;

implementation

function TDirector.Construct(aBuilder: iBuilder): iDirector;
begin
  aBuilder
    .BuildHeader
    .BuildBody
    .BuildFooter;
end;

constructor TDirector.Create;
begin

end;

destructor TDirector.Destroy;
begin

  inherited;
end;

class function TDirector.New : iDirector;
begin
  Result := Self.Create;
end;

end.
