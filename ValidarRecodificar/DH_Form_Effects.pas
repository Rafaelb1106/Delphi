// Unit : DH Form Effects
// Version : 0.3
// (C) Doddy Hackman 2016
// efectos
unit DH_Form_Effects;

interface

uses Windows, SysUtils, Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls, Registry;

type
  T_DH_Form_Effects = class
  private

  public
    constructor Create;
    destructor Destroy; override;
    procedure Effect_Marquee_Label_DownUp(Panel1: TPanel; Label1: TLabel;
      segundos: integer);
    procedure Effect_Marquee_Label_LeftRight(Label2: TLabel; opcion: string;
      segundos: integer);
    procedure Effect_Marquee_Form_Caption_LeftRight(Form1: TForm;
      opcion: string; segundos: integer);
    function Window_Effect(Form: HWND; opcion: string;
      velocidad: integer): bool;
    function Window_Transparent(Form: TForm; level: integer): bool;
    procedure Effect_Load_Another_Form(Form1_Load: TForm; Form2_Load: TForm;
      option: string; autosize: integer; space: integer; seconds: integer);
    function desktop_composition_control(option: string): bool;
    function Effect_Glass_in_Console(): bool;
  end;

type
  TTimerEffect_Marquee_Label_DownUp = Class(TTimer)
  public
    procedure OnWork(Sender: TObject);
  end;

  TTimerEffect_Marquee_Label_LeftRight = Class(TTimer)
  public
    procedure OnWork(Sender: TObject);
  end;

  TTimerEffect_Marquee_Form_Caption_LeftRight = Class(TTimer)
  public
    procedure OnWork(Sender: TObject);
  end;

var
  Timer_Effect_Marquee_Label_DownUp: TTimerEffect_Marquee_Label_DownUp;
  PanelToMove1: TPanel;
  LabelToMove1: TLabel;

var
  TimerEffect_Marquee_Label_LeftRight: TTimerEffect_Marquee_Label_LeftRight;
  LabelToMove2: TLabel;
  Option_Marquee_Label_LeftRight: string;

var
  TimerEffect_Marquee_Form_Caption_LeftRight
    : TTimerEffect_Marquee_Form_Caption_LeftRight;
  FormCaptionToMove: TForm;
  Option_Marquee_Form_Caption_LeftRight: string;

implementation

constructor T_DH_Form_Effects.Create;
begin
  inherited Create;
  //
end;

destructor T_DH_Form_Effects.Destroy;
begin
  inherited Destroy;
end;

// Timers

procedure TTimerEffect_Marquee_Label_DownUp.OnWork(Sender: TObject);
begin
  LabelToMove1.Top := LabelToMove1.Top - 10;
  if LabelToMove1.Top + LabelToMove1.Height < 0 then
  begin
    LabelToMove1.Top := PanelToMove1.Height;
  end;
end;

procedure TTimerEffect_Marquee_Form_Caption_LeftRight.OnWork(Sender: TObject);
var
  code: string;
  opcion: string;
begin
  code := FormCaptionToMove.Caption;
  opcion := Option_Marquee_Form_Caption_LeftRight;
  if opcion = 'left' then
  begin
    FormCaptionToMove.Caption := Copy(code, 2, Length(code) - 1) +
      Copy(code, 1, 1);
  end
  else if (opcion = 'right') then
  begin
    FormCaptionToMove.Caption := Copy(code, Length(code) - 1, 1) +
      Copy(code, 1, Length(code) - 1);
  end
  else
  begin
    FormCaptionToMove.Caption := Copy(code, 2, Length(code) - 1) +
      Copy(code, 1, 1);
  end;
end;

procedure TTimerEffect_Marquee_Label_LeftRight.OnWork(Sender: TObject);
// Based on : http://delphi.about.com/od/vclusing/a/marquee.htm
// Thanks to Zarko Gajic
var
  code: string;
  opcion: string;
begin
  code := LabelToMove2.Caption;
  opcion := Option_Marquee_Label_LeftRight;
  if opcion = 'left' then
  begin
    LabelToMove2.Caption := Copy(code, 2, Length(code) - 1) + Copy(code, 1, 1);
  end
  else if (opcion = 'right') then
  begin
    LabelToMove2.Caption := Copy(code, Length(code) - 1, 1) +
      Copy(code, 1, Length(code) - 1);
  end
  else
  begin
    LabelToMove2.Caption := Copy(code, 2, Length(code) - 1) + Copy(code, 1, 1);
  end;
end;

//

// Functions

procedure T_DH_Form_Effects.Effect_Load_Another_Form(Form1_Load: TForm;
  Form2_Load: TForm; option: string; autosize: integer; space: integer;
  seconds: integer);
