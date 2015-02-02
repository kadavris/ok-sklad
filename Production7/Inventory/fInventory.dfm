inherited fmInventory: TfmInventory
  Width = 779
  Height = 348
  inherited Splitter1: TSplitter
    Width = 779
  end
  inherited panClient: TPanel
    Width = 779
    inherited ssBevel9: TssBevel
      Width = 779
    end
    inherited ssBevel8: TssBevel
      Left = 778
    end
    inherited ssBevel12: TssBevel
      Width = 779
    end
    inherited pcMainList: TcxPageControl
      Width = 777
      inherited tsMainList: TcxTabSheet
        inherited bvlMainListTop: TssBevel
          Width = 777
        end
        inherited grdMain: TssDBGrid
          Width = 777
          Hint = 'WHNAME'
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
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
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
          object colWBRest: TdxDBGridImageColumn [2]
            Alignment = taRightJustify
            MinWidth = 16
            Sizing = False
            Width = 25
            BandIndex = 0
            RowIndex = 0
            FieldName = 'WBILLID'
            OnGetText = colWBRestGetText
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
              '158')
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
              '5')
          end
          object colWriteOff: TdxDBGridImageColumn [3]
            Alignment = taLeftJustify
            MinWidth = 16
            Sizing = False
            Width = 25
            BandIndex = 0
            RowIndex = 0
            OnGetText = colWriteOffGetText
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
              '158')
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
              '-5')
          end
          inherited colNum: TdxDBGridColumn
            FieldName = 'numex'
            OnGetText = colNumGetText
          end
          object colNumEx: TdxDBGridColumn [5]
            Visible = False
            BandIndex = 0
            RowIndex = 0
            FieldName = 'NUM'
          end
          inherited colName: TdxDBGridColumn
            FieldName = 'WHNAME'
          end
          inherited colSummAll: TdxDBGridColumn
            Tag = 0
            Visible = False
          end
          inherited colSummPay: TdxDBGridColumn
            Tag = 0
          end
          inherited colDocSaldo: TdxDBGridColumn
            Tag = 0
          end
        end
        inherited panFooter: TPanel
          Width = 777
          inherited ssBevel1: TssBevel
            Width = 777
          end
          inherited lDocsSumm: TLabel
            Visible = False
          end
          inherited stTotal: TssBevel
            Visible = False
          end
        end
      end
    end
    inherited panFilter: TPanel
      Width = 779
      inherited bvlTop: TssBevel
        Width = 779
      end
      inherited bvlRight: TssBevel
        Left = 778
      end
      inherited lStatus: TLabel
        Left = 1214
      end
      inherited lKAgent: TLabel
        Alignment = taLeftJustify
      end
      inherited btnKagent: TssSpeedButton
        Left = 1014
        ImageIndex = 26
      end
      inherited cbChecked: TcxImageComboBox
        Left = 1255
      end
      inherited lcbKAgent: TssDBLookupCombo
        Width = 161
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
          '<>')
        KeyField = 'wid'
      end
    end
  end
  inherited pcMain: TcxPageControl
    Width = 779
    Height = 184
    inherited tsPositions: TcxTabSheet
      inherited ssBevel14: TssBevel
        Height = 128
      end
      inherited ssBevel15: TssBevel
        Width = 779
      end
      inherited ssBevel16: TssBevel
        Top = 129
        Width = 779
      end
      inherited ssBevel17: TssBevel
        Left = 778
        Height = 128
      end
      inherited grdDet: TssDBGrid
        Width = 777
        Height = 128
        Hint = 'PRICE'
        Filter.Criteria = {00000000}
        OnGetOptionsTitle = grdDetGetOptionsTitle
        inherited colMeasureName: TdxDBGridColumn [4]
        end
        inherited colWHouseName: TdxDBGridColumn [5]
          Visible = False
        end
        object colRealAmount: TdxDBGridColumn [6]
          Tag = 1
          Alignment = taRightJustify
          HeaderAlignment = taCenter
          Sizing = False
          Width = 60
          BandIndex = 0
          RowIndex = 0
          FieldName = 'Discount'
          OnGetText = colRealAmountGetText
        end
        object colRealPrice: TdxDBGridColumn [7]
          Tag = 1
          Alignment = taRightJustify
          HeaderAlignment = taCenter
          Sizing = False
          Width = 70
          BandIndex = 0
          RowIndex = 0
          FieldName = 'nds'
          OnGetText = colPriceGetText
        end
        object colDiff: TdxDBGridColumn [8]
          Tag = 1
          Alignment = taRightJustify
          HeaderAlignment = taCenter
          Sizing = False
          Width = 60
          BandIndex = 0
          RowIndex = 0
          OnGetText = colDiffGetText
        end
        object colDiffSum: TdxDBGridColumn [9]
          Tag = 1
          Alignment = taRightJustify
          HeaderAlignment = taCenter
          Sizing = False
          Width = 80
          BandIndex = 0
          RowIndex = 0
          OnGetText = colDiffSumGetText
        end
        inherited colAmount: TdxDBGridColumn [10]
          MinWidth = 60
          Width = 60
        end
        inherited colPriceWONDS: TdxDBGridColumn
          Tag = 0
        end
        inherited colPrice: TdxDBGridColumn
          MinWidth = 70
          Width = 70
          FieldName = 'PRICE'
        end
        inherited colPriceInCurr: TdxDBGridColumn
          Tag = 0
        end
        inherited colSummDefWONDS: TdxDBGridColumn
          Tag = 0
        end
        inherited colNDS: TdxDBGridColumn
          Tag = 0
        end
        inherited colSummDef: TdxDBGridColumn
          Tag = 0
          MinWidth = 70
          Visible = False
          Width = 70
        end
        inherited colSummCurr: TdxDBGridColumn
          Tag = 0
          MinWidth = 70
          Visible = False
          Width = 70
        end
        inherited colRate: TdxDBGridColumn
          Tag = 0
        end
      end
      inherited PanDetFooter: TPanel
        Top = 130
        Width = 779
        inherited ssBevel4: TssBevel
          Width = 779
        end
        inherited lTot: TLabel
          Left = 609
        end
        inherited lTotNDSOut: TLabel
          Left = 164
          Visible = False
        end
        inherited lTotNDS: TLabel
          Left = 409
        end
        inherited stSummDef: TssBevel
          Left = 646
          Width = 115
        end
        inherited stSummDefNDS: TssBevel
          Left = 445
          Width = 116
        end
        inherited stSummDefNoNDS: TssBevel
          Left = 285
          Visible = False
        end
      end
    end
    inherited tsInfo: TcxTabSheet
      inherited ssBevel10: TssBevel
        Height = 158
      end
      inherited ssBevel19: TssBevel
        Width = 779
      end
      inherited ssBevel21: TssBevel
        Top = 159
        Width = 779
      end
      inherited ssBevel22: TssBevel
        Left = 778
        Height = 158
      end
      inherited inspMain: TdxInspector
        Width = 777
        Height = 158
        DividerPos = 269
        Data = {
          D00000000600000008000000000000000500000069724E756D08000000000000
          00080000006972506572736F6E08000000040000000800000069724B4167656E
          7408000000000000000C00000069724B4146756C6C4E616D6508000000000000
          000A00000069724B4141647265737308000000000000000900000069724B4150
          686F6E6508000000000000000500000069724661780800000000000000080000
          006972526561736F6E0800000000000000080000006972537461747573080000
          00000000000700000069724E6F74657300000000}
        inherited irCurr: TdxInspectorTextRow
          Visible = False
        end
        inherited irEmail: TdxInspectorTextHyperLinkRow
          Visible = False
        end
        inherited irWWW: TdxInspectorTextHyperLinkRow
          Visible = False
        end
      end
    end
    inherited tsDocRel: TcxTabSheet
      TabVisible = True
      inherited grdDocRel: TssDBGrid
        Width = 576
        Height = 249
        Filter.Criteria = {00000000}
      end
    end
  end
  inherited ActionList: TActionList
    object aMakeWriteOff: TAction [19]
      Category = 'All'
      Caption = 'aMakeWriteOff'
      ImageIndex = 125
      OnExecute = aMakeWriteOffExecute
    end
    object aMakeWBRest: TAction [20]
      Category = 'All'
      Caption = 'aMakeWBRest'
      ImageIndex = 133
      OnExecute = aMakeWBRestExecute
    end
  end
  inherited pmMain: TTBPopupMenu
    object TBItem7: TTBItem [5]
      Action = aPrint
    end
    object TBSeparatorItem4: TTBSeparatorItem [6]
    end
    object TBItem11: TTBItem [7]
      Action = aMakeWBRest
    end
    object TBItem12: TTBItem [8]
      Action = aMakeWriteOff
    end
    object TBSeparatorItem5: TTBSeparatorItem [9]
    end
  end
  inherited cdsMain: TssClientDataSet
    Params = <
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
        Value = '1.1.2000'
      end>
    ProviderName = 'pInv_List'
    OnCalcFields = cdsMainCalcFields
    Macros = <
      item
        DataType = ftString
        Name = 'm'
        ParamType = ptUnknown
      end>
    object cdsMainnumex: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'numex'
    end
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
    Left = 152
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
        DataType = ftString
        Name = 'WBILLID'
        ParamType = ptInput
        Value = '0'
      end>
    Left = 154
    object cdsDetailDISCOUNT: TFloatField [14]
      FieldName = 'DISCOUNT'
    end
    object cdsDetailGRPID: TIntegerField
      FieldName = 'GRPID'
    end
  end
  inherited srcDetail: TDataSource
    Left = 139
  end
  inherited cdsRel: TssClientDataSet
    Left = 40
    Top = 192
  end
  inherited srcRel: TDataSource
    Left = 68
    Top = 192
  end
end
