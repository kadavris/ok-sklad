inherited fmInvoices: TfmInvoices
  OnResize = nil
  inherited panClient: TPanel
    inherited pcMainList: TcxPageControl
      inherited tsMainList: TcxTabSheet
        inherited grdMain: TssDBGrid
          KeyField = 'Wbillid'
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
              '182')
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
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
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
          inherited colChecked: TdxDBGridImageColumn
            Visible = False
          end
          inherited colNum: TdxDBGridColumn
            FieldName = 'numex'
            OnGetText = colNumGetText
          end
          inherited colSummPay: TdxDBGridColumn
            Tag = 0
            Width = 53
          end
          inherited colDocSaldo: TdxDBGridColumn
            Tag = 0
            Width = 68
          end
          inherited colCurrName: TdxDBGridColumn
            Width = 68
            FieldName = ''
          end
          inherited colID: TdxDBGridColumn
            Width = 68
          end
          object colNumEx: TdxDBGridColumn
            Visible = False
            Width = 132
            BandIndex = 0
            RowIndex = 0
            FieldName = 'NUM'
          end
        end
        inherited panFooter: TPanel
          inherited lDocsCount: TLabel
            Left = 187
          end
          inherited lDocsSumm: TLabel
            Left = 387
          end
          inherited stCount: TssBevel
            Left = 287
          end
          inherited stTotal: TssBevel
            Left = 444
          end
        end
      end
    end
    inherited panFilter: TPanel
      inherited lStatus: TLabel
        Left = 1214
        Visible = False
      end
      inherited btnKagent: TssSpeedButton
        Left = 1118
      end
      inherited cbChecked: TcxImageComboBox
        Left = 1255
        Enabled = False
        Visible = False
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
          '<>')
      end
    end
  end
  inherited pcMain: TcxPageControl
    inherited tsPositions: TcxTabSheet
      inherited grdDet: TssDBGrid
        Hint = 'pricewonds'
        Filter.Criteria = {00000000}
        OptionsBehavior = [edgoCellMultiSelect, edgoDragScroll, edgoEditing, edgoExtMultiSelect, edgoImmediateEditor, edgoMultiSelect, edgoStoreToRegistry, edgoTabThrough, edgoVertThrough]
        OnGetOptionsTitle = grdDetGetOptionsTitle
        object colType: TdxDBGridImageColumn [1]
          Alignment = taRightJustify
          HeaderAlignment = taCenter
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
            '182')
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
        inherited colWHouseName: TdxDBGridColumn
          Visible = False
        end
        inherited colMeasureName: TdxDBGridColumn [6]
        end
        inherited colAmount: TdxDBGridColumn [7]
        end
        inherited colPriceWONDS: TdxDBGridColumn
          Visible = True
          FieldName = 'pricewonds'
        end
        inherited colPrice: TdxDBGridColumn
          Visible = False
          FieldName = 'PRICE'
        end
        inherited colPriceInCurr: TdxDBGridColumn
          Tag = 0
        end
        inherited colSummDefWONDS: TdxDBGridColumn
          Visible = True
        end
        inherited colNDS: TdxDBGridColumn
          Visible = True
        end
        inherited colDetNDS: TdxDBGridColumn
          Visible = True
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
        object colCountry: TdxDBGridColumn [19]
          Tag = 1
          HeaderAlignment = taCenter
          Width = 80
          BandIndex = 0
          RowIndex = 0
          FieldName = 'COUNTRY'
        end
        inherited colGTD: TdxDBGridColumn
          Tag = 1
          Visible = True
          FieldName = 'GTD'
        end
      end
      inherited PanDetFooter: TPanel
        inherited lTot: TLabel
          Left = 399
        end
        inherited lTotNDSOut: TLabel
          Left = 230
        end
        inherited lTotNDS: TLabel
          Left = 235
        end
        inherited stSummDef: TssBevel
          Left = 401
        end
        inherited stSummDefNDS: TssBevel
          Left = 303
        end
        inherited stSummDefNoNDS: TssBevel
          Left = 243
        end
      end
    end
    inherited tsInfo: TcxTabSheet
      inherited inspMain: TdxInspector
        Data = {
          370200000600000008000000000000000500000069724E756D08000000000000
          00060000006972437572720800000004000000050000006972456E7408000000
          000000000D0000006972456E7446756C6C4E616D650800000000000000090000
          006972456E74416464720800000000000000080000006972456E74494E4E0800
          000000000000080000006972456E744B50500800000004000000090000006972
          53686970456E74080000000000000011000000697253686970456E7446756C6C
          4E616D6508000000000000000D000000697253686970456E7441646472080000
          00000000000C000000697253686970456E74494E4E08000000000000000C0000
          00697253686970456E744B50500800000004000000080000006972536869704B
          410800000000000000100000006972536869704B4146756C6C4E616D65080000
          00000000000C0000006972536869704B414164647208000000000000000B0000
          006972536869704B41494E4E08000000000000000B0000006972536869704B41
          4B505008000000040000000800000069724B4167656E7408000000000000000C
          00000069724B4146756C6C4E616D6508000000000000000A00000069724B4141
          647265737308000000000000000700000069724B41494E4E0800000000000000
          0500000069724B5050040000000800000000000000050000006972456E740800
          00000000000009000000697253686970456E7408000000000000000800000069
          72536869704B4108000000000000000800000069724B4167656E74}
        inherited irKAPhone: TdxInspectorTextRow
          Visible = False
        end
        inherited irReason: TdxInspectorTextRow
          Visible = False
        end
        inherited irPerson: TdxInspectorTextRow
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
        inherited irStatus: TdxInspectorTextRow
          Visible = False
        end
        inherited irNotes: TdxInspectorTextRow
          Visible = False
        end
        object irKAINN: TdxInspectorTextRow
          Caption = 'INN'
          ReadOnly = True
        end
        object irKACertnum: TdxInspectorTextRow
          Caption = 'Cert'
          Visible = False
        end
        object irForm: TdxInspectorTextRow
          Caption = 'Form'
          Visible = False
        end
        object irWhoCreate: TdxInspectorTextRow
          Caption = 'irWhoCreate'
          Visible = False
        end
        object irKPP: TdxInspectorTextRow
          Caption = #1050#1055#1055
          ReadOnly = True
        end
        object irEnt: TdxInspectorTextRow
          Caption = #1055#1088#1086#1076#1072#1074#1077#1094
          ReadOnly = True
        end
        object irEntFullName: TdxInspectorTextRow
          Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          ReadOnly = True
        end
        object irEntAddr: TdxInspectorTextRow
          Caption = #1040#1076#1088#1077#1089
          ReadOnly = True
        end
        object irEntINN: TdxInspectorTextRow
          Caption = #1048#1053#1053
          ReadOnly = True
        end
        object irEntKPP: TdxInspectorTextRow
          Caption = #1050#1055#1055
          ReadOnly = True
        end
        object irShipEnt: TdxInspectorTextRow
          Caption = #1043#1088#1091#1079#1086#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1100
          ReadOnly = True
        end
        object irShipEntFullName: TdxInspectorTextRow
          Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          ReadOnly = True
        end
        object irShipEntAddr: TdxInspectorTextRow
          Caption = #1040#1076#1088#1077#1089
          ReadOnly = True
        end
        object irShipEntKPP: TdxInspectorTextRow
          Caption = #1050#1055#1055
          ReadOnly = True
        end
        object irShipEntINN: TdxInspectorTextRow
          Caption = #1048#1053#1053
          ReadOnly = True
        end
        object irShipKA: TdxInspectorTextRow
          Caption = #1043#1088#1091#1079#1086#1087#1086#1083#1091#1095#1072#1090#1077#1083#1100
          ReadOnly = True
        end
        object irShipKAFullName: TdxInspectorTextRow
          Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          ReadOnly = True
        end
        object irShipKAINN: TdxInspectorTextRow
          Caption = #1048#1053#1053
          ReadOnly = True
        end
        object irShipKAAddr: TdxInspectorTextRow
          Caption = #1040#1076#1088#1077#1089
          ReadOnly = True
        end
        object irShipKAKPP: TdxInspectorTextRow
          Caption = #1050#1055#1055
          ReadOnly = True
        end
      end
    end
    inherited tsDocRel: TcxTabSheet
      TabVisible = True
      inherited grdDocRel: TssDBGrid
        Width = 565
        Height = 223
        Hint = ''
        Filter.Criteria = {00000000}
      end
    end
  end
  inherited pmMain: TTBPopupMenu
    inherited TBSeparatorItem2: TTBSeparatorItem
      Visible = False
    end
    inherited TBItem6: TTBItem
      Visible = False
    end
    inherited TBItem19: TTBItem
      Tag = 1
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
    ProviderName = 'pInvoices_List'
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
    object cdsMainDEFNUM: TIntegerField
      FieldName = 'DEFNUM'
      Required = True
    end
    object cdsMainNOTES: TStringField
      FieldName = 'NOTES'
      Size = 255
    end
    object cdsMainDOCID: TIntegerField
      FieldName = 'DOCID'
      Required = True
    end
    object cdsMainENTID: TIntegerField
      FieldName = 'ENTID'
    end
    object cdsMainKANAME: TStringField
      FieldName = 'KANAME'
      Required = True
      Size = 64
    end
    object cdsMainKAINN: TStringField
      FieldName = 'KAINN'
      Size = 64
    end
    object cdsMainKAKPP: TStringField
      FieldName = 'KAKPP'
      Size = 32
    end
    object cdsMainSHIPKAID: TIntegerField
      FieldName = 'SHIPKAID'
      Required = True
    end
    object cdsMainSHIPENTID: TIntegerField
      FieldName = 'SHIPENTID'
      Required = True
    end
    object cdsMainSHIPENTADDRID: TIntegerField
      FieldName = 'SHIPENTADDRID'
    end
    object cdsMainSHIPKAADDRID: TIntegerField
      FieldName = 'SHIPKAADDRID'
    end
    object cdsMainKAADDRID: TIntegerField
      FieldName = 'KAADDRID'
    end
    object cdsMainENTADDRID: TIntegerField
      FieldName = 'ENTADDRID'
    end
    object cdsMainENTNAME: TStringField
      FieldName = 'ENTNAME'
      Required = True
      Size = 64
    end
    object cdsMainENTINN: TStringField
      FieldName = 'ENTINN'
      Size = 64
    end
    object cdsMainENTKPP: TStringField
      FieldName = 'ENTKPP'
      Size = 32
    end
    object cdsMainSHIPKANAME: TStringField
      FieldName = 'SHIPKANAME'
      Required = True
      Size = 64
    end
    object cdsMainSHIPKAINN: TStringField
      FieldName = 'SHIPKAINN'
      Size = 64
    end
    object cdsMainSHIPKAKPP: TStringField
      FieldName = 'SHIPKAKPP'
      Size = 32
    end
    object cdsMainSHIPENTNAME: TStringField
      FieldName = 'SHIPENTNAME'
      Required = True
      Size = 64
    end
    object cdsMainSHIPENTINN: TStringField
      FieldName = 'SHIPENTINN'
      Size = 64
    end
    object cdsMainSHIPENTKPP: TStringField
      FieldName = 'SHIPENTKPP'
      Size = 32
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
        Name = 'WBILLID'
        ParamType = ptUnknown
      end>
    ProviderName = 'pWaybillDet_GetOutEx'
    ReadOnly = True
    inherited cdsDetailMATNAME: TStringField
      ReadOnly = False
    end
    object cdsDetailsumm: TFloatField
      FieldKind = fkCalculated
      FieldName = 'summ'
      Calculated = True
    end
    object cdsDetailCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Size = 128
    end
    object cdsDetailTAX: TStringField
      FieldName = 'TAX'
      Size = 255
    end
    object cdsDetailPOSTYPE: TIntegerField
      FieldName = 'POSTYPE'
    end
    object cdsDetailNORM: TFloatField
      FieldName = 'NORM'
    end
    object cdsDetailGTD: TStringField
      FieldName = 'GTD'
      Size = 64
    end
    object cdsDetailGRPID: TIntegerField
      FieldName = 'GRPID'
    end
  end
  inherited pmDet: TTBPopupMenu
    OnPopup = pmDetPopup
    Left = 292
    Top = 61
  end
  inherited pmDocRel: TTBPopupMenu
    Left = 320
    Top = 61
  end
  object kaInfo: TokKAgent
    RemoteServer = dmData.SConnection
    LoadAccounts = False
    LoadContracts = False
    LoadPersons = False
    Left = 225
    Top = 193
  end
end
