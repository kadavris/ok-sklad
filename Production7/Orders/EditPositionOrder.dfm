inherited frmEditPositionOrder: TfrmEditPositionOrder
  Left = 286
  Top = 54
  Caption = 'frmEditPositionOrder'
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    inherited panMat: TPanel
      inherited chbRsv: TcxCheckBox
        Properties.Caption = #1047#1072#1088#1077#1079#1077#1088#1074#1080#1088#1086#1074#1072#1090#1100' '#1090#1086#1074#1072#1088
      end
    end
    inherited panPrice: TPanel
      inherited btnShowNDS: TssSpeedButton
        ImageIndex = 63
      end
    end
    inherited panDiscount: TPanel
      inherited chbDiscount: TcxCheckBox
        Properties.Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1089#1082#1080#1076#1082#1091
      end
    end
    inherited panWarranty: TPanel
      inherited chbWarranty: TcxCheckBox
        Properties.Caption = #1055#1086#1089#1090#1072#1074#1080#1090#1100' '#1085#1072' '#1075#1072#1088#1072#1085#1090#1080#1102
      end
    end
  end
  inherited FormStorage: TssFormStorage
    StoredProps.Strings = (
      'aShowPriceIn.Checked'
      'aShowNDS.Checked'
      'btnShowNDS.Checked'
      'panSN.Visible'
      'PanAddProps.Visible'
      'panDiscount.Visible'
      'panSummary.Visible')
  end
  inherited mdwmt: TdxMemData
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
  end
end
