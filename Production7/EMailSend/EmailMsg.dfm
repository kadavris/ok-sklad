inherited frmSendMsg: TfrmSendMsg
  Left = 524
  Top = 228
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'frmSendMsg'
  ClientHeight = 622
  ClientWidth = 578
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 578
    Height = 540
    object gbMsg: TssGroupBox
      Left = 4
      Top = -1
      Width = 571
      Height = 519
      Alignment = alTopLeft
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = ' '#1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1089#1086#1086#1073#1097#1077#1085#1080#1077' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      TabStop = False
      Edges = [beLeft, beRight, beTop, beBottom]
      DesignSize = (
        571
        519)
      object lSubject: TLabel
        Left = 15
        Top = 133
        Width = 116
        Height = 16
        Caption = #1058#1077#1084#1072' '#1089#1086#1086#1073#1097#1077#1085#1080#1103':'
      end
      object lMsg: TLabel
        Left = 15
        Top = 215
        Width = 80
        Height = 16
        Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1077':'
      end
      object lImp: TLabel
        Left = 15
        Top = 457
        Width = 50
        Height = 16
        Anchors = [akLeft, akBottom]
        Caption = #1042#1072#1078#1085#1086'!'
      end
      object lImpText: TLabel
        Left = 98
        Top = 455
        Width = 455
        Height = 56
        Anchors = [akLeft, akRight, akBottom]
        AutoSize = False
        Caption = 
          #1045#1089#1083#1080' '#1042#1099' '#1078#1077#1083#1072#1077#1090#1077' '#1087#1086#1083#1091#1095#1080#1090#1100' '#1086#1090#1074#1077#1090' '#1085#1072' '#1101#1090#1086' '#1089#1086#1086#1073#1097#1077#1085#1080#1077', '#1091#1082#1072#1078#1080#1090#1077', '#1087#1086#1078#1072#1083#1091 +
          #1081#1089#1090#1072', '#1042#1072#1096' E-Mail '#1074' '#1090#1077#1082#1089#1090#1077' '#1087#1080#1089#1100#1084#1072'. '#1042#1072#1096' '#1079#1072#1087#1088#1086#1089' '#1085#1077' '#1086#1089#1090#1072#1085#1077#1090#1089#1103' '#1073#1077#1079' '#1074#1085 +
          #1080#1084#1072#1085#1080#1103'.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object lemail: TLabel
        Left = 16
        Top = 407
        Width = 111
        Height = 16
        Caption = 'E-mail (optional):'
      end
      object lText: TJvHTLabel
        Left = 16
        Top = 24
        Width = 545
        Height = 105
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 
          'You can easy send an error report or ask for support from here.'#13 +
          #10'<br>You need Internet connection to do this.'#13#10'<br><font color=#' +
          '0000ff>Please note that no personal or company info will be tran' +
          'sferred without your permit.</font>'#13#10'<br>Internal statistics als' +
          'o added to each message,'#13#10'<br> helping us determine the source o' +
          'f error condition if any.'
      end
      object edMsg: TcxMemo
        Left = 15
        Top = 232
        Width = 540
        Height = 173
        Anchors = [akLeft, akTop, akRight, akBottom]
        ImeName = 'Russian'
        Lines.Strings = (
          '4545')
        ParentFont = False
        Properties.MaxLength = 0
        Style.StyleController = dmData.scMain
        TabOrder = 1
      end
      object edSubject: TcxMemo
        Left = 15
        Top = 150
        Width = 540
        Height = 62
        Anchors = [akLeft, akTop, akRight]
        ImeName = 'Russian'
        Lines.Strings = (
          '4545')
        ParentFont = False
        Properties.MaxLength = 0
        Style.StyleController = dmData.scMain
        TabOrder = 0
      end
      object edEmail: TcxTextEdit
        Left = 15
        Top = 425
        Width = 540
        Height = 24
        TabOrder = 2
        ImeName = 'Russian'
      end
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 578
    inherited panTitleButtons: TssPanel
      Left = 520
    end
  end
  inherited panButtons: TPanel
    Top = 587
    Width = 578
    TabOrder = 3
    inherited btnOK: TxButton
      Left = 370
    end
    inherited btnCancel: TxButton
      Left = 475
    end
    inherited btnApply: TxButton
      Left = 1
      Visible = False
    end
  end
  inherited panToolBar: TPanel
    Width = 578
    TabOrder = 1
    inherited btnLock: TssSpeedButton
      Left = 525
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 553
      Visible = False
    end
    inherited btnHelp: TssSpeedButton
      Left = 497
    end
  end
  inherited ilTitleBar: TImageList
    Left = 65
    Top = 23
  end
  inherited FormStorage: TssFormStorage
    Left = 144
    Top = 142
  end
  inherited ActionList: TActionList
    Left = 93
    Top = 23
    inherited aSendErrMessage: TAction
      Enabled = False
    end
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 232
    Top = 21
  end
end
