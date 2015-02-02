object frmLog: TfrmLog
  Left = 264
  Top = 174
  Width = 764
  Height = 519
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'frmLog'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 756
    Height = 451
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object gbLog: TGroupBox
      Left = 1
      Top = 1
      Width = 754
      Height = 449
      Align = alClient
      Caption = 'gbLog'
      TabOrder = 0
      object Splitter1: TSplitter
        Left = 2
        Top = 209
        Width = 750
        Height = 5
        Cursor = crVSplit
        Align = alTop
        Beveled = True
        MinSize = 100
      end
      object memoDebug: TMemo
        Left = 2
        Top = 214
        Width = 750
        Height = 233
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Lucida Console'
        Font.Style = []
        Lines.Strings = (
          'memoDebug')
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object MemoLog: TMemo
        Left = 2
        Top = 15
        Width = 750
        Height = 194
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Lucida Console'
        Font.Style = []
        Lines.Strings = (
          'memoLog')
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 451
    Width = 756
    Height = 40
    Align = alTop
    TabOrder = 1
    DesignSize = (
      756
      40)
    object btnOK: TButton
      Left = 663
      Top = 8
      Width = 81
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      TabOrder = 0
      OnClick = btnOKClick
    end
  end
end
