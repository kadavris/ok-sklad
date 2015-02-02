inherited frmLock: TfrmLock
  Left = 467
  Top = 258
  VertScrollBar.Range = 0
  ActiveControl = edPass
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'frmLock'
  ClientHeight = 191
  ClientWidth = 482
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  object btnHelp: TssSpeedButton [0]
    Left = 449
    Top = 27
    Alignment = taLeftJustify
    AllwaysShowFrame = False
    Anchors = [akTop, akRight]
    ButtonType = ssbtStandard
    Checked = False
    GroupIndex = 0
    ImageIndex = 7
    Images = dmData.Images18x18
    LeftMargin = 4
    Style = ssbsUser
    ViewStyle = ssvsGlyphOnly
  end
  inherited panTitleBar: TssGradientPanel
    Width = 482
    inherited panTitleButtons: TssPanel
      Left = 423
      inherited btnTBMinimize: TssSpeedButton
        Visible = False
      end
      inherited btnTBMaximize: TssSpeedButton
        Visible = False
      end
      inherited btnTBClose: TssSpeedButton
        Visible = False
      end
    end
  end
  inherited panButtons: TPanel
    Top = 161
    Width = 482
    TabOrder = 2
    inherited btnOK: TxButton
      Left = 231
      Top = 1
    end
    inherited btnCancel: TxButton
      Left = 336
      Top = 1
      Width = 142
    end
    inherited btnApply: TxButton
      Left = 9
      Visible = False
    end
  end
  object gbMain: TssGroupBox [3]
    Left = 0
    Top = 55
    Width = 479
    Height = 92
    Alignment = alTopLeft
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = ' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    TabStop = False
    Edges = [beLeft, beRight, beTop, beBottom]
    DesignSize = (
      479
      92)
    object lUser: TLabel
      Left = 20
      Top = 31
      Width = 109
      Height = 16
      Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lPassword: TLabel
      Left = 20
      Top = 60
      Width = 43
      Height = 16
      Caption = #1055#1072#1088#1086#1083#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object txtLang: TLabel
      Left = 157
      Top = 62
      Width = 17
      Height = 16
      Alignment = taRightJustify
      Caption = 'RU'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object txtUser: TssBevel
      Left = 178
      Top = 30
      Width = 287
      Height = 20
      Anchors = [akLeft, akTop, akRight]
      Caption = 'admin'
      ColorGrBegin = clWindow
      ColorGrEnd = clWindow
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Margins.Left = 3
      UseGradient = True
      WordBreak = False
    end
    object lUnlock: TLabel
      Left = 12
      Top = 1
      Width = 191
      Height = 16
      Caption = #1056#1072#1079#1073#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1091' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edPass: TcxTextEdit
      Left = 177
      Top = 55
      Width = 289
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      BeepOnEnter = False
      ParentFont = False
      Properties.EchoMode = eemPassword
      Properties.MaxLength = 24
      Style.StyleController = dmData.scMain
      TabOrder = 0
      ImeName = 'Russian'
      OnKeyPress = edPassKeyPress
    end
  end
  inherited ilTitleBar: TImageList
    Left = 64
    Top = 12
  end
  inherited ActionList: TActionList
    Left = 92
    Top = 12
  end
end
