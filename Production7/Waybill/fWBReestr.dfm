inherited fmWBReestr: TfmWBReestr
  Width = 859
  Height = 344
  inherited Splitter1: TSplitter
    Top = 150
    Width = 859
    Visible = False
  end
  inherited panClient: TPanel
    Width = 859
    Height = 150
    inherited ssBevel3: TssBevel
      Height = 118
    end
    inherited ssBevel9: TssBevel
      Width = 859
    end
    inherited ssBevel8: TssBevel
      Left = 858
      Height = 118
    end
    inherited ssBevel12: TssBevel
      Top = 149
      Width = 859
    end
    inherited pcMainList: TcxPageControl
      Width = 857
      Height = 118
      inherited tsMainList: TcxTabSheet
        inherited bvlMainListTop: TssBevel
          Width = 857
        end
        inherited grdMain: TssDBGrid
          Width = 857
          Height = 87
          Filter.Criteria = {00000000}
          OnGetOptionsTitle = grdMainGetOptionsTitle
          inherited colImg: TdxDBGridImageColumn
            FieldName = 'wtype'
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
              '206')
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
              '1'
              ''
              ''
              ''
              ''
              '-1'
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              '2'
              ''
              ''
              ''
              ''
              '-6'
              '6'
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              '16'
              '-16')
          end
          inherited colName: TdxDBGridColumn
            Width = 172
          end
          inherited colSummPay: TdxDBGridColumn
            Width = 63
          end
          inherited colDocSaldo: TdxDBGridColumn
            Width = 63
            FieldName = 'docsaldo'
          end
          inherited colNotes: TdxDBGridColumn
            Width = 98
          end
        end
        inherited panFooter: TPanel
          Top = 88
          Width = 857
          inherited ssBevel1: TssBevel
            Width = 857
          end
        end
      end
    end
    inherited panFilter: TPanel
      Width = 859
      inherited bvlTop: TssBevel
        Width = 859
      end
      inherited bvlRight: TssBevel
        Left = 858
      end
      inherited lStatus: TLabel
        Left = 1079
      end
      inherited cbChecked: TcxImageComboBox
        Left = 1079
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
    Top = 153
    Width = 859
    Height = 191
    Visible = False
    inherited tsPositions: TcxTabSheet
      inherited ssBevel14: TssBevel
        Height = 135
      end
      inherited ssBevel15: TssBevel
        Width = 859
      end
      inherited ssBevel16: TssBevel
        Top = 136
        Width = 859
      end
      inherited ssBevel17: TssBevel
        Left = 858
        Height = 135
      end
      inherited grdDet: TssDBGrid
        Width = 857
        Height = 135
        Filter.Criteria = {00000000}
      end
      inherited PanDetFooter: TPanel
        Top = 137
        Width = 859
        inherited ssBevel4: TssBevel
          Width = 859
        end
      end
    end
    inherited tsInfo: TcxTabSheet
      inherited ssBevel10: TssBevel
        Height = 165
      end
      inherited ssBevel19: TssBevel
        Width = 859
      end
      inherited ssBevel21: TssBevel
        Top = 166
        Width = 859
      end
      inherited ssBevel22: TssBevel
        Left = 858
        Height = 165
      end
      inherited inspMain: TdxInspector
        Width = 857
        Height = 165
        DividerPos = 295
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
      inherited grdDocRel: TssDBGrid
        Height = 100
        Filter.Criteria = {00000000}
      end
    end
  end
  inherited pmMain: TTBPopupMenu
    inherited TBItem1: TTBItem
      Visible = False
    end
    inherited TBItem2: TTBItem
      Visible = False
    end
    inherited TBSeparatorItem1: TTBSeparatorItem
      Visible = False
    end
    object TBItem7: TTBItem [4]
      Action = aPrint
    end
    inherited TBItem6: TTBItem
      Visible = False
    end
    inherited TBSeparatorItem3: TTBSeparatorItem
      Visible = False
    end
    inherited TBItem3: TTBItem
      Visible = False
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
      end>
    ProviderName = 'pWaybill_Reestr'
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
    object cdsMainSUMMPAY: TFloatField
      FieldName = 'SUMMPAY'
    end
    object cdsMainNOTES: TStringField
      FieldName = 'NOTES'
      Size = 255
    end
    object cdsMainKANAME: TStringField
      FieldName = 'KANAME'
      Required = True
      Size = 64
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
  end
end
