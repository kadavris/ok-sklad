inherited fmWaybill: TfmWaybill
  Width = 900
  Height = 519
  inherited Splitter1: TSplitter
    Width = 900
  end
  inherited panClient: TPanel
    Width = 900
    inherited ssBevel9: TssBevel
      Width = 900
    end
    inherited ssBevel8: TssBevel
      Left = 899
    end
    inherited ssBevel12: TssBevel
      Width = 900
    end
    inherited pcMainList: TcxPageControl
      Width = 898
      inherited tsMainList: TcxTabSheet
        inherited bvlMainListTop: TssBevel
          Width = 898
        end
        inherited grdMain: TssDBGrid
          Width = 898
          DefaultLayout = False
          Filter.Criteria = {00000000}
          GroupPanelFontColor = clWindow
          AllowGrouping = True
          OnGetOptionsTitle = grdMainGetOptionsTitle
          inherited colImg: TdxDBGridImageColumn
            FieldName = 'WTYPE'
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
              '1')
          end
          inherited colNum: TdxDBGridColumn
            FieldName = 'numex'
            OnGetText = colNumGetText
          end
          object colNumEx: TdxDBGridColumn [3]
            Visible = False
            BandIndex = 0
            RowIndex = 0
            FieldName = 'NUM'
          end
          inherited colName: TdxDBGridColumn
            Tag = 2
          end
          inherited colSummPay: TdxDBGridColumn
            Width = 90
          end
          inherited colSummInCurr: TdxDBGridColumn
            Tag = 1
            FieldName = 'SUMMINCURR'
            OnGetText = colSummInCurrGetText
          end
          inherited colDocSaldo: TdxDBGridColumn
            Width = 90
            FieldName = 'docsaldo'
          end
        end
        inherited panFooter: TPanel
          Width = 898
          inherited ssBevel1: TssBevel
            Width = 898
          end
        end
      end
    end
    inherited panFilter: TPanel
      Width = 900
      inherited bvlTop: TssBevel
        Width = 900
      end
      inherited bvlRight: TssBevel
        Left = 899
      end
      inherited lStatus: TLabel
        Left = 1428
      end
      inherited btnKagent: TssSpeedButton
        Left = 1107
      end
      inherited cbChecked: TcxImageComboBox
        Left = 1469
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
    Width = 900
    Height = 355
    ActivePage = tsInfo
    inherited tsPositions: TcxTabSheet
      inherited ssBevel14: TssBevel
        Height = 299
      end
      inherited ssBevel15: TssBevel
        Width = 900
      end
      inherited ssBevel16: TssBevel
        Top = 300
        Width = 900
      end
      inherited ssBevel17: TssBevel
        Left = 899
        Height = 299
      end
      inherited grdDet: TssDBGrid
        Width = 898
        Height = 299
        Filter.Criteria = {00000000}
        OptionsBehavior = [edgoCellMultiSelect, edgoDragScroll, edgoExtMultiSelect, edgoMultiSelect, edgoStoreToRegistry, edgoTabThrough, edgoVertThrough]
        OnGetOptionsTitle = grdDetGetOptionsTitle
        object colPType: TdxDBGridImageColumn [0]
          Alignment = taRightJustify
          Caption = ' '
          HeaderAlignment = taCenter
          MinWidth = 16
          Sizing = False
          Width = 25
          BandIndex = 0
          RowIndex = 0
          FieldName = 'POStype'
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
            '183')
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
        inherited colPriceWONDS: TdxDBGridColumn
          FieldName = 'pricewonds'
        end
        inherited colPrice: TdxDBGridColumn
          FieldName = 'pricewithnds'
        end
        inherited colSummDefWONDS: TdxDBGridColumn
          FieldName = 'sumwonds'
          OnGetText = colSummDefGetText
        end
        inherited colNDS: TdxDBGridColumn
          OnGetText = colSummDefGetText
        end
        inherited colDetNDS: TdxDBGridColumn
          FieldName = 'sumnds'
          OnGetText = colSummDefGetText
        end
        inherited colSummDef: TdxDBGridColumn
          FieldName = 'sumwithnds'
        end
        inherited colSummCurr: TdxDBGridColumn
          FieldName = 'sumcurr'
          OnGetText = colSummDefGetText
        end
        object colSN: TdxDBGridColumn [18]
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          Width = 70
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SN'
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
        inherited colArchived: TdxDBGridColumn
          FieldName = 'ARCHIVED'
        end
        object colSvcToPrice: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'svctoprice'
        end
      end
      inherited PanDetFooter: TPanel
        Top = 301
        Width = 900
        inherited ssBevel4: TssBevel
          Width = 900
        end
      end
    end
    inherited tsInfo: TcxTabSheet
      inherited ssBevel10: TssBevel
        Height = 329
      end
      inherited ssBevel19: TssBevel
        Width = 900
      end
      inherited ssBevel21: TssBevel
        Top = 330
        Width = 900
      end
      inherited ssBevel22: TssBevel
        Left = 899
        Height = 329
      end
      inherited inspMain: TdxInspector
        Width = 898
        Height = 329
        DividerPos = 311
        Data = {
          1A0100000700000008000000000000000500000069724E756D08000000060000
          000800000069724B4167656E7408000000000000000C00000069724B4146756C
          6C4E616D6508000000000000000A00000069724B414164726573730800000000
          0000000900000069724B4150686F6E6508000000000000000500000069724661
          780800000000000000070000006972456D61696C080000000000000005000000
          6972575757080000000000000006000000697243757272080000000000000008
          0000006972526561736F6E0800000000000000080000006972506572736F6E08
          0000000000000008000000697253746174757308000000000000000700000069
          724E6F7465730100000008000000000000000800000069724B4167656E74}
      end
    end
    inherited tsDocRel: TcxTabSheet
      TabVisible = True
      inherited grdDocRel: TssDBGrid
        Width = 900
        Height = 331
        Hint = ''
        Filter.Criteria = {00000000}
        inherited colDRType: TdxDBGridImageColumn
          Caption = 'DOCTYPE'
        end
        inherited colDRNum: TdxDBGridColumn
          FieldName = 'num'
        end
        inherited colDRID: TdxDBGridColumn
          FieldName = 'docid'
        end
        inherited colDRSummAll: TdxDBGridColumn
          FieldName = 'summ'
        end
      end
    end
  end
  inherited ActionList: TActionList
    object aPosProps: TAction [26]
      Caption = 'aPosProps'
      ImageIndex = 4
      OnExecute = aPosPropsExecute
    end
    inherited aAddPayDoc: TAction
      ImageIndex = 64
    end
  end
  inherited pmMain: TTBPopupMenu
    object TBItem7: TTBItem [5]
      Action = aPrint
    end
    object TBSeparatorItem4: TTBSeparatorItem [6]
    end
    object TBItem10: TTBItem [8]
      Action = aAddPayDoc
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
    object cdsMaindocsaldo: TFloatField
      FieldKind = fkCalculated
      FieldName = 'docsaldo'
      Calculated = True
    end
    object cdsMainNOTES: TStringField
      FieldName = 'NOTES'
      Size = 255
    end
    object cdsMainDOCID: TIntegerField
      FieldName = 'DOCID'
      Required = True
    end
    object cdsMainSUMMINCURR: TFloatField
      FieldName = 'SUMMINCURR'
    end
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
    ProviderName = 'pWaybillDet_GetIn'
    inherited cdsDetailONVALUE: TFloatField
      Required = False
    end
    object cdsDetailproducer: TStringField [16]
      FieldName = 'producer'
      Size = 64
    end
    object cdsDetailSN: TStringField [17]
      FieldName = 'SN'
      Size = 64
    end
    object cdsDetailGTD: TStringField [18]
      FieldName = 'GTD'
      Size = 64
    end
    object cdsDetailCERTNUM: TStringField [19]
      FieldName = 'CERTNUM'
      Size = 64
    end
    object cdsDetailCERTDATE: TDateTimeField [20]
      FieldName = 'CERTDATE'
    end
    object cdsDetailARCHIVED: TIntegerField [21]
      FieldName = 'ARCHIVED'
    end
    object cdsDetailGRPID: TIntegerField [22]
      FieldName = 'GRPID'
    end
    object cdsDetailPOSTYPE: TIntegerField [23]
      FieldName = 'POSTYPE'
    end
    object cdsDetailsvctoprice: TIntegerField
      FieldName = 'svctoprice'
    end
  end
  inherited srcDetail: TDataSource
    OnDataChange = srcDetailDataChange
  end
  inherited pmDet: TTBPopupMenu
    object TBItem9: TTBItem [5]
      Action = aFindAtWH
    end
    object TBSeparatorItem5: TTBSeparatorItem [10]
    end
    object TBItem8: TTBItem [11]
      Action = aPosProps
    end
  end
  inherited cdsRel: TssClientDataSet
    Params = <
      item
        DataType = ftInteger
        Name = 'docid'
        ParamType = ptUnknown
        Value = 0
      end>
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
end
