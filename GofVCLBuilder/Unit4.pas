unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
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

  TRedFormBuilder = class(TAbstractFormBuilder)
  private
    FNextLeft, FNextTop: Integer;
  public
    procedure CreateForm(AOwner: TComponent); override;
    procedure CreateSpeedButton; override;
    procedure CreateEdit; override;
    procedure CreateLabel; override;
  end;

  TBlueFormBuilder = class(TAbstractFormBuilder)
  private
    FNextLeft, FNextTop: Integer;
  public
    procedure CreateForm(AOwner: TComponent); override;
    procedure CreateSpeedButton; override;
    procedure CreateEdit; override;
    procedure CreateLabel; override;
  end;

  TForm4 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Create3ComponentFormUsingBuilder(ABuilder: TAbstractFormBuilder);
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

{ TAbstractFormBuilder }

procedure TAbstractFormBuilder.BuilderFormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FForm.Free;
end;

procedure TAbstractFormBuilder.CreateForm(AOwner: TComponent);
begin
  FForm := TForm.Create(AOwner);
end;

function TAbstractFormBuilder.GetForm: TForm;
begin
  Result := FForm;
end;

{ TForm4 }

procedure TForm4.Button1Click(Sender: TObject);
begin
  Create3ComponentFormUsingBuilder(TRedFormBuilder.Create);
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
 Create3ComponentFormUsingBuilder(TBlueFormBuilder.Create);
end;

procedure TForm4.Create3ComponentFormUsingBuilder(
  ABuilder: TAbstractFormBuilder);
var
  NewForm: TForm;
begin
  with ABuilder do begin
    CreateForm(Application);
    CreateEdit;
    CreateSpeedButton;
    CreateLabel;
    NewForm := Form;
    if NewForm <> nil then NewForm.Show;
  end;
end;

{ TRedFormBuilder }

procedure TRedFormBuilder.CreateEdit;
var
  lEdt : TEdit;
begin
  lEdt := TEdit.Create(Form);
  lEdt.Parent := Form;
  lEdt.Left := FNextLeft - 198;
  lEdt.Top := FNextTop - 120;
  lEdt.Width := FNextLeft - 20;
end;

procedure TRedFormBuilder.CreateForm(AOwner: TComponent);
begin
  inherited;
  FNextLeft := 200;
  FNextTop  := 150;

  Form.Caption := 'Cadastro Tela Vermelha';
  Form.Width := FNextLeft;
  Form.Height := FNextTop;
  Form.Color := clRed;
end;

procedure TRedFormBuilder.CreateLabel;
var
  lLabel : TLabel;
begin
  lLabel := TLabel.Create(Form);
  lLabel.Parent  := Form;
  lLabel.Caption := 'Digite seu nome:';
  lLabel.Left    := FNextLeft - 190;
  lLabel.Top     := FNextTop - 140;
end;

procedure TRedFormBuilder.CreateSpeedButton;
var
  lbtn : TSpeedButton;
begin
  lbtn := TSpeedButton.Create(Form);
  lbtn.Parent := Form;
  lbtn.Left := FNextLeft - (lbtn.Width) - 80;
  lbtn.Top := FNextTop - 70;
  lbtn.Caption := 'Clique aqui';
  lbtn.Height := 25;
  lbtn.Width := 80;
end;

{ TBlueFormBuilder }

procedure TBlueFormBuilder.CreateEdit;
var
  lEdt : TEdit;
begin
  lEdt := TEdit.Create(Form);
  lEdt.Parent := Form;
  lEdt.Left := FNextLeft - 198;
  lEdt.Top := FNextTop - 120;
  lEdt.Width := FNextLeft - 20;
end;

procedure TBlueFormBuilder.CreateForm(AOwner: TComponent);
begin
  inherited;
  FNextLeft := 300;
  FNextTop  := 250;

  Form.Caption := 'Cadastro Tela Azul';
  Form.Width := FNextLeft;
  Form.Height := FNextTop;
  Form.Color := clBlue;
end;

procedure TBlueFormBuilder.CreateLabel;
var
  lLabel : TLabel;
begin
  lLabel := TLabel.Create(Form);
  lLabel.Parent  := Form;
  lLabel.Caption := 'Digite seu nome:';
  lLabel.Left    := FNextLeft - 190;
  lLabel.Top     := FNextTop - 140;
end;

procedure TBlueFormBuilder.CreateSpeedButton;
var
  lbtn : TSpeedButton;
begin
  lbtn := TSpeedButton.Create(Form);
  lbtn.Parent := Form;
  lbtn.Left := FNextLeft - (lbtn.Width) - 80;
  lbtn.Top := FNextTop - 70;
  lbtn.Caption := 'Clique aqui';
  lbtn.Height := 25;
  lbtn.Width := 80;
end;

end.
