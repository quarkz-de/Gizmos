object wMainForm: TwMainForm
  Left = 0
  Top = 0
  BiDiMode = bdLeftToRight
  Caption = 'Qizmos'
  ClientHeight = 569
  ClientWidth = 909
  Color = clBtnFace
  CustomTitleBar.CaptionAlignment = taCenter
  CustomTitleBar.Height = 31
  Constraints.MinHeight = 300
  Constraints.MinWidth = 600
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  GlassFrame.Top = 31
  ParentBiDiMode = False
  StyleElements = [seFont, seClient]
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 17
  object sh1: TShape
    Left = 170
    Top = 0
    Width = 1
    Height = 569
    Align = alLeft
    Brush.Style = bsClear
    Pen.Color = clWindowFrame
  end
  object svSplitView: TSplitView
    Left = 0
    Top = 0
    Width = 170
    Height = 569
    CloseStyle = svcCompact
    CompactWidth = 60
    OpenedWidth = 170
    Placement = svpLeft
    TabOrder = 0
    OnClosed = svSplitViewClosed
    OnOpened = svSplitViewOpened
    object pnl1: TPanel
      Left = 0
      Top = 0
      Width = 170
      Height = 45
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object imBurgerButton: TVirtualImage
        Left = 15
        Top = 7
        Width = 32
        Height = 32
        ImageCollection = dmCommon.icIcons
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = 0
        ImageName = '000_Menu'
        OnClick = imBurgerButtonClick
      end
    end
    object nvHeader: TQzNavigationView
      Left = 0
      Top = 45
      Width = 170
      Height = 476
      Align = alClient
      BorderStyle = bsNone
      ButtonHeight = 48
      ButtonOptions = [nboGroupStyle, nboShowCaptions]
      Images = vilLargeIcons
      Items = <
        item
          Action = acSectionWelcome
          ImageIndex = 5
          ImageName = '005_Start'
          AllowReorder = False
        end
        item
          Action = acSectionSimulators
        end>
      ItemIndex = 0
      TabOrder = 1
      OnButtonClicked = nvHeaderButtonClicked
    end
    object nvFooter: TQzNavigationView
      Left = 0
      Top = 521
      Width = 170
      Height = 48
      Align = alBottom
      BorderStyle = bsNone
      ButtonHeight = 48
      ButtonOptions = [nboGroupStyle, nboShowCaptions]
      Images = vilLargeIcons
      Items = <
        item
          Action = acSectionSettings
          Caption = 'Einstellungen'
        end>
      TabOrder = 2
      OnButtonClicked = nvFooterButtonClicked
    end
  end
  object vilLargeIcons: TVirtualImageList
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
      end>
    ImageCollection = dmCommon.icIcons
    Width = 32
    Height = 32
    Left = 304
    Top = 16
  end
  object vilIcons: TVirtualImageList
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
      end>
    ImageCollection = dmCommon.icIcons
    Left = 252
    Top = 16
  end
  object alActions: TActionList
    Left = 200
    Top = 16
    object acSectionWelcome: TAction
      Category = 'Section'
      AutoCheck = True
      Caption = 'Start'
      GroupIndex = 1
      ImageIndex = 1
      ImageName = '001_Home'
      OnExecute = acSectionWelcomeExecute
    end
    object acSectionSettings: TAction
      Category = 'Section'
      Caption = 'Settings'
      GroupIndex = 1
      ImageIndex = 2
      ImageName = '002_Settings'
      OnExecute = acSectionSettingsExecute
    end
    object acSectionSimulators: TAction
      Category = 'Section'
      Caption = 'Simulatoren'
      ImageIndex = 6
      OnExecute = acSectionSimulatorsExecute
    end
  end
end
