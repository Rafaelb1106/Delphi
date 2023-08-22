unit UFVDisparador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.WinXCtrls, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids;

type
  TFVDisparador = class(TForm)
    BAgregarAI: TButton;
    CTabla: TEdit;
    MemoPK: TMemo;
    BConectarBD: TButton;
    Panel1: TPanel;
    CNombreBD: TEdit;
    Button1: TButton;
    Label1: TLabel;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    FDQuery2: TFDQuery;
    TabPrincipal: TPageControl;
    Proc_Afterpostrecord: TTabSheet;
    TabSheet2: TTabSheet;
    GTablas: TDBGrid;
    Label2: TLabel;
    Label3: TLabel;
    BCargarAfter: TButton;
    CTotalTablas: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    MemoAI: TMemo;
    MemoAU: TMemo;
    MemoAD: TMemo;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    LNombreAI: TLabel;
    LNombreAU: TLabel;
    LNombreAD: TLabel;
    BAgregarAU: TButton;
    BAgregarAD: TButton;
    Label11: TLabel;
    GtablasB: TDBGrid;
    BCargarBefore: TButton;
    CTotalB: TEdit;
    Label12: TLabel;
    MemoCamposB: TMemo;
    CTablaB: TEdit;
    Label13: TLabel;
    LabelBI: TLabel;
    MemoBI: TMemo;
    BAgregarBI: TButton;
    MemoBU: TMemo;
    Label15: TLabel;
    LabelBU: TLabel;
    BAgregarBU: TButton;
    Label17: TLabel;
    Label18: TLabel;
    procedure BAgregarAIClick(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BCargarAfterClick(Sender: TObject);
    procedure BConectarBDClick(Sender: TObject);
    procedure SeleccionarSP();
    procedure GTablasCellClick(Column: TColumn);
    procedure CTablaChange(Sender: TObject);
    procedure LlenarMemo( tipot, tabla : string; etiqueta: Tlabel; memo : TMemo);
    procedure BAgregarAUClick(Sender: TObject);
    procedure BAgregarADClick(Sender: TObject);
    procedure BCargarBeforeClick(Sender: TObject);
    procedure GtablasBCellClick(Column: TColumn);
    procedure BAgregarBIClick(Sender: TObject);
    procedure BAgregarBUClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVDisparador: TFVDisparador;
function AfterInsert(tabla, bd: string;campos: TStringList): string; external 'DllActualizarTrigger.dll';
function AfterUpdate(tabla, bd: string;campos: TStringList): string; external 'DllActualizarTrigger.dll';
function AfterDelete(tabla, bd: string;campos: TStringList): string; external 'DllActualizarTrigger.dll';
function BeforeInsert(tabla,FC,FU, bd: string): string; external 'DllActualizarTrigger.dll';
function BeforeUpdate(tabla, bd: string): string; external 'DllActualizarTrigger.dll';
implementation

{$R *.dfm}
procedure TFVDisparador.SeleccionarSP();
begin
   CTabla.Text := GTablas.Columns[0].Field.AsString;
end;
procedure TFVDisparador.BAgregarAUClick(Sender: TObject);
var
  res : string;
  I,Indice: integer;
  campos : TStringList;
begin

  campos := TStringList.Create;

  for i := 0 to MemoPK.Lines.Count - 1 do
  begin
     campos.Add(uppercase(MemoPK.Lines[i]));
  end;
  if campos.Count <> 0 then
     res := AfterUpdate(trim(UpperCase(CTabla.Text)),trim(CNombreBD.Text),campos)
  else
     ShowMessage('Error: Debe seleccionar campos para crear el TRIGGER');
  MemoAU.Clear;
  LNombreAU.Caption := 'Nombre: ';

  LlenarMemo('4',CTabla.Text, LNombreAU,MemoAU);
  freeandnil(campos);
end;

procedure TFVDisparador.BCargarAfterClick(Sender: TObject);
var
sql,s : string;
begin
   s := #13;
   FDQuery1.Close;
   sql := 'select RDB$RELATIONS.RDB$RELATION_NAME as Tabla '+S+
         'from RDB$RELATIONS '+S+
         'where '+S+
         'not exists ( select tt.RDB$RELATION_NAME '+S+
         'from '+S+
         '(SELECT RDB$RELATION_NAME ,  '+S+
         'count(RDB$TRIGGER_NAME) as cuenta  '+S+
         'FROM RDB$TRIGGERS  '+S+
         'WHERE RDB$TRIGGER_TYPE in (2,4,6) and '+S+
         'RDB$RELATION_NAME not like ''GTT_%'' and RDB$RELATION_NAME not like ''RDB$%'' '+S+
         'and RDB$RELATION_NAME not like ''MON$%'' and RDB$RELATION_NAME not like ''SEC$%'' '+S+
         'and RDB$RELATION_NAME not like ''%MOVUN%'' and RDB$RELATION_NAME not like ''OPR%'' '+S+
         'group by RDB$RELATION_NAME '+S+
         'having count(RDB$TRIGGER_NAME) = 3 '+S+
         'order by 1) as tt '+S+
         'where RDB$RELATIONS.RDB$RELATION_NAME = tt.RDB$RELATION_NAME) '+S+
         'and RDB$RELATIONS.RDB$RELATION_NAME not like ''GTT_%'' and RDB$RELATIONS.RDB$RELATION_NAME not like ''RDB$%'' '+S+
         'and RDB$RELATIONS.RDB$RELATION_NAME not like ''MON$%'' and RDB$RELATIONS.RDB$RELATION_NAME not like ''SEC$%'' '+S+
         'and RDB$RELATIONS.RDB$RELATION_NAME not like ''%MOVUN%'' and RDB$RELATIONS.RDB$RELATION_NAME not like ''OPR%''; ';

   FDQuery1.sql.Text := sql;
   FDQuery1.Open;
   FDQuery1.Last;
   FDQuery1.First;

   //asigno al datasource la consulta para que la grid se alimente de ahi
   DataSource1.DataSet := FDQuery1;
   GTablas.DataSource := DataSource1;
   GTablas.Columns[0].Width := 366;


   CTotalTablas.Text := FDQuery1.RecordCount.ToString;
end;

procedure TFVDisparador.BCargarBeforeClick(Sender: TObject);
var
sql,s : string;
begin
   s := #13;
   FDQuery1.Close;
   sql := 'SELECT DISTINCT rr.RDB$RELATION_NAME as TABLAS, '+S+
         'COALESCE( (select RDB$FIELD_NAME FROM RDB$RELATION_FIELDS where RDB$FIELD_NAME = ''FCREACION'' and RDB$RELATION_NAME = rr.RDB$RELATION_NAME) ,''0'') as FCREACION, '+S+
         'COALESCE( (select RDB$FIELD_NAME FROM RDB$RELATION_FIELDS where RDB$FIELD_NAME = ''FULTIMA'' and RDB$RELATION_NAME = rr.RDB$RELATION_NAME) ,''0'') as FULTIMA '+S+
         'FROM RDB$RELATION_FIELDS as rr  '+S+
         'WHERE rr.RDB$RELATION_NAME not in (select yy.tab  '+S+
         'from (select  RDB$RELATIONS.RDB$RELATION_NAME as tab , COUNT(RDB$TRIGGER_NAME) as cuenta '+S+
         'from RDB$RELATIONS, RDB$TRIGGERS '+S+
         'where RDB$TRIGGERS.RDB$TRIGGER_TYPE  in (1,3) and  RDB$RELATIONS.RDB$RELATION_NAME = RDB$TRIGGERS.RDB$RELATION_NAME  '+S+
         'and RDB$RELATIONS.RDB$RELATION_NAME in (SELECT DISTINCT tt.RDB$RELATION_NAME as tabla '+S+
         'FROM RDB$RELATION_FIELDS as tt WHERE tt.RDB$FIELD_NAME = ''FCREACION'' or tt.RDB$FIELD_NAME = ''FULTIMA'') '+S+
         'group by RDB$RELATIONS.RDB$RELATION_NAME '+S+
         'having COUNT(RDB$TRIGGER_NAME) >= 2 '+S+
         'order by RDB$RELATIONS.RDB$RELATION_NAME '+S+
         ') as yy ) '+S+
         'and (rr.RDB$FIELD_NAME = ''FCREACION'' or rr.RDB$FIELD_NAME = ''FULTIMA'')  '+S+
         'order by rr.RDB$RELATION_NAME;';

   FDQuery1.sql.Text := sql;
   FDQuery1.Open;
   FDQuery1.Last;
   FDQuery1.First;

   //asigno al datasource la consulta para que la grid se alimente de ahi
   DataSource1.DataSet := FDQuery1;
   GtablasB.DataSource := DataSource1;
   GtablasB.Columns[0].Width := 293;
   GtablasB.Columns[1].Width := 150;
   GtablasB.Columns[2].Width := 150;


   CTotalB.Text := FDQuery1.RecordCount.ToString;
end;

procedure TFVDisparador.BConectarBDClick(Sender: TObject);
begin
 if CNombreBD.Text <> '' then
 begin
    if BConectarBD.Caption = 'Conectar BD' then
       begin
       try
         FDConnection1.Params.Clear;
         FDConnection1.Params.DriverID:= 'FB';
         FDConnection1.Params.Database := CNombreBD.Text;
         FDConnection1.Params.UserName := 'SYSDBA';
         FDConnection1.Params.Password := 'masterkey';
         FDConnection1.Connected := true;
         if FDConnection1.Connected then
         begin
            Panel1.Color := clGreen;
            BConectarBD.Caption := 'Desconectar BD';
         end
         else
         begin
            Panel1.Color := clRed;
            BConectarBD.Caption := 'Conectar BD';
         end;
       except on E: exception do
          ShowMessage('Error al Conectar a la Base de Datos: '#13 + E.Message);
       end;
       end
       else
       begin
         FDConnection1.Connected := false;
         FDConnection1.Params.Clear;
         Panel1.Color := clRed;
         BConectarBD.Caption := 'Conectar BD';
       end;
  end
  else
     ShowMessage('Debe Seleccionar un Archivo de Base de Datos Valido');
 end;

procedure TFVDisparador.BAgregarAIClick(Sender: TObject);
var
  res : string;
  I,Indice: integer;
  campos : TStringList;
begin

  campos := TStringList.Create;

  for i := 0 to MemoPK.Lines.Count - 1 do
  begin
     campos.Add(uppercase(MemoPK.Lines[i]));
  end;
  if campos.Count <> 0 then
     res := AfterInsert(trim(UpperCase(CTabla.Text)),trim(CNombreBD.Text),campos)
  else
     ShowMessage('Error: Debe seleccionar campos para crear el TRIGGER');
  MemoAI.Clear;
  LNombreAI.Caption := 'Nombre: ';

  LlenarMemo('2',CTabla.Text, LNombreAI,MemoAI);
  freeandnil(campos);
end;

procedure TFVDisparador.BAgregarADClick(Sender: TObject);
var
  res : string;
  I,Indice: integer;
  campos : TStringList;
begin

  campos := TStringList.Create;

  for i := 0 to MemoPK.Lines.Count - 1 do
  begin
     campos.Add(uppercase(MemoPK.Lines[i]));
  end;
  if campos.Count <> 0 then
     res := AfterDelete(trim(UpperCase(CTabla.Text)),trim(CNombreBD.Text),campos)
  else
     ShowMessage('Error: Debe seleccionar campos para crear el TRIGGER');
  MemoAD.Clear;
  LNombreAD.Caption := 'Nombre: ';

  LlenarMemo('6',CTabla.Text, LNombreAD,MemoAD);
  freeandnil(campos);
end;

procedure TFVDisparador.BAgregarBIClick(Sender: TObject);
var
  res, fc, fu : string;
  I: integer;

begin
  fc := '0';
  fu := '0';
  for i := 0 to MemoCamposB.Lines.Count - 1 do
  begin

     if trim(MemoCamposB.Lines[i]) = 'FCREACION' then
        fc := 'FCREACION';
     if trim(MemoCamposB.Lines[i]) = 'FULTIMA' then
        fu := 'FULTIMA';
  end;
  if (fu <> '0') or (fc <> '0') then
     res :=  BeforeInsert(trim(UpperCase(CTablaB.Text)),fc,fu,trim(CNombreBD.Text))
  else
     ShowMessage('la tabla: '+CTablaB.Text+' no tiene los campos FCREACION o FULTIMA');
  MemoBI.Clear;
  LabelBI.Caption := 'Nombre: ';
  LlenarMemo('1',CTablaB.Text, LabelBI,MemoBI);
end;

procedure TFVDisparador.BAgregarBUClick(Sender: TObject);
var
  res, fc, fu : string;
  I: integer;

begin
  fc := '0';
  fu := '0';
  for i := 0 to MemoCamposB.Lines.Count - 1 do
  begin
     if trim(MemoCamposB.Lines[i]) = 'FCREACION' then
        fc := 'FCREACION';
     if trim(MemoCamposB.Lines[i]) = 'FULTIMA' then
        fu := 'FULTIMA';
  end;
  if (fu <> '0')  then
     res :=  BeforeUpdate(trim(UpperCase(CTablaB.Text)),trim(CNombreBD.Text))
  else
     ShowMessage('la tabla: '+CTablaB.Text+' no tiene el campo FULTIMA para aplicar el TRIGGER');
  MemoBU.Clear;
  LabelBU.Caption := 'Nombre: ';
  LlenarMemo('3',CTablaB.Text, LabelBU,MemoBU);
end;

procedure TFVDisparador.Button7Click(Sender: TObject);
begin
   //memo5.Lines.Add(BeforeInsert(trim(UpperCase(CTabla.Text)),trim(CNombreBD.Text)));
end;


procedure TFVDisparador.CTablaChange(Sender: TObject);
begin
   {
   try
      FDQuery2.Close;
      FDQuery2.SQL.Text := 'select s.rdb$field_name from rdb$indices i INNER JOIN rdb$index_segments s ON(i.rdb$unique_flag=1 and i.rdb$relation_name='''+trim(UpperCase(CTabla.Text))+''' and s.rdb$index_name=i.rdb$index_name);';
      FDQuery2.Open();
      FDQuery2.Last;
      FDQuery2.First;
      MemoPK.Clear;
      while FDQuery2.Eof do
      begin
         MemoPK.Lines.Add(trim(UpperCase(FDQuery2.Fields[0].AsString)));
         FDQuery2.Next;
      end;

   except on e:exception do
      ShowMessage('Error Consultando la Llave Primaria, erro: '#13+e.Message);
   end;
   }
end;

procedure TFVDisparador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   freeandnil(FVDisparador);
end;

procedure TFVDisparador.FormCreate(Sender: TObject);
begin
  //BorderStyle := bsNone;  // elimino bordes
  WindowState := wsMaximized; // maximiso la ventana
end;

procedure TFVDisparador.GtablasBCellClick(Column: TColumn);
var
   sql : string;
begin
  //SeleccionarSP();
  CTablaB.Text := GtablasB.Columns[0].Field.AsString;
  MemoBI.Clear;
  MemoBU.Clear;

  LabelBI.Caption := 'Nombre: ';
  LabelBU.Caption := 'Nombre: ';
  MemoCamposB.Clear;

  if GtablasB.Columns[1].Field.AsString <> '0' then
     MemoCamposB.Lines.Add(trim(UpperCase(GtablasB.Columns[1].Field.AsString)));
  if GtablasB.Columns[2].Field.AsString <> '0' then
     MemoCamposB.Lines.Add(trim(UpperCase(GtablasB.Columns[2].Field.AsString)));
  LlenarMemo('1',CTablaB.Text, LabelBI,MemoBI);
  LlenarMemo('3',CTablaB.Text, LabelBU,MemoBU);

end;

procedure TFVDisparador.GTablasCellClick(Column: TColumn);
var
   sql : string;
begin
  SeleccionarSP();
  MemoAI.Clear;
  MemoAU.Clear;
  MemoAD.Clear;
  LNombreAI.Caption := 'Nombre: ';
  LNombreAU.Caption := 'Nombre: ';
  LNombreAD.Caption := 'Nombre: ';
  try
      sql := 'select s.rdb$field_name from rdb$indices i INNER JOIN rdb$index_segments s ON(i.rdb$unique_flag=1 and upper(i.rdb$relation_name)='''+trim(UpperCase(CTabla.Text))+''' and s.rdb$index_name=i.rdb$index_name)';

      FDQuery2.Close;
      FDQuery2.SQL.Text := sql;
      FDQuery2.Open();
      FDQuery2.Last;
      FDQuery2.First;
      MemoPK.Clear;
      while not FDQuery2.Eof do
      begin
         MemoPK.Lines.Add(trim(UpperCase(FDQuery2.Fields[0].AsString)));
         FDQuery2.Next;
      end;

   except on e:exception do
      ShowMessage('Error Consultando la Llave Primaria, erro: '#13+e.Message);
   end;

  LlenarMemo('2',CTabla.Text, LNombreAI,MemoAI);
  LlenarMemo('4',CTabla.Text, LNombreAU,MemoAU);
  LlenarMemo('6',CTabla.Text, LNombreAD,MemoAD);

end;

procedure TFVDisparador.LlenarMemo( tipot, tabla : string; etiqueta: Tlabel; memo : TMemo);
var
sql: string;
begin
  try
      sql := 'select RDB$TRIGGER_NAME, RDB$TRIGGER_SOURCE from RDB$TRIGGERS where RDB$TRIGGER_TYPE in ('+tipot+') and RDB$RELATION_NAME = '''+tabla+''';';

      FDQuery2.Close;
      FDQuery2.SQL.Text := sql;
      FDQuery2.Open();
      FDQuery2.Last;
      FDQuery2.First;
      if not FDQuery2.IsEmpty then
      begin
         memo.Text := FDQuery2.Fields[1].AsString;
         etiqueta.Caption := 'Nombre: ' + FDQuery2.Fields[0].AsString;
      end;

   except on e:exception do
      ShowMessage('Error Consultando Trigger '+tipot+'. Error: '#13+e.Message);
   end;
end;

end.
