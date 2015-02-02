inherited frmAbout: TfrmAbout
  Left = 431
  Top = 207
  VertScrollBar.Range = 0
  BorderStyle = bsNone
  Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
  ClientHeight = 323
  ClientWidth = 442
  Color = clBlack
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  inherited panTitleBar: TssGradientPanel
    Width = 442
    Visible = False
    inherited panTitleButtons: TssPanel
      Left = 383
      inherited btnTBMinimize: TssSpeedButton
        Left = 1
      end
    end
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 21
    Width = 442
    Height = 302
    Align = alClient
    BevelOuter = bvLowered
    Caption = 'Panel1'
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      442
      302)
    object imgMain: TImage
      Left = 1
      Top = 1
      Width = 440
      Height = 300
      Align = alClient
      OnClick = imgMainClick
    end
    object lCopyRight: TLabel
      Left = 56
      Top = 279
      Width = 126
      Height = 16
      Caption = #169' Irystyle, 2003-2009'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lWWW: TLabel
      Left = 253
      Top = 278
      Width = 35
      Height = 16
      Cursor = crHandPoint
      Caption = '12345'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      Transparent = True
      OnClick = lWWWClick
    end
    object lVersion: TLabel
      Left = 55
      Top = 260
      Width = 114
      Height = 16
      Caption = #1042#1077#1088#1089#1080#1103' 2.5.4 {USA}'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = 8416606
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lRegUserName: TJvgLabel
      Left = 224
      Top = 0
      Width = 96
      Height = 18
      Anchors = [akTop, akRight]
      Caption = 'lRegUserName'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Colors.Shadow = 9803157
      Colors.Highlight = 16382457
      Colors.AutoHighlight = True
      Colors.AutoShadow = True
      FontWeight = fwDONTCARE
      Options = [floActiveWhileControlFocused]
      Gradient.FromColor = clWhite
      Gradient.Active = False
      Gradient.Orientation = fgdHorizontal
      Illumination.ShadowDepth = 6
      Alignment = taLeftJustify
    end
    object lRegEMail: TJvgLabel
      Left = 224
      Top = 24
      Width = 66
      Height = 18
      Anchors = [akTop, akRight]
      Caption = 'lRegEMail'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Colors.Shadow = 9803157
      Colors.Highlight = 16382457
      Colors.AutoHighlight = True
      Colors.AutoShadow = True
      FontWeight = fwDONTCARE
      Options = [floActiveWhileControlFocused]
      Gradient.FromColor = clWhite
      Gradient.Active = False
      Gradient.Orientation = fgdHorizontal
      Illumination.ShadowDepth = 6
      Alignment = taLeftJustify
    end
    object lRegCity: TJvgLabel
      Left = 224
      Top = 48
      Width = 55
      Height = 18
      Anchors = [akTop, akRight]
      Caption = 'lRegCity'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Colors.Shadow = 9803157
      Colors.Highlight = 16382457
      Colors.AutoHighlight = True
      Colors.AutoShadow = True
      FontWeight = fwDONTCARE
      Options = [floActiveWhileControlFocused]
      Gradient.FromColor = clWhite
      Gradient.Active = False
      Gradient.Orientation = fgdHorizontal
      Illumination.ShadowDepth = 6
      Alignment = taLeftJustify
    end
    object lRegNo: TJvgLabel
      Left = 224
      Top = 72
      Width = 48
      Height = 18
      Anchors = [akTop, akRight]
      Caption = 'lRegNo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Colors.Shadow = 9803157
      Colors.Highlight = 16382457
      Colors.AutoHighlight = True
      Colors.AutoShadow = True
      FontWeight = fwDONTCARE
      Options = [floActiveWhileControlFocused]
      Gradient.FromColor = clWhite
      Gradient.Active = False
      Gradient.Orientation = fgdHorizontal
      Illumination.ShadowDepth = 6
      Alignment = taLeftJustify
    end
  end
end
