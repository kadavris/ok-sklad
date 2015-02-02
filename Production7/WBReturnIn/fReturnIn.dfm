inherited fmWBReturnIn: TfmWBReturnIn
  inherited panClient: TPanel
    inherited pcMainList: TcxPageControl
      inherited tsMainList: TcxTabSheet
        inherited grdMain: TssDBGrid
          Hint = 'numex'
          Filter.Criteria = {00000000}
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
              '151'
              '152'
              '153'
              '154'
              '155'
              '156'
              '157')
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
        end
      end
    end
    inherited panFilter: TPanel
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
          '<>')
      end
    end
  end
  inherited pcMain: TcxPageControl
    inherited tsPositions: TcxTabSheet
      inherited grdDet: TssDBGrid
        Filter.Criteria = {00000000}
        OnGetOptionsTitle = grdDetGetOptionsTitle
        inherited colPriceWONDS: TdxDBGridColumn
          FieldName = 'pricewonds'
        end
        inherited colPrice: TdxDBGridColumn
          Tag = 0
          Visible = False
          FieldName = 'pricewithnds'
        end
        inherited colPriceInCurr: TdxDBGridColumn
          Caption = #1062#1077#1085#1072' '#1074' '#1074#1072#1083#1102#1090#1077
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
        inherited colProducer: TdxDBGridColumn
          Tag = 1
          FieldName = 'PRODUCER'
        end
        object colCName: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'currname'
        end
        object colSN: TdxDBGridColumn
          Width = 100
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'sn'
        end
      end
    end
    inherited tsInfo: TcxTabSheet
      inherited inspMain: TdxInspector
        Data = {
          060100000700000008000000000000000500000069724E756D08000000060000
          000800000069724B4167656E7408000000000000000C00000069724B4146756C
          6C4E616D6508000000000000000A00000069724B414164726573730800000000
          0000000900000069724B4150686F6E6508000000000000000500000069724661
          780800000000000000070000006972456D61696C080000000000000005000000
          6972575757080000000000000006000000697243757272080000000000000008
          0000006972526561736F6E0800000000000000080000006972506572736F6E08
          0000000000000008000000697253746174757308000000000000000700000069
          724E6F74657300000000}
      end
    end
    inherited tsDocRel: TcxTabSheet
      TabVisible = True
      inherited grdDocRel: TssDBGrid
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
  inherited pmMain: TTBPopupMenu
    object TBItem7: TTBItem [5]
      Action = aPrint
    end
    object TBSeparatorItem4: TTBSeparatorItem [6]
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
    object cdsMainDOCID: TIntegerField
      FieldName = 'DOCID'
      Required = True
    end
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
    ProviderName = 'pRetOutDet_Get'
    object cdsDetailcurrname: TStringField
      FieldName = 'currname'
    end
    object cdsDetailpricetxt: TStringField
      FieldKind = fkCalculated
      FieldName = 'pricetxt'
      Calculated = True
    end
    object cdsDetailDPOSID: TIntegerField
      FieldName = 'DPOSID'
    end
    object cdsDetailPPOSID: TIntegerField
      FieldName = 'PPOSID'
      Required = True
    end
    object cdsDetailGRPID: TIntegerField
      FieldName = 'GRPID'
    end
    object cdsDetailPRODUCER: TStringField
      FieldName = 'PRODUCER'
      Size = 255
    end
    object cdsDetailGTD: TStringField
      FieldName = 'GTD'
      Size = 64
    end
    object cdsDetailsn: TStringField
      FieldName = 'sn'
      Size = 64
    end
  end
  inherited pmDet: TTBPopupMenu
    object TBItem8: TTBItem [5]
      Action = aFindAtWH
    end
    object TBSeparatorItem5: TTBSeparatorItem [6]
    end
  end
end
