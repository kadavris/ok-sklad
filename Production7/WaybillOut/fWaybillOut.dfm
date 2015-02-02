inherited fmWaybillOut: TfmWaybillOut
  inherited panClient: TPanel
    inherited pcMainList: TcxPageControl
      inherited tsMainList: TcxTabSheet
        inherited grdMain: TssDBGrid
          Hint = 'ONDATE'
          Font.Charset = RUSSIAN_CHARSET
          Font.Height = -13
          Font.Name = 'Tahoma'
          ParentFont = False
          BandFont.Charset = RUSSIAN_CHARSET
          BandFont.Height = -13
          BandFont.Name = 'Tahoma'
          Filter.Criteria = {00000000}
          HeaderFont.Charset = RUSSIAN_CHARSET
          HeaderFont.Height = -13
          HeaderFont.Name = 'Tahoma'
          PreviewFont.Charset = RUSSIAN_CHARSET
          PreviewFont.Height = -13
          PreviewFont.Name = 'Tahoma'
          OnGetOptionsTitle = grdMainGetOptionsTitle
          inherited colImg: TdxDBGridImageColumn
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
              '151')
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
              '1')
          end
          inherited colNum: TdxDBGridColumn
            FieldName = 'numex'
            OnGetText = colNumGetText
          end
          inherited colName: TdxDBGridColumn
            Tag = 2
          end
          inherited colSummInCurr: TdxDBGridColumn
            Tag = 1
            FieldName = 'SUMMINCURR'
            OnGetText = colSummInCurrGetText
          end
          inherited colDocSaldo: TdxDBGridColumn
            FieldName = 'docsaldo'
          end
          object colNumEx: TdxDBGridColumn
            Visible = False
            BandIndex = 0
            RowIndex = 0
            FieldName = 'NUM'
          end
          object colEnt: TdxDBGridColumn
            Tag = 1
            HeaderAlignment = taCenter
            Visible = False
            Width = 100
            BandIndex = 0
            RowIndex = 0
            FieldName = 'entname'
          end
        end
        inherited panFooter: TPanel
          inherited lDocsCount: TLabel
            Left = 463
          end
          inherited lDocsSumm: TLabel
            Left = 663
          end
          inherited stCount: TssBevel
            Left = 563
          end
          inherited stTotal: TssBevel
            Left = 720
          end
        end
      end
    end
    inherited panFilter: TPanel
      inherited lStatus: TLabel
        Left = 2048
      end
      inherited btnKagent: TssSpeedButton
        Left = 1790
      end
      inherited cbChecked: TcxImageComboBox
        Left = 2089
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
    inherited tsPositions: TcxTabSheet
      inherited ssBevel16: TssBevel
        Top = 77
      end
      inherited grdDet: TssDBGrid
        Hint = 'amount'
        BandFont.Height = -13
        Filter.Criteria = {00000000}
        OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoMultiSelect, edgoStoreToRegistry, edgoTabThrough, edgoVertThrough]
        OnGetOptionsTitle = grdDetGetOptionsTitle
        object colPType: TdxDBGridImageColumn [0]
          Alignment = taRightJustify
          MinWidth = 16
          Sizing = False
          Width = 25
          BandIndex = 0
          RowIndex = 0
          FieldName = 'POSTYPE'
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
            '160')
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
            '0'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
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
        object colRsv: TdxDBGridImageColumn [1]
          Tag = 1
          Alignment = taRightJustify
          HeaderAlignment = taCenter
          MinWidth = 25
          Sizing = False
          Width = 25
          BandIndex = 0
          RowIndex = 0
          FieldName = 'rsv'
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
            '187')
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
            '1')
        end
        inherited colMatName: TdxDBGridColumn
          Sorted = csNone
        end
        inherited colWHouseName: TdxDBGridColumn
          OnGetText = colWHouseNameGetText
        end
        inherited colPriceWONDS: TdxDBGridColumn
          OnCustomDrawCell = colPriceCustomDrawCell
          FieldName = 'pricewonds'
        end
        inherited colPrice: TdxDBGridColumn
          OnCustomDrawCell = colPriceCustomDrawCell
          FieldName = 'pricewithnds'
        end
        inherited colSummDefWONDS: TdxDBGridColumn
          FieldName = 'sumwonds'
        end
        inherited colDetNDS: TdxDBGridColumn
          FieldName = 'sumnds'
        end
        inherited colSummDef: TdxDBGridColumn
          FieldName = 'sumwithnds'
        end
        inherited colSummCurr: TdxDBGridColumn
          FieldName = 'sumcurr'
        end
        object colDiscount: TdxDBGridColumn [17]
          Tag = 1
          Alignment = taRightJustify
          HeaderAlignment = taCenter
          Visible = False
          Width = 60
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DISCOUNT'
          OnGetText = colDiscountGetText
        end
        inherited colNorm: TdxDBGridColumn
          FieldName = 'NORM'
        end
        object colSN: TdxDBGridColumn [20]
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          Width = 70
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SN'
          OnGetText = colSNGetText
        end
        inherited colProducer: TdxDBGridColumn
          Tag = 1
          FieldName = 'producer'
        end
        inherited colGTD: TdxDBGridColumn
          Tag = 1
          FieldName = 'GTD'
        end
        inherited colCertNum: TdxDBGridColumn
          Tag = 1
          FieldName = 'CERTNUM'
        end
        inherited colCertDate: TdxDBGridColumn
          Tag = 1
          FieldName = 'CERTDATE'
        end
        inherited colCardNum: TdxDBGridColumn
          Tag = 1
          FieldName = 'cardnum'
        end
        inherited colCardHolder: TdxDBGridColumn
          Tag = 1
          FieldName = 'holder'
        end
        object colWarrantyPeriod: TdxDBGridColumn
          Tag = 1
          Alignment = taLeftJustify
          HeaderAlignment = taCenter
          Visible = False
          Width = 70
          BandIndex = 0
          RowIndex = 0
          FieldName = 'WPERIOD'
          OnGetText = colWarrantyPeriodGetText
        end
        object colWarrantyPeriodType: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'WPERIODTYPE'
        end
        object colWarrantyStatus: TdxDBGridColumn
          Tag = 1
          Alignment = taCenter
          HeaderAlignment = taCenter
          Visible = False
          Width = 100
          BandIndex = 0
          RowIndex = 0
          OnCustomDrawCell = colWarrantyStatusCustomDrawCell
          OnGetText = colWarrantyStatusGetText
        end
      end
      inherited PanDetFooter: TPanel
        Top = 47
        inherited lTot: TLabel
          Left = -276
        end
        inherited lTotNDSOut: TLabel
          Left = -445
        end
        inherited lTotNDS: TLabel
          Left = -440
        end
        inherited stSummDef: TssBevel
          Left = -274
        end
        inherited stSummDefNDS: TssBevel
          Left = -372
        end
        inherited stSummDefNoNDS: TssBevel
          Left = -432
        end
      end
    end
    inherited tsInfo: TcxTabSheet
      inherited inspMain: TdxInspector
        DividerPos = 225
        Data = {
          280100000900000008000000000000000500000069724E756D08000000060000
          000800000069724B4167656E7408000000000000000900000069724B4150686F
          6E6508000000000000000C00000069724B4146756C6C4E616D65080000000000
          00000A00000069724B4141647265737308000000000000000500000069724661
          780800000000000000070000006972456D61696C080000000000000005000000
          69725757570800000000000000050000006972456E7408000000000000000600
          00006972437572720800000000000000080000006972526561736F6E08000000
          00000000080000006972506572736F6E08000000000000000800000069725374
          6174757308000000000000000500000069724174740800000000000000070000
          0069724E6F74657300000000}
        object irAtt: TdxInspectorTextRow
          Caption = #1044#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1100
          ReadOnly = True
        end
        object irEnt: TdxInspectorTextRow
          Caption = #1060#1080#1088#1084#1072'-'#1087#1088#1086#1076#1072#1074#1077#1094
          ReadOnly = True
        end
      end
    end
    inherited tsDocRel: TcxTabSheet
      TabVisible = True
      inherited grdDocRel: TssDBGrid
        Height = 87
        Hint = 'checked'
        Filter.Criteria = {00000000}
        inherited colDRNum: TdxDBGridColumn
          FieldName = 'num'
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited aPrint: TAction
      ShortCut = 0
    end
    object aAddTaxWB: TAction [21]
      Category = 'All'
      Caption = 'aAddTaxWB'
      OnExecute = aAddTaxWBExecute
    end
    object aPrintDef: TAction [22]
      Category = 'Print'
      Caption = 'aPrintDef'
      OnExecute = aPrintDefExecute
    end
    object aPrintInvoice: TAction [23]
      Category = 'Print'
      Caption = 'aPrintInvoice'
      OnExecute = aPrintInvoiceExecute
    end
    object aPrintTorg12: TAction [24]
      Category = 'Print'
      Caption = 'aPrintTorg12'
      OnExecute = aPrintTorg12Execute
    end
    object aPrintOrder: TAction [32]
      Category = 'Print'
      Caption = 'aPrintOrder'
      OnExecute = aPrintOrderExecute
    end
    object aPrintWork: TAction [33]
      Category = 'Print'
      Caption = #1040#1082#1090' '#1074#1099#1087#1086#1083#1085#1077#1085#1085#1099#1093' '#1088#1072#1073#1086#1090
      OnExecute = aPrintWorkExecute
    end
    inherited aAddPayDoc: TAction
      ImageIndex = 63
    end
    object aPrintWarrantyDoc: TAction [38]
      Category = 'Print'
      Caption = #1043#1072#1088#1072#1085#1090#1080#1081#1085#1099#1081' '#1090#1072#1083#1086#1085
      OnExecute = aPrintWarrantyDocExecute
    end
    object aCreateInvoice: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1089#1095#1105#1090'-'#1092#1072#1082#1090#1091#1088#1091
      ImageIndex = 181
      OnExecute = aCreateInvoiceExecute
    end
    object aDetCreateInvoice: TAction
      Tag = 1
      Caption = 'aDetCreateInvoice'
      ImageIndex = 181
      OnExecute = aCreateInvoiceExecute
    end
    object aPrintWarrantyDocCustom: TAction
      Category = 'Print'
      Caption = 'aPrintWarrantyDocCustom'
      OnExecute = aPrintWarrantyDocCustomExecute
    end
  end
  inherited pmMain: TTBPopupMenu
    inherited TBItem23: TTBItem [5]
      Visible = False
    end
    object TBSeparatorItem4: TTBSeparatorItem [6]
    end
    inherited TBSeparatorItem2: TTBSeparatorItem [7]
    end
    object TBItem16: TTBItem [8]
      Action = aAddPayDoc
    end
    object TBItemCreateInvoice: TTBItem [9]
      Action = aCreateInvoice
      Caption = 'aCreateInvoice'
    end
    object TBItem11: TTBItem [10]
      Action = aAddTaxWB
    end
    inherited TBItem6: TTBItem [11]
    end
    inherited TBSeparatorItem6: TTBSeparatorItem [12]
    end
    inherited TBItem18: TTBItem [13]
    end
    inherited TBItem5: TTBItem [14]
    end
    inherited itmColParams: TTBItem [15]
    end
    inherited TBSeparatorItem11: TTBSeparatorItem [16]
    end
    object mnuPrint: TTBSubmenuItem [17]
      Caption = 'aPrint'
      ImageIndex = 9
      OnClick = aPrintExecute
      object TBItem7: TTBItem
        Action = aPrintDef
        ShortCut = 16464
      end
      object TBItemPrintInvoice: TTBItem
        Action = aPrintInvoice
      end
      object TBItemPrintTorg12: TTBItem
        Action = aPrintTorg12
      end
      object TBItem15: TTBItem
        Action = aPrintOrder
      end
      object TBItem17: TTBItem
        Action = aPrintWork
      end
      object TBItem24: TTBItem
        Tag = 1
        Action = aPrintWarrantyDoc
      end
    end
  end
  inherited cdsMain: TssClientDataSet
    Params = <
      item
        DataType = ftUnknown
        Name = 'in_fromdate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'in_todate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'in_wtype'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'in_checked'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'in_kaid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'wh'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'allwh'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'shownullbalance'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'in_entid'
        ParamType = ptUnknown
      end>
    ProviderName = 'pWaybill_List'
    OnCalcFields = cdsMainCalcFields
    Macros = <
      item
        DataType = ftString
        Name = 'm'
        ParamType = ptUnknown
      end>
    object cdsMainWBILLID: TIntegerField
      FieldName = 'WBILLID'
      Required = True
    end
    object cdsMainNUM: TStringField
      FieldName = 'NUM'
      Required = True
    end
    object cdsMainONDATE: TDateTimeField
      FieldName = 'ONDATE'
      Required = True
    end
    object cdsMainKAID: TIntegerField
      FieldName = 'KAID'
    end
    object cdsMainCURRID: TIntegerField
      FieldName = 'CURRID'
    end
    object cdsMainATTNUM: TStringField
      FieldName = 'ATTNUM'
      Size = 15
    end
    object cdsMainATTDATE: TDateTimeField
      FieldName = 'ATTDATE'
    end
    object cdsMainREASON: TStringField
      FieldName = 'REASON'
      Size = 255
    end
    object cdsMainCHECKED: TIntegerField
      FieldName = 'CHECKED'
      Required = True
    end
    object cdsMainSUMMALL: TFloatField
      FieldName = 'SUMMALL'
    end
    object cdsMainWTYPE: TIntegerField
      FieldName = 'WTYPE'
      Required = True
    end
    object cdsMainNDS: TFloatField
      FieldName = 'NDS'
    end
    object cdsMainPERSONID: TIntegerField
      FieldName = 'PERSONID'
    end
    object cdsMainRECEIVED: TStringField
      FieldName = 'RECEIVED'
      Size = 64
    end
    object cdsMainTODATE: TDateTimeField
      FieldName = 'TODATE'
    end
    object cdsMainDEFNUM: TIntegerField
      FieldName = 'DEFNUM'
      Required = True
    end
    object cdsMainCURRNAME: TStringField
      FieldName = 'CURRNAME'
      Required = True
      Size = 3
    end
    object cdsMainCURRRATE: TFloatField
      FieldName = 'CURRRATE'
      Required = True
    end
    object cdsMainKANAME: TStringField
      FieldName = 'KANAME'
      Required = True
      Size = 64
    end
    object cdsMainKAFULLNAME: TStringField
      FieldName = 'KAFULLNAME'
      Size = 255
    end
    object cdsMainKAPHONE: TStringField
      FieldName = 'KAPHONE'
      Size = 64
    end
    object cdsMainPERSONNAME: TStringField
      FieldName = 'PERSONNAME'
      Size = 64
    end
    object cdsMainADDRESS: TStringField
      FieldName = 'ADDRESS'
      Size = 255
    end
    object cdsMainCITY: TStringField
      FieldName = 'CITY'
      Size = 32
    end
    object cdsMainDISTRICT: TStringField
      FieldName = 'DISTRICT'
      Size = 32
    end
    object cdsMainCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Size = 32
    end
    object cdsMainPOSTINDEX: TStringField
      FieldName = 'POSTINDEX'
      Size = 16
    end
    object cdsMainFAX: TStringField
      FieldName = 'FAX'
      Size = 32
    end
    object cdsMainEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 64
    end
    object cdsMainWWW: TStringField
      FieldName = 'WWW'
      Size = 64
    end
    object cdsMainKATYPE: TIntegerField
      FieldName = 'KATYPE'
      Required = True
    end
    object cdsMainnumex: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'numex'
    end
    object cdsMainSUMMPAY: TFloatField
      FieldName = 'SUMMPAY'
    end
    object cdsMainNOTES: TStringField
      FieldName = 'NOTES'
      Size = 255
    end
    object cdsMaindocsaldo: TFloatField
      FieldKind = fkCalculated
      FieldName = 'docsaldo'
      Calculated = True
    end
    object cdsMainDOCID: TIntegerField
      FieldName = 'DOCID'
      Required = True
    end
    object cdsMainENTID: TIntegerField
      FieldName = 'ENTID'
    end
    object cdsMainSUMMINCURR: TFloatField
      FieldName = 'SUMMINCURR'
    end
    object cdsMainentname: TStringField
      FieldKind = fkCalculated
      FieldName = 'entname'
      Size = 128
      Calculated = True
    end
  end
  inherited cdsDetail: TssMemoryData
    OnCalcFields = cdsDetailCalcFields
    Left = 88
    Top = 112
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
    ProviderName = 'pWaybillDet_GetOutEx'
    Left = 89
    Top = 157
    object cdsDetailPOSTYPE: TIntegerField [17]
      FieldName = 'POSTYPE'
      Required = True
    end
    object cdsDetailNUM: TIntegerField [18]
      FieldName = 'NUM'
      Required = True
    end
    object cdsDetailNORM: TFloatField [19]
      FieldName = 'NORM'
    end
    object cdsDetailDISCOUNT: TFloatField [20]
      FieldName = 'DISCOUNT'
    end
    object cdsDetailproducer: TStringField [21]
      FieldName = 'producer'
      Size = 64
    end
    object cdsDetailGTD: TStringField [22]
      FieldName = 'GTD'
      Size = 64
    end
    object cdsDetailCERTNUM: TStringField [23]
      FieldName = 'CERTNUM'
      Size = 64
    end
    object cdsDetailCERTDATE: TDateTimeField [24]
      FieldName = 'CERTDATE'
    end
    object cdsDetailTAX: TStringField [25]
      FieldName = 'TAX'
      Size = 255
    end
    object cdsDetailSN: TStringField [26]
      FieldName = 'SN'
      Size = 1000
    end
    object cdsDetailWPERIOD: TIntegerField [27]
      FieldName = 'WPERIOD'
    end
    object cdsDetailWPERIODTYPE: TIntegerField [28]
      FieldName = 'WPERIODTYPE'
    end
    object cdsDetailGRPID: TIntegerField [29]
      FieldName = 'GRPID'
    end
    object cdsDetailcardnum: TStringField [30]
      FieldName = 'cardnum'
      Size = 24
    end
    object cdsDetailholder: TStringField [31]
      FieldName = 'holder'
      Size = 64
    end
    object cdsDetailrsv: TIntegerField [32]
      FieldName = 'rsv'
    end
  end
  inherited srcDetail: TDataSource
    Left = 89
  end
  inherited pmDet: TTBPopupMenu
    OnPopup = pmDetPopup
    Left = 220
    Top = 64
    object itmSvcInfo: TTBItem [1]
      Action = aSvcInfo
    end
    object TBSeparatorItem8: TTBSeparatorItem [5]
    end
    object TBSubmenuItem2: TTBSubmenuItem [6]
      Action = aPrint
      object TBItem22: TTBItem
        Action = aPrintWarrantyDocCustom
      end
    end
    object TBItemDetCreateInvoice: TTBItem [8]
      Action = aDetCreateInvoice
    end
    object TBSeparatorItem5: TTBSeparatorItem [9]
    end
  end
  inherited cdsRel: TssClientDataSet
    Left = 173
    Top = 141
  end
  inherited pmDocRel: TTBPopupMenu
    Left = 248
    Top = 64
  end
  object pmPrint: TTBPopupMenu
    Images = dmData.Images
    Left = 304
    Top = 60
    object TBItem13: TTBItem
      Action = aPrintDef
      Images = dmData.Images
    end
    object TBItem14: TTBItem
      Action = aPrintInvoice
    end
    object TBItem8: TTBItem
      Action = aPrintTorg12
    end
    object TBItem10: TTBItem
      Action = aPrintOrder
    end
    object itmPrintWork: TTBItem
      Action = aPrintWork
    end
    object itmWarrantyDoc: TTBItem
      Action = aPrintWarrantyDoc
    end
  end
  object cdsFind: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pSQL'
    RemoteServer = dmData.SConnection
    Macros = <
      item
        DataType = ftString
        Name = 'sql'
        ParamType = ptUnknown
      end>
    Left = 304
    Top = 196
  end
  object cdsEnts_: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pKAgent_EntsList'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 352
    Top = 60
  end
end
