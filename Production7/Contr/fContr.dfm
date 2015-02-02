inherited fmContr: TfmContr
  Width = 577
  Height = 375
  inherited Splitter1: TSplitter
    Width = 577
  end
  inherited panClient: TPanel
    Width = 577
    inherited ssBevel9: TssBevel
      Width = 577
    end
    inherited ssBevel8: TssBevel
      Left = 576
    end
    inherited ssBevel12: TssBevel
      Width = 577
    end
    inherited pcMainList: TcxPageControl
      Width = 575
      inherited tsMainList: TcxTabSheet
        inherited bvlMainListTop: TssBevel
          Width = 575
        end
        inherited grdMain: TssDBGrid
          Width = 575
          Hint = 'todate'
          Bands = <
            item
              Caption = 'Main Info'
              OnlyOwnColumns = True
            end
            item
              Caption = 'AandS'
              OnlyOwnColumns = True
            end
            item
              Caption = 'Shipped'
              OnlyOwnColumns = True
            end
            item
              Caption = 'Rest'
              OnlyOwnColumns = True
            end>
          DefaultLayout = False
          KeyField = 'DOCID'
          Filter.Criteria = {00000000}
          ShowBands = True
          OnGetOptionsTitle = grdMainGetOptionsTitle
          object colStatus: TdxDBGridColumn [0]
            HeaderAlignment = taCenter
            Visible = False
            Width = 20
            BandIndex = 0
            RowIndex = 0
            FieldName = 'CHECKED'
          end
          inherited colImg: TdxDBGridImageColumn
            HeaderAlignment = taCenter
            FieldName = 'doctype'
            Descriptions.Strings = (
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              '8'
              '-8')
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
              '179')
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
              '8'
              '-8')
          end
          inherited colChecked: TdxDBGridImageColumn
            HeaderAlignment = taCenter
            FieldName = ''
          end
          object colImgFPath: TdxDBGridImageColumn [3]
            Alignment = taLeftJustify
            HeaderAlignment = taCenter
            MinWidth = 16
            Sizing = False
            Width = 20
            BandIndex = 0
            RowIndex = 0
            OnCustomDrawCell = colImgFPathCustomDrawCell
            OnGetText = colImgFPathGetText
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
              '171')
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
              '1'
              ''
              ''
              '-1')
          end
          inherited colNum: TdxDBGridColumn
            MinWidth = 30
          end
          inherited colOnDate: TdxDBGridColumn
            Width = 80
          end
          object colToDate: TdxDBGridColumn [6]
            Tag = 1
            Alignment = taCenter
            HeaderAlignment = taCenter
            Width = 80
            BandIndex = 0
            RowIndex = 0
            FieldName = 'todate'
            OnGetText = colToDateGetText
          end
          inherited colName: TdxDBGridColumn
            MinWidth = 100
          end
          inherited colNotes: TdxDBGridColumn [8]
            FieldName = ''
          end
          object colFpath: TdxDBGridColumn [9]
            HeaderAlignment = taCenter
            Visible = False
            BandIndex = 0
            RowIndex = 0
            FieldName = 'fpath'
          end
          object colAllAmount: TdxDBGridColumn [10]
            Tag = 1
            HeaderAlignment = taCenter
            Width = 60
            BandIndex = 1
            RowIndex = 0
            FieldName = 'amount'
          end
          inherited colSummAll: TdxDBGridColumn [11]
            Width = 80
            BandIndex = 1
            FieldName = 'summall'
            OnGetText = colSummPayGetText
          end
          inherited colSummPay: TdxDBGridColumn [13]
            Width = 80
            BandIndex = 1
            FieldName = 'paidsumm'
          end
          object colShAmount: TdxDBGridColumn [14]
            Tag = 1
            HeaderAlignment = taCenter
            Visible = False
            Width = 60
            BandIndex = 2
            RowIndex = 0
            FieldName = 'shippedamount'
          end
          object colShSumm: TdxDBGridColumn [15]
            Tag = 1
            HeaderAlignment = taCenter
            Visible = False
            Width = 80
            BandIndex = 2
            RowIndex = 0
            FieldName = 'shippedsumm'
            OnGetText = colSummPayGetText
          end
          object colRest: TdxDBGridColumn [16]
            Tag = 1
            HeaderAlignment = taCenter
            Visible = False
            Width = 60
            BandIndex = 3
            RowIndex = 0
            FieldName = 'rest'
          end
          object colRestSumm: TdxDBGridColumn [17]
            Tag = 1
            HeaderAlignment = taCenter
            Visible = False
            Width = 80
            BandIndex = 3
            RowIndex = 0
            FieldName = 'summrest'
            OnGetText = colSummPayGetText
          end
          inherited colDocSaldo: TdxDBGridColumn [18]
            Tag = 0
          end
          inherited colCurrName: TdxDBGridColumn
            Tag = 1
            Alignment = taCenter
            HeaderAlignment = taCenter
            Sizing = False
            Visible = True
          end
          inherited colID: TdxDBGridColumn
            FieldName = 'docid'
          end
        end
        inherited panFooter: TPanel
          Width = 575
          inherited ssBevel1: TssBevel
            Width = 575
          end
        end
      end
    end
    inherited panFilter: TPanel
      Width = 577
      inherited bvlTop: TssBevel
        Width = 577
      end
      inherited bvlRight: TssBevel
        Left = 576
      end
      inherited lStatus: TLabel
        Left = 1717
      end
      inherited btnKagent: TssSpeedButton
        Left = 1079
      end
      inherited cbChecked: TcxImageComboBox
        Left = 1757
      end
      inherited lcbKAgent: TssDBLookupCombo
        Properties.Items.Strings = (
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>')
      end
    end
  end
  inherited pcMain: TcxPageControl
    Width = 577
    Height = 211
    inherited tsPositions: TcxTabSheet
      inherited ssBevel14: TssBevel
        Height = 155
      end
      inherited ssBevel15: TssBevel
        Width = 577
      end
      inherited ssBevel16: TssBevel
        Top = 156
        Width = 577
      end
      inherited ssBevel17: TssBevel
        Left = 576
        Height = 155
      end
      inherited grdDet: TssDBGrid
        Width = 575
        Height = 155
        Hint = 'amount'
        Filter.Criteria = {00000000}
        OnGetOptionsTitle = grdMainGetOptionsTitle
        inherited colWHouseName: TdxDBGridColumn
          Tag = 0
          Visible = False
        end
        object colDetShAmount: TdxDBGridColumn [6]
          Tag = 1
          HeaderAlignment = taCenter
          Width = 70
          BandIndex = 0
          RowIndex = 0
          FieldName = 'shippedamount'
        end
        inherited colPriceWONDS: TdxDBGridColumn
          Tag = 0
        end
        inherited colPrice: TdxDBGridColumn
          Tag = 0
          Visible = False
        end
        inherited colSummDefWONDS: TdxDBGridColumn
          Tag = 0
        end
        inherited colNDS: TdxDBGridColumn
          Tag = 0
        end
        inherited colSummDef: TdxDBGridColumn
          Tag = 0
          Visible = False
        end
        inherited colRate: TdxDBGridColumn
          Tag = 0
        end
      end
      inherited PanDetFooter: TPanel
        Top = 157
        Width = 577
        inherited ssBevel4: TssBevel
          Width = 577
        end
        inherited lTot: TLabel
          Left = 254
        end
        inherited lTotNDSOut: TLabel
          Left = 61
        end
        inherited lTotNDS: TLabel
          Left = 66
        end
        inherited stSummDef: TssBevel
          Left = 288
        end
        inherited stSummDefNDS: TssBevel
          Left = 438
        end
        inherited stSummDefNoNDS: TssBevel
          Left = 74
        end
      end
    end
    inherited tsInfo: TcxTabSheet
      inherited ssBevel10: TssBevel
        Height = 185
      end
      inherited ssBevel19: TssBevel
        Width = 577
      end
      inherited ssBevel21: TssBevel
        Top = 186
        Width = 577
      end
      inherited ssBevel22: TssBevel
        Left = 576
        Height = 185
      end
      inherited inspMain: TdxInspector
        Width = 575
        Height = 185
        DividerPos = 203
        Data = {
          1A0100000800000008000000000000000500000069724E756D08000000060000
          000800000069724B4167656E7408000000000000000C00000069724B4146756C
          6C4E616D6508000000000000000A00000069724B414164726573730800000000
          0000000900000069724B4150686F6E6508000000000000000500000069724661
          780800000000000000070000006972456D61696C080000000000000005000000
          6972575757080000000000000006000000697243757272080000000000000008
          0000006972416D6F756E740800000000000000080000006972526561736F6E08
          00000000000000080000006972506572736F6E08000000000000000800000069
          7253746174757308000000000000000700000069724E6F74657300000000}
        inherited irAmount: TdxInspectorTextRow
          Visible = True
        end
      end
    end
    inherited tsDocRel: TcxTabSheet
      TabVisible = True
      inherited grdDocRel: TssDBGrid
        Width = 911
        Height = 278
        Hint = ''
        Filter.Criteria = {00000000}
      end
    end
  end
  inherited ActionList: TActionList
    object aSet0: TAction
      Category = 'Status'
      AutoCheck = True
      Caption = 'aSet0'
      Checked = True
      GroupIndex = 5
      OnExecute = aSet0Execute
    end
    object aSet1: TAction
      Category = 'Status'
      AutoCheck = True
      Caption = 'aSet1'
      GroupIndex = 5
      OnExecute = aSet1Execute
    end
    object aSet2: TAction
      Category = 'Status'
      AutoCheck = True
      Caption = 'aSet2'
      GroupIndex = 5
      OnExecute = aSet2Execute
    end
    object aSet3: TAction
      Category = 'Status'
      AutoCheck = True
      Caption = 'aSet3'
      GroupIndex = 5
      OnExecute = aSet3Execute
    end
    object aRecalc: TAction
      Category = 'All'
      Caption = 'aRecalc'
      OnExecute = aRecalcExecute
    end
    object aRecalcAll: TAction
      Category = 'All'
      Caption = 'aRecalcAll'
      OnExecute = aRecalcAllExecute
    end
    object aPrintFRF: TAction
      Category = 'All'
      Caption = 'aPrintFRF'
      OnExecute = aPrintFRFExecute
    end
    object aPrintF: TAction
      Category = 'All'
      Caption = 'aPrintF'
      OnExecute = aPrintFExecute
    end
    object aReport: TAction
      Caption = 'aReport'
      ImageIndex = 58
      ShortCut = 16457
      OnExecute = aReportExecute
    end
  end
  inherited pmMain: TTBPopupMenu
    inherited itmPatternIns: TTBItem
      Visible = False
    end
    object mnuStatus: TTBSubmenuItem [5]
      OnPopup = mnuStatusPopup
      object TBItem7: TTBItem
        Action = aSet0
      end
      object TBItem8: TTBItem
        Action = aSet1
      end
      object TBItem9: TTBItem
        Action = aSet2
      end
      object TBItem10: TTBItem
        Action = aSet3
      end
    end
    inherited TBItem6: TTBItem
      Action = nil
      Visible = False
    end
    object TBItem12: TTBItem [8]
      Action = aRecalc
    end
    object TBItem13: TTBItem [9]
      Action = aRecalcAll
    end
  end
  inherited cdsMain: TssClientDataSet
    Params = <
      item
        DataType = ftUnknown
        Name = 'doctype'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fromdate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'todate'
        ParamType = ptUnknown
      end>
    ProviderName = 'pContr_List'
    Macros = <
      item
        DataType = ftUnknown
        Name = 'm'
        ParamType = ptUnknown
      end>
  end
  inherited cdsDetail: TssMemoryData
    Left = 132
    Top = 284
  end
  inherited cdsDetailFetch: TssClientDataSet
    Aggregates = <
      item
        Active = True
        Expression = 'min(msrname)'
        Visible = False
      end
      item
        Active = True
        Expression = 'max(msrname)'
        Visible = False
      end
      item
        Active = True
        Expression = 'sum(amount)'
        Visible = False
      end>
    ProviderName = 'pContrDet_Get'
    Left = 126
    Top = 229
    object cdsDetailshippedamount: TFloatField
      FieldName = 'shippedamount'
    end
  end
  inherited srcDetail: TDataSource
    Left = 86
    Top = 285
  end
  inherited pmDet: TTBPopupMenu
    inherited itmFindAtMats: TTBItem
      Visible = False
    end
    inherited TBSeparatorItem7: TTBSeparatorItem
      Visible = False
    end
  end
  inherited cdsRel: TssClientDataSet
    ProviderName = 'pContr_RelList'
    Left = 201
    Top = 221
  end
  inherited srcRel: TDataSource
    Left = 261
    Top = 225
  end
  object pmCheck: TTBPopupMenu
    Images = dmData.Images
    OnPopup = pmCheckPopup
    Left = 468
    Top = 136
    object TBItem14: TTBItem
      Action = aSet0
    end
    object TBItem15: TTBItem
      Action = aSet1
    end
    object TBItem16: TTBItem
      Action = aSet2
    end
    object itmPrintWork: TTBItem
      Action = aSet3
    end
  end
  object pmPrint: TTBPopupMenu
    Images = dmData.Images
    Left = 420
    Top = 132
    object TBItem11: TTBItem
      Action = aPrintFRF
      Images = dmData.Images
    end
    object TBItem17: TTBItem
      Action = aPrintF
    end
  end
end
