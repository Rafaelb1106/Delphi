object FVRecodificar: TFVRecodificar
  Left = 0
  Top = 0
  ClientHeight = 795
  ClientWidth = 1601
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Padding.Left = 10
  Padding.Top = 10
  Padding.Right = 10
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 152
    Top = 11
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
  object Label2: TLabel
    Left = 8
    Top = 64
    Width = 341
    Height = 21
    Caption = 'Procedimientos Almacenados de Recodificar '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 507
    Top = 147
    Width = 128
    Height = 13
    Caption = 'Procedimiento Almacenado'
  end
  object Label4: TLabel
    Left = 507
    Top = 88
    Width = 81
    Height = 13
    Caption = 'Campo a Evaluar'
  end
  object Label5: TLabel
    Left = 8
    Top = 345
    Width = 237
    Height = 17
    Caption = 'Tablas en las que se encuentra el campo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 251
    Top = 345
    Width = 140
    Height = 17
    Caption = 'Tablas en Recodificar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clGreen
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 507
    Top = 345
    Width = 144
    Height = 17
    Caption = 'Tablas Sin Recodificar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 112
    Top = 687
    Width = 90
    Height = 22
    Caption = 'Cantidad:  '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 368
    Top = 687
    Width = 90
    Height = 22
    Caption = 'Cantidad:  '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 626
    Top = 687
    Width = 90
    Height = 22
    Caption = 'Cantidad:  '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel
    Left = 419
    Top = 295
    Width = 47
    Height = 13
    Caption = 'Cantidad:'
  end
  object LCantidadSP: TLabel
    Left = 486
    Top = 295
    Width = 3
    Height = 13
  end
  object Label12: TLabel
    Left = 631
    Top = 88
    Width = 37
    Height = 13
    Caption = 'Dominio'
  end
  object Label13: TLabel
    Left = 800
    Top = 60
    Width = 218
    Height = 25
    Caption = 'Informaci'#243'n Adicional  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label14: TLabel
    Left = 1235
    Top = 60
    Width = 358
    Height = 19
    Caption = 'TABLAS QUE NO EST'#193'N EN LA BASE DE DATOS '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object CNombreBD: TEdit
    Left = 152
    Top = 34
    Width = 337
    Height = 21
    TabOrder = 0
    Text = 
      'F:\insoft\bases de datos contapyme\IS_STRUCT_08072021\IS_STRUCT.' +
      'FDB'
  end
  object Button1: TButton
    Left = 495
    Top = 32
    Width = 91
    Height = 25
    Caption = 'Base de Datos'
    TabOrder = 1
    OnClick = Button1Click
  end
  object BConectarBD: TButton
    Left = 55
    Top = 6
    Width = 94
    Height = 50
    Caption = 'Conectar BD'
    TabOrder = 2
    OnClick = BConectarBDClick
  end
  object Panel1: TPanel
    Left = 8
    Top = 5
    Width = 47
    Height = 50
    BorderWidth = 1
    Color = clRed
    ParentBackground = False
    TabOrder = 3
    StyleElements = [seBorder]
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 91
    Width = 493
    Height = 198
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
  end
  object Button2: TButton
    Left = 347
    Top = 60
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 5
    OnClick = Button2Click
  end
  object CSP: TEdit
    Left = 507
    Top = 166
    Width = 241
    Height = 21
    ReadOnly = True
    TabOrder = 6
  end
  object CCampoLlave: TEdit
    Left = 507
    Top = 107
    Width = 118
    Height = 21
    TabOrder = 7
  end
  object MProcedimientos: TMemo
    Left = 507
    Top = 208
    Width = 241
    Height = 81
    TabOrder = 8
  end
  object Button3: TButton
    Left = 754
    Top = 166
    Width = 18
    Height = 21
    Caption = '+'
    ImageIndex = 0
    TabOrder = 9
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 754
    Top = 208
    Width = 18
    Height = 21
    Caption = '-'
    ImageIndex = 0
    TabOrder = 10
    OnClick = Button4Click
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 368
    Width = 237
    Height = 313
    TabOrder = 11
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object BprocesarCampo: TButton
    Left = 8
    Top = 314
    Width = 97
    Height = 25
    Caption = 'Procesar Campo'
    TabOrder = 12
    OnClick = BprocesarCampoClick
  end
  object Memo1: TMemo
    Left = 251
    Top = 368
    Width = 250
    Height = 313
    ScrollBars = ssBoth
    TabOrder = 13
  end
  object Memo2: TMemo
    Left = 507
    Top = 368
    Width = 250
    Height = 313
    ScrollBars = ssBoth
    TabOrder = 14
  end
  object CCantidad1: TEdit
    Left = 200
    Top = 687
    Width = 45
    Height = 21
    Alignment = taRightJustify
    Enabled = False
    TabOrder = 15
  end
  object CCantidad2: TEdit
    Left = 456
    Top = 687
    Width = 45
    Height = 21
    Alignment = taRightJustify
    Enabled = False
    TabOrder = 16
  end
  object CCantidad3: TEdit
    Left = 712
    Top = 687
    Width = 45
    Height = 21
    Alignment = taRightJustify
    Enabled = False
    TabOrder = 17
  end
  object Button5: TButton
    Left = 673
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Limpiar'
    TabOrder = 18
    OnClick = Button5Click
  end
  object ChDominio: TCheckBox
    Left = 635
    Top = 289
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Validar por Dominio'
    TabOrder = 19
  end
  object Memo3: TMemo
    Left = 8
    Top = 762
    Width = 733
    Height = 89
    Lines.Strings = (
      'Memo3')
    ScrollBars = ssBoth
    TabOrder = 20
    Visible = False
  end
  object SInfo: TStringGrid
    Left = 795
    Top = 91
    Width = 419
    Height = 192
    ColCount = 2
    DefaultColWidth = 150
    FixedCols = 0
    RowCount = 10
    TabOrder = 21
  end
  object CDominio: TEdit
    Left = 631
    Top = 107
    Width = 118
    Height = 21
    TabOrder = 22
  end
  object SInfoSP: TStringGrid
    Left = 795
    Top = 289
    Width = 422
    Height = 392
    ColCount = 3
    DefaultColWidth = 80
    FixedCols = 0
    RowCount = 100
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 23
    ColWidths = (
      156
      161
      80)
  end
  object Memo4: TMemo
    Left = 1235
    Top = 91
    Width = 353
    Height = 192
    ScrollBars = ssBoth
    TabOrder = 24
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'User_Name=sysdba'
      'Password=masterkey')
    Left = 617
    Top = 7
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 681
    Top = 7
  end
  object DataSource1: TDataSource
    Left = 737
    Top = 7
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection1
    Left = 785
    Top = 7
  end
  object DataSource2: TDataSource
    Left = 841
    Top = 7
  end
  object FDQuery3: TFDQuery
    Connection = FDConnection1
    Left = 905
    Top = 7
  end
  object FDQuery4: TFDQuery
    Connection = FDConnection1
    Left = 976
    Top = 8
  end
end
