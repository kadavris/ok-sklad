inherited frmInitialSettings: TfrmInitialSettings
  Left = 491
  Top = 373
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'Initial settings'
  ClientHeight = 471
  ClientWidth = 636
  OldCreateOrder = True
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panTitleBar: TssGradientPanel
    Width = 636
    inherited panTitleButtons: TssPanel
      Left = 577
    end
  end
  object panMain: TPanel [1]
    Left = 167
    Top = 21
    Width = 469
    Height = 409
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'panMain'
    ParentBackground = False
    TabOrder = 1
    object pcMain: TPageControl
      Left = 2
      Top = 2
      Width = 465
      Height = 405
      ActivePage = tsCID
      Align = alClient
      TabOrder = 0
      OnChange = pcMainChange
      object tsCID: TTabSheet
        Caption = 'tsCID'
        DesignSize = (
          457
          374)
        object cbLang: TcxComboBox
          Left = 158
          Top = 177
          Width = 158
          Height = 24
          ImeName = 'Russian'
          ParentFont = False
          Properties.OnChange = cbLangPropertiesChange
          Style.StyleController = dmData.scMain
          TabOrder = 0
        end
        object cbRepLang: TcxComboBox
          Left = 158
          Top = 217
          Width = 158
          Height = 24
          ImeName = 'Russian'
          ParentFont = False
          Properties.OnChange = cbRepLangPropertiesChange
          Style.StyleController = dmData.scMain
          TabOrder = 1
        end
        object lblLang: TcxLabel
          Left = 10
          Top = 182
          Width = 139
          Height = 21
          AutoSize = False
          TabOrder = 2
          ImeName = 'Russian'
        end
        object lblRepLang: TcxLabel
          Left = 10
          Top = 220
          Width = 139
          Height = 21
          AutoSize = False
          TabOrder = 3
          ImeName = 'Russian'
        end
        object gbCID: TGroupBox
          Left = 10
          Top = 10
          Width = 434
          Height = 159
          Anchors = [akLeft, akTop, akRight]
          Caption = 'gbCID'
          Color = 2121983
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 4
          DesignSize = (
            434
            159)
          object lblCountryID: TcxLabel
            Left = 20
            Top = 59
            Width = 395
            Height = 51
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.WordWrap = True
            TabOrder = 0
            ImeName = 'Russian'
          end
          object cbCountryID: TcxImageComboBox
            Left = 20
            Top = 25
            Width = 395
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownRows = 12
            Properties.Items = <>
            Properties.OnChange = cbCountryIDPropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 1
          end
          object cbAR: TcxComboBox
            Left = 148
            Top = 117
            Width = 158
            Height = 24
            Enabled = False
            ImeName = 'Russian'
            ParentFont = False
            Properties.OnChange = cbLangPropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 2
          end
          object chbARdef: TcxCheckBox
            Left = 315
            Top = 118
            Width = 100
            Height = 24
            Enabled = False
            ParentFont = False
            Properties.DisplayUnchecked = 'False'
            Properties.OnChange = chbARdefPropertiesChange
            Properties.Caption = 'Default'
            State = cbsChecked
            Style.BorderStyle = ebsThick
            TabOrder = 3
            ImeName = 'Russian'
          end
          object lAR: TcxLabel
            Left = 20
            Top = 121
            Width = 129
            Height = 21
            AutoSize = False
            TabOrder = 4
            ImeName = 'Russian'
            Caption = 'Accounting Rules'
          end
        end
      end
    end
  end
  object PanBottom: TPanel [2]
    Left = 0
    Top = 430
    Width = 636
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      636
      41)
    object btnOK: TxButton
      Left = 522
      Top = 6
      Width = 109
      Height = 31
      Anchors = [akTop, akRight]
      Caption = 'OK'
      ColorInner = clBtnShadow
      Gradient.ColorEnd = clWindow
      Gradient.Direction = gdVertical
      Gradient.Enabled = True
      OnClick = btnOKClick
      TabOrder = 0
    end
    object btnCancel: TxButton
      Left = 393
      Top = 6
      Width = 109
      Height = 31
      Anchors = [akTop, akRight]
      Caption = 'cancel'
      ColorInner = clBtnShadow
      Gradient.ColorEnd = clWindow
      Gradient.Direction = gdVertical
      Gradient.Enabled = True
      OnClick = btnCancelClick
      TabOrder = 1
    end
  end
  object tvMain: TcxTreeView [3]
    Left = 0
    Top = 21
    Width = 159
    Height = 409
    Align = alLeft
    TabOrder = 3
    MultiSelectStyle = [msControlSelect]
    OnChange = tvMainChange
  end
  object splMain: TcxSplitter [4]
    Left = 159
    Top = 21
    Width = 8
    Height = 409
    HotZoneClassName = 'TcxMediaPlayer9Style'
    HotZone.SizePercent = 40
    HotZone.LightColor = clWhite
    Control = tvMain
    Color = clScrollBar
    ParentColor = False
  end
end