var
  width: integer;
  Height: integer;
  i: integer;
begin

  if (autosize = 1) then
  begin
    width := Form2_Load.width;
    Height := Form1_Load.Height;
  end
  else
  begin
    width := Form2_Load.width;
    Height := Form2_Load.Height;
  end;

  if (option = 'effect1') then
  begin
    Form2_Load.width := 1;
    Form2_Load.Height := Form1_Load.Height;
    Form2_Load.Left := space + Form1_Load.Left + Form1_Load.width;
    Form2_Load.Top := Form1_Load.Top;
    Form2_Load.Show;
    for i := 1 to width do
    begin
      if (Form2_Load.width = width) then
      begin
        break;
      end
      else
      begin
        Form2_Load.width := i + seconds;
        Form2_Load.Update;
      end;
    end;
  end
  else if (option = 'effect2') then
  begin
    Form2_Load.Hide;
    Form2_Load.Height := Height;
    Form2_Load.Left := Form1_Load.Left + width;
    Form2_Load.Top := Form1_Load.Top;
    Form2_Load.Left := space + Form1_Load.Left + Form1_Load.width;
    Window_Effect(Form2_Load.Handle, 'effect1', seconds);
    Form2_Load.Show;
  end
  else
  begin
    Form2_Load.width := 1;
    Form2_Load.Height := Form1_Load.Height;
    Form2_Load.Left := space + Form1_Load.Left + Form1_Load.width;
    Form2_Load.Top := Form1_Load.Top;
    Form2_Load.Show;
    for i := 1 to width do
    begin
      if (Form2_Load.width = width) then
      begin
        break;
      end
      else
      begin
        Form2_Load.width := i + seconds;
        Form2_Load.Update;
      end;
    end;
  end;
end;

procedure T_DH_Form_Effects.Effect_Marquee_Label_DownUp(Panel1: TPanel;
  Label1: TLabel; segundos: integer);
begin

  // To hide panel : BevelOuter = bvNone

  PanelToMove1 := Panel1;
  LabelToMove1 := Label1;
  Timer_Effect_Marquee_Label_DownUp :=
    TTimerEffect_Marquee_Label_DownUp.Create(nil);
  Timer_Effect_Marquee_Label_DownUp.Interval := segundos * 1000;
  Timer_Effect_Marquee_Label_DownUp.OnTimer :=
    Timer_Effect_Marquee_Label_DownUp.OnWork;
  Timer_Effect_Marquee_Label_DownUp.Enabled := True;
end;

procedure T_DH_Form_Effects.Effect_Marquee_Form_Caption_LeftRight(Form1: TForm;
  opcion: string; segundos: integer);
begin
  if (opcion = 'left') then
  begin
    FormCaptionToMove := Form1;
    FormCaptionToMove.Caption := FormCaptionToMove.Caption + ' ';
  end
  else if (opcion = 'right') then
  begin
    FormCaptionToMove := Form1;
    FormCaptionToMove.Caption := FormCaptionToMove.Caption + '  ';
  end
  else
  begin
    FormCaptionToMove := Form1;
    FormCaptionToMove.Caption := FormCaptionToMove.Caption + ' ';
  end;

  Option_Marquee_Form_Caption_LeftRight := opcion;
  TimerEffect_Marquee_Form_Caption_LeftRight :=
    TTimerEffect_Marquee_Form_Caption_LeftRight.Create(nil);
  TimerEffect_Marquee_Form_Caption_LeftRight.Interval := segundos * 1000;
  TimerEffect_Marquee_Form_Caption_LeftRight.OnTimer :=
    TimerEffect_Marquee_Form_Caption_LeftRight.OnWork;
  TimerEffect_Marquee_Form_Caption_LeftRight.Enabled := True;
end;

procedure T_DH_Form_Effects.Effect_Marquee_Label_LeftRight(Label2: TLabel;
  opcion: string; segundos: integer);
begin
  if (opcion = 'left') then
  begin
    LabelToMove2 := Label2;
    LabelToMove2.Caption := LabelToMove2.Caption + ' ';
  end
  else if (opcion = 'right') then
  begin
    LabelToMove2 := Label2;
    LabelToMove2.Caption := LabelToMove2.Caption + '  ';
  end
  else
  begin
    LabelToMove2 := Label2;
    LabelToMove2.Caption := LabelToMove2.Caption + ' ';
  end;
  Option_Marquee_Label_LeftRight := opcion;
  TimerEffect_Marquee_Label_LeftRight :=
    TTimerEffect_Marquee_Label_LeftRight.Create(nil);
  TimerEffect_Marquee_Label_LeftRight.Interval := segundos * 1000;
  TimerEffect_Marquee_Label_LeftRight.OnTimer :=
    TimerEffect_Marquee_Label_LeftRight.OnWork;
  TimerEffect_Marquee_Label_LeftRight.Enabled := True;
