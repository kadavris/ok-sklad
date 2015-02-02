object Form1: TForm1
  Left = 129
  Top = 157
  Width = 309
  Height = 133
  Caption = 'Script Executor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 16
    Width = 55
    Height = 13
    Caption = #1055#1091#1090#1100' '#1082' '#1041#1044':'
  end
  object Label2: TLabel
    Left = 12
    Top = 44
    Width = 39
    Height = 13
    Caption = #1057#1082#1088#1080#1087#1090':'
  end
  object edBD: TJvFilenameEdit
    Left = 76
    Top = 12
    Width = 217
    Height = 21
    Filter = 'Interbase Database (*.gdb)|*.gdb'
    ButtonFlat = False
    DirectInput = False
    NumGlyphs = 1
    TabOrder = 0
  end
  object edScript: TJvFilenameEdit
    Left = 76
    Top = 40
    Width = 217
    Height = 21
    Filter = 'Script Files (*.sql)|*.sql'
    ButtonFlat = False
    DirectInput = False
    NumGlyphs = 1
    TabOrder = 1
  end
  object btnExec: TButton
    Left = 116
    Top = 72
    Width = 75
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    TabOrder = 2
    OnClick = btnExecClick
  end
end
