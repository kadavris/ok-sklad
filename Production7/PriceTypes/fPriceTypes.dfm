inherited fmPriceTypes: TfmPriceTypes
  inherited panClient: TPanel
    inherited pcMainList: TcxPageControl
      inherited tsMainList: TcxTabSheet
        inherited grdMain: TssDBGrid
          Hint = 'NAME'
          KeyField = 'PTYPEID'
          DragMode = dmAutomatic
          Filter.Criteria = {00000000}
          OptionsCustomize = [edgoBandMoving, edgoBandSizing, edgoColumnMoving, edgoColumnSizing]
          OnColumnSorting = grdMainColumnSorting
          OnGetNodeDragText = grdMainGetNodeDragText
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
              '160')
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
              '1')
          end
          object colNum: TdxDBGridColumn
            HeaderAlignment = taCenter
            Sizing = False
            Sorted = csUp
            Width = 30
            BandIndex = 0
            RowIndex = 0
            OnCustomDrawCell = colNumCustomDrawCell
            FieldName = 'numex'
          end
          object colName: TdxDBGridColumn
            Tag = 1
            HeaderAlignment = taCenter
            Width = 280
            BandIndex = 0
            RowIndex = 0
            FieldName = 'name'
          end
          object colDef: TdxDBGridColumn
            Visible = False
            BandIndex = 0
            RowIndex = 0
            FieldName = 'DEF'
          end
          object colID: TdxDBGridColumn
            Visible = False
            BandIndex = 0
            RowIndex = 0
            FieldName = 'ptypeid'
          end
          object colExtraDisc: TdxDBGridColumn
            Alignment = taLeftJustify
            HeaderAlignment = taCenter
            Width = 70
            BandIndex = 0
            RowIndex = 0
            FieldName = 'PPTYPEID'
            OnGetText = colExtraDiscGetText
          end
          object colExtra: TdxDBGridColumn
            Tag = 1
            Alignment = taLeftJustify
            HeaderAlignment = taCenter
            Width = 180
            BandIndex = 0
            RowIndex = 0
            FieldName = 'onvalue'
            OnGetText = colExtraGetText
          end
          object colRealNum: TdxDBGridColumn
            Visible = False
            BandIndex = 0
            RowIndex = 0
            FieldName = 'num'
          end
          object colPName: TdxDBGridColumn
            Visible = False
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Pname'
          end
          object colExtraType: TdxDBGridColumn
            Visible = False
            BandIndex = 0
            RowIndex = 0
            FieldName = 'extratype'
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    Left = 100
    Top = 40
  end
  inherited pmMain: TTBPopupMenu
    Left = 72
    Top = 40
    object TBItem5: TTBItem [1]
      Action = aPatternInsert
    end
    object TBItem6: TTBItem [6]
      Action = aSelectAll
    end
    object TBSeparatorItem3: TTBSeparatorItem [7]
    end
    object TBItem7: TTBItem [8]
      Action = aExcel
    end
    object TBSeparatorItem4: TTBSeparatorItem [9]
    end
  end
  inherited cdsMain: TssClientDataSet
    ProviderName = 'pPriceTypes_List'
    OnCalcFields = cdsMainCalcFields
    Left = 100
    Top = 68
    object cdsMainPTYPEID: TIntegerField
      FieldName = 'PTYPEID'
      Required = True
    end
    object cdsMainNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 64
    end
    object cdsMainONVALUE: TFloatField
      FieldName = 'ONVALUE'
      Required = True
    end
    object cdsMainNUM: TIntegerField
      FieldName = 'NUM'
      Required = True
    end
    object cdsMainDEF: TIntegerField
      FieldName = 'DEF'
      Required = True
    end
    object cdsMainDELETED: TIntegerField
      FieldName = 'DELETED'
      Required = True
    end
    object cdsMainnumex: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'numex'
      Calculated = True
    end
    object cdsMainPPTYPEID: TIntegerField
      FieldName = 'PPTYPEID'
    end
    object cdsMainPNAME: TStringField
      FieldName = 'PNAME'
      Size = 64
    end
    object cdsMainextratype: TIntegerField
      FieldName = 'extratype'
    end
  end
  inherited srcMain: TssDataSource
    Left = 72
    Top = 68
  end
end
