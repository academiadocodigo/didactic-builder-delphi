unit Unit5;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.StdCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Datasnap.DBClient,
  Diretor,
  Builder,
  ConcreteBuilder;

type
  TForm5 = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses
  FileGeneretor;

{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
var
  Director: TDirector;
  ConcreteBuilder: IBuilder;
  Product: TProduct;
begin
  // Cria uma instância do Director
  Director := TDirector.Create;

  // Cria uma instância do Concrete Builder, informando os dados como parâmetro
  ConcreteBuilder := TConcreteBuilder.Create(ClientDataSet1.Data);
  try
    // Solicita a construção do objeto ao Director
    Director.Construct(ConcreteBuilder);

    // Recebe o produto pronto ("constrúido")
    Product := ConcreteBuilder.GetRelatorio;

    // Chama o método para salvar o arquivo em disco
    Product.SalvarArquivo;
  finally
    // Libera o Director da memória
    FreeAndNil(Director);
  end;
end;

end.
