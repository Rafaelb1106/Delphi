object FVDisparador: TFVDisparador
  Left = 0
  Top = 0
  ClientHeight = 734
  ClientWidth = 1343
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Padding.Top = 50
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 153
    Top = 12
    Width = 256
    Height = 23
    Caption = 'Seleccionar Base de Datos '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BConectarBD: TButton
    Left = 55
    Top = 6
    Width = 94
    Height = 50
    Caption = 'Conectar BD'
    TabOrder = 0
    OnClick = BConectarBDClick
  end
  object Panel1: TPanel
    Left = 5
    Top = 6
    Width = 50
    Height = 50
    BorderWidth = 1
    Color = clRed
    ParentBackground = False
    TabOrder = 1
    StyleElements = [seBorder]
  end
  object CNombreBD: TEdit
    Left = 153
    Top = 35
    Width = 337
    Height = 21
    TabOrder = 2
    Text = 
      'F:\insoft\bases de datos contapyme\IS_STRUCT_08072021\IS_STRUCT.' +
      'FDB'
  end
  object Button1: TButton
    Left = 496
    Top = 33
    Width = 91
    Height = 25
    Caption = 'Base de Datos'
    TabOrder = 3
  end
  object TabPrincipal: TPageControl
    Left = 16
    Top = 80
    Width = 1305
    Height = 625
    ActivePage = TabSheet2
    TabOrder = 4
    object Proc_Afterpostrecord: TTabSheet
      Caption = 'Proc_Afterpostrecord'
      object Label2: TLabel
        Left = 32
        Top = 4
        Width = 361
        Height = 16
        Caption = 'Tablas sin Disparador AFTER(Insert, Update, Delete)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Stencil'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 32
        Top = 25
        Width = 160
        Height = 16
        Caption = 'proc_afterpostrecord'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Stencil'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 308
        Top = 561
        Width = 62
        Height = 19
        Caption = 'Total:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Stencil'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 461
        Top = 60
        Width = 47
        Height = 16
        Caption = 'Tabla: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Stencil'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 461
        Top = 82
        Width = 155
        Height = 16
        Caption = 'Campos Llave Primaria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Stencil'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 760
        Top = 36
        Width = 89
        Height = 16
        Caption = 'AFTER INSERT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Stencil'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 760
        Top = 211
        Width = 92
        Height = 16
        Caption = 'AFTER UPDATE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Stencil'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 759
        Top = 402
        Width = 90
        Height = 16
        Caption = 'AFTER DELETE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Stencil'
        Font.Style = []
        ParentFont = False
      end
      object LNombreAI: TLabel
        Left = 944
        Top = 37
        Width = 44
        Height = 13
        Caption = 'Nombre: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LNombreAU: TLabel
        Left = 944
        Top = 214
        Width = 44
        Height = 13
        Caption = 'Nombre: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LNombreAD: TLabel
        Left = 944
        Top = 405
        Width = 44
        Height = 13
        Caption = 'Nombre: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object BAgregarAI: TButton
        Left = 1199
        Top = 53
        Width = 75
        Height = 25
        Caption = 'Agregar'
        TabOrder = 0
        OnClick = BAgregarAIClick
      end
      object MemoPK: TMemo
        Left = 461
        Top = 98
        Width = 220
        Height = 103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Century'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object CTabla: TEdit
        Left = 514
        Top = 55
        Width = 167
        Height = 21
        Enabled = False
        TabOrder = 2
        OnChange = CTablaChange
      end
      object GTablas: TDBGrid
        Left = 32
        Top = 56
        Width = 366
        Height = 497
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Century'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = GTablasCellClick
      end
      object BCargarAfter: TButton
        Left = 323
        Top = 25
        Width = 75
        Height = 25
        Caption = 'Cargar'
        TabOrder = 4
        OnClick = BCargarAfterClick
      end
      object CTotalTablas: TEdit
        Left = 371
        Top = 559
        Width = 27
        Height = 21
        Enabled = False
        TabOrder = 5
      end
      object MemoAI: TMemo
        Left = 760
        Top = 55
        Width = 425
        Height = 138
        ScrollBars = ssBoth
        TabOrder = 6
      end
      object MemoAU: TMemo
        Left = 760
        Top = 233
        Width = 425
        Height = 144
        ScrollBars = ssBoth
        TabOrder = 7
      end
      object MemoAD: TMemo
        Left = 760
        Top = 424
        Width = 425
        Height = 133
        ScrollBars = ssBoth
        TabOrder = 8
      end
      object BAgregarAU: TButton
        Left = 1199
        Top = 228
        Width = 75
        Height = 25
        Caption = 'Agregar'
        TabOrder = 9
        OnClick = BAgregarAUClick
      end
      object BAgregarAD: TButton
        Left = 1199
        Top = 419
        Width = 75
        Height = 25
        Caption = 'Agregar'
        TabOrder = 10
        OnClick = BAgregarADClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'FUltima, FCreacion'
      ImageIndex = 1
      object Label11: TLabel
        Left = 40
        Top = 12
        Width = 316
        Height = 16
        Caption = 'Tablas sin Disparador Before(Insert, Update)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Stencil'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 538
        Top = 567
        Width = 62
        Height = 19
        Caption = 'Total:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Stencil'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 856
        Top = 44
        Width = 98
        Height = 16
        Caption = 'BEFORE INSERT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Stencil'
        Font.Style = []
        ParentFont = False
      end
      object LabelBI: TLabel
        Left = 1008
        Top = 45
        Width = 44
        Height = 13
        Caption = 'Nombre: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 856
        Top = 219
        Width = 101
        Height = 16
        Caption = 'BEFORE UPDATE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Stencil'
        Font.Style = []
        ParentFont = False
      end
      object LabelBU: TLabel
        Left = 1008
        Top = 222
        Width = 44
        Height = 13
        Caption = 'Nombre: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label17: TLabel
        Left = 653
        Top = 68
        Width = 47
        Height = 16
        Caption = 'Tabla: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Stencil'
        Font.Style = []
        ParentFont = False
      end
      object Label18: TLabel
        Left = 653
        Top = 90
        Width = 52
        Height = 16
        Caption = 'Campos '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Stencil'
        Font.Style = []
        ParentFont = False
      end
      object GtablasB: TDBGrid
        Left = 40
        Top = 64
        Width = 593
        Height = 497
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Century'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = GtablasBCellClick
      end
      object BCargarBefore: TButton
        Left = 558
        Top = 33
        Width = 75
        Height = 25
        Caption = 'Cargar'
        TabOrder = 1
        OnClick = BCargarBeforeClick
      end
      object CTotalB: TEdit
        Left = 606
        Top = 567
        Width = 27
        Height = 21
        Enabled = False
        TabOrder = 2
      end
      object MemoCamposB: TMemo
        Left = 653
        Top = 112
        Width = 185
        Height = 103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Century'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object CTablaB: TEdit
        Left = 706
        Top = 63
        Width = 132
        Height = 21
        Enabled = False
        TabOrder = 4
        OnChange = CTablaChange
      end
      object MemoBI: TMemo
        Left = 856
        Top = 63
        Width = 361
        Height = 138
        ScrollBars = ssBoth
        TabOrder = 5
      end
      object BAgregarBI: TButton
        Left = 1222
        Top = 64
        Width = 75
        Height = 25
        Caption = 'Agregar'
        TabOrder = 6
        OnClick = BAgregarBIClick
      end
      object MemoBU: TMemo
        Left = 856
        Top = 241
        Width = 361
        Height = 144
        ScrollBars = ssBoth
        TabOrder = 7
      end
      object BAgregarBU: TButton
        Left = 1222
        Top = 239
        Width = 75
        Height = 25
        Caption = 'Agregar'
        TabOrder = 8
        OnClick = BAgregarBUClick
      end
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'User_Name=sysdba'
      'Password=masterkey')
    Left = 618
    Top = 8
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 682
    Top = 8
  end
  object DataSource1: TDataSource
    Left = 738
    Top = 8
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection1
    Left = 786
    Top = 8
  end
end
