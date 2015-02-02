inherited frmSetDiscount: TfrmSetDiscount
  Left = 477
  Top = 262
  Width = 381
  Height = 206
  Caption = 'frmSetDiscount'
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 373
    Height = 94
    object bvlMain: TssBevel
      Left = 4
      Top = 0
      Width = 368
      Height = 89
      Anchors = [akLeft, akTop, akRight, akBottom]
      ColorGrBegin = clBtnFace
      ColorGrEnd = clBtnFace
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = True
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object lDisc: TLabel
      Left = 15
      Top = 48
      Width = 213
      Height = 16
      Caption = #1057#1082#1080#1076#1082#1072' '#1076#1083#1103' '#1074#1099#1073#1088#1072#1085#1085#1099#1093' '#1090#1086#1074#1072#1088#1086#1074', %:'
    end
    object ssSpeedButton2: TssSpeedButton
      Left = 213
      Top = 9
      Width = 30
      Height = 28
      Alignment = taCenter
      AllwaysShowFrame = True
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      Caption = '5%'
      Color = 10468256
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      GroupIndex = 0
      ImageIndex = 90
      Images = dmData.Images
      LeftMargin = 4
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsCaptionOnly
      OnClick = ssSpeedButton2Click
    end
    object ssSpeedButton3: TssSpeedButton
      Left = 247
      Top = 9
      Width = 45
      Height = 28
      Alignment = taCenter
      AllwaysShowFrame = True
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      Caption = '7%'
      Color = 8510590
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      GroupIndex = 0
      ImageIndex = 90
      Images = dmData.Images
      LeftMargin = 4
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsCaptionOnly
      OnClick = ssSpeedButton3Click
    end
    object ssSpeedButton4: TssSpeedButton
      Left = 300
      Top = 9
      Width = 65
      Height = 28
      Alignment = taCenter
      AllwaysShowFrame = True
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      Caption = '10%'
      Color = 6877828
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      GroupIndex = 0
      ImageIndex = 90
      Images = dmData.Images
      LeftMargin = 4
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsCaptionOnly
      OnClick = ssSpeedButton4Click
    end
    object edDisc: TssCalcEdit
      Left = 248
      Top = 43
      Width = 116
      Height = 24
      Anchors = [akTop, akRight]
      EditValue = 0.000000000000000000
      ImeName = 'Russian'
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.ImmediatePost = True
      Properties.UseLeftAlignmentOnEditing = False
      Style.StyleController = dmData.scMain
      TabOrder = 0
      OnKeyDown = GoNextKeyDown
      CalcColor = clBtnFace
      DecimalPlaces = 8
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 373
    inherited panTitleButtons: TssPanel
      Left = 315
    end
  end
  inherited panButtons: TPanel
    Top = 141
    Width = 373
    inherited btnOK: TxButton
      Left = 51
    end
    inherited btnCancel: TxButton
      Left = 156
    end
    inherited btnApply: TxButton
      Left = 268
      Top = 4
      Visible = False
    end
  end
  inherited panToolBar: TPanel
    Width = 373
    inherited btnLock: TssSpeedButton
      Left = 321
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 348
    end
    inherited btnHelp: TssSpeedButton
      Left = 292
    end
  end
  inherited ilTitleBar: TImageList
    Left = 96
    Top = 8
  end
  inherited ActionList: TActionList
    Left = 124
    Top = 8
  end
end
