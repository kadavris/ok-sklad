inherited fmBundles: TfmBundles
  Width = 677
  Height = 418
  inherited Splitter1: TSplitter
    Width = 677
  end
  inherited panClient: TPanel
    Width = 677
    inherited ssBevel9: TssBevel
      Width = 677
    end
    inherited ssBevel8: TssBevel
      Left = 676
    end
    inherited ssBevel12: TssBevel
      Width = 677
    end
    inherited pcMainList: TcxPageControl
      Width = 675
      inherited tsMainList: TcxTabSheet
        inherited bvlMainListTop: TssBevel
          Width = 675
        end
        inherited grdMain: TssDBGrid
          Width = 675
          Hint = ''
          Filter.Criteria = {00000000}
        end
        inherited panFooter: TPanel
          Width = 675
          inherited ssBevel1: TssBevel
            Width = 675
          end
        end
      end
    end
    inherited panFilter: TPanel
      Width = 677
      inherited bvlTop: TssBevel
        Width = 677
      end
      inherited bvlRight: TssBevel
        Left = 676
      end
      inherited lStatus: TLabel
        Left = 1
      end
      inherited btnKagent: TssSpeedButton
        Left = 1
      end
      inherited cbChecked: TcxImageComboBox
        Left = 1
      end
      inherited lcbKAgent: TssDBLookupCombo
        Properties.Items.Strings = (
          '<>')
      end
    end
  end
  inherited pcMain: TcxPageControl
    Width = 677
    Height = 254
    inherited tsPositions: TcxTabSheet
      inherited ssBevel14: TssBevel
        Height = 198
      end
      inherited ssBevel15: TssBevel
        Width = 677
      end
      inherited ssBevel16: TssBevel
        Top = 199
        Width = 677
      end
      inherited ssBevel17: TssBevel
        Left = 676
        Height = 198
      end
      inherited grdDet: TssDBGrid
        Width = 675
        Height = 198
        Hint = 'WHNAME'
        Filter.Criteria = {00000000}
      end
      inherited PanDetFooter: TPanel
        Top = 200
        Width = 677
        inherited ssBevel4: TssBevel
          Width = 677
        end
      end
    end
    inherited tsInfo: TcxTabSheet
      inherited ssBevel10: TssBevel
        Height = 228
      end
      inherited ssBevel19: TssBevel
        Width = 677
      end
      inherited ssBevel21: TssBevel
        Top = 229
        Width = 677
      end
      inherited ssBevel22: TssBevel
        Left = 676
        Height = 228
      end
      inherited inspMain: TdxInspector
        Width = 675
        Height = 228
        DividerPos = 237
        Data = {
          1A0100000700000008000000000000000500000069724E756D08000000060000
          000800000069724B4167656E7408000000000000000C00000069724B4146756C
          6C4E616D6508000000000000000A00000069724B414164726573730800000000
          0000000900000069724B4150686F6E6508000000000000000500000069724661
          780800000000000000070000006972456D61696C080000000000000005000000
          6972575757080000000000000006000000697243757272080000000000000008
          0000006972526561736F6E0800000000000000080000006972506572736F6E08
          0000000000000008000000697253746174757308000000000000000700000069
          724E6F7465730100000008000000ECEF24060800000069724B4167656E74}
      end
    end
    inherited tsDocRel: TcxTabSheet
      inherited grdDocRel: TssDBGrid
        Filter.Criteria = {00000000}
      end
    end
  end
  inherited cdsMain: TssClientDataSet
    ProviderName = 'pWaybill_List'
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
