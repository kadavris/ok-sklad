inherited frmRepSummaryAnalitic: TfrmRepSummaryAnalitic
  Left = 314
  Top = 182
  Width = 463
  Height = 276
  Caption = 'frmRepSummaryAnalitic'
  PixelsPerInch = 96
  TextHeight = 13
  object ssBevel1: TssBevel [0]
    Left = 4
    Top = 40
    Width = 446
    Height = 174
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColorGrBegin = clBtnFace
    ColorGrEnd = clBtnFace
    ColorInner = clBtnShadow
    ColorOuter = clBtnShadow
    Edges = [beLeft, beRight, beTop, beBottom]
    GradientDirection = gdHorizontal
    HotTrack = False
    ImageIndex = 0
    Style = bsSingle
    UseGradient = False
  end
  inherited panTitleBar: TssGradientPanel
    Width = 455
    inherited panTitleButtons: TssPanel
      Left = 398
    end
  end
  inherited panButtons: TPanel
    Top = 214
    Width = 455
    inherited btnOK: TxButton
      Left = 202
    end
    inherited btnCancel: TxButton
      Left = 286
    end
    inherited btnApply: TxButton
      Left = 370
    end
  end
  inherited ilTitleBar: TImageList
    Left = 92
    Top = 220
  end
  inherited ActionList: TActionList
    Left = 120
    Top = 220
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    Left = 32
    Top = 220
    ReportForm = {19000000}
  end
end
