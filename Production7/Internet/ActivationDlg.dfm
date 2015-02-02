inherited ActivationDlg: TActivationDlg
  Top = 376
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'ActivationDlg'
  ClientHeight = 336
  ClientWidth = 444
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 444
    Height = 254
    BevelInner = bvLowered
    BevelOuter = bvRaised
    object pcMain: TPageControl
      Left = 2
      Top = 2
      Width = 440
      Height = 250
      ActivePage = tsLogin
      Align = alClient
      Style = tsFlatButtons
      TabOrder = 0
      object tsLogin: TTabSheet
        Caption = 'tsLogin'
        TabVisible = False
        DesignSize = (
          432
          240)
        object lEmail: TcxLabel
          Left = 10
          Top = 84
          Width = 100
          Height = 21
          AutoSize = False
          TabOrder = 0
          ImeName = 'Russian'
          Caption = 'E-Mail:'
        end
        object edEmail: TcxTextEdit
          Left = 128
          Top = 81
          Width = 277
          Height = 24
          TabOrder = 1
          ImeName = 'Russian'
        end
        object edPassword: TcxTextEdit
          Left = 128
          Top = 118
          Width = 277
          Height = 24
          Properties.EchoMode = eemPassword
          TabOrder = 2
          ImeName = 'Russian'
        end
        object lPassword: TcxLabel
          Left = 10
          Top = 121
          Width = 100
          Height = 21
          AutoSize = False
          TabOrder = 3
          ImeName = 'Russian'
          Caption = 'Password:'
        end
        object btnActivate: TxButton
          Left = 158
          Top = 164
          Width = 217
          Height = 34
          Anchors = [akRight, akBottom]
          Caption = 'Activate!'
          ColorInner = clBtnShadow
          Gradient.ColorBegin = clLime
          Gradient.ColorEnd = clGreen
          Gradient.Direction = gdVertical
          Gradient.Enabled = True
          OnClick = btnActivateClick
          TabOrder = 4
        end
        object lLoginMsg: TcxLabel
          Left = 5
          Top = 0
          Width = 425
          Height = 70
          AutoSize = False
          Properties.Alignment.Horz = taCenter
          Properties.WordWrap = True
          TabOrder = 5
          ImeName = 'Russian'
          Caption = 
            'Please enter your registered email and password for activation p' +
            'urpose'
        end
      end
      object tsDistributions: TTabSheet
        Caption = 'tsDistributions'
        ImageIndex = 1
        TabVisible = False
        object rgDistributions: TcxRadioGroup
          Left = 0
          Top = 82
          Width = 432
          Height = 158
          Align = alBottom
          Properties.Items = <>
          Properties.OnChange = rgDistributionsPropertiesChange
          Style.StyleController = dmData.scMain
          TabOrder = 0
          Caption = ''
        end
        object lDistrMsg: TcxLabel
          Left = 5
          Top = 0
          Width = 425
          Height = 60
          AutoSize = False
          Properties.Alignment.Horz = taCenter
          Properties.WordWrap = True
          TabOrder = 1
          ImeName = 'Russian'
          Caption = 
            'Please enter your registered email and password for activation p' +
            'urpose'
        end
      end
      object tsTimer: TTabSheet
        Caption = 'tsTimer'
        ImageIndex = 2
        TabVisible = False
        object pbMain: TcxProgressBar
          Left = 30
          Top = 69
          Width = 371
          Height = 24
          Position = 100
          Properties.BeginColor = clYellow
          Properties.EndColor = clLime
          Properties.ShowTextStyle = cxtsPosition
          Properties.BarStyle = cxbsGradientLEDs
          Properties.PeakValue = 100
          TabOrder = 0
          ImeName = 'Russian'
        end
        object lTimerMsg: TcxLabel
          Left = 5
          Top = 0
          Width = 425
          Height = 41
          AutoSize = False
          Properties.Alignment.Horz = taCenter
          Properties.WordWrap = True
          TabOrder = 1
          ImeName = 'Russian'
          Caption = 
            'Please enter your registered email and password for activation p' +
            'urpose'
        end
      end
      object tsServerAddress: TTabSheet
        Caption = 'tsServerAddress'
        ImageIndex = 3
        TabVisible = False
        DesignSize = (
          432
          240)
        object btnHost: TssSpeedButton
          Left = 393
          Top = 91
          Alignment = taLeftJustify
          AllwaysShowFrame = False
          Anchors = [akTop, akRight]
          ButtonType = ssbtStandard
          Checked = False
          Caption = 'btnDBWiz'
          DisabledImages = dmData.Images18x18dis
          DisabledImageIndex = 51
          GroupIndex = 0
          ImageIndex = 51
          Images = dmData.Images18x18
          LeftMargin = 2
          ParentColorEx = False
          ParentShowHint = False
          ShowHint = True
          Style = ssbsUser
          ViewStyle = ssvsGlyphOnly
          OnClick = btnHostClick
        end
        object lServAddr: TcxLabel
          Left = 6
          Top = 94
          Width = 153
          Height = 20
          AutoSize = False
          TabOrder = 0
          ImeName = 'Russian'
          Caption = 'Server'#39's name:'
        end
        object edServAddr: TcxTextEdit
          Left = 158
          Top = 91
          Width = 227
          Height = 24
          ParentFont = False
          Style.StyleController = dmData.scMain
          TabOrder = 1
          ImeName = 'Russian'
        end
        object btnServaddr: TxButton
          Left = 159
          Top = 134
          Width = 226
          Height = 27
          Anchors = [akRight, akBottom]
          Caption = 'Comprobacion de conexion'
          ColorInner = clBtnShadow
          Gradient.ColorBegin = clYellow
          Gradient.ColorEnd = clRed
          Gradient.Direction = gdVertical
          Gradient.Enabled = True
          OnClick = btnServaddrClick
          TabOrder = 2
        end
        object lServAddrMsg: TcxLabel
          Left = 5
          Top = 10
          Width = 425
          Height = 80
          AutoSize = False
          Properties.Alignment.Horz = taCenter
          Properties.WordWrap = True
          TabOrder = 3
          ImeName = 'Russian'
          Caption = 
            'Leave empty if server application is on this same computer or en' +
            'ter name or IP address of the computer with server application i' +
            'nstalled. Also you may click on the button at the right to choos' +
            'e from discovered server'#39's list.'
        end
      end
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 444
    inherited panTitleButtons: TssPanel
      Left = 386
    end
  end
  inherited panButtons: TPanel
    Top = 301
    Width = 444
    inherited btnOK: TxButton
      Left = 226
    end
    inherited btnCancel: TxButton
      Left = 331
    end
    inherited btnApply: TxButton
      Left = 2
      Visible = False
    end
  end
  inherited panToolBar: TPanel
    Width = 444
    inherited btnLock: TssSpeedButton
      Left = 357
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 384
    end
    inherited btnHelp: TssSpeedButton
      Left = 411
    end
  end
  inherited ilTitleBar: TImageList
    Left = 36
    Top = 4
  end
  inherited FormStorage: TssFormStorage
    Left = 124
    Top = 4
  end
  inherited ActionList: TActionList
    Left = 80
    Top = 4
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 208
    Top = 5
  end
end
