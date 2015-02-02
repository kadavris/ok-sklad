inherited fmWaybillMov: TfmWaybillMov
  Width = 832
  Height = 305
  inherited Splitter1: TSplitter
    Width = 832
  end
  inherited panClient: TPanel
    Width = 832
    inherited ssBevel9: TssBevel
      Width = 832
    end
    inherited ssBevel8: TssBevel
      Left = 831
    end
    inherited ssBevel12: TssBevel
      Width = 832
    end
    inherited pcMainList: TcxPageControl
      Width = 830
      inherited tsMainList: TcxTabSheet
        inherited bvlMainListTop: TssBevel
          Width = 830
        end
        inherited grdMain: TssDBGrid
          Width = 830
          Hint = 'ONDATE'
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
              '1')
          end
          inherited colNum: TdxDBGridColumn
            FieldName = 'numex'
            OnGetText = colNumGetText
          end
          inherited colName: TdxDBGridColumn
            FieldName = 'whout'
          end
          object colwhIn: TdxDBGridColumn [5]
            HeaderAlignment = taCenter
            BandIndex = 0
            RowIndex = 0
            FieldName = 'whin'
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
          Width = 830
          inherited ssBevel1: TssBevel
            Width = 830
          end
        end
      end
    end
    inherited panFilter: TPanel
      Width = 832
      inherited bvlTop: TssBevel
        Width = 832
      end
      inherited bvlRight: TssBevel
        Left = 831
      end
      inherited lStatus: TLabel
        Left = 2032
      end
      inherited lKAgent: TLabel
        Visible = False
      end
      inherited btnKagent: TssSpeedButton
        Left = 1599
        Visible = False
      end
      inherited cbChecked: TcxImageComboBox
        Left = 2072
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
          '<>')
        Visible = False
      end
    end
  end
  inherited pcMain: TcxPageControl
    Width = 832
    Height = 141
    inherited tsPositions: TcxTabSheet
      inherited ssBevel14: TssBevel
        Height = 85
      end
      inherited ssBevel15: TssBevel
        Width = 832
      end
      inherited ssBevel16: TssBevel
        Top = 116
        Width = 832
      end
      inherited ssBevel17: TssBevel
        Left = 831
        Height = 85
      end
      inherited grdDet: TssDBGrid
        Width = 830
        Height = 85
        Hint = 'MATNAME'
        Filter.Criteria = {00000000}
        OnGetOptionsTitle = grdDetGetOptionsTitle
        object colRsv: TdxDBGridImageColumn [1]
          Alignment = taRightJustify
          HeaderAlignment = taCenter
          MinWidth = 16
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
            '187'
            '188'
            '189'
            '190'
            '191'
            '192'
            '193'
            '194'
            '195'
            '196'
            '197'
            '198'
            '199'
            '200'
            '201'
            '202'
            '203'
            '204'
            '205'
            '206'
            '207'
            '208'
            '209')
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
        inherited colWHouseName: TdxDBGridColumn
          Visible = False
        end
        inherited colPriceWONDS: TdxDBGridColumn
          FieldName = 'pricewonds'
          OnGetText = colPriceWONDSGetText
        end
        inherited colPrice: TdxDBGridColumn
          Visible = False
          FieldName = 'PRICE'
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
          Width = 80
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
        Top = 86
        Width = 832
        inherited ssBevel4: TssBevel
          Width = 832
        end
      end
    end
    inherited tsInfo: TcxTabSheet
      inherited ssBevel10: TssBevel
        Height = 115
      end
      inherited ssBevel19: TssBevel
        Width = 832
      end
      inherited ssBevel21: TssBevel
        Top = 116
        Width = 832
      end
      inherited ssBevel22: TssBevel
        Left = 831
        Height = 115
      end
      inherited inspMain: TdxInspector
        Width = 830
        Height = 115
        DividerPos = 285
        Data = {
          FF0000000800000008000000000000000500000069724E756D08000000010000
          000800000069724B4167656E7408000000000000000C00000069724B4146756C
          6C4E616D6508000000010000000B000000697257486F757365496E3108000000
          000000000B0000006972506572736F6E496E3108000000000000000600000069
          72437572720800000000000000080000006972506572736F6E08000000000000
          00080000006972526561736F6E08000000000000000800000069725374617475
          7308000000000000000700000069724E6F746573020000000800000000000000
          0800000069724B4167656E7408000000000000000B000000697257486F757365
          496E31}
        inherited irKAPhone: TdxInspectorTextRow
          Visible = False
        end
        inherited irKAFullName: TdxInspectorTextMemoRow
          Caption = #1054#1090#1087
        end
        inherited irKAAdress: TdxInspectorTextMemoRow
          Visible = False
        end
        inherited irCurr: TdxInspectorTextRow
          Caption = #1057#1091#1084
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
          Caption = #1057#1082#1083'. '#1086#1090#1087#1088
          Buttons = <
            item
              Default = True
              Kind = bkGlyph
              Visible = False
            end>
        end
        object irWHouseIn1: TdxInspectorTextRow
          Caption = #1057#1082#1083'. '#1087#1086#1083
          ReadOnly = True
        end
        object irPersonIn1: TdxInspectorTextRow
          Caption = #1055#1088#1080#1085
          ReadOnly = True
        end
      end
    end
    inherited tsDocRel: TcxTabSheet
      inherited grdDocRel: TssDBGrid
        Hint = 'NUM'
        Filter.Criteria = {00000000}
      end
    end
  end
  inherited ActionList: TActionList
    OnUpdate = ActionListUpdate
    object aAddTaxWB: TAction
      Category = 'All'
      Caption = 'aAddTaxWB'
    end
    object aWBMovPrint: TAction
      Category = 'WBMov'
      Caption = 'aWBMovPrint'
      OnExecute = aWBMovPrintExecute
    end
    object aWBMovPrintW: TAction
      Category = 'WBMov'
      Caption = 'aWBMovPrintW'
      OnExecute = aWBMovPrintWExecute
    end
    object aWBMovPrintPT: TAction
      Category = 'WBMov'
      Caption = 'aWBMovPrintPT'
      OnExecute = aWBMovPrintPTExecute
    end
  end
  inherited pmMain: TTBPopupMenu
    object TBItem9: TTBItem [1]
      Action = aPatternInsert
      Visible = False
    end
    object tbPrint: TTBSubmenuItem [6]
      Caption = 'aPrint'
      ImageIndex = 9
      object TBItem7: TTBItem
        Action = aWBMovPrint
      end
      object TBItem12: TTBItem
        Action = aWBMovPrintW
      end
      object TBItem13: TTBItem
        Action = aWBMovPrintPT
      end
    end
    object TBSeparatorItem4: TTBSeparatorItem [7]
    end
    object TBItem11: TTBItem [9]
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
    ProviderName = 'pWayBillMov_List'
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
    object cdsMainSOURCEWID: TIntegerField
      FieldName = 'SOURCEWID'
      Required = True
    end
    object cdsMainWHOUT: TStringField
      FieldName = 'WHOUT'
      Required = True
      Size = 64
    end
    object cdsMainDESTWID: TIntegerField
      FieldName = 'DESTWID'
    end
    object cdsMainWHIN: TStringField
      FieldName = 'WHIN'
      Required = True
      Size = 64
    end
    object cdsMainPERSONIN: TStringField
      FieldName = 'PERSONIN'
      Size = 64
    end
    object cdsMainPERSONOUT: TStringField
      FieldName = 'PERSONOUT'
      Size = 64
    end
    object cdsMainMIDDLEPERSON: TStringField
      FieldName = 'MIDDLEPERSON'
      Size = 64
    end
    object cdsMainnumex: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'numex'
    end
    object cdsMainnotes: TStringField
      FieldName = 'notes'
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
    object cdsDetailpricetxt: TStringField
      FieldKind = fkCalculated
      FieldName = 'pricetxt'
      Calculated = True
    end
    object cdsDetailcurrname: TStringField
      FieldName = 'currname'
    end
    object cdsDetailGTD: TStringField
      FieldKind = fkCalculated
      FieldName = 'GTD'
      Size = 64
      Calculated = True
    end
    object cdsDetailPRODUCER: TStringField
      FieldName = 'PRODUCER'
      Size = 255
    end
    object cdsDetailCERTNUM: TStringField
      FieldKind = fkCalculated
      FieldName = 'CERTNUM'
      Size = 64
      Calculated = True
    end
    object cdsDetailCERTDATE: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'CERTDATE'
      Calculated = True
    end
    object cdsDetailGRPID: TIntegerField
      FieldName = 'GRPID'
    end
    object cdsDetailrsv: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'rsv'
      Calculated = True
    end
    object cdsDetailsn: TStringField
      FieldName = 'sn'
      Size = 128
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
