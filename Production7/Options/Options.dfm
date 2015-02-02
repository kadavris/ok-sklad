inherited frmOptions: TfrmOptions
  Left = 509
  Top = 188
  VertScrollBar.Range = 0
  ActiveControl = tvMain
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 703
  ClientWidth = 848
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panTitleBar: TssGradientPanel
    Width = 848
    TabOrder = 2
    inherited panTitleButtons: TssPanel
      Left = 789
    end
  end
  inherited panButtons: TPanel
    Top = 673
    Width = 848
    inherited btnOK: TxButton
      Left = 538
    end
    inherited btnCancel: TxButton
      Left = 641
    end
    inherited btnApply: TxButton
      Left = 745
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 21
    Width = 848
    Height = 652
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      848
      652)
    object btnLock: TssSpeedButton
      Left = 758
      Top = 2
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 90
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnLockClick
    end
    object btnHelp: TssSpeedButton
      Left = 815
      Top = 2
      Action = aHelp
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 10
      Images = dmData.Images
      LeftMargin = 3
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object btnSendErrMessage: TssSpeedButton
      Left = 786
      Top = 2
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 129
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnSendErrMessageClick
    end
    object tvMain: TcxTreeView
      Left = 2
      Top = 37
      Width = 272
      Height = 598
      Anchors = [akLeft, akTop, akBottom]
      Style.BorderColor = clGray
      Style.BorderStyle = cbsSingle
      Style.HotTrack = False
      Style.LookAndFeel.Kind = lfStandard
      TabOrder = 0
      OnMouseUp = tvMainMouseUp
      HideSelection = False
      HotTrack = True
      Images = dmData.ImagesTree
      Indent = 21
      MultiSelectStyle = [msControlSelect]
      ReadOnly = True
      RightClickSelect = True
      OnChange = tvMainChange
    end
    object panMain: TssImagePanel
      Left = 279
      Top = 31
      Width = 565
      Height = 604
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      Picture.Data = {07544269746D617000000000}
      object pcMain: TcxPageControl
        Left = 0
        Top = 0
        Width = 565
        Height = 604
        ActivePage = tsCommon
        Align = alClient
        TabOrder = 0
        object tsCommon: TcxTabSheet
          Caption = 'tsCommon'
          ImageIndex = 0
          TabVisible = False
          object gbCommon: TssGroupBox
            Left = 0
            Top = 0
            Width = 565
            Height = 604
            Align = alClient
            Alignment = alTopLeft
            Caption = 'gbCommon'
            TabOrder = 0
            Edges = [beLeft, beRight, beTop, beBottom]
            DesignSize = (
              565
              604)
            object lLang: TLabel
              Left = 20
              Top = 28
              Width = 29
              Height = 16
              Caption = #1071#1079#1099#1082
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lChargeType: TLabel
              Left = 20
              Top = 228
              Width = 161
              Height = 16
              Caption = #1052#1077#1090#1086#1076' '#1089#1087#1080#1089#1072#1085#1080#1103' '#1089#1086' '#1089#1082#1083#1072#1076#1072':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lRepLang: TLabel
              Left = 20
              Top = 63
              Width = 150
              Height = 16
              Caption = #1071#1079#1099#1082' '#1076#1083#1103' '#1087#1077#1095#1072#1090#1080' '#1086#1090#1095#1105#1090#1086#1074
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lPrintType: TLabel
              Left = 20
              Top = 262
              Width = 233
              Height = 16
              Caption = #1055#1088#1080' '#1087#1077#1095#1072#1090#1080' '#1085#1072#1082#1083#1072#1076#1085#1099#1093' '#1091#1082#1072#1079#1099#1074#1072#1090#1100' '#1094#1077#1085#1099
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lShowPricePrec: TLabel
              Left = 20
              Top = 297
              Width = 202
              Height = 16
              Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1094#1077#1085#1099' '#1089' '#1090#1086#1095#1085#1086#1089#1090#1100#1102' '#1076#1086
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lDigAfterPoint: TLabel
              Left = 359
              Top = 297
              Width = 129
              Height = 16
              Caption = #1079#1085#1072#1082#1086#1074' '#1087#1086#1089#1083#1077' '#1079#1072#1087#1103#1090#1086#1081
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lMatPrecision: TLabel
              Left = 20
              Top = 331
              Width = 238
              Height = 16
              Caption = #1044#1083#1103' '#1082#1086#1083'-'#1074#1072' '#1090#1086#1074#1072#1088#1072' '#1091#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1090#1086#1095#1085#1086#1089#1090#1100
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lMatPrecisionEx: TLabel
              Left = 359
              Top = 331
              Width = 129
              Height = 16
              Caption = #1079#1085#1072#1082#1086#1074' '#1087#1086#1089#1083#1077' '#1079#1072#1087#1103#1090#1086#1081
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lMultiEntsViewType: TLabel
              Left = 20
              Top = 359
              Width = 262
              Height = 42
              AutoSize = False
              Caption = 
                #1042' '#1089#1083#1091#1095#1072#1077' '#1074#1077#1076#1077#1085#1080#1103' '#1091#1095#1077#1090#1072' '#1086#1090' '#1085#1077#1089#1082#1086#1083#1100#1082#1080#1093' '#1102#1088'. '#1083#1080#1094' '#1087#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090 +
                #1099
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              WordWrap = True
            end
            object cbLang: TcxComboBox
              Left = 290
              Top = 23
              Width = 205
              Height = 24
              Anchors = [akLeft, akTop, akRight]
              ImeName = 'Russian'
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 0
              OnKeyPress = GoNext
            end
            object cbChargeType: TcxComboBox
              Left = 290
              Top = 223
              Width = 263
              Height = 24
              Anchors = [akLeft, akTop, akRight]
              ImeName = 'Russian'
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 9
              OnKeyPress = GoNext
            end
            object cbRepLang: TcxComboBox
              Left = 290
              Top = 58
              Width = 205
              Height = 24
              Anchors = [akLeft, akTop, akRight]
              ImeName = 'Russian'
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 1
              OnKeyPress = GoNext
            end
            object cbPrintType: TcxComboBox
              Left = 290
              Top = 257
              Width = 205
              Height = 24
              Anchors = [akLeft, akTop, akRight]
              ImeName = 'Russian'
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.OnChange = DataModified
              Properties.OnEditValueChanged = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 2
              OnKeyPress = GoNext
            end
            object chbDelToBin: TcxCheckBox
              Left = 12
              Top = 410
              Width = 484
              Height = 24
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1059#1076#1072#1083#1103#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1074' '#1082#1086#1088#1079#1080#1085#1091
              Style.StyleController = dmData.scMain
              TabOrder = 6
              ImeName = 'Russian'
            end
            object chbFilterOnSearch: TcxCheckBox
              Left = 12
              Top = 439
              Width = 484
              Height = 24
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1060#1080#1083#1100#1090#1088#1086#1074#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1087#1088#1080' '#1087#1086#1080#1089#1082#1077
              Style.StyleController = dmData.scMain
              TabOrder = 7
              ImeName = 'Russian'
            end
            object edShowPricePrec: TcxSpinEdit
              Left = 290
              Top = 290
              Width = 61
              Height = 24
              ParentFont = False
              Properties.MaxValue = 6.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 3
              Value = 2
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object chbShowCalc: TcxCheckBox
              Left = 12
              Top = 469
              Width = 541
              Height = 24
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = 
                #1044#1083#1103' '#1095#1080#1089#1083#1086#1074#1099#1093' '#1087#1086#1083#1077#1081' '#1074#1074#1086#1076#1072' '#1086#1090#1082#1088#1099#1074#1072#1090#1100' '#1082#1072#1083#1100#1082#1091#1083#1103#1090#1086#1088' '#1087#1088#1080' '#1087#1086#1087#1099#1090#1082#1077' '#1074#1074#1086#1076#1072 +
                ' '#1095#1080#1089#1083#1072
              Style.StyleController = dmData.scMain
              TabOrder = 8
              ImeName = 'Russian'
            end
            object edMatPrecision: TcxSpinEdit
              Left = 290
              Top = 325
              Width = 61
              Height = 24
              ParentFont = False
              Properties.MaxValue = 6.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 4
              Value = 4
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object cbMultiEntsViewType: TcxComboBox
              Left = 290
              Top = 364
              Width = 205
              Height = 24
              Anchors = [akLeft, akTop, akRight]
              ImeName = 'Russian'
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.OnChange = DataModified
              Properties.OnEditValueChanged = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 5
              OnKeyPress = GoNext
            end
            object panAccRul: TPanel
              Left = 10
              Top = 95
              Width = 543
              Height = 83
              BevelInner = bvLowered
              Color = 2121983
              ParentBackground = False
              TabOrder = 10
              DesignSize = (
                543
                83)
              object LCountryOfOp: TLabel
                Left = 14
                Top = 15
                Width = 171
                Height = 16
                Caption = #1057#1090#1088#1072#1085#1072' '#1073#1080#1079#1085#1077#1089' '#1076#1077#1103#1090#1077#1083#1100#1085#1086#1089#1090#1080
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object lAccRules: TLabel
                Left = 16
                Top = 52
                Width = 94
                Height = 16
                Caption = 'Accounting rules'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object cbCountryOfOp: TcxImageComboBox
                Left = 213
                Top = 11
                Width = 310
                Height = 24
                ImeName = 'Russian'
                Properties.Items = <>
                Properties.OnChange = DataModified
                TabOrder = 0
                OnKeyPress = GoNext
              end
              object cbAccRules: TcxComboBox
                Left = 345
                Top = 47
                Width = 178
                Height = 24
                Anchors = [akLeft, akTop, akRight]
                ImeName = 'Russian'
                ParentFont = False
                Properties.DropDownListStyle = lsFixedList
                Properties.OnChange = DataModified
                Style.StyleController = dmData.scMain
                TabOrder = 1
                OnKeyPress = GoNext
              end
              object chbAccRules: TcxCheckBox
                Left = 209
                Top = 47
                Width = 120
                Height = 24
                ParentFont = False
                Properties.DisplayUnchecked = 'False'
                Properties.OnChange = chbAccRulesPropertiesChange
                Properties.Caption = #1055#1086'-'#1091#1084#1086#1083#1095#1072#1085#1080#1102
                State = cbsChecked
                Style.BorderColor = clBlack
                Style.BorderStyle = ebsThick
                TabOrder = 2
                ImeName = 'Russian'
              end
            end
          end
        end
        object tsEntParams: TcxTabSheet
          Caption = 'tsEntParams'
          ImageIndex = 0
          TabVisible = False
          object gbEnt: TssGroupBox
            Left = 0
            Top = 0
            Width = 565
            Height = 604
            Align = alClient
            Alignment = alTopLeft
            Caption = 'gbEnt'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Edges = [beLeft, beRight, beTop, beBottom]
            DesignSize = (
              565
              604)
            object lEntName: TLabel
              Left = 18
              Top = 30
              Width = 91
              Height = 16
              Caption = #1057#1086#1082#1088'. '#1085#1072#1079#1074#1072#1085#1080#1077
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lEntAddr: TLabel
              Left = 18
              Top = 130
              Width = 35
              Height = 16
              Caption = #1040#1076#1088#1077#1089
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lEntPhone: TLabel
              Left = 18
              Top = 187
              Width = 53
              Height = 16
              Caption = #1058#1077#1083#1077#1092#1086#1085
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lEntOKPO: TLabel
              Left = 18
              Top = 256
              Width = 33
              Height = 16
              Caption = #1054#1050#1055#1054
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lKPP: TLabel
              Left = 18
              Top = 283
              Width = 23
              Height = 16
              Caption = #1050#1055#1055
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lEntINN: TLabel
              Left = 18
              Top = 350
              Width = 24
              Height = 16
              Caption = #1048#1053#1053
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              Visible = False
            end
            object lEntCertNum: TLabel
              Left = 18
              Top = 377
              Width = 54
              Height = 16
              Caption = #8470' '#1089#1074#1080#1076'. '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              Visible = False
            end
            object lFullName: TLabel
              Left = 18
              Top = 54
              Width = 102
              Height = 16
              Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object edEntName: TcxTextEdit
              Left = 177
              Top = 25
              Width = 377
              Height = 24
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Properties.MaxLength = 255
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 0
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object memEntAddr: TcxMemo
              Left = 177
              Top = 126
              Width = 377
              Height = 55
              Anchors = [akLeft, akTop, akRight]
              ImeName = 'Russian'
              ParentFont = False
              Properties.MaxLength = 255
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 2
              OnKeyDown = GoNextKeyDown
            end
            object edEntPhone: TcxTextEdit
              Left = 177
              Top = 182
              Width = 377
              Height = 24
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Properties.MaxLength = 48
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 3
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edEntOKPO: TcxTextEdit
              Left = 177
              Top = 251
              Width = 256
              Height = 24
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Properties.MaxLength = 14
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 4
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edKPP: TcxTextEdit
              Left = 177
              Top = 278
              Width = 256
              Height = 24
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Properties.MaxLength = 64
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 5
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object chbNDSPayer: TcxCheckBox
              Left = 14
              Top = 320
              Width = 184
              Height = 24
              ParentFont = False
              Properties.Alignment = taRightJustify
              Properties.DisplayUnchecked = 'False'
              Properties.Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082' '#1053#1044#1057
              TabOrder = 6
              ImeName = 'Russian'
              OnClick = chbNDSPayerClick
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edEntINN: TcxTextEdit
              Left = 177
              Top = 345
              Width = 256
              Height = 24
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Properties.MaxLength = 20
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 7
              Visible = False
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edEntCertNum: TcxTextEdit
              Left = 177
              Top = 372
              Width = 256
              Height = 24
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Properties.MaxLength = 15
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 8
              Visible = False
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object memFullName: TcxMemo
              Left = 177
              Top = 52
              Width = 377
              Height = 58
              Anchors = [akLeft, akTop, akRight]
              ImeName = 'Russian'
              ParentFont = False
              Properties.MaxLength = 255
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 1
              OnKeyDown = GoNextKeyDown
            end
            object chbMultiCurrency: TcxCheckBox
              Left = 12
              Top = 412
              Width = 541
              Height = 24
              Enabled = False
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077' '#1088#1072#1073#1086#1090#1072#1077#1090' '#1089' '#1085#1077#1089#1082#1086#1083#1100#1082#1080#1084#1080' '#1074#1072#1083#1102#1090#1072#1084#1080
              State = cbsChecked
              Style.StyleController = dmData.scMain
              TabOrder = 9
              ImeName = 'Russian'
            end
          end
        end
        object tsIntf: TcxTabSheet
          Caption = 'tsIntf'
          ImageIndex = 0
          TabVisible = False
          object gbIntf: TssGroupBox
            Left = 0
            Top = 0
            Width = 565
            Height = 604
            Align = alClient
            Alignment = alTopLeft
            Caption = 'gbIntf'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Edges = [beLeft, beRight, beTop, beBottom]
            object cbOddColor: TcxColorComboBox
              Left = 359
              Top = 34
              Width = 184
              Height = 24
              ImeName = 'Russian'
              ParentFont = False
              Properties.AllowSelectColor = True
              Properties.DefaultDescription = 'Color not selected'
              Properties.ShowDescriptions = False
              Properties.OnChange = DataModified
              Properties.OnEditValueChanged = DataModified
              Properties.Items = <>
              Properties.PrepareInfo = ''
              Style.StyleController = dmData.scMain
              TabOrder = 0
            end
            object chbNextCtrlOnEnter: TcxCheckBox
              Left = 12
              Top = 69
              Width = 541
              Height = 24
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = 
                #1042' '#1076#1080#1072#1083#1086#1075#1072#1093' '#1087#1077#1088#1077#1093#1086#1076#1080#1090#1100' '#1082' '#1089#1083#1077#1076#1091#1102#1097#1077#1084#1091' '#1087#1086#1083#1102' '#1074#1074#1086#1076#1072' '#1087#1086' '#1085#1072#1078#1072#1090#1080#1102' '#1085#1072' <Ent' +
                'er>'
              Style.StyleController = dmData.scMain
              TabOrder = 1
              ImeName = 'Russian'
            end
            object lOddColor: TcxLabel
              Left = 20
              Top = 37
              Width = 183
              Height = 20
              ParentFont = False
              Style.StyleController = dmData.scMain4Labels
              TabOrder = 2
              ImeName = 'Russian'
              Caption = #1042#1099#1076#1077#1083#1103#1090#1100' '#1095#1105#1090#1085#1099#1077' '#1094#1074#1077#1090#1086#1084
            end
            object gbFonts: TGroupBox
              Left = 10
              Top = 108
              Width = 543
              Height = 90
              Caption = ' Fonts '
              TabOrder = 3
              object lMainFont: TcxLabel
                Left = 20
                Top = 20
                Width = 119
                Height = 21
                AutoSize = False
                ParentFont = False
                Properties.Alignment.Horz = taRightJustify
                Style.StyleController = dmData.scMain4Labels
                TabOrder = 0
                ImeName = 'Russian'
                Caption = 'Main font'
              end
              object lGridFont: TcxLabel
                Left = 20
                Top = 55
                Width = 119
                Height = 21
                AutoSize = False
                ParentFont = False
                Properties.Alignment.Horz = taRightJustify
                Style.StyleController = dmData.scMain4Labels
                TabOrder = 1
                ImeName = 'Russian'
                Caption = 'Grids font'
              end
              object cbMainFontColor: TcxColorComboBox
                Left = 409
                Top = 18
                Width = 124
                Height = 24
                ImeName = 'Russian'
                ParentFont = False
                Properties.AllowSelectColor = True
                Properties.DefaultColor = clBlack
                Properties.DefaultDescription = 'Color not selected'
                Properties.ShowDescriptions = False
                Properties.OnChange = DataModified
                Properties.OnEditValueChanged = DataModified
                Properties.Items = <>
                Properties.PrepareInfo = ''
                Style.StyleController = dmData.scMain
                TabOrder = 2
              end
              object cbGridsFontColor: TcxColorComboBox
                Left = 409
                Top = 54
                Width = 124
                Height = 24
                ImeName = 'Russian'
                ParentFont = False
                Properties.AllowSelectColor = True
                Properties.DefaultColor = clBlack
                Properties.DefaultDescription = 'Color not selected'
                Properties.ShowDescriptions = False
                Properties.OnChange = DataModified
                Properties.OnEditValueChanged = DataModified
                Properties.Items = <>
                Properties.PrepareInfo = ''
                Style.StyleController = dmData.scMain
                TabOrder = 3
              end
              object cbMainFont: TcxFontNameComboBox
                Left = 148
                Top = 18
                Width = 198
                Height = 24
                ParentFont = False
                Properties.FontTypes = [cxftTTF]
                Properties.OnChange = DataModified
                Properties.OnEditValueChanged = DataModified
                Style.StyleController = dmData.scMain
                TabOrder = 4
                ImeName = 'Russian'
              end
              object cbGridsFont: TcxFontNameComboBox
                Left = 148
                Top = 54
                Width = 198
                Height = 24
                ParentFont = False
                Properties.FontTypes = [cxftTTF]
                Properties.OnChange = DataModified
                Properties.OnEditValueChanged = DataModified
                Style.StyleController = dmData.scMain
                TabOrder = 5
                ImeName = 'Russian'
              end
              object seMainFont: TcxSpinEdit
                Left = 352
                Top = 18
                Width = 50
                Height = 24
                ParentFont = False
                Properties.MaxValue = 50.000000000000000000
                Properties.MinValue = 6.000000000000000000
                Properties.OnChange = DataModified
                Properties.OnEditValueChanged = DataModified
                Style.StyleController = dmData.scMain
                TabOrder = 6
                Value = 6
                ImeName = 'Russian'
              end
              object seGridsFont: TcxSpinEdit
                Left = 352
                Top = 54
                Width = 50
                Height = 24
                ParentFont = False
                Properties.MaxValue = 50.000000000000000000
                Properties.MinValue = 6.000000000000000000
                Properties.OnChange = DataModified
                Properties.OnEditValueChanged = DataModified
                Style.StyleController = dmData.scMain
                TabOrder = 7
                Value = 6
                ImeName = 'Russian'
              end
            end
          end
        end
        object tsLogo: TcxTabSheet
          Caption = 'tsLogo'
          ImageIndex = 0
          TabVisible = False
          object gbLogo: TssGroupBox
            Left = 0
            Top = 0
            Width = 565
            Height = 604
            Align = alClient
            Alignment = alTopLeft
            Caption = 'gbLogo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Edges = [beLeft, beRight, beTop, beBottom]
            DesignSize = (
              565
              604)
            object lLogo: TLabel
              Left = 20
              Top = 30
              Width = 175
              Height = 16
              Caption = #1051#1086#1075#1086#1090#1080#1087' '#1042#1072#1096#1077#1075#1086' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object btnLogo: TssSpeedButton
              Left = 263
              Top = 22
              Width = 29
              Height = 28
              Alignment = taLeftJustify
              AllwaysShowFrame = False
              Anchors = [akTop, akRight]
              ButtonType = ssbtStandard
              Checked = False
              GroupIndex = 0
              ImageIndex = 8
              Images = dmData.Images
              LeftMargin = 3
              ParentShowHint = False
              ShowHint = True
              Style = ssbsUser
              ViewStyle = ssvsGlyphOnly
              OnClick = btnLogoClick
            end
            object ssBevel1: TssBevel
              Left = 20
              Top = 57
              Width = 528
              Height = 1
              ColorGrBegin = clBtnFace
              ColorGrEnd = clBtnFace
              ColorInner = clBtnShadow
              ColorOuter = clBtnHighlight
              Edges = [beLeft, beRight, beTop, beBottom]
              GradientDirection = gdHorizontal
              HotTrack = False
              ImageIndex = 0
              Shape = bsTopLine
              UseGradient = False
            end
            object btnClear: TssSpeedButton
              Left = 492
              Top = 22
              Width = 29
              Height = 28
              Alignment = taLeftJustify
              AllwaysShowFrame = False
              Anchors = [akTop, akRight]
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              GroupIndex = 0
              ImageIndex = 2
              Images = dmData.Images18x18
              LeftMargin = 3
              ParentShowHint = False
              ShowHint = True
              Style = ssbsUser
              ViewStyle = ssvsGlyphOnly
              OnClick = btnClearClick
            end
            object btnUndo: TssSpeedButton
              Left = 521
              Top = 22
              Width = 28
              Height = 28
              Alignment = taLeftJustify
              AllwaysShowFrame = False
              Anchors = [akTop, akRight]
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              GroupIndex = 0
              ImageIndex = 37
              Images = dmData.Images18x18
              LeftMargin = 3
              ParentShowHint = False
              ShowHint = True
              Style = ssbsUser
              ViewStyle = ssvsGlyphOnly
              OnClick = btnUndoClick
            end
            object panLogo: TPanel
              Left = 20
              Top = 69
              Width = 529
              Height = 522
              Anchors = [akLeft, akTop, akRight, akBottom]
              BevelOuter = bvNone
              ParentBackground = False
              TabOrder = 0
              object imgBevel: TJvBevel
                Left = 0
                Top = 0
                Width = 95
                Height = 95
                Style = bsCustomStyle
                Inner = bvRaised
                Outer = bvRaised
                HorizontalLines.Count = 4
                VerticalLines.Count = 4
                VerticalLines.Style = bvRaised
              end
              object imgLogo: TImage
                Left = 5
                Top = 5
                Width = 85
                Height = 85
                Proportional = True
              end
            end
          end
        end
        object tsOperLog: TcxTabSheet
          Caption = 'tsOperLog'
          ImageIndex = 0
          TabVisible = False
          object gbOperLog: TssGroupBox
            Left = 0
            Top = 0
            Width = 565
            Height = 533
            Align = alClient
            Alignment = alTopLeft
            Caption = 'gbOperLog'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Edges = [beLeft, beRight, beTop, beBottom]
            object chbOperLog: TcxCheckBox
              Left = 15
              Top = 30
              Width = 543
              Height = 25
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1042#1077#1089#1090#1080' '#1078#1091#1088#1085#1072#1083' '#1089#1086#1073#1099#1090#1080#1081
              State = cbsChecked
              Style.StyleController = dmData.scMain
              TabOrder = 0
              ImeName = 'Russian'
              OnClick = chbOperLogClick
            end
            object chbWB: TcxCheckBox
              Left = 34
              Top = 59
              Width = 519
              Height = 26
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1055#1088#1080#1093#1086#1076#1085#1099#1077'/'#1088#1072#1089#1093#1086#1076#1085#1099#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077', '#1089#1095#1077#1090#1072
              Style.StyleController = dmData.scMain
              TabOrder = 1
              ImeName = 'Russian'
            end
            object chbPayDoc: TcxCheckBox
              Left = 34
              Top = 84
              Width = 519
              Height = 26
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1055#1083#1072#1090#1077#1078#1080
              Style.StyleController = dmData.scMain
              TabOrder = 2
              ImeName = 'Russian'
            end
            object chbTax: TcxCheckBox
              Left = 34
              Top = 108
              Width = 519
              Height = 26
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1053#1072#1083#1086#1075#1086#1074#1099#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
              Style.StyleController = dmData.scMain
              TabOrder = 3
              ImeName = 'Russian'
            end
            object chbMat: TcxCheckBox
              Left = 34
              Top = 148
              Width = 519
              Height = 26
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1058#1086#1074#1072#1088#1099
              Style.StyleController = dmData.scMain
              TabOrder = 4
              ImeName = 'Russian'
            end
            object chbKA: TcxCheckBox
              Left = 34
              Top = 172
              Width = 519
              Height = 26
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090#1099
              Style.StyleController = dmData.scMain
              TabOrder = 5
              ImeName = 'Russian'
            end
            object chbCurrency: TcxCheckBox
              Left = 34
              Top = 197
              Width = 519
              Height = 26
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1042#1072#1083#1102#1090#1072
              Style.StyleController = dmData.scMain
              TabOrder = 6
              ImeName = 'Russian'
            end
            object chbMeasures: TcxCheckBox
              Left = 34
              Top = 246
              Width = 519
              Height = 26
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1045#1076#1080#1085#1080#1094#1099' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
              Style.StyleController = dmData.scMain
              TabOrder = 7
              ImeName = 'Russian'
            end
            object chbWHouses: TcxCheckBox
              Left = 34
              Top = 271
              Width = 519
              Height = 26
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1057#1082#1083#1072#1076#1099
              Style.StyleController = dmData.scMain
              TabOrder = 8
              ImeName = 'Russian'
            end
            object chbAccTypes: TcxCheckBox
              Left = 34
              Top = 295
              Width = 519
              Height = 26
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1058#1080#1087#1099' '#1089#1095#1077#1090#1086#1074
              Style.StyleController = dmData.scMain
              TabOrder = 9
              ImeName = 'Russian'
            end
            object chbCountries: TcxCheckBox
              Left = 34
              Top = 320
              Width = 519
              Height = 26
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1057#1090#1088#1072#1085#1099
              Style.StyleController = dmData.scMain
              TabOrder = 10
              ImeName = 'Russian'
            end
            object chbMatGroups: TcxCheckBox
              Left = 34
              Top = 345
              Width = 519
              Height = 25
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1043#1088#1091#1087#1087#1099' '#1090#1086#1074#1072#1088#1086#1074
              Style.StyleController = dmData.scMain
              TabOrder = 11
              ImeName = 'Russian'
            end
            object chbPriceTypes: TcxCheckBox
              Left = 34
              Top = 369
              Width = 519
              Height = 26
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1062#1077#1085#1086#1074#1099#1077' '#1082#1072#1090#1077#1075#1086#1088#1080#1080
              Style.StyleController = dmData.scMain
              TabOrder = 12
              ImeName = 'Russian'
            end
            object chbBanks: TcxCheckBox
              Left = 34
              Top = 222
              Width = 519
              Height = 25
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1041#1072#1085#1082#1080
              Style.StyleController = dmData.scMain
              TabOrder = 13
              ImeName = 'Russian'
            end
          end
        end
        object tsCurrency: TcxTabSheet
          Caption = 'tsCurrency'
          ImageIndex = 0
          TabVisible = False
          object gbCurrency: TssGroupBox
            Left = 0
            Top = 0
            Width = 565
            Height = 533
            Align = alClient
            Alignment = alTopLeft
            Caption = 'gbCurrency'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Edges = [beLeft, beRight, beTop, beBottom]
            object lCheckCurrency: TLabel
              Left = 49
              Top = 44
              Width = 504
              Height = 70
              AutoSize = False
              Caption = 
                #1044#1083#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074' '#1074' '#1074#1072#1083#1102#1090#1077', '#1086#1090#1083#1080#1095#1085#1086#1081' '#1086#1090' '#1073#1072#1079#1086#1074#1086#1081', '#1087#1088#1086#1074#1077#1088#1103#1090#1100', '#1091#1089#1090#1072#1085#1086#1074 +
                #1083#1077#1085' '#1083#1080' '#1082#1091#1088#1089' '#1085#1072' '#1076#1072#1090#1091' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              WordWrap = True
            end
            object chbCheckCurrency: TcxCheckBox
              Left = 20
              Top = 39
              Width = 26
              Height = 26
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = ''
              Style.StyleController = dmData.scMain
              TabOrder = 0
              ImeName = 'Russian'
            end
          end
        end
        object tsWBIn: TcxTabSheet
          Caption = 'tsWBIn'
          ImageIndex = 0
          TabVisible = False
          OnShow = tsWBInShow
          object gbWBIn: TssGroupBox
            Left = 0
            Top = 0
            Width = 565
            Height = 604
            Align = alClient
            Alignment = alTopLeft
            Caption = 'gbWBIn'
            TabOrder = 0
            Edges = [beLeft, beRight, beTop, beBottom]
            object lWBInDefAmount: TssLabel
              Left = 26
              Top = 34
              Width = 361
              Height = 16
              Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1090#1086#1074#1072#1088#1072', '#1087#1088#1077#1076#1083#1072#1075#1072#1077#1084#1086#1077' '#1076#1083#1103' '#1074#1074#1086#1076#1072' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddStandard
              DisabledColor = clBlack
            end
            object lWBInPrefix: TssLabel
              Left = 44
              Top = 107
              Width = 56
              Height = 16
              Caption = #1055#1088#1077#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lWBInCurrNum: TssLabel
              Left = 182
              Top = 107
              Width = 97
              Height = 16
              Caption = #1058#1077#1082#1091#1097#1080#1081' '#1085#1086#1084#1077#1088':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lWBInSuffix: TssLabel
              Left = 384
              Top = 107
              Width = 58
              Height = 16
              Caption = #1057#1091#1092#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lWBInAddType: TssLabel
              Left = 26
              Top = 337
              Width = 335
              Height = 46
              AutoSize = False
              Caption = 
                #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102' ('#1087#1088#1080' '#1085#1072#1078#1072#1090#1080#1080' '#1085#1072' '#1082#1085#1086#1087#1082#1091' "'#1044#1086#1073#1072#1074#1080#1090#1100'") '#1076#1086#1073#1072#1074#1083#1103#1090#1100' '#1074' '#1085#1072#1082#1083 +
                #1072#1076#1085#1091#1102':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              WordWrap = True
              DisabledDraw = ddStandard
              DisabledColor = clBlack
            end
            object lWBInShowModel: TokLabel
              Left = 25
              Top = 398
              Width = 128
              Height = 16
              Caption = 'Item name printed as:'
              DisabledDraw = ddStandard
              DisabledColor = clBlack
            end
            object lWbInRepSort: TokLabel
              Left = 25
              Top = 432
              Width = 248
              Height = 16
              Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086#1079#1080#1094#1080#1080' '#1074' '#1087#1077#1095#1072#1090#1085#1099#1093' '#1092#1086#1088#1084#1072#1093
              DisabledDraw = ddStandard
              DisabledColor = clBlack
            end
            object btnWBInRepSortDesc: TssSpeedButton
              Left = 438
              Top = 425
              Width = 79
              Height = 30
              Alignment = taLeftJustify
              AllwaysShowFrame = True
              ButtonType = ssbtChecked
              Checked = True
              Caption = 'Z -> A'
              GroupIndex = 0
              ImageIndex = 20
              Images = dmData.Images
              LeftMargin = 4
              Style = ssbsFlat
              ViewStyle = ssvsCaptionGlyph
              OnClick = btnWBOutRepSortDescClick
            end
            object chbWBInAllowZero: TcxCheckBox
              Left = 20
              Top = 162
              Width = 528
              Height = 26
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1087#1088#1080#1085#1080#1084#1072#1090#1100' '#1090#1086#1074#1072#1088' '#1087#1086' '#1085#1091#1083#1077#1074#1086#1081' '#1094#1077#1085#1077
              Style.StyleController = dmData.scMain
              TabOrder = 6
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edWBInDefAmount: TcxCurrencyEdit
              Left = 453
              Top = 28
              Width = 65
              Height = 26
              ImeName = 'Russian'
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.DecimalPlaces = 5
              Properties.DisplayFormat = '0'
              Properties.MaxValue = 1000000000.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 0
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object chbWBInAutoNum: TcxCheckBox
              Left = 20
              Top = 69
              Width = 528
              Height = 26
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1040#1074#1090#1086#1085#1091#1084#1077#1088#1072#1094#1080#1103
              Style.StyleController = dmData.scMain
              TabOrder = 1
              ImeName = 'Russian'
              OnClick = chbWBInAutoNumClick
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object chbWBInChecked: TcxCheckBox
              Left = 20
              Top = 133
              Width = 528
              Height = 26
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1089#1086#1079#1076#1072#1105#1090#1089#1103' '#1082#1072#1082' '#1087#1088#1086#1074#1077#1076#1105#1085#1085#1099#1081
              Style.StyleController = dmData.scMain
              TabOrder = 5
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edWBInCurrNum: TcxSpinEdit
              Left = 289
              Top = 101
              Width = 81
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.MaxValue = 1000000000000.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 3
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edWBInPrefix: TcxTextEdit
              Left = 108
              Top = 101
              Width = 66
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 2
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edWBInSuffix: TcxTextEdit
              Left = 453
              Top = 101
              Width = 65
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 4
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object chbWBInAutoPrice: TcxCheckBox
              Left = 20
              Top = 217
              Width = 528
              Height = 25
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1087#1086#1076#1089#1090#1072#1074#1083#1103#1090#1100' '#1094#1077#1085#1091' '#1087#1088#1080' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1080' '#1085#1086#1074#1086#1081' '#1087#1086#1079#1080#1094#1080#1080
              Style.StyleController = dmData.scMain
              TabOrder = 7
              ImeName = 'Russian'
              OnClick = chbWBInAutoPriceClick
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object rbtWBInLastPrice: TcxRadioButton
              Left = 43
              Top = 244
              Width = 175
              Height = 28
              Caption = #1055#1086#1089#1083#1077#1076#1085#1102#1102' '#1074#1093#1086#1076#1085#1091#1102
              Checked = True
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 8
              TabStop = True
              WordWrap = True
              OnClick = chbWBInAutoPriceClick
            end
            object rbtWBInPriceType: TcxRadioButton
              Left = 43
              Top = 273
              Width = 175
              Height = 21
              Caption = #1062#1077#1085#1091' '#1076#1083#1103' '#1082#1072#1090#1077#1075#1086#1088#1080#1080
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 9
              OnClick = chbWBInAutoPriceClick
            end
            object lcbWBInPriceType: TssDBLookupCombo
              Left = 222
              Top = 270
              Width = 183
              Height = 25
              Enabled = False
              ImeName = 'Russian'
              ParentFont = False
              Properties.DropDownListStyle = lsEditFixedList
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 10
              OnKeyPress = GoNext
              EmptyValue = 0
              KeyField = 'ptypeid'
              ListField = 'name'
              ListSource = dsPriceTypes
            end
            object cbWBInAddType: TcxComboBox
              Left = 384
              Top = 335
              Width = 134
              Height = 26
              ImeName = 'Russian'
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 11
            end
            object lcbWBInShowModel: TokComboBox
              Left = 192
              Top = 394
              Width = 178
              Height = 22
              ItemHeight = 0
              TabOrder = 12
              ReadOnly = True
              ItemIndex = -1
              OnChange = DataModified
            end
            object cbWbInRepSortField: TokComboBox
              Left = 322
              Top = 428
              Width = 110
              Height = 22
              ItemHeight = 0
              TabOrder = 13
              ReadOnly = True
              ItemIndex = -1
              OnChange = DataModified
            end
          end
        end
        object tsWBOut: TcxTabSheet
          Caption = 'tsWBOut'
          ImageIndex = 0
          TabVisible = False
          object gbWBOut: TssGroupBox
            Left = 0
            Top = 0
            Width = 565
            Height = 604
            Align = alClient
            Alignment = alTopLeft
            Caption = 'gbWBOut'
            LookAndFeel.Kind = lfUltraFlat
            TabOrder = 0
            Edges = [beLeft, beRight, beTop, beBottom]
            DesignSize = (
              565
              604)
            object lWBOutDefAmount: TssLabel
              Left = 26
              Top = 25
              Width = 361
              Height = 16
              Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1090#1086#1074#1072#1088#1072', '#1087#1088#1077#1076#1083#1072#1075#1072#1077#1084#1086#1077' '#1076#1083#1103' '#1074#1074#1086#1076#1072' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddStandard
              DisabledColor = clBlack
            end
            object lWBOutPrefix: TssLabel
              Left = 44
              Top = 82
              Width = 56
              Height = 16
              Caption = #1055#1088#1077#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lWBOutCurrNum: TssLabel
              Left = 182
              Top = 82
              Width = 97
              Height = 16
              Caption = #1058#1077#1082#1091#1097#1080#1081' '#1085#1086#1084#1077#1088':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lWBOutSuffix: TssLabel
              Left = 384
              Top = 82
              Width = 58
              Height = 16
              Caption = #1057#1091#1092#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lPOType: TLabel
              Left = 25
              Top = 241
              Width = 518
              Height = 35
              AutoSize = False
              Caption = 
                #1055#1088#1080' '#1086#1090#1089#1090#1091#1090#1089#1090#1074#1080#1080' '#1092#1080#1082#1089#1080#1088#1086#1074#1072#1085#1085#1086#1081' '#1086#1090#1087#1091#1089#1082#1085#1086#1081' '#1094#1077#1085#1099' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1087#1086#1089#1083#1077#1076#1085 +
                #1102#1102' '#1089' '#1087#1086#1084#1086#1097#1100#1102' '#1085#1072#1094#1077#1085#1082#1080' '#1085#1072':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              WordWrap = True
            end
            object lWBOutAddType: TssLabel
              Left = 26
              Top = 480
              Width = 335
              Height = 38
              AutoSize = False
              Caption = 
                #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102' ('#1087#1088#1080' '#1085#1072#1078#1072#1090#1080#1080' '#1085#1072' '#1082#1085#1086#1087#1082#1091' "'#1044#1086#1073#1072#1074#1080#1090#1100'") '#1076#1086#1073#1072#1074#1083#1103#1090#1100' '#1074' '#1085#1072#1082#1083 +
                #1072#1076#1085#1091#1102':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              WordWrap = True
              DisabledDraw = ddStandard
              DisabledColor = clBlack
            end
            object lWBOutPriceType: TssLabel
              Left = 26
              Top = 454
              Width = 309
              Height = 16
              Caption = #1055#1088#1080' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1080' '#1087#1086#1079#1080#1094#1080#1080' '#1074' '#1085#1072#1082#1083#1072#1076#1085#1091#1102' '#1074#1085#1086#1089#1080#1090#1100' '#1094#1077#1085#1091
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddStandard
              DisabledColor = clBlack
            end
            object lWBOutShowModel: TokLabel
              Left = 25
              Top = 530
              Width = 128
              Height = 16
              Caption = 'Item name printed as:'
              DisabledDraw = ddStandard
              DisabledColor = clBlack
            end
            object lWbOutRepSort: TokLabel
              Left = 25
              Top = 570
              Width = 248
              Height = 16
              Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086#1079#1080#1094#1080#1080' '#1074' '#1087#1077#1095#1072#1090#1085#1099#1093' '#1092#1086#1088#1084#1072#1093
              DisabledDraw = ddStandard
              DisabledColor = clBlack
            end
            object btnWBOutRepSortDesc: TssSpeedButton
              Left = 437
              Top = 562
              Width = 80
              Height = 31
              Alignment = taLeftJustify
              AllwaysShowFrame = True
              ButtonType = ssbtChecked
              Checked = True
              Caption = 'Z -> A'
              GroupIndex = 0
              ImageIndex = 20
              Images = dmData.Images
              LeftMargin = 4
              Style = ssbsFlat
              ViewStyle = ssvsCaptionGlyph
              OnClick = btnWBOutRepSortDescClick
            end
            object lWBOutAutoPrice: TssLabel
              Left = 27
              Top = 427
              Width = 203
              Height = 16
              Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1087#1086#1076#1089#1090#1072#1074#1083#1103#1090#1100' '#1094#1077#1085#1091':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddStandard
              DisabledColor = clBlack
            end
            object chbWBOutAllowZero: TcxCheckBox
              Left = 20
              Top = 128
              Width = 528
              Height = 24
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1087#1088#1080#1085#1080#1084#1072#1090#1100' '#1090#1086#1074#1072#1088' '#1087#1086' '#1085#1091#1083#1077#1074#1086#1081' '#1094#1077#1085#1077
              Style.StyleController = dmData.scMain
              TabOrder = 6
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edWBOutDefAmount: TcxCurrencyEdit
              Left = 453
              Top = 18
              Width = 65
              Height = 24
              ImeName = 'Russian'
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.DecimalPlaces = 5
              Properties.DisplayFormat = '0'
              Properties.MaxValue = 1000000000.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 0
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object chbWBOutAutoWH: TcxCheckBox
              Left = 20
              Top = 153
              Width = 528
              Height = 24
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1086#1073#1088#1072#1097#1072#1090#1100#1089#1103' '#1082' '#1089#1082#1083#1072#1076#1091' '#1087#1088#1080' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1080' '#1085#1086#1074#1086#1081' '#1087#1086#1079#1080#1094#1080#1080' '
              Style.StyleController = dmData.scMain
              TabOrder = 7
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object chbWBOutChecked: TcxCheckBox
              Left = 20
              Top = 103
              Width = 528
              Height = 24
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1089#1086#1079#1076#1072#1105#1090#1089#1103' '#1082#1072#1082' '#1087#1088#1086#1074#1077#1076#1105#1085#1085#1099#1081
              Style.StyleController = dmData.scMain
              TabOrder = 5
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object chbWBOutAutoNum: TcxCheckBox
              Left = 20
              Top = 49
              Width = 528
              Height = 24
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1040#1074#1090#1086#1085#1091#1084#1077#1088#1072#1094#1080#1103
              Style.StyleController = dmData.scMain
              TabOrder = 1
              ImeName = 'Russian'
              OnClick = chbWBOutAutoNumClick
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edWBOutPrefix: TcxTextEdit
              Left = 108
              Top = 76
              Width = 66
              Height = 24
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 2
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edWBOutCurrNum: TcxSpinEdit
              Left = 289
              Top = 76
              Width = 81
              Height = 24
              Enabled = False
              ParentFont = False
              Properties.MaxValue = 1000000000000.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 3
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edWBOutSuffix: TcxTextEdit
              Left = 453
              Top = 76
              Width = 65
              Height = 24
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 4
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object rbtPOAvg: TcxRadioButton
              Left = 23
              Top = 274
              Width = 520
              Height = 29
              Caption = 
                #1057#1088#1077#1076#1085#1077#1074#1079#1074#1077#1096#1077#1085#1085#1091#1102' '#1087#1086' '#1074#1093#1086#1076#1085#1099#1084' '#1094#1077#1085#1072#1084' '#1087#1072#1088#1090#1080#1081', '#1082#1086#1090#1086#1088#1099#1077' '#1083#1077#1078#1072#1090' '#1085#1072' '#1089#1082#1083#1072#1076 +
                #1077
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 10
              TabStop = True
              WordWrap = True
              OnClick = DataModified
            end
            object rbtPOLast: TcxRadioButton
              Left = 23
              Top = 300
              Width = 515
              Height = 21
              Caption = #1055#1086#1089#1083#1077#1076#1085#1102#1102' '#1074#1093#1086#1076#1085#1091#1102' '#1094#1077#1085#1091
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 11
              OnClick = DataModified
            end
            object cbWBOutAddType: TcxComboBox
              Left = 384
              Top = 478
              Width = 134
              Height = 24
              ImeName = 'Russian'
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 13
            end
            object cbWBOutPriceType: TcxComboBox
              Left = 384
              Top = 449
              Width = 134
              Height = 24
              ImeName = 'Russian'
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 12
            end
            object chbShowRetNDS: TcxCheckBox
              Left = 20
              Top = 177
              Width = 528
              Height = 24
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1074#1086#1079#1084#1086#1078#1085#1086#1089#1090#1100' '#1074#1086#1079#1074#1088#1072#1090#1072' '#1053#1044#1057
              Style.StyleController = dmData.scMain
              TabOrder = 8
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object chbWBOutDCCheck: TcxCheckBox
              Left = 20
              Top = 202
              Width = 528
              Height = 24
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = 
                #1044#1083#1103' '#1085#1072#1082#1086#1087#1080#1090#1077#1083#1100#1085#1099#1093' '#1082#1072#1088#1090' '#1087#1077#1088#1077#1089#1095#1080#1090#1099#1074#1072#1090#1100' % '#1089#1082#1080#1076#1082#1080' '#1074' '#1087#1088#1077#1076#1077#1083#1072#1093' '#1085#1072#1082#1083#1072#1076#1085 +
                #1086#1081
              Style.StyleController = dmData.scMain
              TabOrder = 9
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object lcbWBOutShowModel: TokComboBox
              Left = 197
              Top = 527
              Width = 178
              Height = 22
              ItemHeight = 16
              TabOrder = 14
              ReadOnly = True
              ItemIndex = -1
              OnChange = DataModified
            end
            object cbWBOutRepSortField: TokComboBox
              Left = 319
              Top = 566
              Width = 109
              Height = 22
              ItemHeight = 16
              TabOrder = 15
              ReadOnly = True
              ItemIndex = -1
              OnChange = DataModified
            end
            object panRPType: TPanel
              Left = 24
              Top = 322
              Width = 529
              Height = 97
              Anchors = [akLeft, akTop, akRight]
              BevelInner = bvLowered
              ParentBackground = False
              TabOrder = 16
              object lRPType: TssLabel
                Left = 18
                Top = 13
                Width = 201
                Height = 16
                Caption = #1052#1077#1090#1086#1076' '#1086#1082#1088#1091#1075#1083#1077#1085#1080#1103' '#1086#1090#1087#1091#1089#1082#1085#1099#1093' '#1094#1077#1085':'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                DisabledDraw = ddStandard
                DisabledColor = clBlack
              end
              object lRDigitsCount: TssLabel
                Left = 18
                Top = 41
                Width = 223
                Height = 48
                AutoSize = False
                Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1085#1072#1082#1086#1074':'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                DisabledDraw = ddUser
                DisabledColor = clBtnShadow
              end
              object cbRPType: TcxComboBox
                Left = 251
                Top = 9
                Width = 262
                Height = 24
                ImeName = 'Russian'
                ParentFont = False
                Properties.DropDownListStyle = lsFixedList
                Properties.OnChange = DataModified
                Properties.OnEditValueChanged = cbRPTypePropertiesEditValueChanged
                Style.StyleController = dmData.scMain
                TabOrder = 0
              end
              object panRound: TPanel
                Left = 251
                Top = 37
                Width = 262
                Height = 57
                BevelOuter = bvNone
                ParentBackground = False
                TabOrder = 1
                object rbtRFrac: TcxRadioButton
                  Left = 0
                  Top = 4
                  Width = 121
                  Height = 21
                  Caption = #1044#1088#1086#1073#1085#1099#1093
                  Checked = True
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  TabStop = True
                  OnClick = rbtRFracClick
                end
                object rbtRInt: TcxRadioButton
                  Left = 0
                  Top = 31
                  Width = 121
                  Height = 21
                  Caption = #1062#1077#1083#1099#1093
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  OnClick = rbtRFracClick
                end
                object edRInt: TcxSpinEdit
                  Left = 128
                  Top = 28
                  Width = 134
                  Height = 24
                  Enabled = False
                  ParentFont = False
                  Properties.MaxValue = 10.000000000000000000
                  Properties.OnEditValueChanged = edRIntPropertiesChange
                  Properties.OnValidate = edRFracPropertiesValidate
                  Style.StyleController = dmData.scMain
                  TabOrder = 3
                  ImeName = 'Russian'
                  OnKeyDown = GoNextKeyDown
                  OnKeyPress = GoNext
                end
                object edRFrac: TcxSpinEdit
                  Left = 128
                  Top = 0
                  Width = 134
                  Height = 24
                  Enabled = False
                  ParentFont = False
                  Properties.ImmediatePost = True
                  Properties.MaxValue = 6.000000000000000000
                  Properties.OnEditValueChanged = edRFracPropertiesChange
                  Properties.OnValidate = edRFracPropertiesValidate
                  Style.StyleController = dmData.scMain
                  TabOrder = 1
                  ImeName = 'Russian'
                  OnKeyDown = GoNextKeyDown
                  OnKeyPress = GoNext
                end
              end
            end
            object cbWBOutAutoPrice: TssDBLookupCombo
              Left = 257
              Top = 422
              Width = 262
              Height = 24
              ImeName = 'Russian'
              ParentFont = False
              Properties.DropDownListStyle = lsEditFixedList
              Properties.OnChange = DataModified
              Properties.OnEditValueChanged = cbWBOutAutoPricePropertiesEditValueChanged
              Style.StyleController = dmData.scMain
              TabOrder = 17
              OnKeyPress = GoNext
              EmptyValue = 0
              KeyField = 'ptypeid'
              ListField = 'name'
              ListSource = dsPriceTypes
            end
          end
        end
        object tsWBMove: TcxTabSheet
          Caption = 'tsWBMove'
          ImageIndex = 0
          TabVisible = False
          object gbWBMove: TssGroupBox
            Left = 0
            Top = 0
            Width = 565
            Height = 604
            Align = alClient
            Alignment = alTopLeft
            Caption = 'gbWBMove'
            TabOrder = 0
            Edges = [beLeft, beRight, beTop, beBottom]
            object lWBMoveDefAmount: TssLabel
              Left = 26
              Top = 34
              Width = 361
              Height = 16
              Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1090#1086#1074#1072#1088#1072', '#1087#1088#1077#1076#1083#1072#1075#1072#1077#1084#1086#1077' '#1076#1083#1103' '#1074#1074#1086#1076#1072' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddStandard
              DisabledColor = clBlack
            end
            object lWBMovePrefix: TssLabel
              Left = 44
              Top = 94
              Width = 56
              Height = 16
              Caption = #1055#1088#1077#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lWBMoveCurrNum: TssLabel
              Left = 182
              Top = 94
              Width = 97
              Height = 16
              Caption = #1058#1077#1082#1091#1097#1080#1081' '#1085#1086#1084#1077#1088':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lWBMoveSuffix: TssLabel
              Left = 384
              Top = 94
              Width = 58
              Height = 16
              Caption = #1057#1091#1092#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lWBMoveShowModel: TokLabel
              Left = 25
              Top = 265
              Width = 128
              Height = 16
              Caption = 'Item name printed as:'
              DisabledDraw = ddStandard
              DisabledColor = clBlack
            end
            object edWBMoveDefAmount: TcxCurrencyEdit
              Left = 453
              Top = 28
              Width = 65
              Height = 26
              ImeName = 'Russian'
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.DecimalPlaces = 5
              Properties.DisplayFormat = '0'
              Properties.MaxValue = 1000000000.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 0
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object chbWBMoveChecked: TcxCheckBox
              Left = 20
              Top = 119
              Width = 528
              Height = 26
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1089#1086#1079#1076#1072#1105#1090#1089#1103' '#1082#1072#1082' '#1087#1088#1086#1074#1077#1076#1105#1085#1085#1099#1081
              Style.StyleController = dmData.scMain
              TabOrder = 5
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object chbWBMoveAutoNum: TcxCheckBox
              Left = 20
              Top = 57
              Width = 528
              Height = 25
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1040#1074#1090#1086#1085#1091#1084#1077#1088#1072#1094#1080#1103
              Style.StyleController = dmData.scMain
              TabOrder = 1
              ImeName = 'Russian'
              OnClick = chbWBMoveAutoNumClick
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edWBMovePrefix: TcxTextEdit
              Left = 108
              Top = 87
              Width = 66
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 2
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edWBMoveCurrNum: TcxSpinEdit
              Left = 289
              Top = 87
              Width = 81
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.MaxValue = 1000000000000.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 3
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edWBMoveSuffix: TcxTextEdit
              Left = 453
              Top = 87
              Width = 65
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 4
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object gbTorg13: TssGroupBox
              Left = 25
              Top = 155
              Width = 515
              Height = 95
              Alignment = alTopLeft
              Caption = ' '#1055#1088#1080' '#1087#1077#1095#1072#1090#1080' '#1092#1086#1088#1084#1099' '#1058#1054#1056#1043'-13 '#1080' '#1088#1072#1089#1095#1105#1090#1077' '#1089#1091#1084#1084' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
              Edges = [beLeft, beRight, beTop, beBottom]
              object rbtT13PriceIn: TcxRadioButton
                Left = 18
                Top = 25
                Width = 175
                Height = 28
                Caption = #1047#1072#1082#1091#1087#1086#1095#1085#1091#1102' '#1094#1077#1085#1091
                Checked = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                TabStop = True
                WordWrap = True
                OnClick = rbtT13PriceInClick
              end
              object rbtT13PriceType: TcxRadioButton
                Left = 18
                Top = 54
                Width = 175
                Height = 21
                Caption = #1062#1077#1085#1091' '#1076#1083#1103' '#1082#1072#1090#1077#1075#1086#1088#1080#1080
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                OnClick = rbtT13PriceInClick
              end
              object lcbT13PriceTypes: TssDBLookupCombo
                Left = 202
                Top = 50
                Width = 183
                Height = 26
                Enabled = False
                ImeName = 'Russian'
                ParentFont = False
                Properties.DropDownListStyle = lsEditFixedList
                Properties.OnChange = DataModified
                Style.StyleController = dmData.scMain
                TabOrder = 2
                OnKeyPress = GoNext
                EmptyValue = 0
                KeyField = 'ptypeid'
                ListField = 'name'
                ListSource = dsPriceTypes
              end
            end
            object lcbWBMoveShowModel: TokComboBox
              Left = 197
              Top = 261
              Width = 178
              Height = 22
              ItemHeight = 0
              TabOrder = 7
              ReadOnly = True
              ItemIndex = -1
              OnChange = DataModified
            end
          end
        end
        object tsTaxWB: TcxTabSheet
          Caption = 'tsTaxWB'
          ImageIndex = 0
          TabVisible = False
          object gbTaxWB: TssGroupBox
            Left = 0
            Top = 0
            Width = 565
            Height = 604
            Align = alClient
            Alignment = alTopLeft
            Caption = 'gbTaxWB'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Edges = [beLeft, beRight, beTop, beBottom]
            object lTaxWBDefAmount: TssLabel
              Left = 26
              Top = 34
              Width = 361
              Height = 16
              Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1090#1086#1074#1072#1088#1072', '#1087#1088#1077#1076#1083#1072#1075#1072#1077#1084#1086#1077' '#1076#1083#1103' '#1074#1074#1086#1076#1072' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddStandard
              DisabledColor = clBlack
            end
            object lTaxPrefix: TssLabel
              Left = 44
              Top = 107
              Width = 56
              Height = 16
              Caption = #1055#1088#1077#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lTaxCurrNum: TssLabel
              Left = 182
              Top = 107
              Width = 97
              Height = 16
              Caption = #1058#1077#1082#1091#1097#1080#1081' '#1085#1086#1084#1077#1088':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lTaxSuffix: TssLabel
              Left = 384
              Top = 107
              Width = 58
              Height = 16
              Caption = #1057#1091#1092#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object edTaxWBDefAmount: TcxCurrencyEdit
              Left = 453
              Top = 28
              Width = 65
              Height = 24
              ImeName = 'Russian'
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.DecimalPlaces = 5
              Properties.DisplayFormat = '0'
              Properties.MaxValue = 1000000000.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 0
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object chbTaxAutoNum: TcxCheckBox
              Left = 20
              Top = 69
              Width = 528
              Height = 24
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1040#1074#1090#1086#1085#1091#1084#1077#1088#1072#1094#1080#1103
              Style.StyleController = dmData.scMain
              TabOrder = 1
              ImeName = 'Russian'
              OnClick = chbTaxAutoNumClick
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edTaxPrefix: TcxTextEdit
              Left = 108
              Top = 101
              Width = 66
              Height = 24
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 2
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edTaxCurrNum: TcxSpinEdit
              Left = 289
              Top = 101
              Width = 81
              Height = 24
              Enabled = False
              ParentFont = False
              Properties.MaxValue = 1000000000000.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 3
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edTaxSuffix: TcxTextEdit
              Left = 453
              Top = 101
              Width = 65
              Height = 24
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 4
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
          end
        end
        object tsAO: TcxTabSheet
          Caption = 'tsAO'
          ImageIndex = 0
          TabVisible = False
          object gbAO: TssGroupBox
            Left = 0
            Top = 0
            Width = 565
            Height = 604
            Align = alClient
            Alignment = alTopLeft
            Caption = 'gbWBMove'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Edges = [beLeft, beRight, beTop, beBottom]
            object lAODefAmount: TssLabel
              Left = 26
              Top = 34
              Width = 361
              Height = 16
              Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1090#1086#1074#1072#1088#1072', '#1087#1088#1077#1076#1083#1072#1075#1072#1077#1084#1086#1077' '#1076#1083#1103' '#1074#1074#1086#1076#1072' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddStandard
              DisabledColor = clBlack
            end
            object lAOPrefix: TssLabel
              Left = 44
              Top = 107
              Width = 56
              Height = 16
              Caption = #1055#1088#1077#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lAOCurrNum: TssLabel
              Left = 182
              Top = 107
              Width = 97
              Height = 16
              Caption = #1058#1077#1082#1091#1097#1080#1081' '#1085#1086#1084#1077#1088':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lAOSuffix: TssLabel
              Left = 384
              Top = 107
              Width = 58
              Height = 16
              Caption = #1057#1091#1092#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object edAODefAmount: TcxCurrencyEdit
              Left = 453
              Top = 28
              Width = 65
              Height = 24
              ImeName = 'Russian'
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.DecimalPlaces = 5
              Properties.DisplayFormat = '0'
              Properties.MaxValue = 1000000000.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 0
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object chbAOAutoNum: TcxCheckBox
              Left = 20
              Top = 69
              Width = 528
              Height = 24
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1040#1074#1090#1086#1085#1091#1084#1077#1088#1072#1094#1080#1103
              Style.StyleController = dmData.scMain
              TabOrder = 1
              ImeName = 'Russian'
              OnClick = chbAOAutoNumClick
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edAOPrefix: TcxTextEdit
              Left = 108
              Top = 101
              Width = 66
              Height = 24
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 2
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edAOCurrNum: TcxSpinEdit
              Left = 289
              Top = 101
              Width = 81
              Height = 24
              Enabled = False
              ParentFont = False
              Properties.MaxValue = 1000000000000.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 3
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edAOSuffix: TcxTextEdit
              Left = 453
              Top = 101
              Width = 65
              Height = 24
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 4
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object chbAOAutoWH: TcxCheckBox
              Left = 20
              Top = 138
              Width = 528
              Height = 24
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1086#1073#1088#1072#1097#1072#1090#1100#1089#1103' '#1082' '#1089#1082#1083#1072#1076#1091' '#1087#1088#1080' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1080' '#1085#1086#1074#1086#1081' '#1087#1086#1079#1080#1094#1080#1080' '
              Style.StyleController = dmData.scMain
              TabOrder = 5
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object chbAOSelectNP: TcxCheckBox
              Left = 20
              Top = 169
              Width = 311
              Height = 24
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1042#1099#1076#1077#1083#1103#1090#1100' '#1085#1077#1086#1087#1083#1072#1095#1077#1085#1085#1099#1077' '#1089#1095#1077#1090#1072' '#1094#1074#1077#1090#1086#1084
              Style.StyleController = dmData.scMain
              TabOrder = 6
              ImeName = 'Russian'
              OnClick = chbAOSelectNPClick
            end
            object edAOSelectNP: TcxColorComboBox
              Left = 335
              Top = 169
              Width = 183
              Height = 24
              Enabled = False
              ImeName = 'Russian'
              ParentFont = False
              Properties.AllowSelectColor = True
              Properties.DefaultDescription = 'Color not selected'
              Properties.ShowDescriptions = False
              Properties.OnChange = DataModified
              Properties.OnEditValueChanged = DataModified
              Properties.Items = <>
              Properties.PrepareInfo = ''
              Style.StyleController = dmData.scMain
              TabOrder = 7
            end
          end
        end
        object tsPDIn: TcxTabSheet
          Caption = 'tsPDIn'
          ImageIndex = 0
          TabVisible = False
          object gbPDIn: TssGroupBox
            Left = 0
            Top = 0
            Width = 565
            Height = 533
            Align = alClient
            Alignment = alTopLeft
            Caption = 'gbWBMove'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Edges = [beLeft, beRight, beTop, beBottom]
            object lPDInPrefix: TssLabel
              Left = 44
              Top = 107
              Width = 56
              Height = 16
              Caption = #1055#1088#1077#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lPDInCurrNum: TssLabel
              Left = 182
              Top = 107
              Width = 97
              Height = 16
              Caption = #1058#1077#1082#1091#1097#1080#1081' '#1085#1086#1084#1077#1088':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lPDInSuffix: TssLabel
              Left = 384
              Top = 107
              Width = 58
              Height = 16
              Caption = #1057#1091#1092#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object chbPDInAutoNum: TcxCheckBox
              Left = 20
              Top = 69
              Width = 528
              Height = 26
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1040#1074#1090#1086#1085#1091#1084#1077#1088#1072#1094#1080#1103
              Style.StyleController = dmData.scMain
              TabOrder = 1
              ImeName = 'Russian'
              OnClick = chbPDInAutoNumClick
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edPDInPrefix: TcxTextEdit
              Left = 108
              Top = 101
              Width = 66
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 2
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edPDInCurrNum: TcxSpinEdit
              Left = 289
              Top = 101
              Width = 81
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.MaxValue = 1000000000000.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 3
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edPDInSuffix: TcxTextEdit
              Left = 453
              Top = 101
              Width = 65
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 4
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object chbPDInChecked: TcxCheckBox
              Left = 20
              Top = 34
              Width = 528
              Height = 26
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1089#1086#1079#1076#1072#1105#1090#1089#1103' '#1082#1072#1082' '#1087#1088#1086#1074#1077#1076#1105#1085#1085#1099#1081
              Style.StyleController = dmData.scMain
              TabOrder = 0
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
          end
        end
        object tsPDOut: TcxTabSheet
          Caption = 'tsPDOut'
          ImageIndex = 0
          TabVisible = False
          object gbPDOut: TssGroupBox
            Left = 0
            Top = 0
            Width = 565
            Height = 533
            Align = alClient
            Alignment = alTopLeft
            Caption = 'gbWBMove'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Edges = [beLeft, beRight, beTop, beBottom]
            object lPDOutPrefix: TssLabel
              Left = 44
              Top = 107
              Width = 56
              Height = 16
              Caption = #1055#1088#1077#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lPDOutCurrNum: TssLabel
              Left = 182
              Top = 107
              Width = 97
              Height = 16
              Caption = #1058#1077#1082#1091#1097#1080#1081' '#1085#1086#1084#1077#1088':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lPDOutSuffix: TssLabel
              Left = 384
              Top = 107
              Width = 58
              Height = 16
              Caption = #1057#1091#1092#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object chbPDOutAutoNum: TcxCheckBox
              Left = 20
              Top = 69
              Width = 528
              Height = 26
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1040#1074#1090#1086#1085#1091#1084#1077#1088#1072#1094#1080#1103
              Style.StyleController = dmData.scMain
              TabOrder = 1
              ImeName = 'Russian'
              OnClick = chbPDOutAutoNumClick
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edPDOutPrefix: TcxTextEdit
              Left = 108
              Top = 101
              Width = 66
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 2
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edPDOutCurrNum: TcxSpinEdit
              Left = 289
              Top = 101
              Width = 81
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.MaxValue = 1000000000000.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 3
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edPDOutSuffix: TcxTextEdit
              Left = 453
              Top = 101
              Width = 65
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 4
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object chbPDOutChecked: TcxCheckBox
              Left = 20
              Top = 34
              Width = 528
              Height = 26
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1089#1086#1079#1076#1072#1105#1090#1089#1103' '#1082#1072#1082' '#1087#1088#1086#1074#1077#1076#1105#1085#1085#1099#1081
              Style.StyleController = dmData.scMain
              TabOrder = 0
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
          end
        end
        object tsWBRest: TcxTabSheet
          Caption = 'tsWBRest'
          ImageIndex = 0
          TabVisible = False
          object gbWBRest: TssGroupBox
            Left = 0
            Top = 0
            Width = 565
            Height = 533
            Align = alClient
            Alignment = alTopLeft
            Caption = 'gbWBIn'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Edges = [beLeft, beRight, beTop, beBottom]
            object lWBRestDefAmount: TssLabel
              Left = 26
              Top = 34
              Width = 361
              Height = 16
              Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1090#1086#1074#1072#1088#1072', '#1087#1088#1077#1076#1083#1072#1075#1072#1077#1084#1086#1077' '#1076#1083#1103' '#1074#1074#1086#1076#1072' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddStandard
              DisabledColor = clBlack
            end
            object lWBRestPrefix: TssLabel
              Left = 44
              Top = 107
              Width = 56
              Height = 16
              Caption = #1055#1088#1077#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lWBRestCurrNum: TssLabel
              Left = 182
              Top = 107
              Width = 97
              Height = 16
              Caption = #1058#1077#1082#1091#1097#1080#1081' '#1085#1086#1084#1077#1088':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lWBRestSuffix: TssLabel
              Left = 384
              Top = 107
              Width = 58
              Height = 16
              Caption = #1057#1091#1092#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object chbWBRestAllowZero: TcxCheckBox
              Left = 20
              Top = 162
              Width = 528
              Height = 26
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1087#1088#1080#1085#1080#1084#1072#1090#1100' '#1090#1086#1074#1072#1088' '#1087#1086' '#1085#1091#1083#1077#1074#1086#1081' '#1094#1077#1085#1077
              Style.StyleController = dmData.scMain
              TabOrder = 6
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edWBRestDefAmount: TcxCurrencyEdit
              Left = 453
              Top = 28
              Width = 65
              Height = 26
              ImeName = 'Russian'
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.DecimalPlaces = 5
              Properties.DisplayFormat = '0'
              Properties.MaxValue = 1000000000.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 0
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object chbWBRestAutoNum: TcxCheckBox
              Left = 20
              Top = 69
              Width = 528
              Height = 26
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1040#1074#1090#1086#1085#1091#1084#1077#1088#1072#1094#1080#1103
              Style.StyleController = dmData.scMain
              TabOrder = 1
              ImeName = 'Russian'
              OnClick = chbWBRestAutoNumClick
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object chbWBRestChecked: TcxCheckBox
              Left = 20
              Top = 133
              Width = 528
              Height = 26
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1089#1086#1079#1076#1072#1105#1090#1089#1103' '#1082#1072#1082' '#1087#1088#1086#1074#1077#1076#1105#1085#1085#1099#1081
              Style.StyleController = dmData.scMain
              TabOrder = 5
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edWBRestCurrNum: TcxSpinEdit
              Left = 289
              Top = 101
              Width = 81
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.MaxValue = 1000000000000.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 3
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edWBRestPrefix: TcxTextEdit
              Left = 108
              Top = 101
              Width = 66
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 2
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edWBRestSuffix: TcxTextEdit
              Left = 453
              Top = 101
              Width = 65
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 4
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
          end
        end
        object tsAccounts: TcxTabSheet
          Caption = 'tsAccounts'
          ImageIndex = 0
          TabVisible = False
          object gbAccounts: TssGroupBox
            Left = 0
            Top = 0
            Width = 565
            Height = 604
            Align = alClient
            Alignment = alTopLeft
            Caption = 'gbAccounts'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Edges = [beLeft, beRight, beTop, beBottom]
            DesignSize = (
              565
              604)
            object panAccButtons: TPanel
              Left = 10
              Top = 28
              Width = 543
              Height = 32
              BevelOuter = bvNone
              ParentBackground = False
              TabOrder = 0
              object btnAccDel: TssSpeedButton
                Left = 230
                Top = 0
                Width = 113
                Height = 31
                Action = aAccDel
                Alignment = taCenter
                AllwaysShowFrame = False
                ButtonType = ssbtStandard
                Checked = False
                DisabledImages = dmData.Images18x18dis
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                GroupIndex = 0
                ImageIndex = 2
                Images = dmData.Images18x18
                LeftMargin = 3
                ParentFont = False
                Style = ssbsUser
                ViewStyle = ssvsCaptionGlyph
              end
              object btnAccProps: TssSpeedButton
                Left = 117
                Top = 0
                Width = 113
                Height = 31
                Action = aAccProps
                Alignment = taCenter
                AllwaysShowFrame = False
                ButtonType = ssbtStandard
                Checked = False
                DisabledImages = dmData.Images18x18dis
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                GroupIndex = 0
                ImageIndex = 1
                Images = dmData.Images18x18
                LeftMargin = 3
                ParentFont = False
                Style = ssbsUser
                ViewStyle = ssvsCaptionGlyph
              end
              object btnAccNew: TssSpeedButton
                Left = 0
                Top = 0
                Width = 117
                Height = 31
                Action = aAccNew
                Alignment = taCenter
                AllwaysShowFrame = False
                ButtonType = ssbtStandard
                Checked = False
                DisabledImages = dmData.Images18x18dis
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                GroupIndex = 0
                ImageIndex = 0
                Images = dmData.Images18x18
                LeftMargin = 3
                ParentFont = False
                Style = ssbsUser
                ViewStyle = ssvsCaptionGlyph
              end
            end
            object grdAccounts: TdxDBGrid
              Left = 10
              Top = 63
              Width = 545
              Height = 530
              DrawDragFrame = False
              Bands = <
                item
                end>
              DefaultLayout = True
              HeaderPanelRowCount = 1
              KeyField = 'accid'
              SummaryGroups = <>
              SummarySeparator = ', '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnDblClick = grdAccountsDblClick
              BandFont.Charset = DEFAULT_CHARSET
              BandFont.Color = clBlack
              BandFont.Height = -11
              BandFont.Name = 'Tahoma'
              BandFont.Style = [fsBold]
              DataSource = srcAccount
              Filter.Criteria = {00000000}
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clBlack
              HeaderFont.Height = -11
              HeaderFont.Name = 'Tahoma'
              HeaderFont.Style = []
              LookAndFeel = lfUltraFlat
              OptionsCustomize = [edgoBandMoving, edgoBandSizing, edgoColumnSizing]
              OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
              OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowAutoHeight, edgoRowSelect, edgoUseBitmap]
              PreviewFont.Charset = DEFAULT_CHARSET
              PreviewFont.Color = clBlue
              PreviewFont.Height = -11
              PreviewFont.Name = 'Tahoma'
              PreviewFont.Style = [fsBold]
              Anchors = [akLeft, akTop, akRight, akBottom]
              object colAccType: TdxDBGridColumn
                Alignment = taLeftJustify
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                HeaderAlignment = taCenter
                Width = 153
                BandIndex = 0
                RowIndex = 0
                FieldName = 'TypeName'
              end
              object colAccNum: TdxDBGridColumn
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                HeaderAlignment = taCenter
                Sorted = csUp
                Width = 117
                BandIndex = 0
                RowIndex = 0
                FieldName = 'Num'
              end
              object colAccMFO: TdxDBGridColumn
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                HeaderAlignment = taCenter
                Width = 81
                BandIndex = 0
                RowIndex = 0
                FieldName = 'MFO'
              end
            end
          end
        end
        object tsAccount: TcxTabSheet
          Caption = 'tsAccount'
          ImageIndex = 0
          TabVisible = False
          object gbAccountEdit: TssGroupBox
            Left = 0
            Top = 0
            Width = 565
            Height = 604
            Align = alClient
            Alignment = alTopLeft
            Caption = 'gbAccountEdit'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Edges = [beLeft, beRight, beTop, beBottom]
            DesignSize = (
              565
              604)
            object lAccount: TLabel
              Left = 14
              Top = 91
              Width = 74
              Height = 16
              Caption = #1053#1086#1084#1077#1088' '#1089#1095#1105#1090#1072
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lType: TLabel
              Left = 14
              Top = 117
              Width = 22
              Height = 16
              Caption = #1058#1080#1087
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object btnAccountRef: TssSpeedButton
              Left = 321
              Top = 112
              Width = 27
              Height = 26
              Action = aAccountRef
              Alignment = taLeftJustify
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              GroupIndex = 0
              ImageIndex = 23
              Images = dmData.Images
              LeftMargin = 3
              ParentShowHint = False
              ShowHint = True
              Style = ssbsUser
              ViewStyle = ssvsGlyphOnly
            end
            object lBank: TLabel
              Left = 14
              Top = 144
              Width = 29
              Height = 16
              Caption = #1052#1060#1054
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object btnBankRef: TssSpeedButton
              Left = 321
              Top = 139
              Width = 27
              Height = 26
              Action = aBanksRef
              Alignment = taLeftJustify
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              GroupIndex = 0
              ImageIndex = 19
              Images = dmData.Images
              LeftMargin = 3
              ParentShowHint = False
              ShowHint = True
              Style = ssbsUser
              ViewStyle = ssvsGlyphOnly
            end
            object lBankName: TLabel
              Left = 14
              Top = 169
              Width = 28
              Height = 16
              Caption = #1041#1072#1085#1082
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object txtBankName: TssBevel
              Left = 114
              Top = 167
              Width = 436
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              ColorGrBegin = clWindow
              ColorGrEnd = clWindow
              ColorInner = clBtnShadow
              ColorOuter = clBtnShadow
              Edges = [beLeft, beRight, beTop, beBottom]
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              GradientDirection = gdHorizontal
              HotTrack = False
              ImageIndex = 0
              Style = bsSingle
              UseGradient = True
              WordBreak = False
            end
            object Panel1: TPanel
              Left = 2
              Top = 18
              Width = 561
              Height = 50
              Align = alTop
              BevelOuter = bvNone
              ParentBackground = False
              TabOrder = 0
              DesignSize = (
                561
                50)
              object ssSpeedButton1: TssSpeedButton
                Left = 238
                Top = 10
                Width = 113
                Height = 31
                Action = aAccDel
                Alignment = taCenter
                AllwaysShowFrame = False
                ButtonType = ssbtStandard
                Checked = False
                DisabledImages = dmData.Images18x18dis
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                GroupIndex = 0
                ImageIndex = 2
                Images = dmData.Images18x18
                LeftMargin = 3
                ParentFont = False
                Style = ssbsUser
                ViewStyle = ssvsCaptionGlyph
              end
              object ssSpeedButton2: TssSpeedButton
                Left = 124
                Top = 10
                Width = 114
                Height = 31
                Action = aAccProps
                Alignment = taCenter
                AllwaysShowFrame = False
                ButtonType = ssbtStandard
                Checked = False
                DisabledImages = dmData.Images18x18dis
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                GroupIndex = 0
                ImageIndex = 1
                Images = dmData.Images18x18
                LeftMargin = 3
                ParentFont = False
                Style = ssbsUser
                ViewStyle = ssvsCaptionGlyph
              end
              object ssSpeedButton3: TssSpeedButton
                Left = 7
                Top = 10
                Width = 117
                Height = 31
                Action = aAccNew
                Alignment = taCenter
                AllwaysShowFrame = False
                ButtonType = ssbtStandard
                Checked = False
                DisabledImages = dmData.Images18x18dis
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                GroupIndex = 0
                ImageIndex = 0
                Images = dmData.Images18x18
                LeftMargin = 3
                ParentFont = False
                Style = ssbsUser
                ViewStyle = ssvsCaptionGlyph
              end
              object bvlAccountSep: TssBevel
                Left = 0
                Top = 49
                Width = 561
                Height = 1
                Align = alBottom
                ColorGrBegin = clBtnFace
                ColorGrEnd = clBtnFace
                ColorInner = clBtnShadow
                ColorOuter = clBtnHighlight
                Edges = [beLeft, beRight, beTop, beBottom]
                GradientDirection = gdHorizontal
                HotTrack = False
                ImageIndex = 0
                Shape = bsTopLine
                UseGradient = False
              end
              object btnAccLevelUp: TssSpeedButton
                Left = 522
                Top = 12
                Width = 28
                Height = 29
                Alignment = taLeftJustify
                AllwaysShowFrame = False
                Anchors = [akTop, akRight]
                ButtonType = ssbtStandard
                Checked = False
                Caption = 'aShowTurnIn'
                GroupIndex = 0
                ImageIndex = 21
                Images = dmData.Images
                LeftMargin = 3
                ParentShowHint = False
                ShowHint = True
                Style = ssbsUser
                ViewStyle = ssvsGlyphOnly
                OnClick = btnAccLevelUpClick
              end
            end
            object edAccount: TcxDBTextEdit
              Left = 113
              Top = 85
              Width = 208
              Height = 24
              DataBinding.DataField = 'num'
              DataBinding.DataSource = srcAccount
              ImeName = 'Russian'
              ParentFont = False
              Properties.MaxLength = 128
              Properties.OnChange = edAccountPropertiesChange
              Style.StyleController = dmData.scMain
              TabOrder = 1
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object lcbAccountType: TcxDBLookupComboBox
              Left = 113
              Top = 112
              Width = 208
              Height = 24
              DataBinding.DataField = 'TypeID'
              DataBinding.DataSource = srcAccount
              ImeName = 'Russian'
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.KeyFieldNames = 'TYPEID'
              Properties.ListColumns = <
                item
                  FieldName = 'NAME'
                end>
              Properties.ListOptions.GridLines = glNone
              Properties.ListOptions.ShowHeader = False
              Properties.ListSource = dsAccountType
              Properties.OnChange = lcbAccountTypePropertiesChange
              Style.StyleController = dmData.scMain
              Style.ButtonTransparency = ebtNone
              TabOrder = 2
              OnKeyPress = GoNext
            end
            object lcbBanks: TcxDBLookupComboBox
              Left = 113
              Top = 139
              Width = 50
              Height = 24
              DataBinding.DataField = 'bankid'
              DataBinding.DataSource = srcAccount
              ImeName = 'Russian'
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.DropDownWidth = 200
              Properties.KeyFieldNames = 'BANKID'
              Properties.ListColumns = <
                item
                  MinWidth = 50
                  FieldName = 'MFO'
                end
                item
                  FieldName = 'NAME'
                end>
              Properties.ListOptions.GridLines = glVertical
              Properties.ListOptions.ShowHeader = False
              Properties.ListSource = dsBanks
              Properties.OnChange = lcbBanksPropertiesChange
              Properties.OnEditValueChanged = lcbBanksPropertiesEditValueChanged
              Style.StyleController = dmData.scMain
              TabOrder = 3
              OnKeyPress = GoNext
            end
          end
        end
        object tsBackup: TcxTabSheet
          Caption = 'tsBackup'
          ImageIndex = 0
          TabVisible = False
          object gbBackup: TssGroupBox
            Left = 0
            Top = 0
            Width = 565
            Height = 604
            Align = alClient
            Alignment = alTopLeft
            Caption = 'gbWBIn'
            LookAndFeel.Kind = lfUltraFlat
            TabOrder = 0
            Edges = [beLeft, beRight, beTop, beBottom]
            object lBackupDir: TssLabel
              Left = 48
              Top = 85
              Width = 163
              Height = 16
              Caption = #1055#1072#1087#1082#1072' '#1076#1083#1103' '#1072#1088#1093#1080#1074#1085#1099#1093' '#1082#1086#1087#1080#1081':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lBackupInterval: TssLabel
              Left = 48
              Top = 110
              Width = 162
              Height = 32
              Caption = #1042#1099#1087#1086#1083#1085#1103#1090#1100' '#1072#1088#1093#1080#1074#1080#1088#1086#1074#1072#1085#1080#1077' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093' '#1082#1072#1078#1076#1099#1077':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              WordWrap = True
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lBackupTime: TssLabel
              Left = 426
              Top = 118
              Width = 7
              Height = 16
              Caption = #1074
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object rbtBackupNo: TcxRadioButton
              Left = 25
              Top = 33
              Width = 508
              Height = 21
              Caption = #1053#1077' '#1074#1099#1087#1086#1083#1085#1103#1090#1100' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1086#1077' '#1072#1088#1093#1080#1074#1080#1088#1086#1074#1072#1085#1080#1077' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              TabStop = True
              OnClick = rbtBackupNoClick
              LookAndFeel.Kind = lfUltraFlat
            end
            object rbtBackupYes: TcxRadioButton
              Left = 25
              Top = 58
              Width = 508
              Height = 21
              Caption = #1042#1099#1087#1086#1083#1085#1103#1090#1100' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1086#1077' '#1072#1088#1093#1080#1074#1080#1088#1086#1074#1072#1085#1080#1077' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnClick = rbtBackupNoClick
              LookAndFeel.Kind = lfUltraFlat
            end
            object edBackupInterval: TcxSpinEdit
              Left = 224
              Top = 113
              Width = 84
              Height = 24
              Enabled = False
              ParentFont = False
              Properties.ImmediatePost = True
              Properties.MaxValue = 10000.000000000000000000
              Properties.MinValue = 1.000000000000000000
              Properties.OnEditValueChanged = edBackupIntervalPropertiesEditValueChanged
              Style.StyleController = dmData.scMain
              TabOrder = 2
              Value = 1
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edBackupDir: TcxButtonEdit
              Left = 224
              Top = 81
              Width = 310
              Height = 24
              Enabled = False
              ParentFont = False
              Properties.Buttons = <
                item
                  Default = True
                  Kind = bkEllipsis
                end>
              Properties.OnButtonClick = edBackupDirPropertiesButtonClick
              Properties.OnEditValueChanged = edBackupDirPropertiesEditValueChanged
              Style.StyleController = dmData.scMain
              TabOrder = 3
            end
            object cbBackupInterval: TcxComboBox
              Left = 313
              Top = 113
              Width = 102
              Height = 24
              Enabled = False
              ImeName = 'Russian'
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.OnEditValueChanged = cbBackupIntervalPropertiesEditValueChanged
              Style.StyleController = dmData.scMain
              TabOrder = 4
            end
            object edBackupTime: TcxTimeEdit
              Left = 441
              Top = 113
              Width = 93
              Height = 24
              EditValue = 0.000000000000000000
              Enabled = False
              ParentFont = False
              Properties.OnChange = edBackupTimePropertiesChange
              Style.StyleController = dmData.scMain
              TabOrder = 5
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
          end
        end
        object tsBackupDBs: TcxTabSheet
          Caption = 'tsBackupDBs'
          ImageIndex = 0
          TabVisible = False
          object gbBackupDBs: TssGroupBox
            Left = 0
            Top = 0
            Width = 565
            Height = 604
            Align = alClient
            Alignment = alTopLeft
            Caption = 'gbWBIn'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Edges = [beLeft, beRight, beTop, beBottom]
            DesignSize = (
              565
              604)
            object lBackupText: TssLabel
              Left = 11
              Top = 28
              Width = 537
              Height = 96
              Caption = 
                ' '#1053#1080#1078#1077' '#1042#1099' '#1084#1086#1078#1077#1090#1077' '#1085#1072#1089#1090#1088#1086#1080#1090#1100' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1086#1077' '#1089#1086#1079#1076#1072#1085#1080#1077' '#1072#1088#1093#1080#1074#1085#1099#1093' '#1082#1086#1087#1080#1081 +
                ' '#1076#1083#1103' '#1074#1099#1073#1088#1072#1085#1085#1099#1093' '#1042#1072#1084#1080' '#1073#1072#1079' '#1076#1072#1085#1085#1099#1093'. '#1060#1072#1081#1083' '#1072#1088#1093#1080#1074#1072' '#1073#1091#1076#1077#1090' '#1088#1072#1079#1084#1077#1097#1105#1085' '#1074' '#1091#1082#1072 +
                #1079#1072#1085#1085#1086#1081' '#1042#1072#1084#1080' '#1087#1072#1087#1082#1077' '#1080' '#1073#1091#1076#1077#1090' '#1080#1084#1077#1090#1100' '#1089#1083#1077#1076#1091#1102#1097#1080#1081' '#1092#1086#1088#1084#1072#1090': DBNameDDMMYYYY' +
                '_HHMM.fbk, '#1075#1076#1077' DBName - '#1085#1072#1079#1074#1072#1085#1080#1077' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093', DDMMYYYY - '#1076#1072#1090#1072' '#1089#1086 +
                #1079#1076#1072#1085#1080#1103' '#1072#1088#1093#1080#1074#1072', HHMM - '#1074#1088#1077#1084#1103' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1072#1088#1093#1080#1074#1072'. '#1055#1086#1079#1078#1077' '#1042#1099' '#1084#1086#1078#1077#1090#1077' '#1074#1086#1089 +
                #1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1073#1072#1079#1091' '#1076#1072#1085#1085#1099#1093' '#1080#1079' '#1072#1088#1093#1080#1074#1085#1086#1081' '#1082#1086#1087#1080#1080', '#1080#1089#1087#1086#1083#1100#1079#1091#1103' '#1084#1077#1085#1102': <'#1057#1077#1088#1074#1080#1089 +
                ' | '#1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1073#1072#1079#1091' '#1076#1072#1085#1085#1099#1093' '#1080#1079' '#1072#1088#1093#1080#1074#1072'...>.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              WordWrap = True
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object grdDBs: TdxDBGrid
              Left = 10
              Top = 138
              Width = 544
              Height = 455
              DrawDragFrame = False
              Bands = <
                item
                end>
              DefaultLayout = True
              HeaderPanelRowCount = 1
              KeyField = 'DBID'
              SummaryGroups = <>
              SummarySeparator = ', '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnDblClick = grdDBsDblClick
              BandFont.Charset = DEFAULT_CHARSET
              BandFont.Color = clBlack
              BandFont.Height = -11
              BandFont.Name = 'Tahoma'
              BandFont.Style = [fsBold]
              DataSource = srcDB
              Filter.Criteria = {00000000}
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clBlack
              HeaderFont.Height = -11
              HeaderFont.Name = 'Tahoma'
              HeaderFont.Style = []
              LookAndFeel = lfUltraFlat
              OptionsCustomize = [edgoBandMoving, edgoBandSizing, edgoColumnSizing]
              OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
              OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowAutoHeight, edgoRowSelect, edgoUseBitmap]
              PreviewFont.Charset = DEFAULT_CHARSET
              PreviewFont.Color = clBlue
              PreviewFont.Height = -11
              PreviewFont.Name = 'Tahoma'
              PreviewFont.Style = [fsBold]
              OnCustomDrawCell = grdDBsCustomDrawCell
              Anchors = [akLeft, akTop, akRight, akBottom]
              object colDBName: TdxDBGridColumn
                Alignment = taLeftJustify
                Caption = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093
                HeaderAlignment = taCenter
                Width = 154
                BandIndex = 0
                RowIndex = 0
                FieldName = 'DESC'
              end
              object colDBOptions: TdxDBGridColumn
                Caption = #1057#1086#1079#1076#1072#1074#1072#1090#1100' '#1072#1088#1093#1080#1074' '#1082#1072#1078#1076#1099#1077
                HeaderAlignment = taCenter
                Sorted = csUp
                Width = 167
                BandIndex = 0
                RowIndex = 0
                OnGetText = colDBOptionsGetText
              end
              object colEnabled: TdxDBGridColumn
                Visible = False
                BandIndex = 0
                RowIndex = 0
                FieldName = 'Enabled'
              end
              object colIntervalType: TdxDBGridColumn
                Visible = False
                BandIndex = 0
                RowIndex = 0
                FieldName = 'IntervalType'
              end
              object colIntervalValue: TdxDBGridColumn
                Visible = False
                BandIndex = 0
                RowIndex = 0
                FieldName = 'IntervalValue'
              end
              object colDBOnTime: TdxDBGridColumn
                Visible = False
                BandIndex = 0
                RowIndex = 0
                FieldName = 'OnTime'
              end
            end
          end
        end
        object tsUpdStat: TcxTabSheet
          Caption = 'tsUpdStat'
          ImageIndex = 0
          TabVisible = False
          object gbUS: TssGroupBox
            Left = 0
            Top = 0
            Width = 565
            Height = 533
            Align = alClient
            Alignment = alTopLeft
            Caption = ' '#1054#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080' '#1086#1073' '#1080#1085#1076#1077#1082#1089#1072#1093' '
            TabOrder = 0
            Edges = [beLeft, beRight, beTop, beBottom]
            object lUSText: TssLabel
              Left = 47
              Top = 84
              Width = 149
              Height = 32
              Caption = #1054#1073#1085#1086#1074#1083#1103#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1082#1072#1078#1076#1099#1077':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              WordWrap = True
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lUSTime: TssLabel
              Left = 426
              Top = 92
              Width = 7
              Height = 16
              Caption = #1074
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object rbtUSNo: TcxRadioButton
              Left = 25
              Top = 33
              Width = 518
              Height = 21
              Caption = #1053#1077' '#1074#1099#1087#1086#1083#1085#1103#1090#1100' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1086#1077' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080' '#1086#1073' '#1080#1085#1076#1077#1082#1089#1072#1093
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              TabStop = True
              OnClick = rbtUSNoClick
              LookAndFeel.Kind = lfUltraFlat
            end
            object rbtUSYes: TcxRadioButton
              Left = 25
              Top = 58
              Width = 518
              Height = 21
              Caption = #1042#1099#1087#1086#1083#1085#1103#1090#1100' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1086#1077' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080' '#1086#1073' '#1080#1085#1076#1077#1082#1089#1072#1093
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnClick = rbtUSNoClick
              LookAndFeel.Kind = lfUltraFlat
            end
            object edUSInterval: TcxSpinEdit
              Left = 224
              Top = 87
              Width = 84
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.ImmediatePost = True
              Properties.MaxValue = 10000.000000000000000000
              Properties.MinValue = 1.000000000000000000
              Properties.OnEditValueChanged = edUSIntervalPropertiesEditValueChanged
              Style.StyleController = dmData.scMain
              TabOrder = 2
              Value = 1
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object cbUSInterval: TcxComboBox
              Left = 313
              Top = 87
              Width = 102
              Height = 26
              Enabled = False
              ImeName = 'Russian'
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.OnEditValueChanged = edUSIntervalPropertiesEditValueChanged
              Style.StyleController = dmData.scMain
              TabOrder = 3
            end
            object edUSTime: TcxTimeEdit
              Left = 439
              Top = 87
              Width = 94
              Height = 26
              EditValue = 0.000000000000000000
              Enabled = False
              ParentFont = False
              Properties.OnChange = edUSIntervalPropertiesEditValueChanged
              Style.StyleController = dmData.scMain
              TabOrder = 4
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
          end
        end
        object tsUpdStatDBs: TcxTabSheet
          Caption = 'tsUpdStatDBs'
          ImageIndex = 0
          TabVisible = False
          object gbUSDBs: TssGroupBox
            Left = 0
            Top = 0
            Width = 565
            Height = 604
            Align = alClient
            Alignment = alTopLeft
            Caption = 'gbWBIn'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Edges = [beLeft, beRight, beTop, beBottom]
            DesignSize = (
              565
              604)
            object lUpdStatText: TssLabel
              Left = 11
              Top = 28
              Width = 537
              Height = 72
              AutoSize = False
              Caption = 
                ' '#1053#1080#1078#1077' '#1042#1099' '#1084#1086#1078#1077#1090#1077' '#1085#1072#1089#1090#1088#1086#1080#1090#1100' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1086#1077' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1077' '#1086#1087#1090#1080#1084#1080#1079#1072#1094#1080#1080' ' +
                #1076#1083#1103' '#1074#1099#1073#1088#1072#1085'- '#1085#1099#1093' '#1042#1072#1084#1080' '#1073#1072#1079' '#1076#1072#1085#1085#1099#1093'. '#1054#1087#1090#1080#1084#1080#1079#1072#1094#1080#1103' '#1085#1091#1078#1085#1072' '#1076#1083#1103' '#1087#1086#1074#1099#1096#1077#1085#1080#1103 +
                ' '#1089#1082#1086#1088#1086#1089#1090#1080' '#1088#1072#1073#1086#1090#1099' '#1089' '#1073#1072#1079#1086#1081' '#1076#1072#1085#1085#1099#1093'. '#1058#1072#1082#1078#1077' '#1042#1099' '#1084#1086#1078#1077#1090#1077' '#1074#1099#1087#1086#1083#1085#1080#1090#1100' '#1086#1087#1090#1080#1084 +
                #1080#1079#1072#1094#1080#1102' '#1074#1088#1091#1095#1085#1091#1102', '#1074#1086#1089#1087#1086#1083#1100#1079#1086#1074#1072#1074#1096#1080#1089#1100' '#1075#1083#1072#1074#1085#1099#1084' '#1084#1077#1085#1102' "'#1057#1077#1088#1074#1080#1089' | '#1042#1099#1087#1086#1083#1085#1080#1090 +
                #1100' '#1086#1087#1090#1080#1084#1080#1079#1072#1094#1080#1102' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093'".'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              WordWrap = True
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object grdUpdStat: TdxDBGrid
              Left = 10
              Top = 103
              Width = 545
              Height = 490
              DrawDragFrame = False
              Bands = <
                item
                end>
              DefaultLayout = True
              HeaderPanelRowCount = 1
              KeyField = 'DBID'
              SummaryGroups = <>
              SummarySeparator = ', '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnDblClick = grdUpdStatDblClick
              BandFont.Charset = DEFAULT_CHARSET
              BandFont.Color = clBlack
              BandFont.Height = -11
              BandFont.Name = 'Tahoma'
              BandFont.Style = [fsBold]
              DataSource = srcDB
              Filter.Criteria = {00000000}
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clBlack
              HeaderFont.Height = -11
              HeaderFont.Name = 'Tahoma'
              HeaderFont.Style = []
              LookAndFeel = lfUltraFlat
              OptionsCustomize = [edgoBandMoving, edgoBandSizing, edgoColumnSizing]
              OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
              OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowAutoHeight, edgoRowSelect, edgoUseBitmap]
              PreviewFont.Charset = DEFAULT_CHARSET
              PreviewFont.Color = clBlue
              PreviewFont.Height = -11
              PreviewFont.Name = 'Tahoma'
              PreviewFont.Style = [fsBold]
              OnCustomDrawCell = grdDBsCustomDrawCell
              Anchors = [akLeft, akTop, akRight, akBottom]
              object colUSName: TdxDBGridColumn
                Alignment = taLeftJustify
                Caption = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093
                HeaderAlignment = taCenter
                Width = 154
                BandIndex = 0
                RowIndex = 0
                FieldName = 'DESC'
              end
              object colUSText: TdxDBGridColumn
                Caption = #1042#1099#1087#1086#1083#1085#1103#1090#1100' '#1086#1087#1090#1080#1084#1080#1079#1072#1094#1080#1102' '#1082#1072#1078#1076#1099#1077
                HeaderAlignment = taCenter
                Sorted = csDown
                Width = 167
                BandIndex = 0
                RowIndex = 0
                OnGetText = colUSTextGetText
              end
              object colUSEnabled: TdxDBGridColumn
                Visible = False
                BandIndex = 0
                RowIndex = 0
                FieldName = 'updenabled'
              end
              object colUSIntervalType: TdxDBGridColumn
                Visible = False
                BandIndex = 0
                RowIndex = 0
                FieldName = 'updintervaltype'
              end
              object colUSIntervalValue: TdxDBGridColumn
                Visible = False
                BandIndex = 0
                RowIndex = 0
                FieldName = 'updintervalvalue'
              end
              object colUSTime: TdxDBGridColumn
                Visible = False
                BandIndex = 0
                RowIndex = 0
                FieldName = 'updtime'
              end
            end
          end
        end
        object tsPDCharge: TcxTabSheet
          Caption = 'tsPDCharge'
          ImageIndex = 0
          TabVisible = False
          object gbPDCharge: TssGroupBox
            Left = 0
            Top = 0
            Width = 565
            Height = 533
            Align = alClient
            Alignment = alTopLeft
            Caption = 'gbWBMove'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Edges = [beLeft, beRight, beTop, beBottom]
            object lPDChargePrefix: TssLabel
              Left = 44
              Top = 107
              Width = 56
              Height = 16
              Caption = #1055#1088#1077#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lPDChargeCurrNum: TssLabel
              Left = 182
              Top = 107
              Width = 97
              Height = 16
              Caption = #1058#1077#1082#1091#1097#1080#1081' '#1085#1086#1084#1077#1088':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lPDChargeSuffix: TssLabel
              Left = 384
              Top = 107
              Width = 58
              Height = 16
              Caption = #1057#1091#1092#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object chbPDChargeAutoNum: TcxCheckBox
              Left = 20
              Top = 69
              Width = 528
              Height = 26
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1040#1074#1090#1086#1085#1091#1084#1077#1088#1072#1094#1080#1103
              Style.StyleController = dmData.scMain
              TabOrder = 1
              ImeName = 'Russian'
              OnClick = chbPDChargeAutoNumClick
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edPDChargePrefix: TcxTextEdit
              Left = 108
              Top = 101
              Width = 66
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 2
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edPDChargeCurrNum: TcxSpinEdit
              Left = 289
              Top = 101
              Width = 81
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.MaxValue = 1000000000000.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 3
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edPDChargeSuffix: TcxTextEdit
              Left = 453
              Top = 101
              Width = 65
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 4
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object chbPDChargeChecked: TcxCheckBox
              Left = 20
              Top = 34
              Width = 528
              Height = 26
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1089#1086#1079#1076#1072#1105#1090#1089#1103' '#1082#1072#1082' '#1087#1088#1086#1074#1077#1076#1105#1085#1085#1099#1081
              Style.StyleController = dmData.scMain
              TabOrder = 0
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
          end
        end
        object tsWriteOff: TcxTabSheet
          Caption = 'tsWriteOff'
          ImageIndex = 0
          TabVisible = False
          object gbWriteOff: TssGroupBox
            Left = 0
            Top = 0
            Width = 565
            Height = 533
            Align = alClient
            Alignment = alTopLeft
            Caption = 'gbWriteOff'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Edges = [beLeft, beRight, beTop, beBottom]
            object lWriteOffDefAmount: TssLabel
              Left = 26
              Top = 34
              Width = 361
              Height = 16
              Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1090#1086#1074#1072#1088#1072', '#1087#1088#1077#1076#1083#1072#1075#1072#1077#1084#1086#1077' '#1076#1083#1103' '#1074#1074#1086#1076#1072' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddStandard
              DisabledColor = clBlack
            end
            object lWriteOffPrefix: TssLabel
              Left = 44
              Top = 107
              Width = 56
              Height = 16
              Caption = #1055#1088#1077#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lWriteOffCurrNum: TssLabel
              Left = 182
              Top = 107
              Width = 97
              Height = 16
              Caption = #1058#1077#1082#1091#1097#1080#1081' '#1085#1086#1084#1077#1088':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lWriteOffSuffix: TssLabel
              Left = 384
              Top = 107
              Width = 58
              Height = 16
              Caption = #1057#1091#1092#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object edWriteOffDefAmount: TcxCurrencyEdit
              Left = 453
              Top = 28
              Width = 65
              Height = 26
              ImeName = 'Russian'
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.DecimalPlaces = 5
              Properties.DisplayFormat = '0'
              Properties.MaxValue = 1000000000.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 0
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object chbWriteOffAutoNum: TcxCheckBox
              Left = 20
              Top = 69
              Width = 528
              Height = 26
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1040#1074#1090#1086#1085#1091#1084#1077#1088#1072#1094#1080#1103
              Style.StyleController = dmData.scMain
              TabOrder = 1
              ImeName = 'Russian'
              OnClick = chbWriteOffAutoNumClick
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object chbWriteOffChecked: TcxCheckBox
              Left = 20
              Top = 133
              Width = 528
              Height = 26
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1089#1086#1079#1076#1072#1105#1090#1089#1103' '#1082#1072#1082' '#1087#1088#1086#1074#1077#1076#1105#1085#1085#1099#1081
              Style.StyleController = dmData.scMain
              TabOrder = 5
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edWriteOffCurrNum: TcxSpinEdit
              Left = 289
              Top = 101
              Width = 81
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.MaxValue = 1000000000000.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 3
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edWriteOffPrefix: TcxTextEdit
              Left = 108
              Top = 101
              Width = 66
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 2
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edWriteOffSuffix: TcxTextEdit
              Left = 453
              Top = 101
              Width = 65
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 4
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
          end
        end
        object tsInv: TcxTabSheet
          Caption = 'tsInv'
          ImageIndex = 0
          TabVisible = False
          object gbInv: TssGroupBox
            Left = 0
            Top = 0
            Width = 565
            Height = 604
            Align = alClient
            Alignment = alTopLeft
            Caption = 'gbInv'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Edges = [beLeft, beRight, beTop, beBottom]
            object lInvPrefix: TssLabel
              Left = 44
              Top = 97
              Width = 56
              Height = 16
              Caption = #1055#1088#1077#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lInvCurrNum: TssLabel
              Left = 182
              Top = 97
              Width = 97
              Height = 16
              Caption = #1058#1077#1082#1091#1097#1080#1081' '#1085#1086#1084#1077#1088':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lInvSuffix: TssLabel
              Left = 384
              Top = 97
              Width = 58
              Height = 16
              Caption = #1057#1091#1092#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object chbInvAutoNum: TcxCheckBox
              Left = 20
              Top = 59
              Width = 528
              Height = 26
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1040#1074#1090#1086#1085#1091#1084#1077#1088#1072#1094#1080#1103
              Style.StyleController = dmData.scMain
              TabOrder = 0
              ImeName = 'Russian'
              OnClick = chbInvAutoNumClick
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object chbInvChecked: TcxCheckBox
              Left = 20
              Top = 30
              Width = 528
              Height = 25
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1089#1086#1079#1076#1072#1105#1090#1089#1103' '#1082#1072#1082' '#1087#1088#1086#1074#1077#1076#1105#1085#1085#1099#1081
              Style.StyleController = dmData.scMain
              TabOrder = 4
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edInvCurrNum: TcxSpinEdit
              Left = 289
              Top = 91
              Width = 81
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.MaxValue = 1000000000000.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 2
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edInvPrefix: TcxTextEdit
              Left = 108
              Top = 91
              Width = 66
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 1
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edInvSuffix: TcxTextEdit
              Left = 453
              Top = 91
              Width = 65
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 3
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
          end
        end
        object tsWBRetOut: TcxTabSheet
          Caption = 'tsWBRetOut'
          ImageIndex = 0
          TabVisible = False
          object gbWBRetOut: TssGroupBox
            Left = 0
            Top = 0
            Width = 565
            Height = 533
            Align = alClient
            Alignment = alTopLeft
            Caption = 'gbWBIn'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Edges = [beLeft, beRight, beTop, beBottom]
            object lRetOutPrefix: TssLabel
              Left = 44
              Top = 107
              Width = 56
              Height = 16
              Caption = #1055#1088#1077#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lRetOutCurrNum: TssLabel
              Left = 182
              Top = 107
              Width = 97
              Height = 16
              Caption = #1058#1077#1082#1091#1097#1080#1081' '#1085#1086#1084#1077#1088':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lRetOutSuffix: TssLabel
              Left = 384
              Top = 107
              Width = 58
              Height = 16
              Caption = #1057#1091#1092#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object chbRetOutAutoNum: TcxCheckBox
              Left = 20
              Top = 69
              Width = 528
              Height = 26
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1040#1074#1090#1086#1085#1091#1084#1077#1088#1072#1094#1080#1103
              Style.StyleController = dmData.scMain
              TabOrder = 0
              ImeName = 'Russian'
              OnClick = chbRetOutAutoNumClick
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object chbRetOutChecked: TcxCheckBox
              Left = 20
              Top = 34
              Width = 528
              Height = 26
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1089#1086#1079#1076#1072#1105#1090#1089#1103' '#1082#1072#1082' '#1087#1088#1086#1074#1077#1076#1105#1085#1085#1099#1081
              Style.StyleController = dmData.scMain
              TabOrder = 4
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edRetOutCurrNum: TcxSpinEdit
              Left = 289
              Top = 101
              Width = 81
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.MaxValue = 1000000000000.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 2
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edRetOutPrefix: TcxTextEdit
              Left = 108
              Top = 101
              Width = 66
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 1
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edRetOutSuffix: TcxTextEdit
              Left = 453
              Top = 101
              Width = 65
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 3
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
          end
        end
        object tsWBRetIn: TcxTabSheet
          Caption = 'tsWBRetIn'
          ImageIndex = 1
          TabVisible = False
          object gbWBRetIn: TssGroupBox
            Left = 0
            Top = 0
            Width = 565
            Height = 533
            Align = alClient
            Alignment = alTopLeft
            Caption = 'gbWBIn'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Edges = [beLeft, beRight, beTop, beBottom]
            object lRetInPrefix: TssLabel
              Left = 44
              Top = 107
              Width = 56
              Height = 16
              Caption = #1055#1088#1077#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lRetInCurrNum: TssLabel
              Left = 182
              Top = 107
              Width = 97
              Height = 16
              Caption = #1058#1077#1082#1091#1097#1080#1081' '#1085#1086#1084#1077#1088':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lRetInSuffix: TssLabel
              Left = 384
              Top = 107
              Width = 58
              Height = 16
              Caption = #1057#1091#1092#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object chbRetInAutoNum: TcxCheckBox
              Left = 20
              Top = 69
              Width = 528
              Height = 26
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1040#1074#1090#1086#1085#1091#1084#1077#1088#1072#1094#1080#1103
              Style.StyleController = dmData.scMain
              TabOrder = 1
              ImeName = 'Russian'
              OnClick = chbRetInAutoNumClick
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object chbRetInChecked: TcxCheckBox
              Left = 20
              Top = 34
              Width = 528
              Height = 26
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1089#1086#1079#1076#1072#1105#1090#1089#1103' '#1082#1072#1082' '#1087#1088#1086#1074#1077#1076#1105#1085#1085#1099#1081
              Style.StyleController = dmData.scMain
              TabOrder = 0
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edRetInCurrNum: TcxSpinEdit
              Left = 289
              Top = 101
              Width = 81
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.MaxValue = 1000000000000.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 3
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edRetInPrefix: TcxTextEdit
              Left = 108
              Top = 101
              Width = 66
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 2
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edRetInSuffix: TcxTextEdit
              Left = 453
              Top = 101
              Width = 65
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 4
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
          end
        end
        object tsFinance: TcxTabSheet
          Caption = 'tsFinance'
          ImageIndex = 0
          TabVisible = False
          object gbFinance: TssGroupBox
            Left = 0
            Top = 0
            Width = 565
            Height = 604
            Align = alClient
            Alignment = alTopLeft
            Caption = ' '#1060#1080#1085#1072#1085#1089#1099' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Edges = [beLeft, beRight, beTop, beBottom]
            object lCheckMoney: TLabel
              Left = 50
              Top = 33
              Width = 504
              Height = 51
              AutoSize = False
              Caption = 
                #1055#1088#1080' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1080' '#1080#1089#1093#1086#1076#1103#1097#1077#1075#1086' '#1087#1083#1072#1090#1077#1078#1072' '#1087#1088#1086#1074#1077#1088#1103#1090#1100' '#1085#1072#1083#1080#1095#1080#1080' '#1085#1091#1078#1085#1086#1081' '#1089#1091#1084#1084#1099 +
                ' '#1074' '#1082#1072#1089#1089#1077' '#1083#1080#1073#1086' '#1085#1072' '#1088#1072#1089#1095#1105#1090#1085#1086#1084' '#1089#1095#1105#1090#1077
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              WordWrap = True
            end
            object lNDS: TLabel
              Left = 26
              Top = 85
              Width = 90
              Height = 16
              Caption = #1057#1090#1072#1074#1082#1072' '#1053#1044#1057', %'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object chbCheckMoney: TcxCheckBox
              Left = 20
              Top = 30
              Width = 30
              Height = 25
              ParentFont = False
              Properties.Alignment = taLeftJustify
              Properties.DisplayUnchecked = 'False'
              Properties.MultiLine = True
              Properties.OnChange = DataModified
              Properties.Caption = ''
              Style.StyleController = dmData.scMain
              TabOrder = 0
              ImeName = 'Russian'
              OnClick = chbWBInAutoPriceClick
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edNDS: TcxCurrencyEdit
              Left = 153
              Top = 80
              Width = 99
              Height = 26
              ImeName = 'Russian'
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = '0'
              Properties.UseLeftAlignmentOnEditing = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 1
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
          end
        end
        object tsInvoice: TcxTabSheet
          Caption = 'tsInvoice'
          ImageIndex = 0
          TabVisible = False
          object gbInvoice: TssGroupBox
            Left = 0
            Top = 0
            Width = 565
            Height = 570
            Align = alClient
            Alignment = alTopLeft
            Caption = 'gbInvoice'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Edges = [beLeft, beRight, beTop, beBottom]
            object lInvoiceDefAmount: TssLabel
              Left = 26
              Top = 34
              Width = 361
              Height = 16
              Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1090#1086#1074#1072#1088#1072', '#1087#1088#1077#1076#1083#1072#1075#1072#1077#1084#1086#1077' '#1076#1083#1103' '#1074#1074#1086#1076#1072' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddStandard
              DisabledColor = clBlack
            end
            object lInvoicePrefix: TssLabel
              Left = 44
              Top = 107
              Width = 56
              Height = 16
              Caption = #1055#1088#1077#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lInvoiceCurrNum: TssLabel
              Left = 182
              Top = 107
              Width = 97
              Height = 16
              Caption = #1058#1077#1082#1091#1097#1080#1081' '#1085#1086#1084#1077#1088':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lInvoiceSuffix: TssLabel
              Left = 384
              Top = 107
              Width = 58
              Height = 16
              Caption = #1057#1091#1092#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object edInvoiceDefAmount: TcxCurrencyEdit
              Left = 453
              Top = 28
              Width = 65
              Height = 26
              ImeName = 'Russian'
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.DecimalPlaces = 5
              Properties.DisplayFormat = '0'
              Properties.MaxValue = 1000000000.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 0
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object chbInvoiceAutoNum: TcxCheckBox
              Left = 20
              Top = 69
              Width = 528
              Height = 26
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1040#1074#1090#1086#1085#1091#1084#1077#1088#1072#1094#1080#1103
              Style.StyleController = dmData.scMain
              TabOrder = 1
              ImeName = 'Russian'
              OnClick = chbInvoiceAutoNumClick
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edInvoiceCurrNum: TcxSpinEdit
              Left = 289
              Top = 101
              Width = 81
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.MaxValue = 1000000000000.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 3
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edInvoicePrefix: TcxTextEdit
              Left = 108
              Top = 101
              Width = 66
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 2
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edInvoiceSuffix: TcxTextEdit
              Left = 453
              Top = 101
              Width = 65
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 4
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
          end
        end
        object tsBarCodes: TcxTabSheet
          Caption = 'tsBarCodes'
          ImageIndex = 0
          TabVisible = False
          object gbBarCodes: TssGroupBox
            Left = 0
            Top = 0
            Width = 565
            Height = 604
            Align = alClient
            Alignment = alTopLeft
            Caption = 'gbWBIn'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Edges = [beLeft, beRight, beTop, beBottom]
            object lBCFirstDigit: TssLabel
              Left = 44
              Top = 68
              Width = 194
              Height = 16
              Caption = #1064#1090#1088#1080#1093'-'#1082#1086#1076' '#1085#1072#1095#1080#1085#1072#1077#1090#1089#1103' '#1089' '#1094#1080#1092#1088#1099':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lBCCode: TssLabel
              Left = 44
              Top = 97
              Width = 222
              Height = 16
              Caption = #1050#1086#1076' '#1090#1086#1074#1072#1088#1072' '#1088#1072#1079#1084#1077#1097#1072#1077#1090#1089#1103' '#1074' '#1087#1086#1079#1080#1094#1080#1103#1093' '
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lBCCodeTo: TssLabel
              Left = 396
              Top = 97
              Width = 14
              Height = 16
              Caption = #1087#1086
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lBCCodeFrom: TssLabel
              Left = 310
              Top = 97
              Width = 6
              Height = 16
              Alignment = taRightJustify
              Caption = #1089
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lBCWeight: TssLabel
              Left = 44
              Top = 127
              Width = 217
              Height = 16
              Caption = #1042#1077#1089' '#1090#1086#1074#1072#1088#1072' '#1088#1072#1079#1084#1077#1097#1072#1077#1090#1089#1103' '#1074' '#1087#1086#1079#1080#1094#1080#1103#1093
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lBCCodeIntFrom: TssLabel
              Left = 310
              Top = 156
              Width = 6
              Height = 16
              Alignment = taRightJustify
              Caption = #1089
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lBCCodeIntTo: TssLabel
              Left = 396
              Top = 156
              Width = 14
              Height = 16
              Caption = #1087#1086
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lBCCodeInt: TssLabel
              Left = 200
              Top = 156
              Width = 79
              Height = 16
              Alignment = taRightJustify
              Caption = #1062#1077#1083#1072#1103' '#1095#1072#1089#1090#1100':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lBCCodeFrac: TssLabel
              Left = 186
              Top = 186
              Width = 93
              Height = 16
              Alignment = taRightJustify
              Caption = #1044#1088#1086#1073#1085#1072#1103' '#1095#1072#1089#1090#1100':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lBCCodeFracFrom: TssLabel
              Left = 310
              Top = 186
              Width = 6
              Height = 16
              Alignment = taRightJustify
              Caption = #1089
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lBCCodeFracTo: TssLabel
              Left = 396
              Top = 186
              Width = 14
              Height = 16
              Caption = #1087#1086
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object edBCFirstDigit: TcxSpinEdit
              Left = 324
              Top = 63
              Width = 61
              Height = 24
              Enabled = False
              ParentFont = False
              Properties.MaxValue = 9.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 0
              Value = 2
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edBCCodeFrom: TcxSpinEdit
              Left = 324
              Top = 92
              Width = 61
              Height = 24
              Enabled = False
              ParentFont = False
              Properties.MaxValue = 100.000000000000000000
              Properties.MinValue = 2.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 1
              Value = 2
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edBCCodeTo: TcxSpinEdit
              Left = 417
              Top = 92
              Width = 62
              Height = 24
              Enabled = False
              ParentFont = False
              Properties.MaxValue = 100.000000000000000000
              Properties.MinValue = 2.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 2
              Value = 8
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edBCCodeIntFrom: TcxSpinEdit
              Left = 324
              Top = 151
              Width = 61
              Height = 24
              Enabled = False
              ParentFont = False
              Properties.MaxValue = 100.000000000000000000
              Properties.MinValue = 2.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 3
              Value = 9
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edBCCodeIntTo: TcxSpinEdit
              Left = 417
              Top = 151
              Width = 62
              Height = 24
              Enabled = False
              ParentFont = False
              Properties.MaxValue = 100.000000000000000000
              Properties.MinValue = 2.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 4
              Value = 9
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edBCCodeFracFrom: TcxSpinEdit
              Left = 324
              Top = 181
              Width = 61
              Height = 24
              Enabled = False
              ParentFont = False
              Properties.MaxValue = 100.000000000000000000
              Properties.MinValue = 2.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 5
              Value = 9
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edBCCodeFracTo: TcxSpinEdit
              Left = 417
              Top = 181
              Width = 62
              Height = 24
              Enabled = False
              ParentFont = False
              Properties.MaxValue = 100.000000000000000000
              Properties.MinValue = 2.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 6
              Value = 9
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object chbBC_Weight: TcxCheckBox
              Left = 20
              Top = 30
              Width = 528
              Height = 24
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1077' '#1074#1077#1089#1086#1074#1099#1093' '#1096#1090#1088#1080#1093'-'#1082#1086#1076#1086#1074
              Style.StyleController = dmData.scMain
              TabOrder = 7
              ImeName = 'Russian'
              OnClick = chbBC_WeightClick
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
          end
        end
        object tsWH: TcxTabSheet
          Caption = 'tsWH'
          ImageIndex = 0
          TabVisible = False
          object gbWH: TssGroupBox
            Left = 0
            Top = 0
            Width = 565
            Height = 604
            Align = alClient
            Alignment = alTopLeft
            Caption = 'gbWBIn'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Edges = [beLeft, beRight, beTop, beBottom]
            object lHLWMatNeeded: TssLabel
              Left = 43
              Top = 68
              Width = 150
              Height = 16
              Caption = #1042#1099#1076#1077#1083#1103#1090#1100' '#1090#1086#1074#1072#1088#1099' '#1094#1074#1077#1090#1086#1084
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object Shape1: TShape
              Left = 10
              Top = 94
              Width = 548
              Height = 55
              Brush.Color = clActiveBorder
              Pen.Color = clGray
            end
            object chbShowAllMats: TcxCheckBox
              Left = 20
              Top = 95
              Width = 523
              Height = 50
              AutoSize = False
              ParentFont = False
              Properties.Alignment = taLeftJustify
              Properties.DisplayUnchecked = 'False'
              Properties.MultiLine = True
              Properties.OnChange = DataModified
              Properties.Caption = 
                #1055#1086#1082#1072#1079' '#1090#1086#1074', '#1087#1086' '#1082#1086#1090' '#1085#1077' '#1073#1099#1083#1086' '#1086#1073#1086#1088', '#1077#1089#1083#1080' '#1074#1082#1083' '#1086#1087#1094' "'#1055#1086#1082#1072#1079' '#1090#1086#1074' '#1089' '#1085#1091#1083' '#1086#1089 +
                #1090'"'
              Style.StyleController = dmData.scMain
              TabOrder = 2
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object chbHLWMatNeeded: TcxCheckBox
              Left = 17
              Top = 34
              Width = 541
              Height = 24
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = 
                #1042' '#1088#1072#1079#1076#1077#1083#1077' "'#1057#1082#1083#1072#1076'" '#1074#1099#1076#1077#1083#1103#1090#1100' '#1090#1086#1074#1072#1088#1099', '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1082#1086#1090#1086#1088#1099#1093' '#1084#1077#1085#1100#1096#1077' '#1084#1080#1085 +
                '. '#1079#1072#1087#1072#1089#1072
              State = cbsChecked
              Style.StyleController = dmData.scMain
              TabOrder = 0
              ImeName = 'Russian'
              OnClick = chbHLWMatNeededClick
            end
            object edHLWMatNeeded: TcxColorComboBox
              Left = 236
              Top = 63
              Width = 184
              Height = 24
              ImeName = 'Russian'
              ParentFont = False
              Properties.AllowSelectColor = True
              Properties.DefaultDescription = 'Color not selected'
              Properties.ShowDescriptions = False
              Properties.OnChange = DataModified
              Properties.OnEditValueChanged = DataModified
              Properties.Items = <>
              Properties.PrepareInfo = ''
              Style.StyleController = dmData.scMain
              TabOrder = 1
            end
          end
        end
        object tsOrdersIn: TcxTabSheet
          Caption = 'tsOrdersIn'
          ImageIndex = 0
          TabVisible = False
          object gbOrdersIn: TssGroupBox
            Left = 0
            Top = 0
            Width = 565
            Height = 533
            Align = alClient
            Alignment = alTopLeft
            Caption = 'gbWBIn'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Edges = [beLeft, beRight, beTop, beBottom]
            object lOrdersInDefAmount: TssLabel
              Left = 26
              Top = 34
              Width = 361
              Height = 16
              Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1090#1086#1074#1072#1088#1072', '#1087#1088#1077#1076#1083#1072#1075#1072#1077#1084#1086#1077' '#1076#1083#1103' '#1074#1074#1086#1076#1072' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddStandard
              DisabledColor = clBlack
            end
            object lOrdersInPrefix: TssLabel
              Left = 44
              Top = 107
              Width = 56
              Height = 16
              Caption = #1055#1088#1077#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lOrdersInCurrNum: TssLabel
              Left = 182
              Top = 107
              Width = 97
              Height = 16
              Caption = #1058#1077#1082#1091#1097#1080#1081' '#1085#1086#1084#1077#1088':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lOrdersInSuffix: TssLabel
              Left = 384
              Top = 107
              Width = 58
              Height = 16
              Caption = #1057#1091#1092#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object edOrdersInDefAmount: TcxCurrencyEdit
              Left = 453
              Top = 28
              Width = 65
              Height = 26
              ImeName = 'Russian'
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.DecimalPlaces = 5
              Properties.DisplayFormat = '0'
              Properties.MaxValue = 1000000000.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 0
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object chbOrdersInAutoNum: TcxCheckBox
              Left = 20
              Top = 69
              Width = 528
              Height = 26
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1040#1074#1090#1086#1085#1091#1084#1077#1088#1072#1094#1080#1103
              Style.StyleController = dmData.scMain
              TabOrder = 1
              ImeName = 'Russian'
              OnClick = chbOrdersInAutoNumClick
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edOrdersInCurrNum: TcxSpinEdit
              Left = 289
              Top = 101
              Width = 81
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.MaxValue = 1000000000000.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 3
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edOrdersInPrefix: TcxTextEdit
              Left = 108
              Top = 101
              Width = 66
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 2
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edOrdersInSuffix: TcxTextEdit
              Left = 453
              Top = 101
              Width = 65
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 4
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object chbOISelectNP: TcxCheckBox
              Left = 20
              Top = 144
              Width = 311
              Height = 26
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1042#1099#1076#1077#1083#1103#1090#1100' '#1085#1077#1086#1087#1083#1072#1095#1077#1085#1085#1099#1077' '#1089#1095#1077#1090#1072' '#1094#1074#1077#1090#1086#1084
              Style.StyleController = dmData.scMain
              TabOrder = 5
              ImeName = 'Russian'
              OnClick = chbOISelectNPClick
            end
            object edOISelectNP: TcxColorComboBox
              Left = 335
              Top = 144
              Width = 183
              Height = 26
              Enabled = False
              ImeName = 'Russian'
              ParentFont = False
              Properties.AllowSelectColor = True
              Properties.DefaultDescription = 'Color not selected'
              Properties.ShowDescriptions = False
              Properties.OnChange = DataModified
              Properties.OnEditValueChanged = DataModified
              Properties.Items = <>
              Properties.PrepareInfo = ''
              Style.StyleController = dmData.scMain
              TabOrder = 6
            end
          end
        end
        object tsOrdersOut: TcxTabSheet
          Caption = 'tsOrdersOut'
          ImageIndex = 1
          TabVisible = False
          object gbOrdersOut: TssGroupBox
            Left = 0
            Top = 0
            Width = 565
            Height = 533
            Align = alClient
            Alignment = alTopLeft
            Caption = 'gbWBIn'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Edges = [beLeft, beRight, beTop, beBottom]
            object lOrdersOutDefAmount: TssLabel
              Left = 26
              Top = 34
              Width = 361
              Height = 16
              Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1090#1086#1074#1072#1088#1072', '#1087#1088#1077#1076#1083#1072#1075#1072#1077#1084#1086#1077' '#1076#1083#1103' '#1074#1074#1086#1076#1072' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddStandard
              DisabledColor = clBlack
            end
            object lOrdersOutPrefix: TssLabel
              Left = 44
              Top = 107
              Width = 56
              Height = 16
              Caption = #1055#1088#1077#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lOrdersOutCurrNum: TssLabel
              Left = 182
              Top = 107
              Width = 97
              Height = 16
              Caption = #1058#1077#1082#1091#1097#1080#1081' '#1085#1086#1084#1077#1088':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lOrdersOutSuffix: TssLabel
              Left = 384
              Top = 107
              Width = 58
              Height = 16
              Caption = #1057#1091#1092#1092#1080#1082#1089':'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object edOrdersOutDefAmount: TcxCurrencyEdit
              Left = 453
              Top = 28
              Width = 65
              Height = 26
              ImeName = 'Russian'
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.DecimalPlaces = 5
              Properties.DisplayFormat = '0'
              Properties.MaxValue = 1000000000.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 0
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object chbOrdersOutAutoNum: TcxCheckBox
              Left = 20
              Top = 69
              Width = 528
              Height = 26
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1040#1074#1090#1086#1085#1091#1084#1077#1088#1072#1094#1080#1103
              Style.StyleController = dmData.scMain
              TabOrder = 1
              ImeName = 'Russian'
              OnClick = chbOrdersOutAutoNumClick
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edOrdersOutCurrNum: TcxSpinEdit
              Left = 289
              Top = 101
              Width = 81
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.MaxValue = 1000000000000.000000000000000000
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 2
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edOrdersOutPrefix: TcxTextEdit
              Left = 108
              Top = 101
              Width = 66
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 3
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object edOrdersOutSuffix: TcxTextEdit
              Left = 453
              Top = 101
              Width = 65
              Height = 26
              Enabled = False
              ParentFont = False
              Properties.OnChange = DataModified
              Style.StyleController = dmData.scMain
              TabOrder = 4
              ImeName = 'Russian'
              OnKeyDown = GoNextKeyDown
              OnKeyPress = GoNext
            end
            object chbOOSelectNP: TcxCheckBox
              Left = 20
              Top = 144
              Width = 311
              Height = 26
              ParentFont = False
              Properties.DisplayUnchecked = 'False'
              Properties.OnChange = DataModified
              Properties.Caption = #1042#1099#1076#1077#1083#1103#1090#1100' '#1085#1077#1086#1087#1083#1072#1095#1077#1085#1085#1099#1077' '#1089#1095#1077#1090#1072' '#1094#1074#1077#1090#1086#1084
              Style.StyleController = dmData.scMain
              TabOrder = 5
              ImeName = 'Russian'
              OnClick = chbOOSelectNPClick
            end
            object edOOSelectNP: TcxColorComboBox
              Left = 335
              Top = 144
              Width = 183
              Height = 26
              Enabled = False
              ImeName = 'Russian'
              ParentFont = False
              Properties.AllowSelectColor = True
              Properties.DefaultDescription = 'Color not selected'
              Properties.ShowDescriptions = False
              Properties.OnChange = DataModified
              Properties.OnEditValueChanged = DataModified
              Properties.Items = <>
              Properties.PrepareInfo = ''
              Style.StyleController = dmData.scMain
              TabOrder = 6
            end
          end
        end
        object tsGrp: TcxTabSheet
          Caption = 'tsGrp'
          ImageIndex = 0
          TabVisible = False
          object gbGrp: TssGroupBox
            Left = 0
            Top = 0
            Width = 565
            Height = 604
            Align = alClient
            Alignment = alTopLeft
            Caption = 'gbCommon'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Edges = [beLeft, beRight, beTop, beBottom]
            object tlGrp: TdxTreeList
              Left = 18
              Top = 31
              Width = 469
              Height = 482
              DrawDragFrame = False
              Bands = <
                item
                end>
              DefaultLayout = True
              HeaderPanelRowCount = 1
              BorderStyle = bsNone
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              BandFont.Charset = DEFAULT_CHARSET
              BandFont.Color = clWindowText
              BandFont.Height = -11
              BandFont.Name = 'Tahoma'
              BandFont.Style = [fsBold]
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWindowText
              HeaderFont.Height = -11
              HeaderFont.Name = 'Tahoma'
              HeaderFont.Style = [fsBold]
              HideSelection = False
              LookAndFeel = lfUltraFlat
              Options = [aoColumnSizing, aoColumnMoving, aoTabThrough, aoHideFocusRect]
              PreviewFont.Charset = DEFAULT_CHARSET
              PreviewFont.Color = clBlue
              PreviewFont.Height = -11
              PreviewFont.Name = 'Tahoma'
              PreviewFont.Style = [fsBold]
              HighlightColor = clBtnFace
              HighlightTextColor = clBtnText
              TreeLineColor = clGrayText
              ShowButtons = False
              ShowPreviewGrid = False
              ShowHeader = False
              ShowLines = False
              ShowRoot = False
              OnClick = tlGrpClick
              OnMouseMove = tlGrpMouseMove
              object tlGrpColumn3: TdxTreeListImageColumn
                Alignment = taLeftJustify
                MinWidth = 16
                Width = 27
                BandIndex = 0
                RowIndex = 0
                Images = dmData.Images
                ImageIndexes.Strings = (
                  '0'
                  '1'
                  '2'
                  '3'
                  '4'
                  '5'
                  '6'
                  '7'
                  '8'
                  '9'
                  '10'
                  '11'
                  '12'
                  '13'
                  '14'
                  '15'
                  '16'
                  '17'
                  '18'
                  '19'
                  '20'
                  '21'
                  '22'
                  '23'
                  '24'
                  '25'
                  '26'
                  '27'
                  '28'
                  '29'
                  '30'
                  '31'
                  '32'
                  '33'
                  '34'
                  '35'
                  '36'
                  '37'
                  '38'
                  '39'
                  '40'
                  '41'
                  '42'
                  '43'
                  '44'
                  '45'
                  '46'
                  '47'
                  '48'
                  '49'
                  '50'
                  '51'
                  '52'
                  '53'
                  '54'
                  '55'
                  '56'
                  '57'
                  '58'
                  '59'
                  '60'
                  '61'
                  '62'
                  '63'
                  '64'
                  '65'
                  '66'
                  '67'
                  '68'
                  '69'
                  '70'
                  '71'
                  '72'
                  '73'
                  '74'
                  '75'
                  '76'
                  '77'
                  '78'
                  '79'
                  '80'
                  '81'
                  '82'
                  '83'
                  '84'
                  '85'
                  '86'
                  '87'
                  '88'
                  '89'
                  '90'
                  '91'
                  '92'
                  '93'
                  '94'
                  '95'
                  '96'
                  '97'
                  '98'
                  '99'
                  '100'
                  '101'
                  '102'
                  '103'
                  '104'
                  '105'
                  '106'
                  '107'
                  '108'
                  '109'
                  '110'
                  '111'
                  '112'
                  '113'
                  '114'
                  '115'
                  '116'
                  '117'
                  '118'
                  '119'
                  '120'
                  '121'
                  '122'
                  '123'
                  '124'
                  '125'
                  '126'
                  '127'
                  '128'
                  '129'
                  '130'
                  '131'
                  '132'
                  '133'
                  '134'
                  '135'
                  '136'
                  '137'
                  '138'
                  '139'
                  '140'
                  '141'
                  '142'
                  '143'
                  '144'
                  '145'
                  '146'
                  '147'
                  '148'
                  '149'
                  '150'
                  '151'
                  '152'
                  '153'
                  '154'
                  '155'
                  '156'
                  '157'
                  '158'
                  '159'
                  '160'
                  '161'
                  '162'
                  '163'
                  '164'
                  '165'
                  '166'
                  '167'
                  '168'
                  '169'
                  '170'
                  '171'
                  '172'
                  '173'
                  '174'
                  '175'
                  '176'
                  '177'
                  '178'
                  '179'
                  '180'
                  '181'
                  '182'
                  '183'
                  '184'
                  '185'
                  '186'
                  '187'
                  '188'
                  '189'
                  '190'
                  '191'
                  '192'
                  '193'
                  '194'
                  '195'
                  '196'
                  '197'
                  '198'
                  '199'
                  '200'
                  '201'
                  '202'
                  '203'
                  '204'
                  '205')
                Values.Strings = (
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  '1')
              end
              object tlGrpColumn1: TdxTreeListColumn
                Width = 250
                BandIndex = 0
                RowIndex = 0
              end
              object colJump: TdxTreeListImageColumn
                Alignment = taLeftJustify
                MinWidth = 16
                Width = 29
                BandIndex = 0
                RowIndex = 0
                Images = dmData.Images
                ImageIndexes.Strings = (
                  '0'
                  '1'
                  '2'
                  '3'
                  '4'
                  '5'
                  '6'
                  '7'
                  '8'
                  '9'
                  '10'
                  '11'
                  '12'
                  '13'
                  '14'
                  '15'
                  '16'
                  '17'
                  '18'
                  '19'
                  '20'
                  '21'
                  '22'
                  '23'
                  '24'
                  '25'
                  '26'
                  '27'
                  '28'
                  '29'
                  '30'
                  '31'
                  '32'
                  '33'
                  '34'
                  '35'
                  '36'
                  '37'
                  '38'
                  '39'
                  '40'
                  '41'
                  '42'
                  '43'
                  '44'
                  '45'
                  '46'
                  '47'
                  '48'
                  '49'
                  '50'
                  '51'
                  '52'
                  '53'
                  '54'
                  '55'
                  '56'
                  '57'
                  '58'
                  '59'
                  '60'
                  '61'
                  '62'
                  '63'
                  '64'
                  '65'
                  '66'
                  '67'
                  '68'
                  '69'
                  '70'
                  '71'
                  '72'
                  '73'
                  '74'
                  '75'
                  '76'
                  '77'
                  '78'
                  '79'
                  '80'
                  '81'
                  '82'
                  '83'
                  '84'
                  '85'
                  '86'
                  '87'
                  '88'
                  '89'
                  '90'
                  '91'
                  '92'
                  '93'
                  '94'
                  '95'
                  '96'
                  '97'
                  '98'
                  '99'
                  '100'
                  '101'
                  '102'
                  '103'
                  '104'
                  '105'
                  '106'
                  '107'
                  '108'
                  '109'
                  '110'
                  '111'
                  '112'
                  '113'
                  '114'
                  '115'
                  '116'
                  '117'
                  '118'
                  '119'
                  '120'
                  '121'
                  '122'
                  '123'
                  '124'
                  '125'
                  '126'
                  '127'
                  '128'
                  '129'
                  '130'
                  '131'
                  '132'
                  '133'
                  '134'
                  '135'
                  '136'
                  '137'
                  '138'
                  '139'
                  '140'
                  '141'
                  '142'
                  '143'
                  '144'
                  '145'
                  '146'
                  '147'
                  '148'
                  '149'
                  '150'
                  '151'
                  '152'
                  '153'
                  '154'
                  '155'
                  '156'
                  '157'
                  '158'
                  '159'
                  '160'
                  '161'
                  '162'
                  '163'
                  '164'
                  '165'
                  '166'
                  '167'
                  '168'
                  '169'
                  '170'
                  '171'
                  '172'
                  '173'
                  '174'
                  '175'
                  '176'
                  '177'
                  '178'
                  '179'
                  '180'
                  '181'
                  '182'
                  '183'
                  '184'
                  '185'
                  '186'
                  '187'
                  '188'
                  '189'
                  '190'
                  '191'
                  '192'
                  '193'
                  '194'
                  '195'
                  '196'
                  '197'
                  '198'
                  '199'
                  '200'
                  '201'
                  '202'
                  '203'
                  '204'
                  '205'
                  '206')
                Values.Strings = (
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  ''
                  '1')
              end
            end
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited aCancel: TAction
      ShortCut = 27
    end
    object aAccNew: TAction
      Category = 'Accounts'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 0
      ShortCut = 45
      OnExecute = aAccNewExecute
    end
    object aAccDel: TAction
      Category = 'Accounts'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 2
      ShortCut = 16430
      OnExecute = aAccDelExecute
    end
    object aAccProps: TAction
      Tag = 1
      Category = 'Accounts'
      Caption = #1057#1074#1086#1081#1089#1090#1074#1072
      ImageIndex = 1
      ShortCut = 16397
      OnExecute = aAccNewExecute
    end
    object aBanksRef: TAction
      Caption = 'aBanksRef'
      ImageIndex = 19
      OnExecute = aBanksRefExecute
    end
    object aAccountRef: TAction
      Caption = 'aAccountRef'
      ImageIndex = 23
      OnExecute = aAccountRefExecute
    end
    object aHelp: TAction
      Caption = 'aHelp'
      ImageIndex = 10
      ShortCut = 112
      OnExecute = aHelpExecute
    end
  end
  object FormStorage: TssFormStorage
    Active = False
    UseRegistry = True
    StoredValues = <>
    Left = 34
    Top = 80
  end
  object mdAccount: TssMemoryData
    FieldDefs = <>
    Filtered = True
    OnFilterRecord = mdAccountFilterRecord
    Left = 63
    Top = 164
    object mdAccountaccid: TIntegerField
      FieldName = 'accid'
    end
    object mdAccounttypeid: TIntegerField
      FieldName = 'typeid'
    end
    object mdAccountbankid: TIntegerField
      FieldName = 'bankid'
    end
    object mdAccountmfo: TStringField
      FieldKind = fkLookup
      FieldName = 'mfo'
      LookupDataSet = cdsBanks
      LookupKeyFields = 'BANKID'
      LookupResultField = 'MFO'
      KeyFields = 'bankid'
      Size = 15
      Lookup = True
    end
    object mdAccountbankname: TStringField
      FieldKind = fkLookup
      FieldName = 'bankname'
      LookupDataSet = cdsBanks
      LookupKeyFields = 'BANKID'
      LookupResultField = 'NAME'
      KeyFields = 'bankid'
      Size = 64
      Lookup = True
    end
    object mdAccounttypename: TStringField
      FieldKind = fkLookup
      FieldName = 'typename'
      LookupDataSet = cdsAccountType
      LookupKeyFields = 'typeid'
      LookupResultField = 'NAME'
      KeyFields = 'typeid'
      Size = 48
      Lookup = True
    end
    object mdAccountfnode: TIntegerField
      FieldName = 'fnode'
    end
    object mdAccountnum: TStringField
      FieldName = 'num'
      Size = 48
    end
    object mdAccountdeleted: TIntegerField
      FieldName = 'deleted'
    end
  end
  object srcAccount: TDataSource
    DataSet = mdAccount
    Left = 91
    Top = 164
  end
  object cdsBanks: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pBanks_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 63
    Top = 196
  end
  object dsBanks: TDataSource
    DataSet = cdsBanks
    Left = 91
    Top = 196
  end
  object cdsAccountType: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pAccountType_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 63
    Top = 228
  end
  object dsAccountType: TDataSource
    DataSet = cdsAccountType
    Left = 91
    Top = 228
  end
  object pmTree: TTBPopupMenu
    Images = dmData.Images18x18
    Left = 76
    Top = 80
    object mnuNew: TTBItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 0
      Images = dmData.Images18x18
      ShortCut = 45
      OnClick = mnuNewClick
    end
    object mnuDel: TTBItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 2
      Images = dmData.Images18x18
      ShortCut = 16430
      OnClick = mnuDelClick
    end
  end
  object cdsDB: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pSysDB_List'
    RemoteServer = dmData.SConnection
    AfterOpen = cdsDBAfterOpen
    Macros = <>
    Left = 59
    Top = 354
    object cdsDBDBID: TIntegerField
      FieldName = 'DBID'
    end
    object cdsDBDESC: TStringField
      FieldName = 'DESC'
      Size = 128
    end
    object cdsDBDEF: TIntegerField
      FieldName = 'DEF'
    end
    object cdsDBEnabled: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'Enabled'
    end
    object cdsDBIntervalType: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'IntervalType'
      Size = 1
    end
    object cdsDBOnTime: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'OnTime'
    end
    object cdsDBIntervalValue: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'IntervalValue'
    end
    object cdsDBfnode: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'fnode'
    end
    object cdsDBbackupdir: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'backupdir'
      Size = 128
    end
    object cdsDBfbackupdir: TStringField
      FieldName = 'fbackupdir'
      ReadOnly = True
      Size = 128
    end
    object cdsDBfintervalvalue: TIntegerField
      FieldName = 'fintervalvalue'
      ReadOnly = True
    end
    object cdsDBfintervaltype: TStringField
      FieldName = 'fintervaltype'
      ReadOnly = True
      Size = 1
    end
    object cdsDBfbackuptime: TDateTimeField
      FieldName = 'fbackuptime'
      ReadOnly = True
    end
    object cdsDBfupdintervalvalue: TIntegerField
      FieldName = 'fupdintervalvalue'
      ReadOnly = True
    end
    object cdsDBfupdintervaltype: TStringField
      FieldName = 'fupdintervaltype'
      ReadOnly = True
      Size = 1
    end
    object cdsDBfupdtime: TDateTimeField
      FieldName = 'fupdtime'
      ReadOnly = True
    end
    object cdsDBfupdnode: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'fupdnode'
    end
    object cdsDBupdenabled: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'updenabled'
    end
    object cdsDBupdintervalvalue: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'updintervalvalue'
    end
    object cdsDBupdintervaltype: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'updintervaltype'
      Size = 1
    end
    object cdsDBupdtime: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'updtime'
    end
  end
  object srcDB: TDataSource
    DataSet = cdsDB
    OnDataChange = srcDBDataChange
    Left = 87
    Top = 354
  end
  object dlgDir: TJvBrowseForFolderDialog
    Position = fpFormCenter
    RootDirectory = fdRootFolder
    Left = 115
    Top = 354
  end
  object cdsPriceTypes: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'matid'
        ParamType = ptUnknown
      end>
    ProviderName = 'pPriceTypes_MatList'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 55
    Top = 294
  end
  object dsPriceTypes: TDataSource
    DataSet = cdsPriceTypes
    Left = 83
    Top = 294
  end
end
