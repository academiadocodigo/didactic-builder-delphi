unit FormAbstractBuilder;

interface

uses
  System.Classes, Vcl.Forms;


{
TAbstractFormBuilder = class
private
  FForm: TForm;
  procedure BuilderFormClose(Sender: TObject; var Action: TCloseAction);
protected
  function GetForm: TForm; virtual;
public
  procedure CreateForm(AOwner: TComponent); virtual;
  procedure CreateSpeedButton; virtual; abstract;
  procedure CreateEdit; virtual; abstract;
  procedure CreateLabel; virtual; abstract;
  property Form: TForm read GetForm;
end;
}

type
  iFormBuilder = interface
    function CreateForm(AOwner: TComponent) : iFormBuilder;
    function CreateSpeedButton : iFormBuilder;
    function CreateEdit : iFormBuilder;
    function CreateLabel : iFormBuilder;
    function Form : TForm;
  end;

implementation

end.
