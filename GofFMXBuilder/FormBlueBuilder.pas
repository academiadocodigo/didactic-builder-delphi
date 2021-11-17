unit FormBlueBuilder;

interface

uses
  FormAbstractBuilder,
  FMX.Forms,
  FMX.Edit,
  FMX.Graphics,
  System.Classes,
  System.UITypes,
  FMX.StdCtrls;

type
  TFormBlueBuilder = class(TInterfacedObject, iFormBuilder)
    private
      FParent : TForm;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iFormBuilder;
      function CreateForm(AOwner: TComponent) : iFormBuilder;
      function CreateButton : iFormBuilder;
      function CreateEdit : iFormBuilder;
      function CreateLabel : iFormBuilder;
      function Form : TForm;
  end;

implementation

uses
  System.SysUtils;

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
  lEdt.Position.X := 10;
  lEdt.Position.Y := 30;
  lEdt.Width := 165;
end;

function TFormBlueBuilder.CreateForm(AOwner: TComponent): iFormBuilder;
begin
  Result := Self;
  FParent := TForm.CreateNew(AOwner);
  FParent.BorderStyle := TFmxFormBorderStyle.Sizeable;
  FParent.Caption  := 'Atenção';
  FParent.Fill.Kind := TBrushKind.Solid;
  FParent.Fill.Color := TAlphaColor($FF1976D2);
  FParent.Position := TFormPosition.ScreenCenter;
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
  lLabel.Text := 'Digite seu nome:';
  lLabel.Position.X := 10;
  lLabel.Position.Y := 10;
end;

function TFormBlueBuilder.CreateButton: iFormBuilder;
var
  lbtn : TButton;
begin
  Result := Self;
  lbtn := TButton.Create(FParent);
  lbtn.Parent := FParent;
  lbtn.Position.X := 90;
  lbtn.Position.Y := 77;
  lbtn.Text := 'Clique aqui';
  lbtn.Height := 25;
  lbtn.Width := 80;
end;

destructor TFormBlueBuilder.Destroy;
begin
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
