inherited fmWBRest: TfmWBRest
  inherited panClient: TPanel
    inherited pcMainList: TcxPageControl
      inherited tsMainList: TcxTabSheet
        inherited grdMain: TssDBGrid
          Hint = 'numex'
          Filter.Criteria = {00000000}
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
              ''
              '1')
          end
          inherited colNum: TdxDBGridColumn
            FieldName = 'numex'
            OnGetText = colNumGetText
          end
          inherited colName: TdxDBGridColumn [3]
            Tag = 0
            Visible = False
          end
          inherited colOnDate: TdxDBGridColumn [4]
          end
          inherited colSummPay: TdxDBGridColumn
            Tag = 0
          end
          inherited colSummInCurr: TdxDBGridColumn
            Tag = 1
            FieldName = 'SUMMINCURR'
            OnGetText = colSummInCurrGetText
          end
          inherited colDocSaldo: TdxDBGridColumn
            Tag = 0
          end
          object colNumEx: TdxDBGridColumn [9]
            Visible = False
            BandIndex = 0
            RowIndex = 0
            FieldName = 'NUM'
          end
          object colReason: TdxDBGridColumn [10]
            Tag = 1
            HeaderAlignment = taCenter
            Visible = False
            Width = 100
            BandIndex = 0
            RowIndex = 0
            FieldName = 'REASON'
          end
        end
      end
    end
    inherited panFilter: TPanel
      inherited lStatus: TLabel
        Left = 1068
      end
      inherited lKAgent: TLabel
        Visible = False
      end
      inherited btnKagent: TssSpeedButton
        Visible = False
      end
      inherited cbChecked: TcxImageComboBox
        Left = 1068
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
          '<>')
        Visible = False
      end
      inherited prdMain: TokPeriod
        CapFrom = 'From:'
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
          FieldName = 'sumwithnds'
        end
        inherited colSummCurr: TdxDBGridColumn
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
        inherited colArchived: TdxDBGridColumn
          FieldName = 'ARCHIVED'
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
    end
    inherited tsInfo: TcxTabSheet
      inherited inspMain: TdxInspector
        DividerPos = 151
        Data = {
          7A0000000600000008000000000000000500000069724E756D08000000000000
          0006000000697243757272080000000000000008000000697253746174757308
          00000000000000080000006972506572736F6E08000000000000000800000069
          72526561736F6E08000000000000000700000069724E6F74657300000000}
        inherited irKAPhone: TdxInspectorTextRow
          Visible = False
        end
        inherited irKAFullName: TdxInspectorTextMemoRow
          Visible = False
        end
        inherited irKAAdress: TdxInspectorTextMemoRow
          Visible = False
        end
        inherited irFax: TdxInspectorTextRow
          Visible = False
        end
        inherited irEmail: TdxInspectorTextHyperLinkRow
          Visible = False
        end
        inherited irWWW: TdxInspectorTextHyperLinkRow
          Visible = False
        end
        inherited irKAgent: TdxInspectorTextButtonRow
          Visible = False
        end
      end
    end
    inherited tsDocRel: TcxTabSheet
      TabVisible = True
      inherited grdDocRel: TssDBGrid
        Hint = 'NUM'
        Filter.Criteria = {00000000}
        inherited colDRSummAll: TdxDBGridColumn
          Visible = False
        end
      end
    end
  end
  inherited ActionList: TActionList
    OnUpdate = ActionListUpdate
    object aPosProps: TAction
      Caption = 'aColProps'
      ImageIndex = 4
      OnExecute = aPosPropsExecute
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
        Name = 'fromdate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'todate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'in_checked'
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
      end>
    ProviderName = 'pWBRest_List'
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
    object cdsMainCURRNAME: TStringField
      FieldName = 'CURRNAME'
      Required = True
      Size = 3
    end
    object cdsMainCURRRATE: TFloatField
      FieldName = 'CURRRATE'
      Required = True
    end
    object cdsMainnumex: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'numex'
    end
    object cdsMainPERSONNAME: TStringField
      FieldName = 'PERSONNAME'
      Size = 64
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
    ProviderName = 'pWaybillDet_GetRest'
    object cdsDetailPRODUCER: TStringField [16]
      FieldName = 'PRODUCER'
      Size = 255
    end
    object cdsDetailGTD: TStringField [17]
      FieldName = 'GTD'
      Size = 64
    end
    object cdsDetailCERTNUM: TStringField [18]
      FieldName = 'CERTNUM'
      Size = 64
    end
    object cdsDetailCERTDATE: TDateTimeField [19]
      FieldName = 'CERTDATE'
    end
    object cdsDetailARCHIVED: TIntegerField [20]
      FieldName = 'ARCHIVED'
    end
    object cdsDetailGRPID: TIntegerField [21]
      FieldName = 'GRPID'
    end
    object cdsDetailsn: TStringField
      FieldName = 'sn'
      Size = 64
    end
  end
  inherited pmDet: TTBPopupMenu
    object TBItem9: TTBItem [5]
      Action = aFindAtWH
    end
    object TBSeparatorItem5: TTBSeparatorItem
    end
    object TBItem8: TTBItem
      Action = aPosProps
    end
  end
end
