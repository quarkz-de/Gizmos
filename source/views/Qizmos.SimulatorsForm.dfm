object wSimulatorsForm: TwSimulatorsForm
  Left = 0
  Top = 0
  Caption = 'Simulatoren'
  ClientHeight = 439
  ClientWidth = 616
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object nvSettings: TQzNavigationView
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 170
    Height = 433
    Align = alLeft
    BorderStyle = bsNone
    ButtonHeight = 40
    ButtonOptions = [nboGroupStyle, nboShowCaptions]
    Images = viImages
    Items = <
      item
        Action = acSmtpBlackhole
      end
      item
        Action = acHttpBlackhole
      end>
    ItemIndex = 0
    TabOrder = 0
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitHeight = 439
  end
  object pnFormContainer: TQzPanel
    Left = 176
    Top = 0
    Width = 440
    Height = 439
    Edges = [qeLeft]
    Align = alClient
    BorderWidth = 1
    TabOrder = 1
    ExplicitLeft = 170
    ExplicitWidth = 446
  end
  object alActions: TActionList
    Images = viImages
    Left = 576
    Top = 60
    object acSmtpBlackhole: TAction
      Caption = 'SMTP Blackhole'
      Checked = True
      GroupIndex = 1
      ImageIndex = 7
      ImageName = '007_Mail'
      OnExecute = acSmtpBlackholeExecute
    end
    object acHttpBlackhole: TAction
      Caption = 'HTTP Blackhole'
      GroupIndex = 1
      ImageIndex = 8
      ImageName = '008_Message'
      OnExecute = acHttpBlackholeExecute
    end
  end
  object viImages: TVirtualImageList
    AutoFill = True
    Images = <
      item
        CollectionIndex = 0
        CollectionName = '000_Menu'
        Name = '000_Menu'
      end
      item
        CollectionIndex = 1
        CollectionName = '001_Help'
        Name = '001_Help'
      end
      item
        CollectionIndex = 2
        CollectionName = '002_Settings'
        Name = '002_Settings'
      end
      item
        CollectionIndex = 3
        CollectionName = '003_Menu_Vertical'
        Name = '003_Menu_Vertical'
      end
      item
        CollectionIndex = 4
        CollectionName = '004_Servers'
        Name = '004_Servers'
      end
      item
        CollectionIndex = 5
        CollectionName = '005_Start'
        Name = '005_Start'
      end
      item
        CollectionIndex = 6
        CollectionName = '006_Simulator'
        Name = '006_Simulator'
      end
      item
        CollectionIndex = 7
        CollectionName = '007_Mail'
        Name = '007_Mail'
      end
      item
        CollectionIndex = 8
        CollectionName = '008_Message'
        Name = '008_Message'
      end>
    ImageCollection = dmCommon.icDarkIcons
    Width = 24
    Height = 24
    Left = 576
    Top = 104
  end
end
