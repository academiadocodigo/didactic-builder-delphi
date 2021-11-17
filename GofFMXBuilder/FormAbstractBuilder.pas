unit FormAbstractBuilder;

interface

uses
  System.Classes,
  FMX.Forms;

type
  iFormBuilder = interface
    function CreateForm(AOwner: TComponent) : iFormBuilder;
    function CreateButton : iFormBuilder;
    function CreateEdit : iFormBuilder;
    function CreateLabel : iFormBuilder;
    function Form : TForm;
  end;

implementation

end.
