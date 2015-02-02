inherited frmEditMaterials: TfrmEditMaterials
  Left = 440
  Top = 251
  Width = 900
  Height = 600
  Caption = 'frmEditMaterials'
  Constraints.MinHeight = 600
  Constraints.MinWidth = 900
  OnCloseQuery = FormCloseQuery
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 884
    Height = 480
    object tvMain: TcxTreeList
      Left = 0
      Top = 0
      Width = 185
      Height = 480
      Align = alLeft
      Bands = <
        item
          Caption.Text = 'Band1'
        end>
      BufferedPaint = False
      Images = dmData.Images
      LookAndFeel.Kind = lfStandard
      OptionsBehavior.CellHints = True
      OptionsData.Deleting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Headers = False
      TabOrder = 0
      OnCustomDrawCell = tvMainCustomDrawCell
      OnSelectionChanged = tvMainSelectionChanged
      object colNAme: TcxTreeListColumn
        DataBinding.ValueType = 'String'
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        Width = 181
      end
      object colID: TcxTreeListColumn
        DataBinding.ValueType = 'String'
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
        Visible = False
      end
      object colDeff: TcxTreeListColumn
        DataBinding.ValueType = 'String'
        Position.ColIndex = 2
        Position.RowIndex = 0
        Position.BandIndex = 0
        Visible = False
      end
    end
    object pcMain: TcxPageControl
      Left = 193
      Top = 0
      Width = 691
      Height = 480
      ActivePage = tsCustomAttr
      Align = alClient
      Images = dmData.Images
      LookAndFeel.Kind = lfUltraFlat
      TabOrder = 1
      object tsMain: TcxTabSheet
        Caption = 'tsMain'
        ImageIndex = 24
        TabVisible = False
        object gbMainInfo: TssGroupBox
          Left = 0
          Top = 0
          Width = 691
          Height = 226
          Align = alClient
          Alignment = alTopLeft
          Caption = ' main info '
          TabOrder = 0
          TabStop = False
          Edges = [beLeft, beRight, beTop, beBottom]
          DesignSize = (
            691
            226)
          object lType: TssLabel
            Left = 14
            Top = 32
            Width = 135
            Height = 16
            AutoSize = False
            Caption = 'type'
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object lName: TssLabel
            Left = 14
            Top = 54
            Width = 32
            Height = 16
            Caption = 'name'
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object lArtikul: TssLabel
            Left = 14
            Top = 79
            Width = 35
            Height = 16
            Caption = 'model'
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object btnCopyName: TssSpeedButton
            Left = 655
            Top = 50
            Width = 20
            Height = 20
            Alignment = taRightJustify
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            DisabledImages = dmData.Images18x18dis
            GroupIndex = 0
            ImageIndex = 35
            Images = dmData.Images18x18
            LeftMargin = 1
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnClick = btnCopyNameClick
          end
          object btnCopyArtikul: TssSpeedButton
            Left = 655
            Top = 75
            Width = 20
            Height = 20
            Alignment = taRightJustify
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            DisabledImages = dmData.Images18x18dis
            GroupIndex = 0
            ImageIndex = 39
            Images = dmData.Images18x18
            LeftMargin = 1
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnClick = btnCopyArtikulClick
          end
          object cbType: TcxComboBox
            Left = 148
            Top = 23
            Width = 147
            Height = 24
            AutoSize = False
            ImeName = 'Russian'
            Properties.DropDownListStyle = lsFixedList
            Properties.OnChange = cbTypePropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 0
            OnKeyPress = GoNext
          end
          object edName: TcxTextEdit
            Left = 148
            Top = 48
            Width = 501
            Height = 24
            Cursor = crIBeam
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Properties.MaxLength = 255
            Properties.OnChange = edNamePropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 1
            ImeName = 'Russian'
            OnKeyDown = edNameKeyDown
            OnKeyPress = GoNext
          end
          object edArtikul: TcxTextEdit
            Left = 148
            Top = 73
            Width = 501
            Height = 24
            Cursor = crIBeam
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Properties.HideSelection = False
            Properties.MaxLength = 255
            Properties.OnChange = edArtikulPropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 2
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object pcParent: TPageControl
            Left = 10
            Top = 96
            Width = 671
            Height = 120
            ActivePage = tsMat
            Align = alCustom
            Anchors = [akLeft, akTop, akRight, akBottom]
            Constraints.MinHeight = 120
            Style = tsFlatButtons
            TabOrder = 3
            TabStop = False
            object tsMat: TTabSheet
              Caption = 'tsMat'
              TabVisible = False
              DesignSize = (
                663
                110)
              object btnGrp: TssSpeedButton
                Left = 641
                Top = 1
                Width = 20
                Height = 20
                Action = aMIns
                Alignment = taLeftJustify
                AllwaysShowFrame = False
                Anchors = [akTop, akRight]
                ButtonType = ssbtStandard
                Checked = False
                DisabledImages = dmData.Images18x18dis
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                GroupIndex = 0
                ImageIndex = 24
                Images = dmData.Images18x18
                LeftMargin = 1
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                Style = ssbsUser
                ViewStyle = ssvsGlyphOnly
                OnMouseDown = btnMeasuresMouseDown
                OnMouseUp = btnMeasuresMouseUp
              end
              object btnMeasures: TssSpeedButton
                Left = 270
                Top = 26
                Width = 20
                Height = 20
                Action = aMIns
                Alignment = taLeftJustify
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
                ImageIndex = 24
                Images = dmData.Images18x18
                LeftMargin = 1
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                Style = ssbsUser
                ViewStyle = ssvsGlyphOnly
                OnMouseDown = btnMeasuresMouseDown
                OnMouseUp = btnMeasuresMouseUp
              end
              object btnWHouse: TssSpeedButton
                Left = 270
                Top = 52
                Width = 20
                Height = 20
                Action = aMIns
                Alignment = taLeftJustify
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
                ImageIndex = 24
                Images = dmData.Images18x18
                LeftMargin = 1
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                Style = ssbsUser
                ViewStyle = ssvsGlyphOnly
                OnMouseDown = btnMeasuresMouseDown
                OnMouseUp = btnMeasuresMouseUp
              end
              object lWarehouse: TssLabel
                Left = -1
                Top = 56
                Width = 65
                Height = 16
                Caption = 'Warehouse'
                DisabledDraw = ddUser
                DisabledColor = clBtnShadow
              end
              object lMeasure: TssLabel
                Left = -1
                Top = 31
                Width = 78
                Height = 16
                Caption = 'Measurement'
                DisabledDraw = ddUser
                DisabledColor = clBtnShadow
              end
              object lParent: TssLabel
                Left = -1
                Top = 6
                Width = 135
                Height = 16
                AutoSize = False
                Caption = 'Product group'
                DisabledDraw = ddUser
                DisabledColor = clBtnShadow
              end
              object lMinReserv: TssLabel
                Left = 373
                Top = 55
                Width = 91
                Height = 16
                Alignment = taRightJustify
                Caption = 'Minimal reserve'
                DisabledDraw = ddUser
                DisabledColor = clBtnShadow
              end
              object lMinM: TssLabel
                Left = 594
                Top = 55
                Width = 23
                Height = 16
                Caption = 'pcs.'
                DisabledDraw = ddUser
                DisabledColor = clBtnShadow
              end
              object lcbParent: TssPopupTreeEdit
                Left = 134
                Top = 0
                Width = 499
                Height = 24
                Anchors = [akLeft, akTop, akRight]
                BeepOnEnter = False
                ParentFont = False
                Properties.PopupAutoSize = False
                Properties.PopupSizeable = False
                Properties.PopupWidth = 497
                Properties.ReadOnly = False
                Properties.OnChange = lcbParentPropertiesChange
                Properties.OnEditValueChanged = lcbParentPropertiesEditValueChanged
                Style.StyleController = dmData.scMain
                TabOrder = 0
                ImeName = 'Russian'
                OnEnter = lcbParentEnter
                OnExit = lcbParentExit
                OnKeyPress = lcbParentKeyPress
                OnGetNodeImageIndex = lcbParentGetNodeImageIndex
                ListSource = srcParent
                KeyField = 'grpid'
                ParentField = 'pid'
                DisplayField = 'name'
                ShowExpandedTree = False
                Images = dmData.Images
              end
              object lcbMeasure: TssDBLookupCombo
                Left = 134
                Top = 25
                Width = 133
                Height = 24
                BeepOnEnter = False
                ImeName = 'Russian'
                ParentFont = False
                Properties.DropDownListStyle = lsFixedList
                Properties.OnChange = lcbMeasurePropertiesChange
                Properties.OnEditValueChanged = lcbMeasurePropertiesEditValueChanged
                Style.StyleController = dmData.scMain
                TabOrder = 1
                OnEnter = lcbMeasureEnter
                OnExit = lcbMeasureExit
                OnKeyPress = lcbMeasureKeyPress
                EmptyValue = 0
                KeyField = 'mid'
                ListField = 'shortname'
                ListSource = srcMeasures
              end
              object lcbWarehouse: TssDBLookupCombo
                Left = 134
                Top = 50
                Width = 133
                Height = 24
                BeepOnEnter = False
                ImeName = 'Russian'
                ParentFont = False
                Properties.DropDownListStyle = lsEditFixedList
                Properties.OnChange = lcbWarehousePropertiesChange
                Properties.OnEditValueChanged = lcbWarehousePropertiesEditValueChanged
                Style.StyleController = dmData.scMain
                TabOrder = 2
                OnEnter = lcbWarehouseEnter
                OnExit = lcbWarehouseExit
                OnKeyPress = lcbWarehouseKeyPress
                EmptyValue = 0
                KeyField = 'wid'
                ListField = 'name'
                ListSource = srcWarehouse
              end
              object chbSerials: TcxCheckBox
                Left = 136
                Top = 79
                Width = 374
                Height = 24
                ParentFont = False
                Properties.DisplayUnchecked = 'False'
                Properties.OnEditValueChanged = DataModified
                Properties.Caption = 'Use serial numbers/Unique IDs'
                Style.StyleController = dmData.scMain
                TabOrder = 4
                ImeName = 'Russian'
                OnClick = chbSerialsClick
                OnKeyDown = GoNextKeyDown
                OnKeyPress = GoNext
              end
              object edMinReserv: TssCalcEdit
                Left = 473
                Top = 50
                Width = 114
                Height = 24
                BeepOnEnter = False
                EditValue = 0.000000000000000000
                ImeName = 'Russian'
                ParentFont = False
                Properties.OnChange = edMinReservPropertiesChange
                Style.StyleController = dmData.scMain
                TabOrder = 3
                OnEnter = edMinReservEnter
                OnExit = edMinReservExit
                OnKeyDown = GoNextKeyDown
                OnKeyPress = edMinReservKeyPress
                CalcColor = clBtnFace
                DecimalPlaces = 5
              end
            end
            object tsGrp: TTabSheet
              Caption = 'tsGrp'
              ImageIndex = 1
              TabVisible = False
              DesignSize = (
                663
                110)
              object btnGrpParent: TssSpeedButton
                Left = 633
                Top = 23
                Width = 20
                Height = 20
                Action = aMIns
                Alignment = taLeftJustify
                AllwaysShowFrame = False
                Anchors = [akTop, akRight]
                ButtonType = ssbtStandard
                Checked = False
                DisabledImages = dmData.Images18x18dis
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                GroupIndex = 0
                ImageIndex = 24
                Images = dmData.Images18x18
                LeftMargin = 2
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                Style = ssbsUser
                ViewStyle = ssvsGlyphOnly
                OnMouseDown = btnMeasuresMouseDown
                OnMouseUp = btnMeasuresMouseUp
              end
              object lGrpParent: TssLabel
                Left = 21
                Top = 26
                Width = 113
                Height = 16
                AutoSize = False
                Caption = 'Category'
                DisabledDraw = ddUser
                DisabledColor = clBtnShadow
              end
              object lcbGrpParent: TssPopupTreeEdit
                Left = 134
                Top = 21
                Width = 498
                Height = 24
                Anchors = [akLeft, akTop, akRight]
                Properties.PopupAutoSize = False
                Properties.PopupSizeable = False
                Properties.PopupWidth = 496
                Properties.ReadOnly = False
                Properties.OnEditValueChanged = lcbGrpParentPropertiesEditValueChanged
                Style.StyleController = dmData.scMain
                TabOrder = 1
                ImeName = 'Russian'
                OnEnter = lcbParentEnter
                OnExit = lcbMeasureExit
                OnKeyPress = GoNext
                OnGetNodeImageIndex = lcbParentGetNodeImageIndex
                ListSource = srcParent
                KeyField = 'grpid'
                ParentField = 'pid'
                DisplayField = 'name'
                ShowExpandedTree = False
                Images = dmData.Images
              end
              object rbtParent: TcxRadioButton
                Left = -1
                Top = 0
                Width = 470
                Height = 21
                Caption = 'Member of category'
                Checked = True
                TabOrder = 0
                TabStop = True
                OnClick = rbtParentClick
              end
              object rbtNoParent: TcxRadioButton
                Left = -1
                Top = 52
                Width = 490
                Height = 21
                Caption = 'no category'
                TabOrder = 2
                OnClick = rbtParentClick
              end
            end
          end
        end
        object gbAddInfo: TssGroupBox
          Left = 0
          Top = 226
          Width = 691
          Height = 254
          Align = alBottom
          Alignment = alTopLeft
          Caption = ' Additional info  '
          TabOrder = 1
          TabStop = False
          Edges = [beLeft, beRight, beTop, beBottom]
          DesignSize = (
            691
            254)
          object lBarCode: TssLabel
            Left = 14
            Top = 110
            Width = 160
            Height = 16
            AutoSize = False
            Caption = 'Barcode: '
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object btnCountries: TssSpeedButton
            Left = 656
            Top = 24
            Width = 20
            Height = 20
            Action = aMIns
            Alignment = taLeftJustify
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
            ImageIndex = 24
            Images = dmData.Images18x18
            LeftMargin = 1
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnMouseDown = btnMeasuresMouseDown
            OnMouseUp = btnMeasuresMouseUp
          end
          object lCountry: TssLabel
            Left = 389
            Top = 26
            Width = 44
            Height = 16
            Alignment = taRightJustify
            Caption = 'Country'
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object lProducer: TssLabel
            Left = 14
            Top = 25
            Width = 100
            Height = 16
            AutoSize = False
            Caption = 'Producer'
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object lWeight: TssLabel
            Left = 15
            Top = 67
            Width = 85
            Height = 16
            AutoSize = False
            Caption = 'Weight'
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object lWeightM: TssLabel
            Left = 238
            Top = 67
            Width = 20
            Height = 16
            Caption = 'lbs.'
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object lSize: TssLabel
            Left = 327
            Top = 67
            Width = 100
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Size'
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object lSizeM: TssLabel
            Left = 538
            Top = 67
            Width = 109
            Height = 16
            AutoSize = False
            Caption = 'in.'
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object lDemandCat: TssLabel
            Left = 14
            Top = 189
            Width = 160
            Height = 22
            AutoSize = False
            Caption = 'Category of demand'
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object lLabelDescr: TssLabel
            Left = 14
            Top = 138
            Width = 148
            Height = 16
            Caption = 'Tag/Label description text'
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object Bevel3: TBevel
            Left = 15
            Top = 52
            Width = 677
            Height = 2
            Anchors = [akLeft, akTop, akRight]
          end
          object Bevel1: TBevel
            Left = 15
            Top = 93
            Width = 677
            Height = 2
            Anchors = [akLeft, akTop, akRight]
          end
          object Bevel2: TBevel
            Left = 15
            Top = 169
            Width = 677
            Height = 2
            Anchors = [akLeft, akTop, akRight]
          end
          object btnGenBarcode: TssSpeedButton
            Left = 490
            Top = 105
            Width = 20
            Height = 20
            Active = True
            Alignment = taLeftJustify
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            GroupIndex = 0
            ImageIndex = 82
            Images = dmData.Images
            LeftMargin = 1
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnClick = btnGenBarcodeClick
          end
          object lcbCountries: TssDBLookupCombo
            Left = 451
            Top = 21
            Width = 198
            Height = 24
            BeepOnEnter = False
            ImeName = 'Russian'
            Properties.DropDownListStyle = lsEditFixedList
            Properties.OnChange = lcbCountriesPropertiesChange
            Properties.OnEditValueChanged = lcbCountriesPropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 1
            OnEnter = lcbCountriesEnter
            OnExit = lcbCountriesExit
            OnKeyPress = lcbCountriesKeyPress
            EmptyValue = 0
            KeyField = 'cid'
            ListField = 'name'
            ListSource = srcCountries
          end
          object edBarCode: TcxTextEdit
            Left = 217
            Top = 104
            Width = 264
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            BeepOnEnter = False
            Properties.HideSelection = False
            Properties.MaxLength = 64
            Properties.OnChange = edBarCodePropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 4
            ImeName = 'Russian'
            OnEnter = edBarCodeEnter
            OnExit = edBarCodeExit
            OnKeyDown = GoNextKeyDown
            OnKeyPress = edBarCodeKeyPress
          end
          object edWeight: TssCalcEdit
            Left = 119
            Top = 61
            Width = 105
            Height = 24
            BeepOnEnter = False
            EditValue = 0.000000000000000000
            ImeName = 'Russian'
            Properties.OnChange = edWeightPropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 2
            OnEnter = edWeightEnter
            OnExit = edWeightExit
            OnKeyDown = GoNextKeyDown
            OnKeyPress = edWeightKeyPress
            CalcColor = clBtnFace
            DecimalPlaces = 5
          end
          object edSize: TssCalcEdit
            Left = 437
            Top = 61
            Width = 89
            Height = 24
            BeepOnEnter = False
            EditValue = 0.000000000000000000
            ImeName = 'Russian'
            Properties.OnChange = edSizePropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 3
            OnEnter = edSizeEnter
            OnExit = edSizeExit
            OnKeyDown = GoNextKeyDown
            OnKeyPress = edSizeKeyPress
            CalcColor = clBtnFace
            DecimalPlaces = 5
          end
          object cbDemandCat: TcxComboBox
            Left = 177
            Top = 182
            Width = 307
            Height = 24
            BeepOnEnter = False
            ImeName = 'Russian'
            Properties.DropDownListStyle = lsEditFixedList
            Properties.OnChange = cbDemandCatPropertiesChange
            Properties.OnEditValueChanged = cbDemandCatPropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 6
            OnEnter = cbDemandCatEnter
            OnExit = cbDemandCatExit
            OnKeyPress = cbDemandCatKeyPress
          end
          object cbProducer: TcxComboBox
            Left = 118
            Top = 21
            Width = 193
            Height = 24
            BeepOnEnter = False
            ImeName = 'Russian'
            Properties.OnChange = cbProducerPropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 0
            OnEnter = cbProducerEnter
            OnExit = cbProducerExit
            OnKeyPress = cbProducerKeyPress
          end
          object panBarCode: TPanel
            Left = 532
            Top = 99
            Width = 149
            Height = 65
            Anchors = [akTop, akRight]
            BevelInner = bvLowered
            ParentBackground = False
            TabOrder = 7
            object bcMain: TxBarCode
              Left = 6
              Top = 4
              Width = 138
              Height = 56
              BarColor = clBlack
              BarType = EAN13
              Color = clBtnFace
              ErrorText = 'Invalid Barcode!'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Transparent = True
            end
          end
          object edLabelDescr: TcxTextEdit
            Left = 217
            Top = 133
            Width = 296
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            BeepOnEnter = False
            Properties.HideSelection = False
            Properties.MaxLength = 255
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 5
            ImeName = 'Russian'
            OnEnter = edBarCodeEnter
            OnExit = edBarCodeExit
            OnKeyDown = GoNextKeyDown
            OnKeyPress = edBarCodeKeyPress
          end
        end
      end
      object tsPrice: TcxTabSheet
        Caption = 'tsPrice'
        ImageIndex = 2
        TabVisible = False
        OnShow = tsPriceShow
        object gbExtra: TssGroupBox
          Left = 0
          Top = 0
          Width = 691
          Height = 480
          Align = alClient
          Alignment = alTopLeft
          Caption = 'gbExtra'
          TabOrder = 0
          TabStop = False
          Edges = [beLeft, beRight, beTop, beBottom]
          DesignSize = (
            691
            480)
          object lPrice: TssLabel
            Left = 70
            Top = 191
            Width = 31
            Height = 16
            Alignment = taRightJustify
            Caption = 'lPrice'
            Enabled = False
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object lPriceNotes: TssLabel
            Left = 38
            Top = 412
            Width = 470
            Height = 46
            AutoSize = False
            Caption = '* lPriceNotes'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsUnderline]
            ParentFont = False
            WordWrap = True
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object chbDefineExtra: TcxCheckBox
            Left = 18
            Top = 38
            Width = 520
            Height = 24
            Properties.DisplayUnchecked = 'False'
            Properties.Caption = 'chbDefineExtra'
            Style.StyleController = dmData.scMain
            TabOrder = 0
            ImeName = 'Russian'
            OnClick = chbDefineExtraClick
          end
          object rbtKoef: TcxRadioButton
            Left = 43
            Top = 71
            Width = 331
            Height = 21
            Caption = 'rbtKoef'
            Checked = True
            TabOrder = 1
            TabStop = True
            OnClick = rbtKoefClick
            OnKeyPress = GoNext
            LookAndFeel.Kind = lfUltraFlat
          end
          object rbtPrice: TcxRadioButton
            Left = 43
            Top = 162
            Width = 297
            Height = 21
            Caption = 'rbtPrice'
            Enabled = False
            TabOrder = 2
            TabStop = True
            OnClick = rbtPriceClick
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            LookAndFeel.Kind = lfUltraFlat
          end
          object edPrice: TssCalcEdit
            Left = 110
            Top = 186
            Width = 124
            Height = 24
            EditValue = 0.000000000000000000
            Enabled = False
            ImeName = 'Russian'
            ParentColor = True
            Properties.OnChange = edPricePropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 3
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            CalcColor = clBtnFace
            DecimalPlaces = 6
          end
          object lcbCurrency: TssDBLookupCombo
            Left = 236
            Top = 186
            Width = 79
            Height = 24
            Enabled = False
            ImeName = 'Russian'
            ParentColor = True
            Properties.DropDownListStyle = lsFixedList
            Properties.OnEditValueChanged = rbtPriceClick
            Style.StyleController = dmData.scMain
            TabOrder = 4
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            EmptyValue = 0
            KeyField = 'currid'
            ListField = 'shortname'
            ListSource = srcCurrency
          end
          object chbWithNDS: TcxCheckBox
            Left = 319
            Top = 186
            Width = 150
            Height = 24
            Enabled = False
            Properties.DisplayUnchecked = 'False'
            Properties.OnEditValueChanged = rbtPriceClick
            Properties.Caption = 'chbWithNDS'
            State = cbsChecked
            Style.StyleController = dmData.scMain
            TabOrder = 5
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object pangbExtra: TPanel
            Left = 64
            Top = 94
            Width = 623
            Height = 65
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 6
            DesignSize = (
              623
              65)
            object lDiscText: TssLabel
              Left = 273
              Top = 38
              Width = 51
              Height = 16
              Caption = 'lDiscText'
              Enabled = False
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lPricePercent1: TssLabel
              Left = 245
              Top = 6
              Width = 12
              Height = 16
              Caption = '%'
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object lPricePercent2: TssLabel
              Left = 245
              Top = 34
              Width = 12
              Height = 16
              Caption = '%'
              DisabledDraw = ddUser
              DisabledColor = clBtnShadow
            end
            object edKoef: TssCalcEdit
              Left = 123
              Top = 2
              Width = 115
              Height = 24
              BeepOnEnter = False
              EditValue = 0.000000000000000000
              Enabled = False
              ImeName = 'Russian'
              ParentColor = True
              Properties.OnChange = edKoefPropertiesChange
              Style.StyleController = dmData.scMain
              TabOrder = 1
              OnEnter = edKoefEnter
              OnExit = edKoefExit
              OnKeyDown = GoNextKeyDown
              OnKeyPress = edKoefKeyPress
              CalcColor = clBtnFace
              DecimalPlaces = 2
            end
            object rbtExtra: TcxRadioButton
              Left = 0
              Top = 6
              Width = 105
              Height = 21
              Caption = 'rbtExtra, %:'
              Checked = True
              TabOrder = 0
              TabStop = True
              OnClick = rbtExtraClick
            end
            object rbtDisc: TcxRadioButton
              Left = 0
              Top = 36
              Width = 105
              Height = 21
              Caption = 'rbtDisc, %:'
              TabOrder = 4
              OnClick = rbtExtraClick
            end
            object edDisc: TssCalcEdit
              Left = 123
              Top = 32
              Width = 115
              Height = 24
              BeepOnEnter = False
              EditValue = 0.000000000000000000
              Enabled = False
              ImeName = 'Russian'
              ParentColor = True
              Properties.OnChange = edKoefPropertiesChange
              Style.StyleController = dmData.scMain
              TabOrder = 5
              OnEnter = edKoefEnter
              OnExit = edKoefExit
              OnKeyDown = GoNextKeyDown
              OnKeyPress = edKoefKeyPress
              CalcColor = clBtnFace
              DecimalPlaces = 2
            end
            object lcbPriceTypes: TssDBLookupCombo
              Left = 453
              Top = 33
              Width = 167
              Height = 24
              Anchors = [akLeft, akTop, akRight]
              Enabled = False
              ImeName = 'Russian'
              ParentColor = True
              Properties.DropDownListStyle = lsFixedList
              Properties.OnEditValueChanged = lcbPriceTypesPropertiesEditValueChanged
              Style.StyleController = dmData.scMain
              TabOrder = 6
              OnKeyPress = GoNext
              EmptyValue = 0
              KeyField = 'ptypeid'
              ListField = 'name'
              ListSource = srcPriceType
            end
            object lcbPTExtra: TssDBLookupCombo
              Left = 453
              Top = 4
              Width = 167
              Height = 24
              Anchors = [akLeft, akTop, akRight]
              Enabled = False
              ImeName = 'Russian'
              ParentColor = True
              Properties.DropDownListStyle = lsFixedList
              Properties.OnEditValueChanged = rbtExtraClick
              Style.StyleController = dmData.scMain
              TabOrder = 3
              Visible = False
              OnKeyPress = GoNext
              EmptyValue = 0
              KeyField = 'ptypeid'
              ListField = 'name'
              ListSource = srcPriceType
            end
            object cbExtra: TcxComboBox
              Left = 271
              Top = 4
              Width = 175
              Height = 24
              Enabled = False
              ImeName = 'Russian'
              ParentColor = True
              Properties.DropDownListStyle = lsFixedList
              Properties.OnChange = DataModified
              Properties.OnEditValueChanged = cbExtraPropertiesEditValueChanged
              Style.StyleController = dmData.scMain
              TabOrder = 2
              OnKeyPress = GoNext
            end
          end
        end
      end
      object tsPrices: TcxTabSheet
        Caption = 'tsPrices'
        ImageIndex = 0
        TabVisible = False
        object gbExtras: TssGroupBox
          Left = 0
          Top = 0
          Width = 691
          Height = 480
          Align = alClient
          Alignment = alTopLeft
          Caption = 'gbExtras'
          TabOrder = 0
          TabStop = False
          Edges = [beLeft, beRight, beTop, beBottom]
          DesignSize = (
            691
            480)
          object grdPrices: TdxDBGrid
            Left = 15
            Top = 25
            Width = 672
            Height = 468
            DrawDragFrame = False
            Bands = <
              item
              end>
            DefaultLayout = True
            HeaderPanelRowCount = 1
            KeyField = 'PTypeID'
            SummaryGroups = <>
            SummarySeparator = ', '
            TabOrder = 0
            OnDblClick = grdPricesDblClick
            OnKeyDown = grdPricesKeyDown
            DataSource = srcPrices
            Filter.Criteria = {00000000}
            LookAndFeel = lfUltraFlat
            OptionsCustomize = [edgoBandMoving, edgoBandSizing, edgoColumnSizing]
            OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
            OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowAutoHeight, edgoRowSelect, edgoUseBitmap]
            OnColumnSorting = grdPricesColumnSorting
            OnCustomDrawCell = grdPricesCustomDrawCell
            Anchors = [akLeft, akTop, akRight, akBottom]
            object colPTypeName: TdxDBGridColumn
              Alignment = taLeftJustify
              HeaderAlignment = taCenter
              Width = 255
              BandIndex = 0
              RowIndex = 0
              FieldName = 'Name'
            end
            object colPTypeExtra: TdxDBGridColumn
              Alignment = taLeftJustify
              HeaderAlignment = taCenter
              Width = 256
              BandIndex = 0
              RowIndex = 0
              FieldName = 'OnValue'
            end
            object colPTypeType: TdxDBGridColumn
              Visible = False
              Width = 105
              BandIndex = 0
              RowIndex = 0
              FieldName = 'ExtraType'
            end
            object colCurrName: TdxDBGridColumn
              Visible = False
              Width = 241
              BandIndex = 0
              RowIndex = 0
              FieldName = 'CurrName'
            end
            object colDef: TdxDBGridColumn
              Visible = False
              Width = 128
              BandIndex = 0
              RowIndex = 0
              FieldName = 'Def'
            end
            object colPricesPPType: TdxDBGridColumn
              Visible = False
              BandIndex = 0
              RowIndex = 0
              FieldName = 'pptypeid'
            end
          end
        end
      end
      object tsNotes: TcxTabSheet
        Caption = 'tsNotes'
        ImageIndex = 0
        TabVisible = False
        object gbNotes: TssGroupBox
          Left = 0
          Top = 0
          Width = 691
          Height = 480
          Align = alClient
          Alignment = alTopLeft
          Caption = 'gbNotes'
          TabOrder = 0
          TabStop = False
          OnClick = aApplyExecute
          Edges = [beLeft, beRight, beTop, beBottom]
          DesignSize = (
            691
            480)
          object edNotes: TcxMemo
            Left = 10
            Top = 30
            Width = 677
            Height = 463
            Anchors = [akLeft, akTop, akRight, akBottom]
            ImeName = 'Russian'
            Properties.MaxLength = 255
            Properties.OnChange = edNotesPropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 0
            OnKeyDown = edNotesKeyDown
            OnKeyPress = GoNext
          end
        end
      end
      object tsMatChangeList: TcxTabSheet
        Caption = 'tsMatChangeList'
        ImageIndex = 0
        TabVisible = False
        object gbMatChange: TssGroupBox
          Left = 0
          Top = 0
          Width = 691
          Height = 480
          Align = alClient
          Alignment = alTopLeft
          Caption = 'gbExtras'
          TabOrder = 0
          TabStop = False
          Edges = [beLeft, beRight, beTop, beBottom]
          DesignSize = (
            691
            480)
          object grdMC: TdxDBGrid
            Left = 10
            Top = 66
            Width = 668
            Height = 427
            DrawDragFrame = False
            Bands = <
              item
              end>
            DefaultLayout = True
            HeaderPanelRowCount = 1
            KeyField = 'matid'
            SummaryGroups = <>
            SummarySeparator = ', '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            PopupMenu = pmMC
            TabOrder = 0
            OnDblClick = grdMCDblClick
            BandFont.Charset = DEFAULT_CHARSET
            BandFont.Color = clBlack
            BandFont.Height = -11
            BandFont.Name = 'Tahoma'
            BandFont.Style = [fsBold]
            DataSource = srcMC
            Filter.Criteria = {00000000}
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clBlack
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
            LookAndFeel = lfUltraFlat
            MaxRowLineCount = 3
            OptionsCustomize = [edgoBandMoving, edgoBandSizing, edgoColumnSizing]
            OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
            OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
            PreviewFont.Charset = DEFAULT_CHARSET
            PreviewFont.Color = clBlue
            PreviewFont.Height = -11
            PreviewFont.Name = 'Tahoma'
            PreviewFont.Style = [fsBold]
            Anchors = [akLeft, akTop, akRight, akBottom]
            object colMCName: TdxDBGridColumn
              Alignment = taLeftJustify
              Caption = '???????????? ??????'
              HeaderAlignment = taCenter
              Width = 260
              BandIndex = 0
              RowIndex = 0
              FieldName = 'Name'
            end
            object colMCArtikul: TdxDBGridMemoColumn
              Caption = '???????'
              HeaderAlignment = taCenter
              Width = 173
              BandIndex = 0
              RowIndex = 0
              HeaderMaxLineCount = 1
              FieldName = 'artikul'
            end
            object colMCMatID: TdxDBGridColumn
              Visible = False
              Width = 104
              BandIndex = 0
              RowIndex = 0
            end
          end
          object panMCBar: TPanel
            Left = 2
            Top = 18
            Width = 687
            Height = 48
            Align = alTop
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 1
            object btnMCDel: TssSpeedButton
              Left = 235
              Top = 10
              Width = 113
              Height = 31
              Action = aMCDel
              Alignment = taCenter
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              GroupIndex = 0
              ImageIndex = 2
              Images = dmData.Images18x18
              LeftMargin = 3
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object btnMCProps: TssSpeedButton
              Left = 123
              Top = 10
              Width = 113
              Height = 31
              Action = aMCProps
              Alignment = taCenter
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              GroupIndex = 0
              ImageIndex = 1
              Images = dmData.Images18x18
              LeftMargin = 3
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object btnMCNew: TssSpeedButton
              Left = 7
              Top = 10
              Width = 117
              Height = 31
              Action = aMCNew
              Alignment = taCenter
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              GroupIndex = 0
              ImageIndex = 0
              Images = dmData.Images18x18
              LeftMargin = 3
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
          end
        end
      end
      object tsMatChange: TcxTabSheet
        Caption = 'tsMatChange'
        ImageIndex = 0
        TabVisible = False
        object gbMC: TssGroupBox
          Left = 0
          Top = 0
          Width = 691
          Height = 480
          Align = alClient
          Alignment = alTopLeft
          Caption = 'gbMC'
          TabOrder = 0
          Edges = [beLeft, beRight, beTop, beBottom]
          DesignSize = (
            691
            480)
          object lMCNotes: TssLabel
            Left = 9
            Top = 122
            Width = 53
            Height = 16
            Caption = 'lMCNotes'
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object pangbMC: TPanel
            Left = 2
            Top = 18
            Width = 687
            Height = 48
            Align = alTop
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 0
            DesignSize = (
              687
              48)
            object btnMCDelEx: TssSpeedButton
              Left = 235
              Top = 10
              Width = 113
              Height = 31
              Action = aMCDel
              Alignment = taCenter
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              GroupIndex = 0
              ImageIndex = 2
              Images = dmData.Images18x18
              LeftMargin = 3
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object btnMCPropsEx: TssSpeedButton
              Left = 123
              Top = 10
              Width = 113
              Height = 31
              Action = aMCProps
              Alignment = taCenter
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              GroupIndex = 0
              ImageIndex = 1
              Images = dmData.Images18x18
              LeftMargin = 3
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object btnMCNewEx: TssSpeedButton
              Left = 7
              Top = 10
              Width = 117
              Height = 31
              Action = aMCNew
              Alignment = taCenter
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              GroupIndex = 0
              ImageIndex = 0
              Images = dmData.Images18x18
              LeftMargin = 3
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object bvlDiscSep: TssBevel
              Left = 0
              Top = 47
              Width = 687
              Height = 1
              Align = alBottom
              ColorGrBegin = clBtnFace
              ColorGrEnd = clBtnFace
              ColorInner = clBtnShadow
              ColorOuter = clBtnHighlight
              Edges = [beLeft, beRight, beTop, beBottom]
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              GradientDirection = gdHorizontal
              HotTrack = False
              ImageIndex = 0
              Shape = bsTopLine
              UseGradient = False
            end
            object btnMCLevelUp: TssSpeedButton
              Left = 645
              Top = 12
              Width = 20
              Height = 20
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
              OnClick = btnMCLevelUpClick
            end
          end
          object edMCMat: TokMatSearchEdit
            Left = 9
            Top = 81
            Width = 672
            Height = 31
            Anchors = [akLeft, akTop, akRight]
            ButtonsLeftMargin = 2
            CapFind = 'Search'
            CapFindParams = 'Search options'
            CapRef = 'Products Directory'
            CapContextFind = 'Context search'
            CapFindBegin = 'From the beginning'
            CapFindConcurr = 'Full match'
            CapFindSubstr = 'Partial match'
            DisabledImages = dmData.Images18x18dis
            Images = dmData.Images18x18
            ImageIndexRef = 22
            ImageIndexFind = 18
            ImageIndexFindParams = 19
            LangManager = dmData.Lng
            RemoteServer = dmData.SConnection
            ShowHint = True
            SearchNames.Strings = (
              'Name;name'
              'Model;artikul'
              'Barcode;barcode')
            SearchType = stBegin
            StyleController = dmData.scMain
            TabOrder = 1
            OnChange = edMCMatChange
            OnRefButtonClick = btnMCMatClick
            AllowZeroRest = True
            ScannerImageIndex = 50
            DesignSize = (
              672
              31)
          end
          object memMCNotes: TcxMemo
            Left = 10
            Top = 152
            Width = 677
            Height = 346
            Anchors = [akLeft, akTop, akRight, akBottom]
            ImeName = 'Russian'
            Properties.MaxLength = 255
            Properties.OnChange = memMCNotesPropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 2
            OnKeyDown = edNotesKeyDown
            OnKeyPress = GoNext
          end
        end
      end
      object tsTax: TcxTabSheet
        Caption = 'tsTax'
        ImageIndex = 0
        TabVisible = False
        object gbTax: TssGroupBox
          Left = 0
          Top = 0
          Width = 691
          Height = 480
          Align = alClient
          Alignment = alTopLeft
          Caption = 'gbTax'
          TabOrder = 0
          TabStop = False
          Edges = [beLeft, beRight, beTop, beBottom]
          DesignSize = (
            691
            480)
          object lNDS: TssLabel
            Left = 46
            Top = 66
            Width = 47
            Height = 16
            Caption = 'lNDS, %'
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object lTaxText: TssLabel
            Left = 33
            Top = 407
            Width = 648
            Height = 60
            AutoSize = False
            Caption = '* lTaxText'
            WordWrap = True
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object btnDelIndNDS: TssSpeedButton
            Left = 284
            Top = 61
            Width = 20
            Height = 20
            Alignment = taLeftJustify
            AllwaysShowFrame = False
            ButtonType = ssbtStandard
            Checked = False
            Caption = 'aMatMove'
            DisabledImages = dmData.Images18x18dis
            GroupIndex = 0
            ImageIndex = 37
            Images = dmData.Images18x18
            LeftMargin = 3
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnClick = btnDelIndNDSClick
          end
          object chbNDS: TcxCheckBox
            Left = 18
            Top = 38
            Width = 500
            Height = 24
            Properties.DisplayUnchecked = 'False'
            Properties.Caption = 'chbNDS'
            State = cbsChecked
            Style.StyleController = dmData.scMain
            TabOrder = 0
            ImeName = 'Russian'
            OnClick = chbNDSClick
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edNDS: TssCalcEdit
            Left = 166
            Top = 60
            Width = 101
            Height = 24
            BeepOnEnter = False
            EditValue = 0.000000000000000000
            ImeName = 'Russian'
            Properties.OnChange = edNDSPropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 1
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            CalcColor = clBtnFace
            DecimalPlaces = 5
          end
          object sbTax: TScrollBox
            Left = 21
            Top = 96
            Width = 658
            Height = 305
            HorzScrollBar.Visible = False
            Anchors = [akLeft, akTop, akRight, akBottom]
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 2
          end
        end
      end
      object tsImages: TcxTabSheet
        Caption = 'tsImages'
        ImageIndex = 1
        TabVisible = False
        object apImgList1: TapImgList
          Left = 0
          Top = 0
          Width = 689
          Height = 473
          Align = alClient
          BevelInner = bvLowered
          Caption = 'apImgList1'
          ParentBackground = False
          TabOrder = 0
          langMan = dmData.Lng
          iconWidth = 100
          iconHeight = 100
          showPostToWeb = False
          showDelete = False
          allowEditing = True
          JPEGsOnly = True
          onChange = apImgList1Change
        end
      end
      object tsWWW: TcxTabSheet
        Caption = 'tsWWW'
        ImageIndex = 1
        TabVisible = False
        object gbWWW: TssGroupBox
          Left = 0
          Top = 0
          Width = 691
          Height = 480
          Align = alClient
          Alignment = alTopLeft
          Caption = ' Web '
          TabOrder = 0
          Edges = [beLeft, beRight, beTop, beBottom]
          object pcWWW: TssPageControl
            Left = 2
            Top = 18
            Width = 687
            Height = 460
            ActivePage = tsWWWMain
            Align = alClient
            LookAndFeel.Kind = lfStandard
            TabOrder = 0
            object tsWWWMain: TcxTabSheet
              Caption = 'Main settings'
              ImageIndex = 0
              DesignSize = (
                683
                433)
              object cbWWWPost: TcxCheckBox
                Left = 15
                Top = 10
                Width = 331
                Height = 26
                AutoSize = False
                ParentColor = False
                Properties.DisplayUnchecked = 'False'
                Properties.OnChange = edWWWEditChanged
                Properties.Caption = 'Post this product to the web site'
                Style.BorderColor = clWindowFrame
                Style.Color = clSkyBlue
                Style.StyleController = dmData.scMain
                TabOrder = 0
                ImeName = 'Russian'
              end
              object gbWWWMainDescr: TcxGroupBox
                Left = 5
                Top = 44
                Width = 676
                Height = 221
                Alignment = alTopLeft
                Anchors = [akLeft, akTop, akRight]
                Caption = ' General product information '
                TabOrder = 2
                DesignSize = (
                  676
                  221)
                object butWWWcopyDown: TssSpeedButton
                  Left = 639
                  Top = 23
                  Width = 20
                  Height = 20
                  Alignment = taLeftJustify
                  AllwaysShowFrame = False
                  Anchors = [akTop, akRight]
                  ButtonType = ssbtStandard
                  Checked = False
                  DisabledImages = dmData.Images18x18dis
                  GroupIndex = 0
                  ImageIndex = 35
                  Images = dmData.Images18x18
                  LeftMargin = 1
                  ParentShowHint = False
                  ShowHint = True
                  Style = ssbsUser
                  ViewStyle = ssvsGlyphOnly
                  OnClick = butWWWcopyDownClick
                end
                object btnWWWCopyFromMain: TssSpeedButton
                  Left = 615
                  Top = 23
                  Width = 20
                  Height = 20
                  Alignment = taLeftJustify
                  AllwaysShowFrame = False
                  Anchors = [akTop, akRight]
                  ButtonType = ssbtStandard
                  Checked = False
                  DisabledImages = dmData.Images18x18dis
                  GroupIndex = 0
                  ImageIndex = 27
                  Images = dmData.Images18x18
                  LeftMargin = 1
                  ParentShowHint = False
                  ShowHint = True
                  Style = ssbsUser
                  ViewStyle = ssvsGlyphOnly
                  OnClick = btnWWWCopyFromMainClick
                end
                object edWWWProdName: TcxTextEdit
                  Left = 162
                  Top = 20
                  Width = 439
                  Height = 24
                  Anchors = [akLeft, akTop, akRight]
                  Properties.OnChange = edWWWEditChanged
                  Style.StyleController = dmData.scMain
                  TabOrder = 0
                  ImeName = 'Russian'
                end
                object lWWWDescr: TcxLabel
                  Left = 15
                  Top = 110
                  Width = 76
                  Height = 20
                  TabStop = False
                  Style.StyleController = dmData.scMain4Labels
                  TabOrder = 5
                  ImeName = 'Russian'
                  Caption = 'Description:'
                end
                object lWWWProdName: TcxLabel
                  Left = 15
                  Top = 22
                  Width = 92
                  Height = 20
                  TabStop = False
                  Style.StyleController = dmData.scMain4Labels
                  TabOrder = 6
                  ImeName = 'Russian'
                  Caption = 'Product name:'
                end
                object memoWWWDescr: TcxMemo
                  Left = 162
                  Top = 108
                  Width = 499
                  Height = 45
                  Anchors = [akLeft, akTop, akRight]
                  ImeName = 'Russian'
                  Properties.ScrollBars = ssVertical
                  Properties.OnChange = edWWWEditChanged
                  Style.StyleController = dmData.scMain
                  TabOrder = 3
                end
                object lWWWShortDescr: TcxLabel
                  Left = 15
                  Top = 79
                  Width = 110
                  Height = 20
                  TabStop = False
                  Style.StyleController = dmData.scMain4Labels
                  TabOrder = 7
                  ImeName = 'Russian'
                  Caption = 'Short description:'
                end
                object edWWWShortDescr: TcxTextEdit
                  Left = 162
                  Top = 79
                  Width = 499
                  Height = 24
                  Anchors = [akLeft, akTop, akRight]
                  Properties.OnChange = edWWWEditChanged
                  Style.StyleController = dmData.scMain
                  TabOrder = 2
                  ImeName = 'Russian'
                end
                object edWWWAlias: TcxTextEdit
                  Left = 162
                  Top = 49
                  Width = 363
                  Height = 24
                  Anchors = [akLeft, akTop, akRight]
                  Enabled = False
                  Properties.OnChange = edWWWEditChanged
                  Style.StyleController = dmData.scMain
                  TabOrder = 1
                  ImeName = 'Russian'
                end
                object lWWWAlias: TcxLabel
                  Left = 16
                  Top = 52
                  Width = 40
                  Height = 20
                  TabStop = False
                  Style.StyleController = dmData.scMain4Labels
                  TabOrder = 8
                  ImeName = 'Russian'
                  Caption = 'Alias:'
                end
                object cbWWWCustomAlias: TcxCheckBox
                  Left = 534
                  Top = 49
                  Width = 127
                  Height = 24
                  TabStop = False
                  Anchors = [akTop, akRight]
                  Properties.DisplayUnchecked = 'False'
                  Properties.OnChange = edWWWEditChanged
                  Properties.Caption = 'Make custom'
                  Style.StyleController = dmData.scMain
                  TabOrder = 9
                  ImeName = 'Russian'
                end
                object memoWWWDetails: TcxMemo
                  Left = 162
                  Top = 158
                  Width = 499
                  Height = 53
                  Anchors = [akLeft, akTop, akRight]
                  ImeName = 'Russian'
                  Properties.ScrollBars = ssVertical
                  Properties.OnChange = edWWWEditChanged
                  Style.StyleController = dmData.scMain
                  TabOrder = 4
                end
                object lWWWDetails: TcxLabel
                  Left = 15
                  Top = 159
                  Width = 51
                  Height = 20
                  TabStop = False
                  Style.StyleController = dmData.scMain4Labels
                  TabOrder = 10
                  ImeName = 'Russian'
                  Caption = 'Details:'
                end
              end
              object gbWWWMeta: TcxGroupBox
                Left = 5
                Top = 264
                Width = 676
                Height = 160
                Alignment = alTopLeft
                Anchors = [akLeft, akTop, akRight, akBottom]
                Caption = ' META tags definitions for HTML page '
                TabOrder = 3
                DesignSize = (
                  676
                  160)
                object lWWWMetaKeywords: TcxLabel
                  Left = 10
                  Top = 55
                  Width = 100
                  Height = 20
                  TabStop = False
                  Style.Shadow = False
                  Style.StyleController = dmData.scMain4Labels
                  TabOrder = 3
                  ImeName = 'Russian'
                  Caption = 'META Keywords'
                end
                object lWWWMetaTitle: TcxLabel
                  Left = 10
                  Top = 25
                  Width = 70
                  Height = 20
                  TabStop = False
                  Style.StyleController = dmData.scMain4Labels
                  TabOrder = 4
                  ImeName = 'Russian'
                  Caption = 'META Title'
                end
                object lWWWMetaDescr: TcxLabel
                  Left = 10
                  Top = 87
                  Width = 108
                  Height = 20
                  TabStop = False
                  Style.StyleController = dmData.scMain4Labels
                  TabOrder = 5
                  ImeName = 'Russian'
                  Caption = 'META Description'
                end
                object edWWWMetaTitle: TcxTextEdit
                  Left = 162
                  Top = 23
                  Width = 494
                  Height = 24
                  Anchors = [akLeft, akTop, akRight]
                  Properties.OnChange = edWWWEditChanged
                  Style.StyleController = dmData.scMain
                  TabOrder = 0
                  ImeName = 'Russian'
                end
                object edWWWMEtaKeywords: TcxTextEdit
                  Left = 162
                  Top = 53
                  Width = 494
                  Height = 24
                  Anchors = [akLeft, akTop, akRight]
                  Properties.OnChange = edWWWEditChanged
                  Style.StyleController = dmData.scMain
                  TabOrder = 1
                  ImeName = 'Russian'
                end
                object memoWWWMETADescr: TcxMemo
                  Left = 162
                  Top = 83
                  Width = 494
                  Height = 70
                  Anchors = [akLeft, akTop, akRight]
                  ImeName = 'Russian'
                  Properties.ScrollBars = ssVertical
                  Properties.OnChange = edWWWEditChanged
                  Style.StyleController = dmData.scMain
                  TabOrder = 2
                end
              end
              object cbWWWSpecial: TcxCheckBox
                Left = 404
                Top = 11
                Width = 232
                Height = 26
                AutoSize = False
                Properties.DisplayUnchecked = 'False'
                Properties.OnChange = edWWWEditChanged
                Properties.Caption = 'Special feature'
                Style.BorderStyle = ebsThick
                Style.StyleController = dmData.scMain
                TabOrder = 1
                ImeName = 'Russian'
              end
            end
            object tsWWWMarketing: TcxTabSheet
              Caption = 'Marketing'
              ImageIndex = 1
              object lWWWRetailPrice: TcxLabel
                Left = 11
                Top = 62
                Width = 131
                Height = 20
                TabStop = False
                AutoSize = False
                Style.StyleController = dmData.scMain4Labels
                TabOrder = 0
                ImeName = 'Russian'
                Caption = 'Retail price:'
              end
              object lWWWPriceCategory: TcxLabel
                Left = 10
                Top = 21
                Width = 139
                Height = 21
                TabStop = False
                AutoSize = False
                Style.StyleController = dmData.scMain4Labels
                TabOrder = 3
                ImeName = 'Russian'
                Caption = 'Price category:'
              end
              object cbWWWPriceCategory: TcxComboBox
                Left = 155
                Top = 20
                Width = 174
                Height = 24
                ImeName = 'Russian'
                Properties.OnChange = edWWWEditChanged
                Style.StyleController = dmData.scMain
                TabOrder = 1
              end
              object edWWWRetailPrice: TssCalcEdit
                Left = 155
                Top = 59
                Width = 171
                Height = 24
                EditValue = 0.000000000000000000
                ImeName = 'Russian'
                Properties.OnChange = edWWWEditChanged
                Style.StyleController = dmData.scMain
                TabOrder = 2
                CalcColor = clBtnFace
                DecimalPlaces = 2
              end
            end
            object tsWWWGroups: TcxTabSheet
              Caption = 'Groups'
              ImageIndex = 2
              DesignSize = (
                683
                433)
              object lWWWGroups: TcxLabel
                Left = 448
                Top = 20
                Width = 233
                Height = 405
                TabStop = False
                Anchors = [akTop, akRight, akBottom]
                AutoSize = False
                Properties.WordWrap = True
                Style.StyleController = dmData.scMain4Labels
                TabOrder = 0
                ImeName = 'Russian'
                Caption = 
                  'Which groups this product belongs to. You may select more than o' +
                  'ne.'
              end
              object tvGroups: TcxTreeView
                Left = 15
                Top = 15
                Width = 429
                Height = 410
                Anchors = [akLeft, akTop, akBottom]
                ParentFont = False
                Style.StyleController = dmData.scMain
                TabOrder = 1
                OnDblClick = tvGroupsDblClick
                Images = dmData.Images
                Indent = 20
                MultiSelectStyle = [msControlSelect]
                ReadOnly = True
                SortType = stText
              end
            end
          end
        end
      end
      object tsGoldProps: TcxTabSheet
        Caption = 'tsGoldProps'
        ImageIndex = 1
        TabVisible = False
        object panGoldSizes: TPanel
          Left = 0
          Top = 0
          Width = 321
          Height = 480
          Align = alLeft
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          object lGoldSizes: TokLabel
            Left = 0
            Top = 0
            Width = 321
            Height = 24
            Align = alTop
            Alignment = taCenter
            Caption = 'Size'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            DisabledDraw = ddStandard
            DisabledColor = clBlack
            LangManager = dmData.Lng
          end
          object gbGoldSizes2: TcxGroupBox
            Left = 0
            Top = 24
            Width = 321
            Height = 456
            Align = alClient
            Alignment = alTopLeft
            Caption = ' Add, edit and mark all possible size values '
            TabOrder = 0
            object clbGoldSizes: TCheckListBox
              Left = 2
              Top = 18
              Width = 317
              Height = 436
              Align = alClient
              BevelInner = bvNone
              BevelOuter = bvNone
              ImeName = 'Russian'
              ItemHeight = 16
              Sorted = True
              TabOrder = 0
              OnMouseDown = clbGoldSizesMouseDown
            end
          end
        end
        object splGold: TcxSplitter
          Left = 321
          Top = 0
          Width = 8
          Height = 480
          HotZoneClassName = 'TcxMediaPlayer9Style'
          HotZone.LightColor = clWhite
          Control = panGoldSizes
          Color = clBtnFace
          ParentColor = False
          Visible = False
        end
        object panGoldColors: TPanel
          Left = 329
          Top = 0
          Width = 362
          Height = 480
          Align = alClient
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 2
          object lGoldColors: TokLabel
            Left = 0
            Top = 0
            Width = 362
            Height = 24
            Align = alTop
            Alignment = taCenter
            Caption = 'Color'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            DisabledDraw = ddStandard
            DisabledColor = clBlack
            LangManager = dmData.Lng
          end
          object gbGoldColors1: TcxGroupBox
            Left = 0
            Top = 24
            Width = 362
            Height = 71
            Align = alTop
            Alignment = alTopLeft
            Caption = ' This product color '
            Enabled = False
            TabOrder = 0
            DesignSize = (
              362
              71)
            object cbGoldColor: TcxComboBox
              Left = 16
              Top = 23
              Width = 331
              Height = 24
              Anchors = [akLeft, akTop, akRight]
              Enabled = False
              ImeName = 'Russian'
              Properties.ReadOnly = False
              Properties.Sorted = True
              Properties.OnChange = cbGoldSizePropertiesChange
              TabOrder = 0
            end
          end
          object gbGoldColors2: TcxGroupBox
            Left = 0
            Top = 95
            Width = 362
            Height = 385
            Align = alClient
            Alignment = alTopLeft
            Caption = ' View and edit all possible color values '
            Enabled = False
            TabOrder = 1
            object clbGoldColors: TCheckListBox
              Left = 2
              Top = 18
              Width = 358
              Height = 365
              OnClickCheck = clbGoldSizesClickCheck
              Align = alClient
              Enabled = False
              ImeName = 'Russian'
              ItemHeight = 16
              Sorted = True
              TabOrder = 0
              OnMouseDown = clbGoldSizesMouseDown
            end
          end
        end
      end
      object tsBundle: TcxTabSheet
        Caption = 'tsBundle'
        ImageIndex = 1
        TabVisible = False
        object gbBundle: TssGroupBox
          Left = 0
          Top = 0
          Width = 691
          Height = 480
          Align = alClient
          Alignment = alTopLeft
          Caption = 'gbBundle'
          TabOrder = 0
          TabStop = False
          Edges = [beLeft, beRight, beTop, beBottom]
          DesignSize = (
            691
            480)
          object Panel1: TPanel
            Left = 2
            Top = 18
            Width = 687
            Height = 48
            Align = alTop
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 0
            object btnBundleDel: TssSpeedButton
              Left = 235
              Top = 10
              Width = 113
              Height = 31
              Action = aBundleDel
              Alignment = taCenter
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              GroupIndex = 0
              ImageIndex = 2
              Images = dmData.Images18x18
              LeftMargin = 3
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object btnBundleEdit: TssSpeedButton
              Left = 123
              Top = 10
              Width = 113
              Height = 31
              Action = aBundleEdit
              Alignment = taCenter
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              GroupIndex = 0
              ImageIndex = 1
              Images = dmData.Images18x18
              LeftMargin = 3
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
              Visible = False
            end
            object btnBundleAdd: TssSpeedButton
              Left = 7
              Top = 10
              Width = 117
              Height = 31
              Action = aBundleAdd
              Alignment = taCenter
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              GroupIndex = 0
              ImageIndex = 0
              Images = dmData.Images18x18
              LeftMargin = 3
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
          end
          object tvBundles: TcxDBTreeList
            Left = 10
            Top = 74
            Width = 673
            Height = 416
            Anchors = [akLeft, akTop, akRight, akBottom]
            Bands = <
              item
                Caption.Text = 'Band1'
              end>
            BufferedPaint = False
            DataController.DataSource = srcBundles
            DataController.ParentField = 'pid'
            DataController.KeyField = 'id'
            OptionsBehavior.HotTrack = True
            OptionsCustomizing.BandVertSizing = False
            OptionsCustomizing.ColumnVertSizing = False
            OptionsData.Deleting = False
            OptionsView.ShowEditButtons = ecsbFocused
            OptionsView.ShowRoot = False
            RootValue = 0
            StateImages = dmData.Images
            TabOrder = 1
            OnCustomDrawCell = tvBundlesCustomDrawCell
            OnDragDrop = tvBundlesDragDrop
            OnDragOver = tvBundlesDragOver
            OnEdited = tvBundlesEdited
            OnGetNodeImageIndex = tvBundlesGetNodeImageIndex
            object tvBundlesID: TcxDBTreeListColumn
              DataBinding.FieldName = 'id'
              MinWidth = 5
              Options.Editing = False
              Position.ColIndex = 6
              Position.RowIndex = 0
              Position.BandIndex = 0
              Visible = False
              Width = 20
            end
            object tvBundlesPID: TcxDBTreeListColumn
              DataBinding.FieldName = 'pid'
              MinWidth = 5
              Options.Editing = False
              Position.ColIndex = 7
              Position.RowIndex = 0
              Position.BandIndex = 0
              Visible = False
              Width = 20
            end
            object tvBundlesPOS: TcxDBTreeListColumn
              DataBinding.FieldName = 'pos'
              MinWidth = 5
              Options.Editing = False
              Position.ColIndex = 5
              Position.RowIndex = 0
              Position.BandIndex = 0
              Visible = False
              Width = 20
            end
            object tvBundlesType: TcxDBTreeListColumn
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Images = dmData.Images
              Properties.Items = <
                item
                  ImageIndex = 14
                  Value = 0
                end
                item
                  ImageIndex = 15
                  Value = 1
                end
                item
                  ImageIndex = 48
                  Value = -1
                end>
              DataBinding.FieldName = 'type'
              MinWidth = 5
              Options.Editing = False
              Position.ColIndex = 4
              Position.RowIndex = 0
              Position.BandIndex = 0
              Visible = False
              Width = 20
            end
            object tvBundlesName: TcxDBTreeListColumn
              DataBinding.FieldName = 'name'
              MinWidth = 50
              Options.Editing = False
              Position.ColIndex = 0
              Position.RowIndex = 0
              Position.BandIndex = 0
              Width = 112
            end
            object tvBundlesModel: TcxDBTreeListColumn
              DataBinding.FieldName = 'model'
              MinWidth = 50
              Options.Editing = False
              Position.ColIndex = 1
              Position.RowIndex = 0
              Position.BandIndex = 0
              Width = 110
            end
            object tvBundlesQuantity: TcxDBTreeListColumn
              PropertiesClassName = 'TcxCalcEditProperties'
              DataBinding.FieldName = 'quantity'
              MinWidth = 50
              Options.CellEndEllipsis = False
              Options.Sorting = False
              Position.ColIndex = 2
              Position.RowIndex = 0
              Position.BandIndex = 0
              Width = 112
            end
            object tvBundlesMsrName: TcxDBTreeListColumn
              DataBinding.FieldName = 'msrname'
              Options.Editing = False
              Options.Sorting = False
              Position.ColIndex = 3
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
          end
        end
      end
      object tsCustomAttr: TcxTabSheet
        Caption = 'tsCustomAttr'
        ImageIndex = 1
        TabVisible = False
        object gbCustAttr: TcxGroupBox
          Left = 0
          Top = 0
          Width = 691
          Height = 480
          Align = alClient
          Alignment = alTopLeft
          Caption = ' Add, edit or remove custom attributes for this item '
          TabOrder = 0
          DesignSize = (
            691
            480)
          object lCustAttr_SideNote: TLabel
            Left = 16
            Top = 52
            Width = 397
            Height = 16
            Caption = #1044#1083#1103' '#1080#1084#1105#1085' '#1072#1090#1088#1080#1073#1091#1090#1086#1074' '#1088#1072#1079#1088#1077#1096#1077#1085#1099' '#1090#1086#1083#1100#1082#1086' '#1083#1072#1090#1080#1085#1089#1082#1080#1077' '#1073#1091#1082#1074#1099' '#1080' '#1094#1080#1092#1088#1099'.'
            ShowAccelChar = False
          end
          object panCustAttr: TPanel
            Left = 16
            Top = 72
            Width = 665
            Height = 393
            Anchors = [akLeft, akTop, akRight, akBottom]
            BevelInner = bvLowered
            Caption = 'panCustAttr'
            ParentBackground = False
            TabOrder = 0
            object vlCustAttr: TValueListEditor
              Left = 2
              Top = 2
              Width = 661
              Height = 389
              Align = alClient
              BorderStyle = bsNone
              Enabled = False
              GridLineWidth = 2
              KeyOptions = [keyEdit, keyUnique]
              Strings.Strings = (
                'a=b')
              TabOrder = 0
              TitleCaptions.Strings = (
                'Attribute name'
                'Value')
              OnSetEditText = vlCustAttrSetEditText
              ColWidths = (
                168
                491)
            end
          end
          object btnCAAdd: TxButton
            Left = 14
            Top = 22
            Width = 98
            Height = 25
            Anchors = [akTop, akRight]
            Caption = 'btnCAAdd'
            ColorInner = clBtnShadow
            Gradient.ColorBegin = clBtnShadow
            Gradient.ColorEnd = clBtnHighlight
            Gradient.Direction = gdVertical
            Gradient.Enabled = True
            Gradient.HalfEffect = True
            OnClick = btnCAAddClick
            TabOrder = 1
          end
          object btnCADel: TxButton
            Left = 582
            Top = 22
            Width = 98
            Height = 25
            Anchors = [akTop, akRight]
            Caption = 'btnCADel'
            ColorInner = clBtnShadow
            Gradient.ColorEnd = clRed
            Gradient.Direction = gdVertical
            Gradient.Enabled = True
            Gradient.HalfEffect = True
            OnClick = btnCADelClick
            TabOrder = 2
          end
        end
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 185
      Top = 0
      Width = 8
      Height = 480
      Cursor = crHSplit
      HotZoneClassName = 'TcxMediaPlayer9Style'
      HotZone.LightColor = clWhite
      HotZone.BorderColor = clGray
      Control = tvMain
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 884
    ParentFont = True
    inherited panTitleButtons: TssPanel
      Left = 826
    end
  end
  inherited panButtons: TPanel
    Top = 527
    Width = 884
    inherited btnOK: TxButton
      Left = 574
      Top = 6
      Anchors = [akTop, akRight]
    end
    inherited btnCancel: TxButton
      Left = 678
      Top = 6
      Width = 97
      Anchors = [akTop, akRight]
    end
    inherited btnApply: TxButton
      Left = 783
      Top = 6
      Anchors = [akTop, akRight]
    end
  end
  inherited panToolBar: TPanel
    Width = 884
    inherited btnLock: TssSpeedButton
      Left = 832
      Top = 1
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 856
      Top = 1
    end
    inherited btnHelp: TssSpeedButton
      Left = 808
      Top = 1
    end
    object btnRsv: TssSpeedButton
      Left = 0
      Top = 0
      Action = aMatRsv
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 100
      Images = dmData.Images
      LeftMargin = 2
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object btnMove: TssSpeedButton
      Left = 27
      Top = 0
      Action = aMatMove
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 61
      Images = dmData.Images
      LeftMargin = 2
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
  end
  inherited ilTitleBar: TImageList
    Left = 8
    Top = 52
  end
  inherited FormStorage: TssFormStorage
    Left = 40
    Top = 108
  end
  inherited ActionList: TActionList
    Left = 68
    Top = 108
    object aMIns: TAction [5]
      Category = 'Measure'
      ImageIndex = 24
      ShortCut = 16429
      OnExecute = aMInsExecute
    end
    object aPricesAdd: TAction [6]
      Category = 'Prices'
      Caption = '????????'
      ImageIndex = 0
      ShortCut = 45
    end
    object aPricesProps: TAction [7]
      Tag = 1
      Category = 'Prices'
      Caption = '????????'
      ImageIndex = 1
      ShortCut = 16397
      OnExecute = aPricesPropsExecute
    end
    object aPricesDel: TAction [8]
      Category = 'Prices'
      Caption = '???????'
      ImageIndex = 2
      ShortCut = 16430
      OnExecute = aPricesDelExecute
    end
    object aMCNew: TAction
      Category = 'MC'
      Caption = 'aMCNew'
      ImageIndex = 0
      ShortCut = 45
      OnExecute = aMCNewExecute
    end
    object aMCProps: TAction
      Tag = 1
      Category = 'MC'
      Caption = 'aMCProps'
      ImageIndex = 1
      ShortCut = 16397
      OnExecute = aMCNewExecute
    end
    object aMCDel: TAction
      Category = 'MC'
      Caption = 'aMCDel'
      ImageIndex = 2
      ShortCut = 16430
      OnExecute = aMCDelExecute
    end
    object aMatMove: TAction
      Caption = 'aMatMove'
      ImageIndex = 61
      ShortCut = 16461
      OnExecute = aMatMoveExecute
    end
    object aMatRsv: TAction
      Caption = 'aMatRsv'
      ImageIndex = 100
      ShortCut = 16466
      OnExecute = aMatRsvExecute
    end
    object aBundleAdd: TAction
      Category = 'Bundles'
      Caption = 'aBundleAdd'
      ImageIndex = 0
      ShortCut = 45
      OnExecute = aBundleAddExecute
    end
    object aBundleEdit: TAction
      Category = 'Bundles'
      Caption = 'aBundleEdit'
      ImageIndex = 1
      ShortCut = 16397
    end
    object aBundleDel: TAction
      Category = 'Bundles'
      Caption = 'aBundleDel'
      ImageIndex = 2
      ShortCut = 16430
      OnExecute = aBundleDelExecute
    end
  end
  object srcCurrency: TDataSource
    DataSet = cdsCurrency
    Left = 66
    Top = 152
  end
  object srcMeasures: TDataSource
    DataSet = cdsMeasures
    Left = 66
    Top = 188
  end
  object cdsMeasures: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pMeasures_List'
    RemoteServer = dmData.SConnection
    AfterOpen = cdsMeasuresAfterOpen
    Macros = <>
    Left = 38
    Top = 188
  end
  object cdsCurrency: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pCurrency_List'
    RemoteServer = dmData.SConnection
    AfterOpen = cdsCurrencyAfterOpen
    Macros = <>
    Left = 38
    Top = 152
  end
  object cdsMatGroup: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pMatGroup_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 38
    Top = 224
  end
  object srcMatGroup: TDataSource
    DataSet = cdsMatGroup
    Left = 66
    Top = 224
  end
  object pmMatGroup: TPopupMenu
    Images = dmData.Images
    Left = 8
    Top = 124
    object aGrpIns1: TMenuItem
      Caption = 'aGrpIns'
      ImageIndex = 0
      ShortCut = 45
    end
    object aGrpDel1: TMenuItem
      Caption = 'aGrpDel'
      ImageIndex = 2
      ShortCut = 16430
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object aGrpRefresh1: TMenuItem
      Caption = 'aGrpRefresh'
      ImageIndex = 3
      ShortCut = 116
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object aGrpProp1: TMenuItem
      Caption = 'aGrpProp'
      ImageIndex = 1
      ShortCut = 16397
    end
  end
  object cdsWarehouse: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pWHouse_List'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsWarehouseBeforeOpen
    AfterOpen = cdsWarehouseAfterOpen
    Macros = <
      item
        DataType = ftString
        Name = 'm'
        ParamType = ptInput
      end>
    Left = 42
    Top = 64
  end
  object srcWarehouse: TDataSource
    DataSet = cdsWarehouse
    Left = 70
    Top = 64
  end
  object cdsParent: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pMatGroup_List'
    RemoteServer = dmData.SConnection
    AfterOpen = cdsParentAfterOpen
    Macros = <>
    Left = 132
    Top = 108
  end
  object srcParent: TDataSource
    DataSet = cdsParent
    Left = 104
    Top = 108
  end
  object mdPrices: TssMemoryData
    FieldDefs = <>
    Left = 104
    Top = 1
    object mdPricesPTypeID: TIntegerField
      FieldName = 'PTypeID'
    end
    object mdPricesName: TStringField
      FieldName = 'Name'
      Size = 64
    end
    object mdPricesOnValue: TFloatField
      FieldName = 'OnValue'
    end
    object mdPricesCurrID: TIntegerField
      FieldName = 'CurrID'
    end
    object mdPricesExtraType: TIntegerField
      FieldName = 'ExtraType'
    end
    object mdPricesCurrName: TStringField
      FieldName = 'CurrName'
      Size = 24
    end
    object mdPricesDef: TIntegerField
      FieldName = 'Def'
    end
    object mdPricesFNode: TIntegerField
      FieldName = 'FNode'
    end
    object mdPricesSrc: TIntegerField
      FieldName = 'Src'
    end
    object mdPricesen: TIntegerField
      FieldName = 'en'
    end
    object mdPricesvaluemodified: TIntegerField
      FieldName = 'valuemodified'
    end
    object mdPricescurrmodified: TIntegerField
      FieldName = 'currmodified'
    end
    object mdPriceswithnds: TIntegerField
      FieldName = 'withnds'
    end
    object mdPricespptypeid: TIntegerField
      FieldName = 'pptypeid'
    end
  end
  object cdsPriceType: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pPriceTypes_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 38
    Top = 264
  end
  object srcPriceType: TDataSource
    DataSet = cdsPriceType
    Left = 66
    Top = 264
  end
  object srcPrices: TDataSource
    DataSet = mdPrices
    OnDataChange = srcPricesDataChange
    Left = 60
    Top = 1
  end
  object cdsCountries: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pCountries_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 38
    Top = 300
  end
  object srcCountries: TDataSource
    DataSet = cdsCountries
    Left = 66
    Top = 300
  end
  object mdMC: TssMemoryData
    AfterDelete = mdMCAfterDelete
    FieldDefs = <>
    Left = 104
    Top = 213
    object mdMCmatid: TIntegerField
      FieldName = 'matid'
    end
    object mdMCname: TStringField
      FieldName = 'name'
      Size = 128
    end
    object mdMCartikul: TStringField
      FieldName = 'artikul'
      Size = 128
    end
    object mdMCfnode: TIntegerField
      FieldName = 'fnode'
    end
    object mdMCnotes: TStringField
      FieldName = 'notes'
      Size = 255
    end
  end
  object srcMC: TDataSource
    DataSet = mdMC
    OnDataChange = srcMCDataChange
    Left = 132
    Top = 213
  end
  object pmMC: TTBPopupMenu
    Images = dmData.Images18x18
    Left = 10
    Top = 86
    object mnuDiscAdd: TTBItem
      Action = aMCNew
      Images = dmData.Images18x18
    end
    object TBItem2: TTBItem
      Action = aMCDel
    end
    object TBSeparatorItem2: TTBSeparatorItem
    end
    object TBItem3: TTBItem
      Action = aMCProps
    end
  end
  object cdsPriceTypes: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'matid'
        ParamType = ptUnknown
      end>
    ProviderName = 'pPriceTypes_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 40
    Top = 334
  end
  object srcPriceTypes: TDataSource
    DataSet = cdsPriceTypes
    Left = 69
    Top = 334
  end
  object cdsTaxes: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'matid'
        ParamType = ptUnknown
      end>
    ProviderName = 'pTaxes_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 124
    Top = 50
    object cdsTaxesTAXID: TIntegerField
      FieldName = 'TAXID'
      Required = True
    end
    object cdsTaxesNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 128
    end
    object cdsTaxesONVALUE: TFloatField
      FieldName = 'ONVALUE'
      Required = True
    end
    object cdsTaxesDELETED: TIntegerField
      FieldName = 'DELETED'
      Required = True
    end
    object cdsTaxeschb: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'chb'
    end
  end
  object pmGoldSizeColor: TTBPopupMenu
    Left = 4
    Top = 198
    object miGoldHeader: TTBItem
      Caption = 'Menu'
      Enabled = False
    end
    object miGoldAdd: TTBEditItem
      Caption = 'Add new: '
      EditCaption = 'Add new: '
      MaxLength = 64
      OnAcceptText = miGoldAddAcceptText
    end
    object miGoldEdit: TTBEditItem
      Caption = 'Rename: '
      EditCaption = 'Rename: '
      MaxLength = 64
      OnAcceptText = miGoldEditAcceptText
    end
  end
  object srcBundles: TDataSource
    DataSet = mdBundles
    Left = 85
    Top = 402
  end
  object mdBundles: TssMemoryData
    FieldDefs = <>
    Left = 28
    Top = 402
  end
end
