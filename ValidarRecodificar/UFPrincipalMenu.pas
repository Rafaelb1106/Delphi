unit UFPrincipalMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, UFVRecodificar, UFVDisparador,DH_Form_Effects ;

type
  TFMenu = class(TForm)
    PCabezera: TPanel;
    PMenu: TPanel;
    PContenedor: TPanel;
    Image1: TImage;
    Panel1: TPanel;
    Label1: TLabel;
    Button1: TButton;
    Panel2: TPanel;
    PContenedorInterno: TPanel;
    Button2: TButton;
    ScrollBox1: TScrollBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenu: TFMenu;
  effects_manager: T_DH_Form_Effects;

implementation

{$R *.dfm}
procedure liberar();
begin
   if assigned(FVDisparador) then
      FVDisparador.Close;
   if assigned(FVRecodificar) then
      FVRecodificar.Close;
end;
procedure TFMenu.Button1Click(Sender: TObject);
begin
  //effects_manager.Effect_Marquee_Label_LeftRight(LMarquesina, 'left', 1);
  liberar();
  if not assigned(FVRecodificar) then //Para verificar que no ha sido asginado/abierto el form y no lo abra mas de una vez.
  begin
    FVRecodificar:= TFVRecodificar.Create(application);
    FVRecodificar.Parent:= ScrollBox1; //Asignamos parent al panel para que se abra dentro de él.
    FVRecodificar.Show;
  end;
end;

procedure TFMenu.Button2Click(Sender: TObject);
begin
  liberar();
  if not assigned(FVDisparador) then //Para verificar que no ha sido asginado/abierto el form y no lo abra mas de una vez.
  begin
    FVDisparador:= TFVDisparador.Create(application);
    FVDisparador.Parent:= ScrollBox1; //Asignamos parent al panel para que se abra dentro de él.
    FVDisparador.Show;
  end;
end;



procedure TFMenu.FormCreate(Sender: TObject);
begin
  WindowState := wsMaximized; // maximiso la ventana
  ReportMemoryLeaksOnShutdown:= true;
  ScrollBox1.HorzScrollBar.Visible := false;
  ScrollBox1.VertScrollBar.Visible := false;
  effects_manager := T_DH_Form_Effects.Create();
end;
procedure TFMenu.FormDestroy(Sender: TObject);
begin
   freeandnil(effects_manager);
end;

procedure TFMenu.FormResize(Sender: TObject);
begin
  if self.WindowState = wsMaximized then
  begin
    ScrollBox1.HorzScrollBar.Visible := false;
    ScrollBox1.VertScrollBar.Visible := false;
  end
  else
  begin
    ScrollBox1.HorzScrollBar.Visible := true;
    ScrollBox1.VertScrollBar.Visible := true;
  end;
end;

end.
