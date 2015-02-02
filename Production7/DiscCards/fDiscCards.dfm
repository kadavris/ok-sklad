inherited fmDiscCards: TfmDiscCards
  inherited panClient: TPanel
    inherited pcMainList: TcxPageControl
      inherited tsMainList: TcxTabSheet
        inherited grdMain: TssDBGrid
          Hint = 'disctype'
          KeyField = 'CARDID'
          DragMode = dmAutomatic
          OnStartDrag = grdMainStartDrag
          Filter.Criteria = {00000000}
          OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSelect, edgoStoreToRegistry, edgoTabThrough, edgoVertThrough]
          OptionsCustomize = [edgoBandMoving, edgoBandSizing, edgoColumnMoving, edgoColumnSizing]
          OptionsView = [edgoBandHeaderWidth, edgoHideFocusRect, edgoRowSelect, edgoUseBitmap]
          LangManager = dmData.Lng
          OnGetOptionsTitle = grdMainGetOptionsTitle
          object colImg: TdxDBGridImageColumn
            Alignment = taLeftJustify
            MinWidth = 16
            Sizing = False
            Width = 25
            BandIndex = 0
            RowIndex = 0
            OnGetText = colImgGetText
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
              '186')
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
              '1')
          end
          object colNum: TdxDBGridColumn
            Tag = 1
            HeaderAlignment = taCenter
            Width = 93
            BandIndex = 0
            RowIndex = 0
            FieldName = 'num'
          end
          object colDiscType: TdxDBGridColumn
            Tag = 1
            Alignment = taLeftJustify
            HeaderAlignment = taCenter
            Width = 90
            BandIndex = 0
            RowIndex = 0
            FieldName = 'disctype'
            OnGetText = colDiscTypeGetText
          end
          object colOnValue: TdxDBGridColumn
            Tag = 1
            Alignment = taRightJustify
            HeaderAlignment = taCenter
            Width = 60
            BandIndex = 0
            RowIndex = 0
            FieldName = 'onvalue'
            OnGetText = colOnValueGetText
          end
          object colExpireDate: TdxDBGridColumn
            Tag = 1
            Alignment = taCenter
            HeaderAlignment = taCenter
            Width = 90
            BandIndex = 0
            RowIndex = 0
            FieldName = 'expiredate'
            OnGetText = colExpireDateGetText
          end
          object colName: TdxDBGridColumn
            Tag = 1
            HeaderAlignment = taCenter
            Width = 158
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Name'
          end
          object colID: TdxDBGridColumn
            Visible = False
            Width = 90
            BandIndex = 0
            RowIndex = 0
            FieldName = 'CardID'
          end
          object colPhone: TdxDBGridColumn
            Tag = 1
            HeaderAlignment = taCenter
            Width = 100
            BandIndex = 0
            RowIndex = 0
            FieldName = 'phone'
          end
          object colPosCount: TdxDBGridColumn
            Tag = 1
            Alignment = taRightJustify
            HeaderAlignment = taCenter
            Width = 70
            BandIndex = 0
            RowIndex = 0
            FieldName = 'poscount'
          end
          object colTotal: TdxDBGridColumn
            Tag = 1
            Alignment = taRightJustify
            HeaderAlignment = taCenter
            Width = 80
            BandIndex = 0
            RowIndex = 0
            FieldName = 'total'
            OnGetText = colTotalGetText
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    Top = 28
    object aDiscCardInfo: TAction
      Category = 'All'
      Caption = 'aDiscCardInfo'
      ImageIndex = 187
      ShortCut = 16457
      OnExecute = aDiscCardInfoExecute
    end
    object aNewGrp: TAction
      Category = 'All'
      Caption = 'aNewGrp'
      OnExecute = aNewGrpExecute
    end
  end
  inherited pmMain: TTBPopupMenu
    Top = 28
    object TBItem5: TTBItem [1]
      Action = aPatternInsert
    end
    object TBSeparatorItem3: TTBSeparatorItem [5]
    end
    object TBItem9: TTBItem [6]
      Action = aDiscCardInfo
    end
    object TBSeparatorItem5: TTBSeparatorItem [7]
    end
    object TBItem6: TTBItem [8]
      Action = aSelectAll
    end
    object TBItem7: TTBItem [10]
      Action = aExcel
    end
    object TBSeparatorItem4: TTBSeparatorItem [11]
    end
    object TBItem8: TTBItem [12]
      Action = aColParams
    end
  end
  inherited cdsMain: TssClientDataSet
    Params = <
      item
        DataType = ftUnknown
        Name = 'pid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pid'
        ParamType = ptUnknown
      end>
    ProviderName = 'pDiscCards_List'
    BeforeOpen = cdsMainBeforeOpen
  end
  inherited srcMain: TssDataSource
    ChangeDelay = 0
  end
end
