unit GorBuilderGeneratorReport.ConcretBuilder;

interface

uses
  System.SysUtils,
  GofBuilderGeneratorReport.Interfaces,
  GofBuilderGeneratorReport.FileGenerator, Datasnap.DBClient;

type
  TConcretBuilder = class(TInterfacedObject, iBuilder)
    private
      FDataSet : TClientDataSet;
      FRecordCount : Integer;
      FFileGenerator : iFileGenerator;

      procedure FillBody;
    public
      constructor Create(aData : olevariant);
      destructor Destroy; override;
      class function New(aData : olevariant) : iBuilder;
      function BuildHeader : iBuilder;
      function BuildBody : iBuilder;
      function BuildFooter : iBuilder;
      function GetReport : iFileGenerator;
  end;

implementation

function TConcretBuilder.BuildBody: iBuilder;
var
  I: Integer;
begin
  Result := Self;

  FFileGenerator
    .Add('<table class="table table-striped table-hover">')
    .Add('<thead class="thead-dark"><tr>')
    .Add('<th scope="col">#</th>')
    .Add('<th scope="col">Fornecedor</th>')
    .Add('<th scope="col">Cidade</th>')
    .Add('</tr></thead><tbody>');

  FillBody;
end;

function TConcretBuilder.BuildFooter: iBuilder;
begin
  Result := Self;
  FFileGenerator
    .Add('<div id="footer">')
    .Add('<div class="container">')
    .Add('<p class="text-center">Total de Registros: ' + IntToStr(FRecordCount)+ '</p>')
    .Add('</div></body></html>');
end;

function TConcretBuilder.BuildHeader: iBuilder;
begin
  Result := Self;
  FFileGenerator
    .Add('<!doctype html>')
    .Add('<html lang="en">')
    .Add('<head>')
    .Add('<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">')
    .Add('<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">')
    .Add('<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">')
    .Add('</head>')
    .Add('<div class="container">')
    .Add('<blockquote class="blockquote text-center">')
    .Add('<h4>Relatório de Fornecedores</h4>')
    .Add('<h4>' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + '</h4>')
    .Add('</blockquote>');
end;

constructor TConcretBuilder.Create(aData : olevariant);
begin
  FDataSet := TClientDataSet.Create(nil);
  FDataSet.Data := aData;
  FRecordCount := 0;
  FFileGenerator := TFileGenerator.New;
end;

destructor TConcretBuilder.Destroy;
begin
  FDataSet.DisposeOf;
  inherited;
end;

procedure TConcretBuilder.FillBody;
begin
  FDataSet.First;
  while not FDataSet.Eof do
  begin
    FFileGenerator
      .Add('<tr>')
      .Add('<td scope="row">' + FDataSet.FieldByName('VendorNo').AsString + '</td>')
      .Add('<td>' + FDataSet.FieldByName('VendorName').AsString + '</td>')
      .Add('<td>' + FDataSet.FieldByName('City').AsString + '</td>')
      .Add('</tr>');
    FDataSet.Next;
  end;
  FRecordCount := FDataSet.RecordCount;
  FFileGenerator.Add('</tbody></table></div></div>');
end;

function TConcretBuilder.GetReport: iFileGenerator;
begin
  Result := FFileGenerator;
end;

class function TConcretBuilder.New(aData : olevariant) : iBuilder;
begin
  Result := Self.Create(aData);
end;

end.
