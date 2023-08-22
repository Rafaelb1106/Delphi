unit UFVRecodificar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFVRecodificar = class(TForm)
    CNombreBD: TEdit;
    Button1: TButton;
    BConectarBD: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    Button2: TButton;
    CSP: TEdit;
    CCampoLlave: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    MProcedimientos: TMemo;
    Button3: TButton;
    Button4: TButton;
    DBGrid2: TDBGrid;
    Label5: TLabel;
    BprocesarCampo: TButton;
    FDQuery2: TFDQuery;
    DataSource2: TDataSource;
    Label6: TLabel;
    Label7: TLabel;
    FDQuery3: TFDQuery;
    Memo1: TMemo;
    Memo2: TMemo;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    CCantidad1: TEdit;
    CCantidad2: TEdit;
    CCantidad3: TEdit;
    Label11: TLabel;
    LCantidadSP: TLabel;
    Button5: TButton;
    ChDominio: TCheckBox;
    Memo3: TMemo;
    SInfo: TStringGrid;
    CDominio: TEdit;
    Label12: TLabel;
    SInfoSP: TStringGrid;
    Label13: TLabel;
    FDQuery4: TFDQuery;
    Memo4: TMemo;
    Label14: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure BConectarBDClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SeleccionarSP();
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure BprocesarCampoClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVRecodificar: TFVRecodificar;


implementation

uses
  System.Generics.Collections;

{$R *.dfm}

procedure TFVRecodificar.BConectarBDClick(Sender: TObject);
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

procedure TFVRecodificar.BprocesarCampoClick(Sender: TObject);
var
  sql,Proc, campo : string;
  c2 ,c3 : integer;
  I, bandera, Indice, x, ban1: Integer;
  DCampos : TDictionary<string,string>;
  Dcampo: string;
  fila: Integer;
  CanCampos: Integer;
  CanTablas: Integer;
