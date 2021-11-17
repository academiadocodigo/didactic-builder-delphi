unit FormBlueBuilder;

interface

uses
  FormAbstractBuilder, System.Classes, Vcl.Forms;

{

TBlueFormBuilder = class(TAbstractFormBuilder)
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
  TFormBlueBuilder = class(TInterfacedObject, iFormBuilder)
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
      function Form : TForm;
  end;

implementation

uses
  Vcl.Graphics, Vcl.Buttons, Vcl.StdCtrls;

constructor TFormBlueBuilder.Create;
begin

end;

function TFormBlueBuilder.CreateEdit: iFormBuilder;
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

function TFormBlueBuilder.CreateForm(AOwner: TComponent): iFormBuilder;
begin
  Result := Self;
  FParent := TForm.Create(AOwner);
  FParent.BorderStyle := bsDialog;
  FParent.Caption  := 'Atenção';
  FParent.Color := clBlue;
  FParent.Position := poScreenCenter;
  FParent.Width    := 200;
  FParent.Height   := 150;
end;

function TFormBlueBuilder.CreateLabel: iFormBuilder;
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

function TFormBlueBuilder.CreateSpeedButton: iFormBuilder;
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

destructor TFormBlueBuilder.Destroy;
begin
  if Assigned(FParent) then
    FParent.Free;
  inherited;
end;

function TFormBlueBuilder.Form: TForm;
begin
  Result := FParent;
end;

class function TFormBlueBuilder.New : iFormBuilder;
begin
  Result := Self.Create;
end;

end.
