object wSettingsForm: TwSettingsForm
  Left = 0
  Top = 0
  BiDiMode = bdLeftToRight
  BorderStyle = bsNone
  ClientHeight = 468
  ClientWidth = 777
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentBiDiMode = False
  OnCreate = FormCreate
  TextHeight = 13
  object nvSettings: TQzNavigationView
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 170
    Height = 462
    Align = alLeft
    BorderStyle = bsNone
    ButtonHeight = 40
    ButtonOptions = [nboGroupStyle, nboShowCaptions]
    Images = viImages
    Items = <
      item
        Action = acSettings
        Caption = 'Allgemein'
      end
      item
        Action = acSimulators
      end
      item
        Action = acInfo
      end>
    ItemIndex = 0
    TabOrder = 0
  end
  object pnFormContainer: TQzPanel
    Left = 176
    Top = 0
    Width = 601
    Height = 468
    Edges = [qeLeft]
    Align = alClient
    BorderWidth = 1
    TabOrder = 1
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
      end
      item
        CollectionIndex = 9
        CollectionName = '009_Expand'
        Name = '009_Expand'
      end
      item
        CollectionIndex = 10
        CollectionName = '010_Collapse'
        Name = '010_Collapse'
      end>
    ImageCollection = dmCommon.icDarkIcons
    Width = 24
    Height = 24
    Left = 688
    Top = 100
  end
  object alActions: TActionList
    Images = viImages
    Left = 688
    Top = 56
    object acSettings: TAction
      Caption = 'Einstellungen'
      Checked = True
      GroupIndex = 1
      ImageIndex = 2
      ImageName = '002_Settings'
      OnExecute = acSettingsExecute
    end
    object acInfo: TAction
      Caption = 'Info'
      GroupIndex = 1
      ImageIndex = 1
      ImageName = '001_Help'
      OnExecute = acInfoExecute
    end
    object acSimulators: TAction
      Caption = 'Simulatoren'
      ImageIndex = 6
      ImageName = '006_Simulator'
      OnExecute = acSimulatorsExecute
    end
  end
end
