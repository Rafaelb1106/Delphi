program HerramientasBDInsoft;

uses
  Vcl.Forms,
  UFVRecodificar in 'UFVRecodificar.pas' {FVRecodificar},
  UFPrincipalMenu in 'UFPrincipalMenu.pas' {FMenu},
  Vcl.Themes,
  Vcl.Styles,
  UFVDisparador in 'UFVDisparador.pas' {FVDisparador},
  DH_Form_Effects in 'DH_Form_Effects.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Onyx Blue');
  Application.CreateForm(TFMenu, FMenu);
  //Application.CreateForm(TFVDisparador, FVDisparador);
  //Application.CreateForm(TFVRecodificar, FVRecodificar);
  Application.Run;
end.
