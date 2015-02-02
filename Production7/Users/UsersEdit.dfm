inherited frmUsersEdit: TfrmUsersEdit
  Left = 271
  Top = 199
  Width = 764
  Height = 568
  Caption = 'frmUsersEdit'
  Constraints.MinHeight = 460
  Constraints.MinWidth = 540
  OnCloseQuery = FormCloseQuery
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 748
    Height = 448
    object tvMain: TcxTreeList
      Left = 0
      Top = 0
      Width = 164
      Height = 448
      Align = alLeft
      Bands = <
        item
          Caption.Text = 'Band1'
        end>
      BufferedPaint = False
      Images = dmData.Images
      OptionsBehavior.CellHints = True
      OptionsData.Deleting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRect = False
      OptionsView.ScrollBars = ssVertical
      OptionsView.ColumnAutoWidth = True
      OptionsView.Headers = False
      TabOrder = 0
      OnSelectionChanged = tvMainSelectionChanged
      object colNAme: TcxTreeListColumn
        DataBinding.ValueType = 'String'
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        Width = 162
      end
    end
    object pcMain: TcxPageControl
      Left = 172
      Top = 0
      Width = 576
      Height = 448
      ActivePage = tsRights
      Align = alClient
      LookAndFeel.Kind = lfUltraFlat
      TabOrder = 1
      object tsMainInfo: TcxTabSheet
        Caption = #1054#1089#1085#1086#1074#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
        ImageIndex = 0
        TabVisible = False
        object lWName: TLabel
          Left = 1
          Top = 25
          Width = 5
          Height = 16
          Caption = '!'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lWConf: TLabel
          Left = 1
          Top = 182
          Width = 5
          Height = 16
          Caption = '!'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object gbMain: TssGroupBox
          Left = 0
          Top = 0
          Width = 584
          Height = 456
          Align = alClient
          Alignment = alTopLeft
          Caption = 'gbMain'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          Edges = [beLeft, beRight, beTop, beBottom]
          DesignSize = (
            576
            448)
          object lName: TLabel
            Left = 18
            Top = 34
            Width = 35
            Height = 16
            Caption = #1051#1086#1075#1080#1085
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lFullName: TLabel
            Left = 18
            Top = 64
            Width = 69
            Height = 16
            Caption = #1055#1086#1083#1085#1086#1077' '#1080#1084#1103
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lPassword: TLabel
            Left = 18
            Top = 113
            Width = 43
            Height = 16
            Caption = #1055#1072#1088#1086#1083#1100
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lConfirm: TLabel
            Left = 18
            Top = 143
            Width = 140
            Height = 16
            Caption = #1055#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1077' '#1087#1072#1088#1086#1083#1103
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object imgMain: TImage
            Left = 18
            Top = 202
            Width = 40
            Height = 39
            Picture.Data = {
              07544269746D61705A0B0000424D5A0B00000000000036000000280000001E00
              00001F0000000100180000000000240B0000C40E0000C40E0000000000000000
              0000FF00FFFF00FFFF00FFC66131AD4929AD4929AD4D29AD4D29AD4D29AD4D29
              AD4D29AD4D29AD4D29AD4D29AD4D29AD4D29AD4D29AD4D29AD4D29AD4D29AD4D
              29AD4D29AD4D29AD4D29AD4D29AD4D29AD4D29AD4D29AD5129FF00FF0000FF00
              FFFF00FFA555316B302963303163303163303163303163303163303163303163
              30315A30315A30315A30315A30315A3031633031633031633031633031633031
              6330316330316330315A3031632C297310086B1C18FF00FF0000FF00FF31A2B5
              00B2DE00A6CE00A6CE00A6CE00A6CE00A6CE00A6CE00A6CE00A6CE00A6CE00A6
              CE00A6CE00A6CE00A6CE00A6CE00A6CE00A6CE00A6CE00A6CE00A6CE00A6CE00
              A6CE00A6CE00AED600B2DE3169847310086B1C1800005A9A9C00AED600B2DE00
              B6DE00B2DE00B2DE00B2DE00B2DE00B2DE00B2DE00B2DE00B6E700BAE700CBFF
              00CBFF00C3F700B6E700B6E700B2DE00B2DE00B2DE00B2DE00B2DE00B2DE00B6
              E700BAE700C3EF00CFFF5245526B1810000021B2CE00B6DE00BAE700C7F700C7
              F700C7F700CBF700CBF700C7F700CBF700CBF700D3FF00DBFF2169845A617B39
              96B500D3FF00CBFF00CBF700CBF700C7F700CBF700C7F700CBF700CBF700C7F7
              00C3EF00D3FF31758C730C00000000BAE700BAE700C3EF00D7FF00DBFF00D7FF
              00D7FF00D7FF00D7FF00D7FF00DBFF00E7FF21384A1000006B0818FFB2BD529E
              AD00E7FF00D7FF00D7FF00D7FF00D7FF00D7FF00D7FF08E3FF00D7FF00CBF700
              D7FF4A4D5A8C1042000000BEE700BEE700C3EF00D3FF08E3FF00D7FF00D3FF00
              D3FF00D3FF00D3FF00DBFF00DFFF0000001000006318316B08185A617B00EFFF
              00D7FF00D3FF00D3FF00D3FF00D3FF00DBFF18EFFF00D7FF00CFFF00CBF76B18
              108C10420000FF00FF18BAD600BEE700CBF710E3FF00DFFF00D7FF00D3FF00D7
              FF00D7FF00DBFF00EBFF10182100000018000031000021597300F3FF00D7FF00
              D7FF00D7FF00D7FF00D7FF10EBFF18EFFF00CFFF00E3FF31758C841C10FF00FF
              0000FF00FF00BEE700BEE700C7EF08DFFF10EBFF00DBFF00D7FF00D7FF00DBFF
              00DBFF00EBFF00AACE10000000000021182100D7FF00E3FF00DBFF00DBFF00D7
              FF00D7FF00DFFF21FFFF08DFFF00D3FF00CFF7632C29A54521FF00FF0000FF00
              FFFF00FF00C7E700C7EF00D3F710EFFF08E7FF00DBFF00DBFF00DBFF00DBFF00
              DFFF00EBFF00EFFF00F7FF00EBFF00EBFF00DBFF00DBFF00DBFF00DBFF00D7FF
              18F3FF21FFFF00D7FF00E3FF298A9C841808FF00FFFF00FF0000FF00FFFF00FF
              00C7EF00C7EF00CBEF08DFFF10EFFF00DFFF00DBFF00DBFF00DBFF00DFFF00E3
              FF00E7FF08A6C600E7FF00E3FF00DBFF00DBFF00DFFF00DBFF00E3FF29FFFF08
              E7FF00D7FF00DFFF632829AD4929FF00FFFF00FF0000FF00FFFF00FFFF00FF10
              C7DE00CBEF00D3F710EFFF08E7FF00DFFF00DFFF00DFFF00DFFF00E7FF00D7FF
              42101800DFFF00EBFF00DFFF00DFFF00DFFF00DBFF18FBFF18FBFF00D7FF00EB
              FF318294841C08FF00FFFF00FFFF00FF0000FF00FFFF00FFFF00FF00CBE700CB
              E700CFEF00E3FF10F3FF00E3FF00DFFF00DFFF00E3FF00F3FF08A6C642000000
              CBEF00EFFF00E3FF00DFFF00DFFF00E7FF21FFFF00E3FF00DFFF00D7F7632C29
              AD4921FF00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FF08CBE700CBE7
              00D7F710EFFF08EBFF00E3FF00E3FF00E7FF00FFFF18798C6B000000AACE00FB
              FF00E7FF00E3FF00E3FF10F7FF18FBFF00D7FF00EBFF298A9C841808FF00FFFF
              00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FF00CBE700CBE700CFEF08
              E7FF08F3FF00E7FF00E7FF00EBFF00FFFF10495A7B00001092AD00FBFF00E7FF
              00E3FF00E7FF18FFFF08E7FF00DBFF00E3FF632421A54521FF00FFFF00FFFF00
              FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00FF10C7DE00CFE700DBF710F7
              FF00EBFF00E7FF00F3FF00EBFF211821A54D5A31516300F7FF00EBFF00E7FF08
              F7FF18FFFF00DFFF00EFFF298A9C841808FF00FFFF00FFFF00FFFF00FFFF00FF
              0000FF00FFFF00FFFF00FFFF00FFFF00FF00CFE700CFE700D7EF08F3FF08F7FF
              00EBFF00FFFF00BED6210000A54D5A52384200FBFF00EFFF00EBFF18FFFF10F7
              FF00E3FF00E3FF633031A54521FF00FFFF00FFFF00FFFF00FFFF00FF0000FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FF00D7E700D7E700E7FF10FBFF00F3FF00
              FFFF00A2B52900006B20314A243900CFE700F7FF08F7FF21FFFF00E7FF00F3FF
              299AA5840C00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FF00D7E700D7E700DBF708F7FF08FFFF00FFFF1049
              5A2900004200184200181092AD00FFFF18FFFF10FBFF00E7FF00F3FF632C29A5
              3C21FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FF08D3E700DBEF00EBFF10FFFF00FFFF000810180000
              39001042000021597300FFFF21FFFF00EFFF00F7FF299AA5841008FF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF00D7E700D7E700E3F708FFFF08FFFF00000010000042001842
              000021384A10FFFF10FFFF00EBFF00F3FF523842A53818FF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF00DBEF00DBEF00F3FF10FFFF000000080000310008310000294D
              5A18FFFF00F3FF00FBFF18AEB57B0C00FF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FF00DBEF00DBEF00E3F708FFFF10A6A500000000000008000021E3E710FFFF
              00F3FF00FBFF5245429C3418FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FF00E3EF00E3EF00F7FF10FFFF00F7FF00BAC608FFFF21FFFF00FBFF00FFFF18
              AEB57B0C08FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00DFE7
              00DFE700EBF708FFFF08FFFF00FFFF18FFFF10FFFF00F7FF00FFFF5245429C34
              18FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00E3EF00
              E7EF00F7FF10FFFF08FFFF29FFFF00FBFF00FFFF18C3C6730C00FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00E3E700E3E700EB
              F718FFFF31FFFF21FFFF00F7FF00FFFF5245429C3418FF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00E7EF00EBEF10FFFF
              6BFFFF08FFFF00FFFF18C3C67B0C08FF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00EBEF00EBEF00FBFF29FFFF00
              FFFF00FFFF4A5152A53C21FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00F3F700F7FF00FFFF00FFFF18C3
              C6AD4521FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FF08F7F700FFFF39D7C6C66131FF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FF0000}
            Transparent = True
          end
          object Image1: TImage
            Left = 18
            Top = 320
            Width = 40
            Height = 39
            Picture.Data = {
              07544269746D61705A0B0000424D5A0B00000000000036000000280000001E00
              00001F0000000100180000000000240B0000C40E0000C40E0000000000000000
              0000FF00FFFF00FFFF00FFC66131AD4929AD4929AD4D29AD4D29AD4D29AD4D29
              AD4D29AD4D29AD4D29AD4D29AD4D29AD4D29AD4D29AD4D29AD4D29AD4D29AD4D
              29AD4D29AD4D29AD4D29AD4D29AD4D29AD4D29AD4D29AD5129FF00FF0000FF00
              FFFF00FFA555316B302963303163303163303163303163303163303163303163
              30315A30315A30315A30315A30315A3031633031633031633031633031633031
              6330316330316330315A3031632C297310086B1C18FF00FF0000FF00FF31A2B5
              00B2DE00A6CE00A6CE00A6CE00A6CE00A6CE00A6CE00A6CE00A6CE00A6CE00A6
              CE00A6CE00A6CE00A6CE00A6CE00A6CE00A6CE00A6CE00A6CE00A6CE00A6CE00
              A6CE00A6CE00AED600B2DE3169847310086B1C1800005A9A9C00AED600B2DE00
              B6DE00B2DE00B2DE00B2DE00B2DE00B2DE00B2DE00B2DE00B6E700BAE700CBFF
              00CBFF00C3F700B6E700B6E700B2DE00B2DE00B2DE00B2DE00B2DE00B2DE00B6
              E700BAE700C3EF00CFFF5245526B1810000021B2CE00B6DE00BAE700C7F700C7
              F700C7F700CBF700CBF700C7F700CBF700CBF700D3FF00DBFF2169845A617B39
              96B500D3FF00CBFF00CBF700CBF700C7F700CBF700C7F700CBF700CBF700C7F7
              00C3EF00D3FF31758C730C00000000BAE700BAE700C3EF00D7FF00DBFF00D7FF
              00D7FF00D7FF00D7FF00D7FF00DBFF00E7FF21384A1000006B0818FFB2BD529E
              AD00E7FF00D7FF00D7FF00D7FF00D7FF00D7FF00D7FF08E3FF00D7FF00CBF700
              D7FF4A4D5A8C1042000000BEE700BEE700C3EF00D3FF08E3FF00D7FF00D3FF00
              D3FF00D3FF00D3FF00DBFF00DFFF0000001000006318316B08185A617B00EFFF
              00D7FF00D3FF00D3FF00D3FF00D3FF00DBFF18EFFF00D7FF00CFFF00CBF76B18
              108C10420000FF00FF18BAD600BEE700CBF710E3FF00DFFF00D7FF00D3FF00D7
              FF00D7FF00DBFF00EBFF10182100000018000031000021597300F3FF00D7FF00
              D7FF00D7FF00D7FF00D7FF10EBFF18EFFF00CFFF00E3FF31758C841C10FF00FF
              0000FF00FF00BEE700BEE700C7EF08DFFF10EBFF00DBFF00D7FF00D7FF00DBFF
              00DBFF00EBFF00AACE10000000000021182100D7FF00E3FF00DBFF00DBFF00D7
              FF00D7FF00DFFF21FFFF08DFFF00D3FF00CFF7632C29A54521FF00FF0000FF00
              FFFF00FF00C7E700C7EF00D3F710EFFF08E7FF00DBFF00DBFF00DBFF00DBFF00
              DFFF00EBFF00EFFF00F7FF00EBFF00EBFF00DBFF00DBFF00DBFF00DBFF00D7FF
              18F3FF21FFFF00D7FF00E3FF298A9C841808FF00FFFF00FF0000FF00FFFF00FF
              00C7EF00C7EF00CBEF08DFFF10EFFF00DFFF00DBFF00DBFF00DBFF00DFFF00E3
              FF00E7FF08A6C600E7FF00E3FF00DBFF00DBFF00DFFF00DBFF00E3FF29FFFF08
              E7FF00D7FF00DFFF632829AD4929FF00FFFF00FF0000FF00FFFF00FFFF00FF10
              C7DE00CBEF00D3F710EFFF08E7FF00DFFF00DFFF00DFFF00DFFF00E7FF00D7FF
              42101800DFFF00EBFF00DFFF00DFFF00DFFF00DBFF18FBFF18FBFF00D7FF00EB
              FF318294841C08FF00FFFF00FFFF00FF0000FF00FFFF00FFFF00FF00CBE700CB
              E700CFEF00E3FF10F3FF00E3FF00DFFF00DFFF00E3FF00F3FF08A6C642000000
              CBEF00EFFF00E3FF00DFFF00DFFF00E7FF21FFFF00E3FF00DFFF00D7F7632C29
              AD4921FF00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FF08CBE700CBE7
              00D7F710EFFF08EBFF00E3FF00E3FF00E7FF00FFFF18798C6B000000AACE00FB
              FF00E7FF00E3FF00E3FF10F7FF18FBFF00D7FF00EBFF298A9C841808FF00FFFF
              00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FF00CBE700CBE700CFEF08
              E7FF08F3FF00E7FF00E7FF00EBFF00FFFF10495A7B00001092AD00FBFF00E7FF
              00E3FF00E7FF18FFFF08E7FF00DBFF00E3FF632421A54521FF00FFFF00FFFF00
              FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00FF10C7DE00CFE700DBF710F7
              FF00EBFF00E7FF00F3FF00EBFF211821A54D5A31516300F7FF00EBFF00E7FF08
              F7FF18FFFF00DFFF00EFFF298A9C841808FF00FFFF00FFFF00FFFF00FFFF00FF
              0000FF00FFFF00FFFF00FFFF00FFFF00FF00CFE700CFE700D7EF08F3FF08F7FF
              00EBFF00FFFF00BED6210000A54D5A52384200FBFF00EFFF00EBFF18FFFF10F7
              FF00E3FF00E3FF633031A54521FF00FFFF00FFFF00FFFF00FFFF00FF0000FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FF00D7E700D7E700E7FF10FBFF00F3FF00
              FFFF00A2B52900006B20314A243900CFE700F7FF08F7FF21FFFF00E7FF00F3FF
              299AA5840C00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FF00D7E700D7E700DBF708F7FF08FFFF00FFFF1049
              5A2900004200184200181092AD00FFFF18FFFF10FBFF00E7FF00F3FF632C29A5
              3C21FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FF08D3E700DBEF00EBFF10FFFF00FFFF000810180000
              39001042000021597300FFFF21FFFF00EFFF00F7FF299AA5841008FF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FF00D7E700D7E700E3F708FFFF08FFFF00000010000042001842
              000021384A10FFFF10FFFF00EBFF00F3FF523842A53818FF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF00DBEF00DBEF00F3FF10FFFF000000080000310008310000294D
              5A18FFFF00F3FF00FBFF18AEB57B0C00FF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FF00DBEF00DBEF00E3F708FFFF10A6A500000000000008000021E3E710FFFF
              00F3FF00FBFF5245429C3418FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FF00E3EF00E3EF00F7FF10FFFF00F7FF00BAC608FFFF21FFFF00FBFF00FFFF18
              AEB57B0C08FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00DFE7
              00DFE700EBF708FFFF08FFFF00FFFF18FFFF10FFFF00F7FF00FFFF5245429C34
              18FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00E3EF00
              E7EF00F7FF10FFFF08FFFF29FFFF00FBFF00FFFF18C3C6730C00FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00E3E700E3E700EB
              F718FFFF31FFFF21FFFF00F7FF00FFFF5245429C3418FF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00E7EF00EBEF10FFFF
              6BFFFF08FFFF00FFFF18C3C67B0C08FF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00EBEF00EBEF00FBFF29FFFF00
              FFFF00FFFF4A5152A53C21FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00F3F700F7FF00FFFF00FFFF18C3
              C6AD4521FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FF08F7F700FFFF39D7C6C66131FF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FF0000}
            Transparent = True
          end
          object edName: TcxTextEdit
            Left = 196
            Top = 28
            Width = 157
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Properties.MaxLength = 24
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 0
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edFullName: TcxTextEdit
            Left = 196
            Top = 58
            Width = 269
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Properties.MaxLength = 128
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 1
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edConfirm: TcxTextEdit
            Left = 197
            Top = 138
            Width = 156
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Properties.EchoMode = eemPassword
            Properties.MaxLength = 8
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 3
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edPassword: TcxTextEdit
            Left = 197
            Top = 108
            Width = 156
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Properties.EchoMode = eemPassword
            Properties.MaxLength = 8
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 2
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object lText: TcxLabel
            Left = 74
            Top = 197
            Width = 479
            Height = 109
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Orientation = cxoLeftTop
            Properties.WordWrap = True
            TabOrder = 4
            ImeName = 'Russian'
            Caption = 
              #1042#1040#1046#1053#1054': '#1055#1072#1088#1086#1083#1100' '#1085#1077' '#1084#1086#1078#1077#1090' '#1073#1099#1090#1100' '#1087#1091#1089#1090#1099#1084' '#1080' '#1077#1075#1086' '#1076#1083#1080#1085#1072' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1072' '#1074#1086#1089#1077#1084#1100 +
              #1102' '#1089#1080#1084#1074#1086#1083#1072#1084#1080', '#1074' '#1082#1072#1095#1077#1089#1090#1074#1077' '#1082#1086#1090#1086#1088#1099#1093' '#1042#1099' '#1084#1086#1078#1077#1090#1077' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1073#1086#1083#1100#1096#1080#1077' '#1080 +
              ' '#1084#1072#1083#1077#1085#1100#1082#1080#1077' '#1073#1091#1082#1074#1099' '#1083#1072#1090#1080#1085#1089#1082#1086#1075#1086' '#1072#1083#1092#1072#1074#1080#1090#1072' '#1080' '#1094#1080#1092#1088#1099'.'
          end
          object lText1: TcxLabel
            Left = 74
            Top = 319
            Width = 479
            Height = 96
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.LabelStyle = cxlsRaised
            Properties.Orientation = cxoLeftTop
            Properties.WordWrap = True
            TabOrder = 5
            ImeName = 'Russian'
            Caption = #1053#1077' '#1079#1072#1073#1091#1076#1100#1090#1077' '#1076#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1099'!'
          end
        end
      end
      object tsMembership: TcxTabSheet
        Caption = #1042#1093#1086#1076#1080#1090' '#1074' '#1075#1088#1091#1087#1087#1099
        ImageIndex = 1
        TabVisible = False
        object lbGroups: TcxCheckListBox
          Left = 0
          Top = 0
          Width = 576
          Height = 448
          EditValue = 0
          Align = alClient
          Columns = 0
          ImeName = 'Russian'
          Items = <>
          ParentFont = False
          ScrollWidth = 0
          Style.StyleController = dmData.scMain
          TabOrder = 0
          TabWidth = 0
        end
      end
      object tsRights: TcxTabSheet
        Caption = #1055#1088#1072#1074#1072
        ImageIndex = 2
        TabVisible = False
        OnShow = tsRightsShow
        object gbRights: TssGroupBox
          Left = 0
          Top = 0
          Width = 576
          Height = 448
          Align = alClient
          Alignment = alTopLeft
          Caption = ' '#1055#1088#1072#1074#1072' '
          TabOrder = 0
          Edges = [beLeft, beRight, beTop, beBottom]
          object pcAccess: TcxPageControl
            Left = 2
            Top = 18
            Width = 572
            Height = 428
            ActivePage = tsAdditional
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Images = dmData.Images
            OwnerDraw = True
            ParentFont = False
            TabOrder = 0
            object tsGeneral: TcxTabSheet
              Caption = #1054#1089#1085#1086#1074#1085#1099#1077
              ImageIndex = 117
              object grdRights: TssDBTreeList
                Left = 0
                Top = 0
                Width = 580
                Height = 410
                DrawDragFrame = False
                BandMaxRowCount = 7
                Bands = <
                  item
                  end>
                DefaultLayout = True
                HeaderPanelMaxRowCount = 7
                HeaderPanelRowCount = 1
                KeyField = 'ID'
                ParentField = 'PID'
                Align = alClient
                ParentShowHint = False
                PopupMenu = pmCheck
                ShowHint = True
                TabOrder = 0
                OnClick = grdRightsClick
                DataSource = srcRights
                GridLineColor = clBtnFace
                HideFocusRect = True
                ImageIndexFieldName = 'IMAGEINDEX'
                Images = dmData.Images
                LookAndFeel = lfUltraFlat
                OptionsBehavior = [etoAutoDragDrop, etoAutoDragDropCopy, etoDragExpand, etoDragScroll, etoImmediateEditor, etoTabThrough]
                OptionsDB = [etoAutoCalcKeyValue, etoCancelOnExit, etoCanNavigation, etoCheckHasChildren, etoConfirmDelete, etoLoadAllRecords]
                OptionsView = [etoBandHeaderWidth, etoHideFocusRect, etoUseBitmap, etoUseImageIndexForSelected]
                ShowGrid = True
                TreeLineColor = clGradientInactiveCaption
                OnCustomDrawCell = grdRightsCustomDrawCell
                object colRightsName: TdxDBTreeListColumn
                  MinWidth = 100
                  Width = 100
                  BandIndex = 0
                  RowIndex = 0
                  OnCustomDrawCell = colRightsNameCustomDrawCell
                  FieldName = 'NAME'
                  OnGetText = colRightsNameGetText
                end
                object colRCanView: TdxDBTreeListImageColumn
                  Alignment = taLeftJustify
                  DisableCustomizing = True
                  DisableEditor = True
                  MinWidth = 16
                  Sizing = False
                  Width = 80
                  BandIndex = 0
                  RowIndex = 0
                  OnGetText = colRCanViewGetText
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
                    '160'
                    '161'
                    '162'
                    '163'
                    '164'
                    '165'
                    '166'
                    '167'
                    '168'
                    '169'
                    '170'
                    '171'
                    '172'
                    '173'
                    '174'
                    '175'
                    '176'
                    '177'
                    '178'
                    '179'
                    '180'
                    '181'
                    '182'
                    '183'
                    '184'
                    '185'
                    '186'
                    '187'
                    '188'
                    '189'
                    '190'
                    '191'
                    '192'
                    '193'
                    '194'
                    '195'
                    '196')
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
                    '1'
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
                    '0')
                end
                object colRCanInsert: TdxDBTreeListImageColumn
                  Alignment = taLeftJustify
                  DisableCustomizing = True
                  DisableEditor = True
                  MinWidth = 16
                  Sizing = False
                  Width = 80
                  BandIndex = 0
                  RowIndex = 0
                  OnGetText = colRCanViewGetText
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
                    '160'
                    '161'
                    '162'
                    '163'
                    '164'
                    '165'
                    '166'
                    '167'
                    '168'
                    '169'
                    '170'
                    '171'
                    '172'
                    '173'
                    '174'
                    '175'
                    '176'
                    '177'
                    '178'
                    '179'
                    '180'
                    '181'
                    '182'
                    '183'
                    '184'
                    '185'
                    '186'
                    '187'
                    '188'
                    '189'
                    '190'
                    '191'
                    '192'
                    '193'
                    '194'
                    '195'
                    '196')
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
                    '1'
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
                    '0')
                end
                object colRCanModify: TdxDBTreeListImageColumn
                  Alignment = taLeftJustify
                  DisableCustomizing = True
                  DisableEditor = True
                  MinWidth = 16
                  ReadOnly = True
                  Sizing = False
                  Width = 80
                  BandIndex = 0
                  RowIndex = 0
                  OnGetText = colRCanViewGetText
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
                    '160'
                    '161'
                    '162'
                    '163'
                    '164'
                    '165'
                    '166'
                    '167'
                    '168'
                    '169'
                    '170'
                    '171'
                    '172'
                    '173'
                    '174'
                    '175'
                    '176'
                    '177'
                    '178'
                    '179'
                    '180'
                    '181'
                    '182'
                    '183'
                    '184'
                    '185'
                    '186'
                    '187'
                    '188'
                    '189'
                    '190'
                    '191'
                    '192'
                    '193'
                    '194'
                    '195'
                    '196')
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
                    '1'
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
                    '0')
                end
                object colRCanDelete: TdxDBTreeListImageColumn
                  Alignment = taLeftJustify
                  DisableCustomizing = True
                  DisableEditor = True
                  MinWidth = 16
                  Sizing = False
                  Width = 80
                  BandIndex = 0
                  RowIndex = 0
                  OnGetText = colRCanViewGetText
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
                    '160'
                    '161'
                    '162'
                    '163'
                    '164'
                    '165'
                    '166'
                    '167'
                    '168'
                    '169'
                    '170'
                    '171'
                    '172'
                    '173'
                    '174'
                    '175'
                    '176'
                    '177'
                    '178'
                    '179'
                    '180'
                    '181'
                    '182'
                    '183'
                    '184'
                    '185'
                    '186'
                    '187'
                    '188'
                    '189'
                    '190'
                    '191'
                    '192'
                    '193'
                    '194'
                    '195'
                    '196')
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
                    '1'
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
                    '0')
                end
                object colRCanPost: TdxDBTreeListImageColumn
                  Alignment = taLeftJustify
                  Caption = 'canpost'
                  DisableCustomizing = True
                  DisableEditor = True
                  MinWidth = 16
                  Sizing = False
                  Width = 80
                  BandIndex = 0
                  RowIndex = 0
                  OnGetText = colRCanPostGetText
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
                    '160'
                    '161'
                    '162'
                    '163'
                    '164'
                    '165'
                    '166'
                    '167'
                    '168'
                    '169'
                    '170'
                    '171'
                    '172'
                    '173'
                    '174'
                    '175'
                    '176'
                    '177'
                    '178'
                    '179'
                    '180'
                    '181'
                    '182'
                    '183'
                    '184'
                    '185'
                    '186'
                    '187'
                    '188'
                    '189'
                    '190'
                    '191'
                    '192'
                    '193'
                    '194'
                    '195'
                    '196'
                    '197'
                    '198'
                    '199'
                    '200'
                    '201'
                    '202'
                    '203'
                    '204'
                    '205'
                    '206'
                    '207'
                    '208'
                    '209')
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
                    '1'
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
                    '0'
                    ''
                    ''
                    ''
                    ''
                    ''
                    ''
                    ''
                    ''
                    '2')
                end
                object colRFuncFlags: TdxDBTreeListColumn
                  MinWidth = 0
                  Width = 20
                  BandIndex = 0
                  RowIndex = 0
                end
                object colRID: TdxDBTreeListColumn
                  Visible = False
                  BandIndex = 0
                  RowIndex = 0
                  FieldName = 'ID'
                end
                object colGType: TdxDBTreeListColumn
                  Visible = False
                  BandIndex = 0
                  RowIndex = 0
                  FieldName = 'GTYPE'
                end
                object colRImageIndex: TdxDBTreeListColumn
                  Visible = False
                  BandIndex = 0
                  RowIndex = 0
                  FieldName = 'IMAGEINDEX'
                end
                object colRFunID: TdxDBTreeListColumn
                  Visible = False
                  Width = 20
                  BandIndex = 0
                  RowIndex = 0
                  FieldName = 'FUNID'
                end
              end
            end
            object tsWH: TcxTabSheet
              Caption = #1044#1086#1089#1090#1091#1087' '#1082' '#1089#1082#1083#1072#1076#1072#1084
              ImageIndex = 50
              object tlWH: TssDBTreeList
                Left = 0
                Top = 0
                Width = 580
                Height = 410
                Hint = 'Name'
                DrawDragFrame = False
                Bands = <
                  item
                  end>
                DefaultLayout = True
                HeaderPanelRowCount = 1
                KeyField = 'wid'
                ParentField = 'PID'
                Align = alClient
                ParentShowHint = False
                PopupMenu = pmWHPerm
                ShowHint = True
                TabOrder = 0
                OnClick = tlWHClick
                DataSource = srcWHPerm
                GridLineColor = clBtnFace
                HideFocusRect = True
                LookAndFeel = lfUltraFlat
                OptionsBehavior = [etoAutoDragDrop, etoAutoDragDropCopy, etoDragExpand, etoDragScroll, etoImmediateEditor, etoTabThrough]
                OptionsDB = [etoAutoCalcKeyValue, etoCancelOnExit, etoCanNavigation, etoCheckHasChildren, etoConfirmDelete, etoLoadAllRecords]
                OptionsView = [etoAutoWidth, etoBandHeaderWidth, etoHideFocusRect, etoUseBitmap, etoUseImageIndexForSelected]
                ShowGrid = True
                ShowRoot = False
                TreeLineColor = clGradientInactiveCaption
                OnGetImageIndex = tlWHGetImageIndex
                OnGetSelectedIndex = tlWHGetImageIndex
                OnCustomDrawCell = grdRightsCustomDrawCell
                LangManager = dmData.Lng
                object colWHP_Allow: TdxDBTreeListImageColumn
                  Alignment = taLeftJustify
                  DisableCustomizing = True
                  DisableEditor = True
                  HeaderAlignment = taCenter
                  MinWidth = 16
                  Sizing = False
                  Width = 60
                  BandIndex = 0
                  RowIndex = 0
                  OnGetText = colWHP_AllowGetText
                  ShowButtonStyle = sbNone
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
                    '160'
                    '161'
                    '162'
                    '163'
                    '164'
                    '165'
                    '166'
                    '167'
                    '168'
                    '169'
                    '170'
                    '171'
                    '172'
                    '173'
                    '174'
                    '175'
                    '176'
                    '177'
                    '178'
                    '179'
                    '180'
                    '181'
                    '182'
                    '183'
                    '184'
                    '185'
                    '186'
                    '187'
                    '188'
                    '189'
                    '190'
                    '191'
                    '192'
                    '193'
                    '194'
                    '195'
                    '196')
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
                    '1'
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
                    '0')
                end
                object colWHP_Name: TdxDBTreeListColumn
                  Caption = 'Name'
                  HeaderAlignment = taCenter
                  Width = 163
                  BandIndex = 0
                  RowIndex = 0
                  FieldName = 'NAME'
                end
                object colWHP_WID: TdxDBTreeListColumn
                  Visible = False
                  Width = 20
                  BandIndex = 0
                  RowIndex = 0
                  FieldName = 'WID'
                end
              end
            end
            object tsAdditional: TcxTabSheet
              Caption = 'Additional'
              ImageIndex = 2
              object chbShowPrices: TcxCheckBox
                Left = 7
                Top = 16
                Width = 601
                Height = 24
                Properties.DisplayUnchecked = 'False'
                Properties.Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1102' '#1074#1093#1086#1076#1085#1099#1077' '#1094#1077#1085#1099
                Style.StyleController = dmData.scMain
                TabOrder = 0
                ImeName = 'Russian'
              end
              object chbShowBallance: TcxCheckBox
                Left = 7
                Top = 41
                Width = 621
                Height = 24
                Properties.DisplayUnchecked = 'False'
                Properties.Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1102' '#1073#1072#1083#1072#1085#1089' '#1089' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1086#1084
                Style.StyleController = dmData.scMain
                TabOrder = 1
                ImeName = 'Russian'
              end
            end
          end
        end
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 164
      Top = 0
      Width = 8
      Height = 448
      Cursor = crHSplit
      HotZoneClassName = 'TcxMediaPlayer9Style'
      HotZone.LightColor = clWhite
      Control = tvMain
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 748
    TabOrder = 3
    inherited panTitleButtons: TssPanel
      Left = 690
    end
  end
  inherited panButtons: TPanel
    Top = 495
    Width = 748
    inherited btnOK: TxButton
      Left = 442
    end
    inherited btnCancel: TxButton
      Left = 545
    end
    inherited btnApply: TxButton
      Left = 649
    end
  end
  inherited panToolBar: TPanel
    Width = 748
    TabOrder = 2
    inherited btnLock: TssSpeedButton
      Left = 677
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 704
    end
    inherited btnHelp: TssSpeedButton
      Left = 731
    end
  end
  inherited FormStorage: TssFormStorage
    Left = 36
    Top = 152
  end
  inherited ActionList: TActionList
    Images = dmData.Images
    Left = 68
    Top = 152
    object aCheckGroup: TAction
      Caption = 'aCheckGroup'
      ImageIndex = 34
      OnExecute = aCheckGroupExecute
    end
    object aUnCheckGroup: TAction
      Caption = 'aUnCheckGroup'
      ImageIndex = 35
      OnExecute = aUncheckGroupExecute
    end
    object aCheckAll: TAction
      Caption = 'aCheckAll'
      ImageIndex = 34
      OnExecute = aCheckAllExecute
    end
    object aUnCheckAll: TAction
      Caption = 'aUnCheckAll'
      ImageIndex = 35
      OnExecute = aUnCheckAllExecute
    end
    object aWHP_CheckAll: TAction
      Caption = 'aWHP_CheckAll'
      ImageIndex = 34
      OnExecute = aWHP_CheckAllExecute
    end
    object aWHP_UncheckAll: TAction
      Tag = 1
      Caption = 'aWHP_UncheckAll'
      ImageIndex = 35
      OnExecute = aWHP_CheckAllExecute
    end
  end
  object srcRights: TDataSource
    DataSet = cdsRights
    Left = 116
    Top = 108
  end
  object cdsRights: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'profid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'lang'
        ParamType = ptUnknown
      end>
    ProviderName = 'pUserTreeView_Get'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsRightsBeforeOpen
    AfterOpen = cdsRightsAfterOpen
    Macros = <>
    Left = 144
    Top = 108
  end
  object pmCheck: TTBPopupMenu
    Images = dmData.Images
    Left = 84
    Top = 224
    object TBItem1: TTBItem
      Action = aCheckGroup
      Images = dmData.Images
    end
    object TBItem2: TTBItem
      Action = aUnCheckGroup
    end
    object TBSeparatorItem1: TTBSeparatorItem
    end
    object TBItem4: TTBItem
      Action = aCheckAll
    end
    object TBItem3: TTBItem
      Action = aUnCheckAll
    end
  end
  object cdsWHPerm: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'userid'
        ParamType = ptUnknown
        Value = '0'
      end>
    ProviderName = 'pWHPerm_Get'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsWHPermBeforeOpen
    Macros = <>
    Left = 144
    Top = 160
  end
  object srcWHPerm: TDataSource
    DataSet = cdsWHPerm
    Left = 116
    Top = 160
  end
  object pmWHPerm: TTBPopupMenu
    Images = dmData.Images
    Left = 40
    Top = 220
    object TBItem7: TTBItem
      Action = aWHP_CheckAll
    end
    object TBItem8: TTBItem
      Action = aWHP_UncheckAll
    end
  end
end
