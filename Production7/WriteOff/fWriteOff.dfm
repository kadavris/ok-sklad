inherited fmWriteOff: TfmWriteOff
  inherited panClient: TPanel
    inherited pcMainList: TcxPageControl
      inherited tsMainList: TcxTabSheet
        inherited grdMain: TssDBGrid
          Filter.Criteria = {00000000}
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
              '151'
              '152'
              '153')
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
              '1')
          end
          inherited colNum: TdxDBGridColumn
            FieldName = 'numex'
            OnGetText = colNumGetText
          end
          inherited colName: TdxDBGridColumn
            Tag = 0
            Sorted = csDown
            FieldName = 'whname'
          end
          inherited colSummPay: TdxDBGridColumn
            Tag = 0
          end
          inherited colDocSaldo: TdxDBGridColumn
            Tag = 0
          end
          object colNumEx: TdxDBGridColumn
            Visible = False
            BandIndex = 0
            RowIndex = 0
            FieldName = 'NUM'
          end
        end
        inherited panFooter: TPanel
          inherited lDocsCount: TLabel
            Left = 311
          end
          inherited lDocsSumm: TLabel
            Left = 535
          end
          inherited stCount: TssBevel
            Left = 415
          end
          inherited stTotal: TssBevel
            Left = 591
          end
        end
      end
    end
    inherited panFilter: TPanel
      inherited lStatus: TLabel
        Left = 640
      end
      inherited lKAgent: TLabel
        Left = 331
        Top = 10
        Alignment = taLeftJustify
      end
      inherited btnKagent: TssSpeedButton
        Left = 594
        ImageIndex = 26
      end
      inherited cbChecked: TcxImageComboBox
        Left = 1575
      end
      inherited lcbKAgent: TssDBLookupCombo
        Left = 416
        Top = 4
        Width = 178
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
          '<>')
        KeyField = 'wid'
      end
      inherited prdMain: TokPeriod
        Left = 8
        Width = 273
      end
    end
  end
  inherited pcMain: TcxPageControl
    inherited tsPositions: TcxTabSheet
      inherited grdDet: TssDBGrid
        Hint = 'summdef'
        Filter.Criteria = {00000000}
        OnGetOptionsTitle = grdDetGetOptionsTitle
        inherited colWHouseName: TdxDBGridColumn
          Visible = False
        end
        inherited colPriceWONDS: TdxDBGridColumn
          FieldName = 'pricewonds'
        end
        inherited colPrice: TdxDBGridColumn
          Visible = False
          FieldName = 'pricewithnds'
        end
        inherited colPriceInCurr: TdxDBGridColumn
          Tag = 0
        end
        inherited colSummDefWONDS: TdxDBGridColumn
          FieldName = 'sumwonds'
        end
        inherited colDetNDS: TdxDBGridColumn
          FieldName = 'sumnds'
        end
        inherited colSummDef: TdxDBGridColumn
          Caption = 'summdef'
          FieldName = 'sumwithnds'
        end
        inherited colSummCurr: TdxDBGridColumn
          Caption = 'summcurr'
          Width = 100
          FieldName = 'sumcurr'
        end
        inherited colProducer: TdxDBGridColumn
          Tag = 1
          FieldName = 'PRODUCER'
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
        object colCName: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'currname'
        end
        object colSN: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'sn'
        end
      end
      inherited PanDetFooter: TPanel
        inherited lTot: TLabel
          Left = 519
        end
        inherited lTotNDSOut: TLabel
          Left = 238
        end
        inherited lTotNDS: TLabel
          Left = 723
        end
        inherited bvlCurrSep: TssBevel
          Left = 227
        end
        inherited stSummCurr: TssBevel
          Left = 100
          Width = 101
          Caption = '999999,999'
        end
        inherited stSummDef: TssBevel
          Left = 569
          Caption = '999999,999'
          Font.Height = -13
        end
        inherited stSummDefNDS: TssBevel
          Left = 759
          Width = 100
          Caption = '999999,999'
          Font.Height = -13
        end
        inherited stSummDefNoNDS: TssBevel
          Left = 355
          Caption = '999999,999'
          Font.Height = -13
        end
      end
    end
    inherited tsInfo: TcxTabSheet
      inherited inspMain: TdxInspector
        DividerPos = 200
        Data = {
          1A0100000800000008000000000000000500000069724E756D08000000000000
          00080000006972506572736F6E08000000060000000800000069724B4167656E
          7408000000000000000C00000069724B4146756C6C4E616D6508000000000000
          000A00000069724B4141647265737308000000000000000900000069724B4150
          686F6E6508000000000000000500000069724661780800000000000000070000
          006972456D61696C080000000000000005000000697257575708000000000000
          000600000069724375727208000000000000000800000069724C6F7373657308
          00000000000000080000006972526561736F6E08000000000000000800000069
          7253746174757308000000000000000700000069724E6F74657300000000}
        inherited irKAgent: TdxInspectorTextButtonRow
          Buttons = <
            item
              Default = True
              Kind = bkGlyph
              Visible = False
            end>
        end
        object irLosses: TdxInspectorTextRow
          Caption = #1057#1091#1084#1084#1072' '#1089#1087#1080#1089#1072#1085#1080#1103' '#1083#1086#1078#1080#1090#1089#1103' '#1085#1072' '#1091#1073#1099#1090#1082#1080
          ReadOnly = True
        end
      end
    end
    inherited tsDocRel: TcxTabSheet
      TabVisible = True
      inherited grdDocRel: TssDBGrid
        Width = 945
        Height = 208
        Filter.Criteria = {00000000}
        inherited colDROnDate: TdxDBGridColumn
          Sizing = False
        end
        inherited colDRSummAll: TdxDBGridColumn
          Visible = False
        end
      end
    end
  end
  inherited ActionList: TActionList
    OnUpdate = ActionListUpdate
    Top = 92
    object aAddTaxWB: TAction [22]
      Category = 'All'
      Caption = 'aAddTaxWB'
      Enabled = False
      OnExecute = aAddTaxWBExecute
    end
  end
  inherited pmMain: TTBPopupMenu
    Top = 92
    object TBItem7: TTBItem [5]
      Action = aPrint
    end
    object TBSeparatorItem4: TTBSeparatorItem [6]
    end
    object TBItem11: TTBItem [8]
      Action = aAddTaxWB
      Visible = False
    end
  end
  inherited cdsMain: TssClientDataSet
    Params = <
      item
        DataType = ftUnknown
        Name = 'WTYPE'
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
    ProviderName = 'pWayBillWO_List'
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
    object cdsMainDELETED: TIntegerField
      FieldName = 'DELETED'
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
    object cdsMainWID: TIntegerField
      FieldName = 'WID'
      Required = True
    end
    object cdsMainWHNAME: TStringField
      FieldName = 'WHNAME'
      Required = True
      Size = 64
    end
    object cdsMainnumex: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'numex'
    end
    object cdsMainNOTES: TStringField
      FieldName = 'NOTES'
      Size = 255
    end
    object cdsMainDOCID: TIntegerField
      FieldName = 'DOCID'
      Required = True
    end
  end
  inherited cdsKAgent: TssClientDataSet
    ProviderName = 'pWHouse_List'
    BeforeOpen = cdsKAgentBeforeOpen
    Macros = <
      item
        DataType = ftString
        Name = 'm'
        ParamType = ptInput
      end>
  end
  inherited cdsDetail: TssMemoryData
    OnCalcFields = cdsDetailCalcFields
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
    ProviderName = 'pWaybillDet_GetNull'
    object cdsDetailcurrname: TStringField [12]
      FieldName = 'currname'
    end
    object cdsDetailPriceTXT: TStringField [13]
      FieldKind = fkCalculated
      FieldName = 'PriceTXT'
      Calculated = True
    end
    object cdsDetailGTD: TStringField
      FieldName = 'GTD'
      Size = 64
    end
    object cdsDetailPRODUCER: TStringField
      FieldName = 'PRODUCER'
      Size = 255
    end
    object cdsDetailCERTNUM: TStringField
      FieldName = 'CERTNUM'
      Size = 64
    end
    object cdsDetailCERTDATE: TDateTimeField
      FieldName = 'CERTDATE'
    end
    object cdsDetailGRPID: TIntegerField
      FieldName = 'GRPID'
    end
    object cdsDetailsn: TStringField
      FieldName = 'sn'
      Size = 64
    end
  end
  inherited cdsDocRel: TssClientDataSet
    Top = 92
  end
end
