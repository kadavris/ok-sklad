object fmDebugTrace: TfmDebugTrace
  Left = 296
  Top = 181
  Width = 855
  Height = 579
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'fmDebugTrace'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 847
    Height = 517
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Panel1'
    ParentBackground = False
    TabOrder = 0
    object debugOut: TRichEdit
      Left = 1
      Top = 1
      Width = 845
      Height = 515
      Align = alClient
      BevelEdges = []
      BevelInner = bvLowered
      BevelOuter = bvRaised
      BevelKind = bkFlat
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Lucida Console'
      Font.Style = []
      ImeName = 'Russian'
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
      WantTabs = True
      WordWrap = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 517
    Width = 847
    Height = 34
    Align = alTop
    Anchors = [akLeft, akRight, akBottom]
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      847
      34)
    object ButOK: TButton
      Left = 652
      Top = 4
      Width = 89
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      TabOrder = 0
      OnClick = ButOKClick
    end
    object ButCancel: TButton
      Left = 748
      Top = 4
      Width = 89
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = ButCancelClick
    end
  end
end
