object fmLoadingData: TfmLoadingData
  Left = 0
  Top = 0
  Width = 342
  Height = 197
  TabOrder = 0
  object panWait: TPanel
    Left = 0
    Top = 0
    Width = 342
    Height = 197
    Align = alClient
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      342
      197)
    object lWait: TLabel
      Left = 149
      Top = 85
      Width = 128
      Height = 16
      Anchors = []
      Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1076#1072#1085#1085#1099#1093'...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object aviWait: TAnimate
      Left = 59
      Top = 66
      Width = 80
      Height = 50
      Anchors = []
      CommonAVI = aviFindFolder
      StopFrame = 29
    end
  end
end
