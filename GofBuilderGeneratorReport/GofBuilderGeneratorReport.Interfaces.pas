unit GofBuilderGeneratorReport.Interfaces;

interface

type
  iFileGenerator = interface;

  iBuilder = interface
    function BuildHeader : iBuilder;
    function BuildBody : iBuilder;
    function BuildFooter : iBuilder;
    function GetReport : iFileGenerator;
  end;

  iFileGenerator = interface
    function Add(aValue : String) : iFileGenerator;
    function FileName(Value : String) : iFileGenerator;
    function SaveToFile : iFileGenerator;
    function FilePath(var aPath : String) : iFileGenerator;
  end;

  iDirector = interface
    function Construct(aBuilder : iBuilder) : iDirector;
  end;

implementation

end.
