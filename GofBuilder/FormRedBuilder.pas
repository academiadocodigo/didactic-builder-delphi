unit FormRedBuilder;

interface

uses
  FormAbstractBuilder, System.Classes, Vcl.Forms;

{
TRedFormBuilder = class(TAbstractFormBuilder)
private
  FNextLeft, FNextTop: Integer;
public
  procedure CreateForm(AOwner: TComponent); override;
  procedure CreateSpeedButton; override;
  procedure CreateEdit; override;
  procedure CreateLabel; override;
end;
}

type
  TFormRedBuilder = class(TInterfacedObject, iFormBuilder)
    private
      FParent : TForm;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iFormBuilder;
      function CreateForm(AOwner: TComponent) : iFormBuilder;
      function CreateSpeedButton : iFormBuilder;
      function CreateEdit : iFormBuilder;
      function CreateLabel : iFormBuilder;
      function Form : TForm; overload;
  end;

implementation

uses
  Vcl.Graphics, Vcl.StdCtrls, Vcl.Buttons;

constructor TFormRedBuilder.Create;
begin

end;

function TFormRedBuilder.CreateEdit: iFormBuilder;
var
  lEdt : TEdit;
begin
  Result := Self;
  lEdt := TEdit.Create(FParent);
  lEdt.Parent := FParent;
  lEdt.Left := 10;
  lEdt.Top := 30;
  lEdt.Width := FParent.ClientWidth -20;//Ajusta o comprimento do Edit de acordo com a largura do form
end;

function TFormRedBuilder.CreateForm(AOwner: TComponent): iFormBuilder;
begin
  Result := Self;
  FParent := TForm.Create(AOwner);
  FParent.BorderStyle := bsDialog;
  FParent.Caption  := 'Atenção';
  FParent.Color := clRed;
  FParent.Position := poScreenCenter;
  FParent.Width    := 200;
  FParent.Height   := 150;
end;

function TFormRedBuilder.CreateLabel: iFormBuilder;
var
  lLabel : TLabel;
begin
  Result := Self;
  lLabel := TLabel.Create(FParent);
  lLabel.Parent  := FParent;
  lLabel.Caption := 'Digite seu nome:';
  lLabel.Left    := 10;
  lLabel.Top     := 10;
end;

function TFormRedBuilder.CreateSpeedButton: iFormBuilder;
var
  lbtn : TSpeedButton;
begin
  Result := Self;
  lbtn := TSpeedButton.Create(FParent);
  lbtn.Parent := FParent;
  lbtn.Left := FParent.ClientWidth - (lbtn.Width) - 70; //posiciona de acordo com a largura do form
  lbtn.Top := 80;
  lbtn.Caption := 'Clique aqui';
  lbtn.Height := 25;
  lbtn.Width := 80;
end;

destructor TFormRedBuilder.Destroy;
begin
  if Assigned(FParent) then
    FParent.Free;
  inherited;
end;

function TFormRedBuilder.Form: TForm;
begin
  Result := FParent;
end;

class function TFormRedBuilder.New : iFormBuilder;
begin
  Result := Self.Create;
end;

end.
