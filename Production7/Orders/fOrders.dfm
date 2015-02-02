inherited fmOrders: TfmOrders
  inherited panClient: TPanel
    inherited pcMainList: TcxPageControl
      inherited tsMainList: TcxTabSheet
        inherited grdMain: TssDBGrid
          OnDragDrop = grdMainDragDrop
          OnDragOver = grdMainDragOver
          Filter.Criteria = {00000000}
          OptionsBehavior = [edgoAutoSort, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSelect, edgoStoreToRegistry, edgoTabThrough, edgoVertThrough]
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
              '200')
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
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
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
          inherited colChecked: TdxDBGridImageColumn
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
              '203')
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
              '1'
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
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              ''
              '2')
          end
          inherited colName: TdxDBGridColumn
            Sorted = csNone
          end
          inherited colSummInCurr: TdxDBGridColumn
            Tag = 1
            FieldName = 'SUMMINCURR'
            OnGetText = colSummInCurrGetText
          end
          inherited colDocSaldo: TdxDBGridColumn
            FieldName = 'docsaldo'
          end
          object colToDate: TdxDBGridColumn
            Tag = 1
            Alignment = taCenter
            HeaderAlignment = taCenter
            Visible = False
            Width = 80
            BandIndex = 0
            RowIndex = 0
            FieldName = 'todate'
          end
          object colStatus: TdxDBGridColumn
            Tag = 1
            Alignment = taCenter
            HeaderAlignment = taCenter
            Sorted = csDown
            Width = 100
            BandIndex = 0
            RowIndex = 0
            OnCustomDrawCell = colStatusCustomDrawCell
            OnGetText = colStatusGetText
          end
          object colDocID: TdxDBGridColumn
            Visible = False
            BandIndex = 0
            RowIndex = 0
            FieldName = 'docid'
          end
        end
        inherited panFooter: TPanel
          inherited lDocsCount: TLabel
            Left = 1611
          end
          inherited lDocsSumm: TLabel
            Left = 1811
          end
          inherited stCount: TssBevel
            Left = 1711
          end
          inherited stTotal: TssBevel
            Left = 1868
          end
        end
      end
    end
    inherited panFilter: TPanel
      inherited lStatus: TLabel
        Left = 1697
      end
      inherited btnKagent: TssSpeedButton
        Left = 1833
      end
      inherited cbChecked: TcxImageComboBox
        Left = 1738
        Properties.Items = <
          item
            Description = #1074#1089#1077
            ImageIndex = 42
            Value = 0
          end
          item
            Description = #1085#1077#1087#1088#1086#1074#1077#1076#1077#1085#1085#1099#1077
            ImageIndex = 32
            Value = 1
          end
          item
            Description = #1087#1088#1086#1074#1077#1076#1105#1085#1085#1099#1077
            ImageIndex = 31
            Value = 2
          end
          item
            ImageIndex = 183
            Value = '3'
          end>
        Properties.OnChange = cbCheckedPropertiesChange
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
          '<>')
      end
    end
  end
  inherited pcMain: TcxPageControl
    OnDrawTabEx = pcMainDrawTabEx
    inherited tsPositions: TcxTabSheet
      inherited ssBevel16: TssBevel
        Top = 77
      end
      inherited grdDet: TssDBGrid
        Filter.Criteria = {00000000}
        OptionsBehavior = [edgoDragScroll, edgoMultiSelect, edgoStoreToRegistry, edgoTabThrough, edgoVertThrough]
        OnGetOptionsTitle = grdDetGetOptionsTitle
        object colPosType: TdxDBGridImageColumn [1]
          Alignment = taCenter
          HeaderAlignment = taCenter
          MinWidth = 30
          Sizing = False
          Width = 30
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
            '203')
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
        object colRsv: TdxDBGridImageColumn [2]
          Alignment = taCenter
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
            '202')
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
        inherited colPriceWONDS: TdxDBGridColumn
          FieldName = 'pricewonds'
        end
        inherited colPrice: TdxDBGridColumn
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
      end
      inherited PanDetFooter: TPanel
        Top = 47
      end
    end
    inherited tsInfo: TcxTabSheet
      inherited inspMain: TdxInspector
        DividerPos = 153
        Data = {
          060100000700000008000000000000000500000069724E756D08000000060000
          000800000069724B4167656E7408000000000000000C00000069724B4146756C
          6C4E616D6508000000000000000A00000069724B414164726573730800000000
          0000000900000069724B4150686F6E6508000000000000000500000069724661
          780800000000000000070000006972456D61696C080000000000000005000000
          6972575757080000000000000006000000697243757272080000000000000008
          0000006972506572736F6E0800000000000000080000006972546F4461746508
          0000000000000008000000697253746174757308000000000000000700000069
          724E6F74657300000000}
        inherited irReason: TdxInspectorTextRow
          Visible = False
        end
        object irToDate: TdxInspectorTextRow
          Caption = #1054#1090#1075#1088#1091#1079#1080#1090#1100' '#1076#1086
          ReadOnly = True
        end
      end
    end
    inherited tsDocRel: TcxTabSheet
      TabVisible = True
      inherited grdDocRel: TssDBGrid
        Hint = 'NUM'
        Filter.Criteria = {00000000}
      end
    end
    object tsTmpPos: TcxTabSheet
      Caption = 'tsTmpPos'
      ImageIndex = 203
      TabVisible = False
      OnShow = tsTmpPosShow
      object grdTempPos: TssDBGrid
        Left = 0
        Top = 0
        Width = 443
        Height = 89
        Hint = 'artikul'
        DrawDragFrame = False
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'posid'
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        DragMode = dmAutomatic
        ParentShowHint = False
        PopupMenu = pmTmpPos
        ShowHint = True
        TabOrder = 0
        OnDblClick = grdTempPosDblClick
        DataSource = srcTempPos
        Filter.Criteria = {00000000}
        LookAndFeel = lfUltraFlat
        OptionsBehavior = [edgoAutoSort, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSelect, edgoStoreToRegistry, edgoTabThrough, edgoVertThrough]
        OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoBandHeaderWidth, edgoHideFocusRect, edgoRowSelect, edgoUseBitmap]
        OnCustomDrawCell = grdTempPosCustomDrawCell
        OnGetNodeDragText = grdTempPosGetNodeDragText
        LangManager = dmData.Lng
        OnNeedAdjust = grdTempPosNeedAdjust
        OnGetOptionsTitle = grdTempPosGetOptionsTitle
        object colTmpImg: TdxDBGridImageColumn
          Alignment = taLeftJustify
          MinWidth = 16
          Sizing = False
          Width = 25
          BandIndex = 0
          RowIndex = 0
          OnGetText = colTmpImgGetText
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
            '203')
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
            '0')
        end
        object colTmpMatName: TdxDBGridColumn
          Tag = 1
          Alignment = taLeftJustify
          HeaderAlignment = taCenter
          Width = 85
          BandIndex = 0
          RowIndex = 0
          FieldName = 'matname'
        end
        object colTmpMatArtikul: TdxDBGridColumn
          Tag = 1
          Alignment = taLeftJustify
          HeaderAlignment = taCenter
          Sorted = csUp
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'artikul'
        end
        object colTmpBarCode: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          Width = 104
          BandIndex = 0
          RowIndex = 0
          FieldName = 'barcode'
        end
        object colTmpMsrName: TdxDBGridColumn
          Tag = 1
          Alignment = taCenter
          HeaderAlignment = taCenter
          Width = 50
          BandIndex = 0
          RowIndex = 0
          FieldName = 'msrname'
        end
        object colTmpAmount: TdxDBGridColumn
          Tag = 1
          Alignment = taRightJustify
          HeaderAlignment = taCenter
          Width = 57
          BandIndex = 0
          RowIndex = 0
          FieldName = 'amount'
        end
        object colTmpFree: TdxDBGridColumn
          Tag = 1
          Alignment = taRightJustify
          HeaderAlignment = taCenter
          Width = 54
          BandIndex = 0
          RowIndex = 0
          FieldName = 'amount'
          OnGetText = colTmpFreeGetText
        end
        object colTmpRsv: TdxDBGridColumn
          Tag = 1
          Alignment = taRightJustify
          HeaderAlignment = taCenter
          Width = 50
          BandIndex = 0
          RowIndex = 0
          FieldName = 'rsv'
        end
        object colTmpNotes: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Width = 127
          BandIndex = 0
          RowIndex = 0
          FieldName = 'notes'
        end
        object colTmpPosID: TdxDBGridColumn
          Visible = False
          Width = 31
          BandIndex = 0
          RowIndex = 0
          FieldName = 'posid'
        end
      end
    end
  end
  inherited ActionList: TActionList
    OnUpdate = ActionListUpdate
    Left = 80
    Top = 56
    inherited aPrint: TAction
      Category = 'Print'
    end
    inherited aDRPrint: TAction
      Category = 'Print'
    end
    inherited aAddPayDoc: TAction
      ImageIndex = 64
    end
    object aPrintAll: TAction [33]
      Category = 'Print'
      Caption = 'aPrintAll'
      OnExecute = aPrintAllExecute
    end
    object aPrintWP: TAction [34]
      Category = 'Print'
      Caption = 'aPrintWP'
      OnExecute = aPrintWPExecute
    end
    object aCreateWBIn: TAction [35]
      Caption = 'aCreateWBIn'
      ImageIndex = 51
      OnExecute = aCreateWBInExecute
    end
    object aCreateWBOut: TAction [36]
      Tag = 1
      Caption = 'aCreateWBOut'
      ImageIndex = 62
      OnExecute = aCreateWBOutExecute
    end
    object aTmpPosColOptions: TAction [37]
      Category = 'TmpPos'
      Caption = 'aTmpPosColOptions'
      OnExecute = aTmpPosColOptionsExecute
    end
    object aTmpProps: TAction [38]
      Category = 'TmpPos'
      Caption = 'aTmpProps'
      ImageIndex = 4
      OnExecute = aTmpPropsExecute
    end
    object aTmpAdd: TAction [39]
      Category = 'TmpPos'
      Caption = 'aTmpAdd'
      ImageIndex = 3
      OnExecute = aTmpAddExecute
    end
    object aTmpDel: TAction [40]
      Category = 'TmpPos'
      Caption = 'aTmpDel'
      ImageIndex = 5
      OnExecute = aTmpDelExecute
    end
    object aTmpRefresh: TAction [41]
      Category = 'TmpPos'
      Caption = 'aTmpRefresh'
      ImageIndex = 6
      OnExecute = aTmpRefreshExecute
    end
    object aTmpCreateOrder: TAction [42]
      Category = 'TmpPos'
      Caption = 'aTmpCreateOrder'
      ImageIndex = 189
      OnExecute = aTmpCreateOrderExecute
    end
    object aCreateAcc: TAction
      Caption = 'aCreateAcc'
      OnExecute = aCreateAccExecute
    end
    object aPrintInvoice: TAction
      Category = 'Print'
      Caption = 'aPrintInvoice'
      OnExecute = aPrintInvoiceExecute
    end
    object aPrintWBOut: TAction
      Category = 'Print'
      Caption = 'aPrintWBOut'
      OnExecute = aPrintWBOutExecute
    end
  end
  inherited pmMain: TTBPopupMenu
    object TBItem8: TTBItem [8]
      Action = aCreateWBOut
    end
    object TBItem7: TTBItem [9]
      Action = aCreateWBIn
    end
    object TBItem15: TTBItem [10]
      Action = aAddPayDoc
    end
    object TBItem20: TTBItem [11]
      Action = aCreateAcc
    end
    object TBSeparatorItem4: TTBSeparatorItem [12]
    end
    inherited TBItem19: TTBItem [17]
    end
    inherited TBItem23: TTBItem [18]
    end
    object TBItemPI: TTBItem [19]
      Action = aPrintInvoice
    end
    object TBItem22: TTBItem [20]
      Action = aPrintWBOut
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
        Name = 'doctype'
        ParamType = ptUnknown
      end>
    ProviderName = 'pOrder_List'
    OnCalcFields = cdsMainCalcFields
    Macros = <
      item
        DataType = ftString
        Name = 'm'
        ParamType = ptUnknown
      end>
    Left = 56
    Top = 104
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
    object cdsMainSUMMINCURR: TFloatField
      FieldName = 'SUMMINCURR'
    end
    object cdsMainENTID: TIntegerField
      FieldName = 'ENTID'
    end
    object cdsMainONVALUE: TFloatField
      FieldName = 'ONVALUE'
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
    object cdsMainPERSONNAME: TStringField
      FieldName = 'PERSONNAME'
      Size = 64
    end
    object cdsMainCURRNAME: TStringField
      FieldName = 'CURRNAME'
      Size = 3
    end
    object cdsMaindocsaldo: TFloatField
      FieldKind = fkCalculated
      FieldName = 'docsaldo'
      Calculated = True
    end
  end
  inherited srcMain: TssDataSource
    Left = 12
    Top = 104
  end
  inherited cdsKAgent: TssClientDataSet
    Top = 48
  end
  inherited srcKAgent: TDataSource
    Left = 148
    Top = 96
  end
  inherited cdsDetail: TssMemoryData
    OnCalcFields = cdsDetailCalcFields
    Left = 192
    Top = 216
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
    Left = 190
    Top = 266
    object cdsDetailrsv: TIntegerField
      FieldName = 'rsv'
    end
    object cdsDetailPOSTYPE: TIntegerField
      FieldName = 'POSTYPE'
    end
    object cdsDetailGRPID: TIntegerField
      FieldName = 'GRPID'
    end
    object cdsDetailtax: TStringField
      FieldName = 'tax'
      Size = 255
    end
  end
  inherited srcDetail: TDataSource
    Left = 186
    Top = 170
  end
  inherited pmDet: TTBPopupMenu
    object TBItem21: TTBItem [10]
      Tag = 1
      Action = aPrintInvoice
    end
    object TBItem24: TTBItem [11]
      Action = aPrintWBOut
    end
    object TBSeparatorItem12: TTBSeparatorItem [12]
    end
  end
  inherited cdsRel: TssClientDataSet
    Left = 81
    Top = 218
  end
  inherited srcRel: TDataSource
    Left = 77
    Top = 178
  end
  inherited cdsDocRel: TssClientDataSet
    Left = 284
    Top = 48
  end
  object pmPrint: TTBPopupMenu
    Images = dmData.Images
    Left = 264
    Top = 132
    object TBItem11: TTBItem
      Action = aPrintAll
      Images = dmData.Images
    end
    object TBItem17: TTBItem
      Action = aPrintWP
    end
  end
  object cdsTempPos: TssClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <
      item
        DataType = ftUnknown
        Name = 'ondate'
        ParamType = ptUnknown
      end>
    ProviderName = 'pOrdersIn_GetTemp'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsTempPosBeforeOpen
    AfterOpen = cdsTempPosAfterOpen
    Macros = <>
    Left = 346
    Top = 89
  end
  object srcTempPos: TDataSource
    DataSet = cdsTempPos
    Left = 342
    Top = 49
  end
  object pmTmpPos: TTBPopupMenu
    Images = dmData.Images
    Left = 434
    Top = 137
    object TBItem9: TTBItem
      Action = aTmpAdd
    end
    object TBItem10: TTBItem
      Action = aTmpDel
    end
    object TBSeparatorItem8: TTBSeparatorItem
    end
    object TBItem12: TTBItem
      Action = aTmpRefresh
    end
    object TBSeparatorItem9: TTBSeparatorItem
    end
    object TBItem14: TTBItem
      Action = aTmpCreateOrder
    end
    object TBSeparatorItem5: TTBSeparatorItem
    end
    object TBItem16: TTBItem
      Action = aTmpPosColOptions
    end
    object TBItem13: TTBItem
      Action = aTmpProps
    end
  end
end
