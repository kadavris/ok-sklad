object frmCommonRef: TfrmCommonRef
  Left = 119
  Top = 146
  Width = 605
  Height = 361
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Reference'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object panBar: TPanel
    Left = 0
    Top = 0
    Width = 597
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object panActionButtons: TPanel
      Left = 0
      Top = 0
      Width = 249
      Height = 29
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object btnNew: TssSpeedButton
        Left = 2
        Top = 2
        Action = aNew
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        ButtonType = ssbtStandard
        Checked = False
        GroupIndex = 0
        HotBorderColor = clGray
        HotTrackColor = clSkyBlue
        ImageIndex = 0
        Images = dmData.Images18x18
        LeftMargin = 4
        Offset = 1
        Style = ssbsFlat
        ViewStyle = ssvsGlyphOnly
      end
      object btnDelEx: TssSpeedButton
        Left = 27
        Top = 2
        Action = aDel
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        ButtonType = ssbtStandard
        Checked = False
        GroupIndex = 0
        HotBorderColor = clGray
        HotTrackColor = clSkyBlue
        ImageIndex = 2
        Images = dmData.Images18x18
        LeftMargin = 4
        Offset = 1
        Style = ssbsFlat
        ViewStyle = ssvsGlyphOnly
      end
      object btnRefreshEx: TssSpeedButton
        Left = 52
        Top = 2
        Action = aRefresh
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        ButtonType = ssbtStandard
        Checked = False
        GroupIndex = 0
        HotBorderColor = clGray
        HotTrackColor = clSkyBlue
        ImageIndex = 3
        Images = dmData.Images18x18
        LeftMargin = 4
        Offset = 1
        Style = ssbsFlat
        ViewStyle = ssvsGlyphOnly
      end
      object btnProps: TssSpeedButton
        Left = 77
        Top = 2
        Action = aProps
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        ButtonType = ssbtStandard
        Checked = False
        GroupIndex = 0
        HotBorderColor = clGray
        HotTrackColor = clSkyBlue
        ImageIndex = 1
        Images = dmData.Images18x18
        LeftMargin = 4
        Offset = 1
        Style = ssbsFlat
        ViewStyle = ssvsGlyphOnly
      end
      object sepDyn: TBevel
        Left = 104
        Top = 3
        Width = 4
        Height = 23
        Shape = bsLeftLine
      end
      object ssSpeedButton3: TssSpeedButton
        Left = 107
        Top = 2
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        ButtonType = ssbtChecked
        Checked = False
        GroupIndex = 0
        HotBorderColor = clGray
        HotTrackColor = clSkyBlue
        ImageIndex = 9
        Images = dmData.Images18x18
        LeftMargin = 4
        Offset = 1
        Style = ssbsFlat
        ViewStyle = ssvsGlyphOnly
      end
      object sepPrint: TBevel
        Left = 134
        Top = 3
        Width = 4
        Height = 23
        Shape = bsLeftLine
        Visible = False
      end
      object btnPrint: TssSpeedButton
        Left = 137
        Top = 2
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        ButtonType = ssbtStandard
        Checked = False
        GroupIndex = 0
        HotBorderColor = clGray
        HotTrackColor = clSkyBlue
        ImageIndex = 6
        Images = dmData.Images18x18
        LeftMargin = 4
        Offset = 1
        Style = ssbsFlat
        ViewStyle = ssvsGlyphOnly
        Visible = False
      end
      object btnExcel: TssSpeedButton
        Left = 162
        Top = 2
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        ButtonType = ssbtStandard
        Checked = False
        GroupIndex = 0
        HotBorderColor = clGray
        HotTrackColor = clSkyBlue
        ImageIndex = 20
        Images = dmData.Images18x18
        LeftMargin = 4
        Offset = 1
        Style = ssbsFlat
        ViewStyle = ssvsGlyphOnly
        Visible = False
      end
    end
    object panDirUp: TPanel
      Left = 249
      Top = 0
      Width = 76
      Height = 29
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
    end
    object panBarFind: TPanel
      Left = 325
      Top = 0
      Width = 132
      Height = 29
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 2
      DesignSize = (
        132
        29)
      object edFind: TcxTextEdit
        Left = 4
        Top = 3
        Width = 125
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Style.BorderStyle = ebsUltraFlat
        Style.Edges = []
        TabOrder = 0
        Visible = False
      end
    end
    object panBarFindButtons: TPanel
      Left = 457
      Top = 0
      Width = 105
      Height = 29
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 3
      object btnFind: TssSpeedButton
        Left = 4
        Top = 2
        Action = aFind
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        ButtonType = ssbtStandard
        Checked = False
        GroupIndex = 0
        HotBorderColor = clGray
        HotTrackColor = clSkyBlue
        ImageIndex = 18
        Images = dmData.Images18x18
        LeftMargin = 4
        Offset = 1
        Style = ssbsFlat
        ViewStyle = ssvsGlyphOnly
      end
      object btnFindParams: TssSpeedButton
        Left = 29
        Top = 2
        Action = aFindProps
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        ButtonType = ssbtStandard
        Checked = False
        GroupIndex = 0
        HotBorderColor = clGray
        HotTrackColor = clSkyBlue
        ImageIndex = 19
        Images = dmData.Images18x18
        LeftMargin = 4
        Offset = 1
        Style = ssbsFlat
        ViewStyle = ssvsGlyphOnly
      end
    end
    object panBarHelp: TPanel
      Left = 562
      Top = 0
      Width = 35
      Height = 29
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 4
      object ssSpeedButton4: TssSpeedButton
        Left = 6
        Top = 2
        Action = aHelp
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        ButtonType = ssbtStandard
        Checked = False
        GroupIndex = 0
        HotBorderColor = clGray
        HotTrackColor = clSkyBlue
        ImageIndex = 7
        Images = dmData.Images18x18
        LeftMargin = 4
        Offset = 1
        Style = ssbsFlat
        ViewStyle = ssvsGlyphOnly
      end
    end
  end
  object ActionList1: TActionList
    Left = 24
    Top = 84
    Images = dmData.Images18x18
    object aNew: TAction
      Category = 'All'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 0
      ShortCut = 45
      OnExecute = aNewExecute
    end
    object aProps: TAction
      Tag = 1
      Category = 'All'
      Caption = #1057#1074#1086#1081#1089#1090#1074#1072
      ImageIndex = 1
      ShortCut = 16397
      OnExecute = aPropsExecute
    end
    object aDel: TAction
      Category = 'All'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 2
      ShortCut = 46
      OnExecute = aDelExecute
    end
    object aRefresh: TAction
      Category = 'All'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 3
      ShortCut = 116
      OnExecute = aRefreshExecute
    end
    object aDyn: TAction
      Category = 'All'
      Caption = 'aDyn'
      ImageIndex = 9
      OnExecute = aDynExecute
    end
    object aHelp: TAction
      Category = 'All'
      Caption = 'aHelp'
      ImageIndex = 7
      ShortCut = 112
    end
    object aFind: TAction
      Category = 'All'
      Caption = 'aFind'
      ImageIndex = 18
    end
    object aFindProps: TAction
      Category = 'All'
      Caption = 'aFindProps'
      ImageIndex = 19
    end
  end
  object FormStorage: TssFormStorage
    Left = 56
    Top = 84
    Active = False
    UseRegistry = True
    StoredValues = <>
  end
end