begin

   Memo1.Clear;
   Memo2.Clear;
   //limpia el STRINGGRID
   for I := 1 to SInfo.RowCount - 1 do
      SInfo.Rows[i].Clear;
   for I := 1 to SInfoSP.RowCount - 1 do
      SInfoSP.Rows[i].Clear;
   FDQuery2.Close;
   if not ChDominio.Checked then
   // validacion por campo
   begin
     try
         FDQuery2.sql.Text := 'SELECT RDB$RELATION_NAME as TABLAS FROM RDB$RELATION_FIELDS WHERE RDB$FIELD_NAME = '''+CCampoLlave.Text+''' and RDB$RELATION_NAME not LIKE ''GTT%'' and RDB$RELATION_NAME not CONTAINING ''_VIEW'' order by 1 ;';
         FDQuery2.Open;
         FDQuery2.Last;
         FDQuery2.First;
         //asigno al datasource la consulta para que la grid se alimente de ahi
         DataSource2.DataSet := FDQuery2;
         DBGrid2.DataSource := DataSource2;
     except on E: exception do
     begin
        ShowMessage('Error al consultar las Tablas error: '#13 + E.Message);
        exit;
     end;
     end;
     CCantidad1.Text := FDQuery2.RecordCount.ToString ;
     c2 := 0;
     c3 := 0;
     Memo1.Clear;
     Memo2.Clear;
     SInfo.Cells[0,0] := 'Procedimiento almacenado';
     SInfo.Cells[1,0] := 'Tablas Incluidas';
     //se recorre toda la consulta de las tablas para validar que la tabla pertenesca a un SP
     while not FDQuery2.EoF do
     begin
        try
           bandera := 0;
           for I := 0 to MProcedimientos.Lines.Count - 1 do
           begin
           //se consulta por cada tabla si hace parte del procedimiento
               FDQuery3.Close;
               sql := 'SELECT UPPER(RDB$PROCEDURE_SOURCE) as SP, RDB$PROCEDURE_NAME as Procedimiento_Almacenado, '''+trim(CCampoLlave.Text)+''' as Campo FROM  RDB$PROCEDURES where UPPER(RDB$PROCEDURE_SOURCE) like ''%'''''+trim(FDQuery2.Fields[0].AsString)+'''''%'' AND RDB$PROCEDURE_NAME = TRIM('''+trim(MProcedimientos.Lines[I])+''')';
               FDQuery3.sql.Text := sql;
               FDQuery3.Open();
               // si esta en algun procedimiento se marca una bandera
               if not FDQuery3.IsEmpty then
               begin
                  bandera := 1;
                  Memo3.Text := FDQuery3.Fields[0].AsString;
               end;
           end;
           // se recorren los SP seleccionados para validar informacion
           CanTablas := 0;
           for I := 0 to MProcedimientos.Lines.Count - 1 do
           begin
           //se consulta por cada tabla si hace parte del procedimiento
               Indice := 0;
               FDQuery3.Close;
               sql := 'SELECT UPPER(RDB$PROCEDURE_SOURCE) as SP FROM  RDB$PROCEDURES where RDB$PROCEDURE_NAME = TRIM('''+trim(MProcedimientos.Lines[I])+''')';
               FDQuery3.sql.Text := sql;
               FDQuery3.Open();
               // si esta en algun procedimiento se marca una bandera
               if not FDQuery3.IsEmpty then
               begin
                  Memo3.Text := FDQuery3.Fields[0].AsString;
                  // armo las lineas del StrinGrid
                  for X := 0 to memo3.lines.count - 1 do
                  begin
                    if pos('NTABLE=',memo3.lines[x]) <> 0 then begin
                       Indice := Indice + 1;
                    end;
                  end;
                  //ShowMessage(Indice.ToString);
                  SInfo.Cells[0,I+1] := MProcedimientos.Lines[I];
                  SInfo.Cells[1,I+1] := Indice.ToString;
               end;
               CanTablas := CanTablas + Indice;
           end;
           SInfo.Cells[0,MProcedimientos.Lines.Count+1] := 'TOTAL: ';
           SInfo.Cells[1,MProcedimientos.Lines.Count+1] := CanTablas.ToString;
           // se escribe en el memo segun la bandera
           if bandera = 0 then
           begin
              c3 := c3 + 1;
              Memo2.Lines.Add(FDQuery2.Fields[0].AsString);
           end
           else
           begin
              c2 := c2 + 1;
              Memo1.Lines.Add(FDQuery2.Fields[0].AsString);
           end;

        except on E:exception do
           ShowMessage('Error en busqueda de tablas de recodificar'#13 + e.Message +''#13 +FDQuery3.sql.Text);
        end;
        FDQuery2.Next;
     end;

     CCantidad2.Text := memo1.Lines.Count.ToString;
     CCantidad3.Text := memo2.Lines.Count.ToString;
   end // fin validar por campo
   else
   begin
   ////// opcion de evaluar por dominios
     try
         // consulto las tablas y campos que peertenecen a ese dominio
         FDQuery2.sql.Text := 'SELECT RDB$RELATION_NAME as TABLA, RDB$FIELD_NAME as CAMPO FROM RDB$RELATION_FIELDS WHERE RDB$FIELD_SOURCE = trim('''+CDominio.Text+''') and RDB$RELATION_NAME not LIKE ''GTT%'' and RDB$RELATION_NAME not CONTAINING ''_VIEW''  order by RDB$RELATION_NAME ;';
         FDQuery2.Open;
         FDQuery2.Last;
         FDQuery2.First;
         //asigno al datasource la consulta para que la grid se alimente de ahi
         DataSource2.DataSet := FDQuery2;
         DBGrid2.DataSource := DataSource2;
     except on E:exception do
         ShowMessage('Error en busqueda de tablas de recodificar'#13 + e.Message +''#13 +FDQuery2.sql.Text);
     end;
     CCantidad1.Text := FDQuery2.RecordCount.ToString ;
     c2 := 0;
     c3 := 0;
     Memo1.Clear;
     Memo2.Clear;
     SInfo.Cells[0,0] := 'Procedimiento almacenado';
     SInfo.Cells[1,0] := 'Tablas Incluidas';
     CanTablas := 0;
     for I := 0 to MProcedimientos.Lines.Count - 1 do
     begin

          //ShowMessage('procedimiento: '+ MProcedimientos.Lines[I]);
          FDQuery2.First;
          Indice := 0;
          Memo3.Clear;
          FDQuery3.Close;
          sql := 'SELECT UPPER(RDB$PROCEDURE_SOURCE) as SP FROM  RDB$PROCEDURES where RDB$PROCEDURE_NAME = TRIM('''+trim(MProcedimientos.Lines[I])+''')';
          FDQuery3.sql.Text := sql;
          FDQuery3.Open();
       // lleno el memo3 con el SP para buscar en el
          if not FDQuery3.IsEmpty then
          Memo3.Text := FDQuery3.Fields[0].AsString;
          // cuento las ocurrencias de NTABLE para saber cuantas tablas procesa el SP
          for X := 0 to memo3.lines.count - 1 do
          begin
            if pos('NTABLE=',memo3.lines[x]) <> 0 then begin
               Indice := Indice + 1;
            end;
          end;
         SInfo.Cells[0,I+1] := MProcedimientos.Lines[I];
         SInfo.Cells[1,I+1] := Indice.ToString;
         CanTablas := CanTablas + Indice;
         while not FDQuery2.EoF do
         begin
             ////// toca controlar que no evalue los campos ya evaluados dos veces
             bandera := 0;
             // si ya esta en los TMEMO ya fue evaluado ese campo no deberioa volver a entrar a no ser que este en la de tablas sin recodificar
            for X := 0 to memo1.lines.count - 1 do   // memo de tablas en recodificar
             begin
               if (pos(FDQuery2.Fields[0].AsString+'|'+FDQuery2.Fields[1].AsString ,memo1.lines[x]) <> 0) then
                  bandera := 1;
             end;
             // fin de validacion si ya esta procesada la tabla con su campo
             //si no esta procesado se entra a procesar
             if bandera = 0 then
             begin
                 ban1:= 0;
                // marco una bandera si en el memo consigo una ocurrencia de la tabla con el campo
                for X := 0 to memo3.lines.count - 1 do
                begin
                  if (pos('NTABLE= '''+FDQuery2.Fields[0].AsString+'''' ,memo3.lines[x]) <> 0) and (pos('NFIELD= '''+FDQuery2.Fields[1].AsString+'''',memo3.lines[x+1]) <> 0)  then
                     bandera := 1;
                end;

                if bandera = 1 then
                begin
                    for X := 0 to memo2.lines.count - 1 do
                    begin
                       if (pos(FDQuery2.Fields[0].AsString+'|'+FDQuery2.Fields[1].AsString ,memo2.lines[x]) <> 0) then
                       begin
                          ban1 := 1;
                          memo2.Lines.Delete(x);
                       end;
                    end;
                    if ban1 = 1 then
                    begin
                       c3 := c3 - 1;
                       //memo2.Text:= StringReplace(memo2.Text, FDQuery2.Fields[0].AsString+'|'+FDQuery2.Fields[1].AsString,'',[rfReplaceAll]);
                    end;
                   ban1 := 0;
                   c2 := c2 + 1;
                   Memo1.Lines.Add(FDQuery2.Fields[0].AsString+'|'+FDQuery2.Fields[1].AsString);
                end
                else
                begin
                   for X := 0 to memo2.lines.count - 1 do
                    begin
                       if (pos(FDQuery2.Fields[0].AsString+'|'+FDQuery2.Fields[1].AsString ,memo2.lines[x]) <> 0) then
                       begin
                          ban1 := 1;
                       end;
                    end;
                    if ban1 <> 1 then
                    begin
                      c3 := c3 + 1;
                      Memo2.Lines.Add(FDQuery2.Fields[0].AsString+'|'+FDQuery2.Fields[1].AsString);
                    end;
                    ban1 := 0;
                end;

             end;
             FDQuery2.Next;
         end;
     end;
     SInfo.Cells[0,MProcedimientos.Lines.Count+1] := 'TOTAL: ';
     SInfo.Cells[1,MProcedimientos.Lines.Count+1] := CanTablas.ToString;
   end;
   // fin if del check box
   CCantidad2.Text := memo1.Lines.Count.ToString;
   CCantidad3.Text := memo2.Lines.Count.ToString;
   //evaluamos los SP para sacar informacion para el segundo STRINGGRID
   fila:= 0;
   SInfoSP.Cells[0,fila] := 'Procedimiento Almcenado';
   SInfoSP.Cells[1,fila] := 'CAMPO';
   SInfoSP.Cells[2,fila] := 'Cantidad';

   for I := 0 to MProcedimientos.Lines.Count - 1 do
   begin
      DCampos := TDictionary<string,string>.create;
      Memo3.Clear;
      FDQuery3.Close;
      sql := 'SELECT UPPER(RDB$PROCEDURE_SOURCE) as SP FROM  RDB$PROCEDURES where RDB$PROCEDURE_NAME = TRIM('''+trim(MProcedimientos.Lines[I])+''')';
      FDQuery3.sql.Text := sql;
      FDQuery3.Open();
   // lleno el memo3 con el SP para buscar en el
      if not FDQuery3.IsEmpty then
         Memo3.Text := FDQuery3.Fields[0].AsString;

      for X := 0 to memo3.lines.count - 1 do
      begin
         if pos('NFIELD= ''',memo3.lines[x]) <> 0 then
         begin
            /// con la siguiente linea obtengo el campo
            campo := copy(trim(memo3.Lines[x]), 10 , Length(trim(memo3.Lines[x]))-11 );
            try
            FDQuery4.Close;
            sql := 'SELECT RDB$RELATION_NAME AS NombreTabla FROM RDB$RELATIONS WHERE RDB$RELATION_NAME = '''+copy(trim(memo3.Lines[x - 1]), 10 , Length(trim(memo3.Lines[x - 1]))-11 )+'''';
            FDQuery4.sql.Text := sql;
            FDQuery4.Open();
            if FDQuery4.IsEmpty then
               Memo4.Lines.Add(copy(trim(memo3.Lines[x - 1]), 10 , Length(trim(memo3.Lines[x - 1]))-11 ));

            except on E:exception do
               ShowMessage('Error en busqueda de tablas que no están'#13 + e.Message +''#13 +FDQuery4.sql.Text);
            end;

            //ShowMessage(  copy(trim(memo3.Lines[x - 1]), 10 , Length(trim(memo3.Lines[x - 1]))-11 )  );
            if DCampos.ContainsKey(campo) then
               //DCampos.Add(campo, inttostr(strtoint(DCampos.Items[campo])+1))
               DCampos.Items[campo] := inttostr(strtoint(DCampos.Items[campo])+1)
            else
               DCampos.Add(campo, '1');
         end;
      end;
      fila := fila +1;
      CanCampos := 0;
      for Dcampo in Dcampos.Keys do
      begin
         SInfoSP.Cells[0,fila] := MProcedimientos.Lines[i];
         SInfoSP.Cells[1,fila] := Dcampo;
         SInfoSP.Cells[2,fila] := DCampos.Items[Dcampo];
         CanCampos := CanCampos + strtoint(DCampos.Items[Dcampo]);
         fila := fila +1;

         //ShowMessage('campo: '+Dcampo+#13'cantidad: '+DCampos.Items[Dcampo]);
      end;
      SInfoSP.Cells[1,fila] := 'TOTAL: ';
      SInfoSP.Cells[2,fila] := inttostr(CanCampos);

      freeandnil(DCampos);
   end;

end;

//end;

procedure TFVRecodificar.Button1Click(Sender: TObject);
var
  selectedFile: string;
  dlg: TOpenDialog;
begin
// para seleccionar las rutas de los archivos
  selectedFile := '';
  dlg := TOpenDialog.Create(nil);
  try
    dlg.InitialDir := 'C:';
    dlg.Filter := 'All files (*.*)|*.*';
    if dlg.Execute(Handle) then
      selectedFile := dlg.FileName;
  finally
    dlg.Free;
  end;

  if selectedFile <> '' then
     CNombreBD.Text := selectedFile;
end;
procedure TFVRecodificar.Button2Click(Sender: TObject);
begin
   FDQuery1.Close;
   FDQuery1.sql.Text := 'SELECT RDB$PROCEDURE_NAME as SP, SUBSTRING(RDB$PROCEDURE_NAME FROM 5 ) as CAMPO_ClAVE  FROM  RDB$PROCEDURES where RDB$PROCEDURE_NAME like ''REN_I%'' order by 1';
   FDQuery1.Open;
   FDQuery1.Last;
   FDQuery1.First;
   //asigno al datasource la consulta para que la grid se alimente de ahi
   DataSource1.DataSet := FDQuery1;
   DBGrid1.DataSource := DataSource1;
   LCantidadSP.Caption := FDQuery1.RecordCount.ToString;

end;

procedure TFVRecodificar.Button3Click(Sender: TObject);
begin
   MProcedimientos.Lines.Add(CSP.Text);
end;

procedure TFVRecodificar.Button4Click(Sender: TObject);
var
  I: Integer;
begin
// elimina una palabra del Tmemo
//   MProcedimientos.Text:= StringReplace(MProcedimientos.Text, CSP.Text,'',[rfReplaceAll]);

 MProcedimientos.Lines.Delete(MProcedimientos.Lines.Count - 1)
end;



procedure TFVRecodificar.Button5Click(Sender: TObject);
begin

  MProcedimientos.Clear;
  Memo1.Clear;
  Memo2.Clear;
  Memo4.Clear;

end;


procedure TFVRecodificar.DBGrid1CellClick(Column: TColumn);
begin
   SeleccionarSP();
end;

procedure TFVRecodificar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   freeandnil(FVRecodificar);
end;

procedure TFVRecodificar.FormCreate(Sender: TObject);
begin

   //BorderStyle := bsNone;  // elimino bordes
   WindowState := wsMaximized; // maximiso la ventana
end;

procedure TFVRecodificar.SeleccionarSP();
begin
   //CSP.Text := FDQuery1.Fields[0].AsString;
   //CCampoLlave.Text := FDQuery1.Fields[1].AsString;
   CSP.Text := DBGrid1.Columns[0].Field.AsString;
   CCampoLlave.Text := DBGrid1.Columns[1].Field.AsString;
   try
     FDQuery3.Close;
     FDQuery3.SQL.Text := 'SELECT DISTINCT RDB$FIELD_SOURCE FROM RDB$RELATION_FIELDS WHERE RDB$FIELD_NAME = '''+CCampoLlave.Text+''' and RDB$FIELD_SOURCE like ''T_%'' ;';
     FDQuery3.Open();
     CDominio.Text := FDQuery3.Fields[0].AsString;
   except on E:exception do
     ShowMessage('Error consultando el Dominio error: '#13+E.Message);
   end;
end;

end.
