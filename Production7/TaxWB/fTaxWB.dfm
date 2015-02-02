inherited fmTaxWB: TfmTaxWB
  Width = 891
  inherited Splitter1: TSplitter
    Width = 891
  end
  inherited panClient: TPanel
    Width = 891
    inherited ssBevel9: TssBevel
      Width = 891
    end
    inherited ssBevel8: TssBevel
      Left = 890
    end
    inherited ssBevel12: TssBevel
      Width = 891
    end
    inherited pcMainList: TcxPageControl
      Width = 889
      inherited tsMainList: TcxTabSheet
        inherited bvlMainListTop: TssBevel
          Width = 889
        end
        inherited grdMain: TssDBGrid
          Width = 889
          KeyField = 'twbid'
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
          object colNumEx: TdxDBGridColumn
            Visible = False
            BandIndex = 0
            RowIndex = 0
            FieldName = 'NUM'
          end
        end
        inherited panFooter: TPanel
          Width = 889
          inherited ssBevel1: TssBevel
            Width = 889
          end
        end
      end
    end
    inherited panFilter: TPanel
      Width = 891
      inherited bvlTop: TssBevel
        Width = 891
      end
      inherited bvlRight: TssBevel
        Left = 890
      end
      inherited lStatus: TLabel
        Left = 1637
      end
      inherited btnKagent: TssSpeedButton
        Left = 1153
      end
      inherited cbChecked: TcxImageComboBox
        Left = 1677
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
          '<>')
      end
    end
  end
  inherited pcMain: TcxPageControl
    Width = 891
    inherited tsPositions: TcxTabSheet
      inherited ssBevel15: TssBevel
        Width = 891
      end
      inherited ssBevel16: TssBevel
        Width = 891
      end
      inherited ssBevel17: TssBevel
        Left = 890
      end
      inherited grdDet: TssDBGrid
        Width = 889
        Hint = 'PRICE'
        Filter.Criteria = {00000000}
        OnGetOptionsTitle = grdDetGetOptionsTitle
        inherited colWHouseName: TdxDBGridColumn
          Visible = False
        end
        inherited colPrice: TdxDBGridColumn
          FieldName = 'PRICE'
        end
        inherited colPriceInCurr: TdxDBGridColumn
          Tag = 0
        end
        inherited colSummDef: TdxDBGridColumn
          FieldName = 'summ'
        end
        inherited colSummCurr: TdxDBGridColumn
          Tag = 0
          Visible = False
        end
        inherited colRate: TdxDBGridColumn
          Tag = 0
        end
      end
      inherited PanDetFooter: TPanel
        Width = 891
        inherited ssBevel4: TssBevel
          Width = 891
        end
      end
    end
    inherited tsInfo: TcxTabSheet
      inherited ssBevel19: TssBevel
        Width = 891
      end
      inherited ssBevel21: TssBevel
        Width = 891
      end
      inherited ssBevel22: TssBevel
        Left = 890
      end
      inherited inspMain: TdxInspector
        Width = 889
        DividerPos = 306
        Data = {
          590100000800000008000000000000000700000069724E6F7465730800000000
          0000000500000069724E756D08000000080000000800000069724B4167656E74
          08000000000000000C00000069724B4146756C6C4E616D650800000000000000
          0A00000069724B4141647265737308000000000000000900000069724B415068
          6F6E650800000000000000050000006972466178080000000000000007000000
          6972456D61696C08000000000000000500000069725757570800000000000000
          0700000069724B41494E4E08000000000000000B00000069724B41436572746E
          756D080000000000000006000000697243757272080000000000000008000000
          6972526561736F6E0800000000000000060000006972466F726D080000000000
          00000B000000697257686F437265617465080000000000000008000000697253
          74617475730100000008000000000000000800000069724B4167656E74}
        inherited irPerson: TdxInspectorTextRow
          Visible = False
        end
        object irKAINN: TdxInspectorTextRow
          Caption = 'INN'
        end
        object irKACertnum: TdxInspectorTextRow
          Caption = 'Cert'
        end
        object irForm: TdxInspectorTextRow
          Caption = 'Form'
        end
        object irWhoCreate: TdxInspectorTextRow
          Caption = 'irWhoCreate'
        end
      end
    end
    inherited tsDocRel: TcxTabSheet
      TabVisible = True
      inherited grdDocRel: TssDBGrid
        Filter.Criteria = {00000000}
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
        DataType = ftString
        Name = 'WTYPE'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'fromdate'
        ParamType = ptUnknown
        Value = '1.1.2000'
      end
      item
        DataType = ftString
        Name = 'todate'
        ParamType = ptUnknown
        Value = '1.1.2005'
      end>
    ProviderName = 'pTaxWB_List'
    OnCalcFields = cdsMainCalcFields
    Macros = <
      item
        DataType = ftString
        Name = 'm'
        ParamType = ptUnknown
      end>
    object cdsMainTWBID: TIntegerField
      FieldName = 'TWBID'
      Required = True
    end
    object cdsMainKAID: TIntegerField
      FieldName = 'KAID'
      Required = True
    end
    object cdsMainONDATE: TDateTimeField
      FieldName = 'ONDATE'
      Required = True
    end
    object cdsMainADDCHARGES: TFloatField
      FieldName = 'ADDCHARGES'
    end
    object cdsMainDISCOUNT: TFloatField
      FieldName = 'DISCOUNT'
    end
    object cdsMainDEFNUM: TIntegerField
      FieldName = 'DEFNUM'
      Required = True
    end
    object cdsMainDELETED: TIntegerField
      FieldName = 'DELETED'
      Required = True
    end
    object cdsMainCHECKED: TIntegerField
      FieldName = 'CHECKED'
      Required = True
    end
    object cdsMainSUMMALL: TFloatField
      FieldName = 'SUMMALL'
      Required = True
    end
    object cdsMainCONDITION: TStringField
      FieldName = 'CONDITION'
      Required = True
      Size = 255
    end
    object cdsMainFORM: TStringField
      FieldName = 'FORM'
      Size = 255
    end
    object cdsMainPERSONID: TIntegerField
      FieldName = 'PERSONID'
    end
    object cdsMainNDS: TFloatField
      FieldName = 'NDS'
      Required = True
    end
    object cdsMainNUM: TStringField
      FieldName = 'NUM'
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
    object cdsMainKAINN: TStringField
      FieldName = 'KAINN'
      Size = 64
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
    object cdsMainKACERTNUM: TStringField
      FieldName = 'KACERTNUM'
      Size = 64
    end
    object cdsMainKATYPE: TIntegerField
      FieldName = 'KATYPE'
      Required = True
    end
    object cdsMainKAPHONE: TStringField
      FieldName = 'KAPHONE'
      Size = 64
    end
    object cdsMainKANDSPAYER: TIntegerField
      FieldName = 'KANDSPAYER'
      Required = True
    end
    object cdsMainKAADDRESS: TStringField
      FieldName = 'KAADDRESS'
      Size = 255
    end
    object cdsMainKACITY: TStringField
      FieldName = 'KACITY'
      Size = 32
    end
    object cdsMainKADISTRICT: TStringField
      FieldName = 'KADISTRICT'
      Size = 32
    end
    object cdsMainKACOUNTRY: TStringField
      FieldName = 'KACOUNTRY'
      Size = 32
    end
    object cdsMainKAPOSTINDEX: TStringField
      FieldName = 'KAPOSTINDEX'
      Size = 16
    end
    object cdsMainPERSONNAME: TStringField
      FieldName = 'PERSONNAME'
      Size = 64
    end
    object cdsMainIMGINDEX: TIntegerField
      FieldName = 'IMGINDEX'
      Required = True
    end
    object cdsMainnumex: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'numex'
    end
    object cdsMaindocid: TIntegerField
      FieldName = 'docid'
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
    Params = <
      item
        DataType = ftUnknown
        Name = 'twbid'
        ParamType = ptUnknown
      end>
    ProviderName = 'pTaxWBDet_Get1'
    object cdsDetailsumm: TFloatField
      FieldKind = fkCalculated
      FieldName = 'summ'
      Calculated = True
    end
  end
  inherited pmDet: TTBPopupMenu
    Left = 28
    Top = 149
  end
  inherited pmDocRel: TTBPopupMenu
    Left = 56
    Top = 149
  end
end