end;

function T_DH_Form_Effects.Window_Effect(Form: HWND; opcion: string;
  velocidad: integer): bool;
begin
  try
    begin
      if (opcion = 'slide') then
      begin
        AnimateWindow(Form, velocidad, AW_SLIDE);
      end
      else if (opcion = 'blend') then
      begin
        AnimateWindow(Form, velocidad, AW_BLEND);
      end
      else if (opcion = 'hide') then
      begin
        AnimateWindow(Form, velocidad, AW_HIDE);
      end
      else if (opcion = 'center') then
      begin
        AnimateWindow(Form, velocidad, AW_CENTER);
      end
      else if (opcion = 'effect1') then
      begin
        AnimateWindow(Form, velocidad, AW_HOR_POSITIVE);
      end
      else if (opcion = 'effect2') then
      begin
        AnimateWindow(Form, velocidad, AW_HOR_NEGATIVE);
      end
      else if (opcion = 'effect3') then
      begin
        AnimateWindow(Form, velocidad, AW_VER_POSITIVE);
      end
      else if (opcion = 'effect4') then
      begin
        AnimateWindow(Form, velocidad, AW_VER_NEGATIVE);
      end
      else
      begin
        Result := False;
      end;
      Result := True;
    end;
  except
    begin
      Result := False;
    end;
  end;
end;

function T_DH_Form_Effects.Window_Transparent(Form: TForm;
  level: integer): bool;
begin

  // Effect in Desktop Dark
  // Level : 240
  // Level : 235
  // Level : 230

  // Effect in Desktop White
  // Level : 220

  try
    begin
      Form.AlphaBlend := True;
      Form.AlphaBlendValue := level;
      Form.Visible := True;
      Result := True;
    end;
  except
    begin
      Result := False;
    end;
  end;
end;

function T_DH_Form_Effects.desktop_composition_control(option: string): bool;
var
  Registry: TRegistry;
begin
  if not(option = '') then
  begin
    try
      begin
        Registry := TRegistry.Create;
        Registry.RootKey := HKEY_CURRENT_USER;
        Registry.OpenKey('Software\Microsoft\Windows\DWM', True);
        if (option = 'on') then
        begin
          Registry.WriteString('CompositionPolicy', '0');
        end;
        if (option = 'off') then
        begin
          Registry.WriteString('CompositionPolicy', '1');
        end;
        Registry.Free;
        Result := True;
      end;
    except
      begin
        Result := False;
      end;
    end;
  end
  else
  begin
    Result := False;
  end;
end;

// Function for Effect Glass in Console
// Credits : Based on http://www.delphibasics.info/home/delphibasicssnippets/glasseffectinadelphiconsoleapplication
// Thanks to Rodrigo Ruz
// Note : You need enable desktop composition to use this function , else use the function
// desktop_composition_control() to enable

type
  DWM_BLURBEHIND = record
    controls: DWORD;
    check: bool;
    color_now: HRGN;
    max_now: bool;
  end;

procedure DwmEnableBlurBehindWindow(HWND: HWND;
  const pBlurBehind: DWM_BLURBEHIND); safecall;
  external 'dwmapi.dll' name 'DwmEnableBlurBehindWindow';
function GetConsoleWindow: HWND; stdcall;
  external kernel32 name 'GetConsoleWindow';

function check_console: Boolean;
var
  Handle: THandle;
begin
  Handle := GetStdHandle(Std_Output_Handle);
  Win32Check(Handle <> Invalid_Handle_Value);
  if (Handle <> 0) then
  begin
    Result := True;
  end
  else
  begin
    Result := False;
  end;
end;

procedure Effect_Glass(Handle: HWND; active: Boolean; rgn: HRGN = 0;
  max: Boolean = False; control: Cardinal = 1);
var
  effect: DWM_BLURBEHIND;
begin
  effect.controls := control;
  effect.check := active;
  effect.color_now := rgn;
  effect.max_now := max;

  DwmEnableBlurBehindWindow(Handle, effect);
end;

function T_DH_Form_Effects.Effect_Glass_in_Console(): bool;
begin
  if (check_console) then
  begin
    try
      begin
        Effect_Glass(GetConsoleWindow(), True);
        Result := True;
      end;
    except
      begin
        //
      end;
    end;
  end
  else
  begin
    Result := False;
  end;
end;

//

end.

// The End ?
