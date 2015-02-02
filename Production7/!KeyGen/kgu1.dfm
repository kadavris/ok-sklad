object Form1: TForm1
  Left = 287
  Top = 49
  ClientWidth = 557
  ClientHeight = 696
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderStyle = bsDialog
  Caption = 'KeyGen. TOP SECRET!!!'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 557
    Height = 369
    Align = alTop
    Caption = ' Input '
    TabOrder = 0
    object lHID: TLabel
      Left = 36
      Top = 24
      Width = 63
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hardware ID:'
    end
    object lUser: TLabel
      Left = 33
      Top = 49
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = 'Registered to:'
    end
    object lregNo: TLabel
      Left = 69
      Top = 75
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Reg #'
    end
    object lEmail: TLabel
      Left = 68
      Top = 100
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'E-mail:'
    end
    object lCust: TLabel
      Left = 4
      Top = 340
      Width = 22
      Height = 13
      Caption = '>>>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lWebShops: TLabel
      Left = 40
      Top = 125
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = 'Web Shops:'
    end
    object lAddStr: TLabel
      Left = 19
      Top = 149
      Width = 84
      Height = 13
      Alignment = taRightJustify
      Caption = 'Additional Strings:'
    end
    object EdHID: TEdit
      Left = 108
      Top = 20
      Width = 229
      Height = 21
      TabOrder = 0
    end
    object EdUser: TEdit
      Left = 108
      Top = 44
      Width = 257
      Height = 21
      TabOrder = 1
    end
    object Edregno: TEdit
      Left = 108
      Top = 69
      Width = 257
      Height = 21
      TabOrder = 2
    end
    object Edemail: TEdit
      Left = 108
      Top = 94
      Width = 257
      Height = 21
      TabOrder = 3
    end
    object CbBarC: TCheckBox
      Left = 108
      Top = 218
      Width = 125
      Height = 17
      Caption = 'Barcodes enabled'
      TabOrder = 4
    end
    object rgMaxClients: TRadioGroup
      Left = 24
      Top = 240
      Width = 341
      Height = 121
      Caption = ' Max # of clients '
      ItemIndex = 0
      Items.Strings = (
        '1'
        '3'
        '5'
        '10'
        'Unlimited'
        'Custom')
      TabOrder = 5
      OnClick = rgMaxClientsClick
    end
    object EdMaxClients: TEdit
      Left = 100
      Top = 336
      Width = 61
      Height = 21
      Enabled = False
      MaxLength = 5
      TabOrder = 6
    end
    object btnDefaults: TButton
      Left = 400
      Top = 20
      Width = 137
      Height = 25
      Caption = 'Defaults for testing'
      TabOrder = 7
      OnClick = btnDefaultsClick
    end
    object BtnClear: TButton
      Left = 400
      Top = 56
      Width = 137
      Height = 25
      Caption = 'Clear'
      TabOrder = 8
      OnClick = BtnClearClick
    end
    object BtnGen: TButton
      Left = 400
      Top = 296
      Width = 137
      Height = 25
      Caption = 'Generate key'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      OnClick = BtnGenClick
    end
    object BtnSave: TButton
      Left = 400
      Top = 336
      Width = 137
      Height = 25
      Caption = 'Save to file'
      TabOrder = 10
      OnClick = BtnSaveClick
    end
    object edWebShops: TEdit
      Left = 108
      Top = 119
      Width = 257
      Height = 21
      TabOrder = 11
    end
    object mAddStr: TMemo
      Left = 108
      Top = 144
      Width = 437
      Height = 57
      TabOrder = 12
    end
    object btnMyHID: TButton
      Left = 339
      Top = 20
      Width = 25
      Height = 21
      Caption = 'Get'
      TabOrder = 13
      OnClick = btnMyHIDClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 376
    Width = 557
    Height = 320
    Align = alBottom
    Caption = ' KEY '
    TabOrder = 1
    object Memo1: TMemo
      Left = 12
      Top = 144
      Width = 533
      Height = 165
      Lines.Strings = (
        '')
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object btnEncode: TButton
      Left = 12
      Top = 113
      Width = 137
      Height = 25
      Caption = 'Encode string'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnEncodeClick
    end
    object bynDecode: TButton
      Left = 156
      Top = 114
      Width = 137
      Height = 25
      Caption = 'Decode string'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
      TabOrder = 2
      OnClick = btDecodeClick
    end
    object mInput: TMemo
      Left = 12
      Top = 16
      Width = 533
      Height = 89
      ScrollBars = ssBoth
      TabOrder = 3
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 288
    Top = 349
    DefaultExt = '.key'
    FileName = 'keygen'
    Filter = 'Keyfiles|*.key|All Files|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
  end
end
