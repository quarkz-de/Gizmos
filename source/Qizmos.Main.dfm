object wMainForm: TwMainForm
  Left = 0
  Top = 0
  Margins.Top = 6
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
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  GlassFrame.Top = 31
  ParentBiDiMode = False
  StyleElements = [seFont, seClient]
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 21
  object pnHeader: TPanel
    AlignWithMargins = True
    Left = 8
    Top = 8
    Width = 893
    Height = 45
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 8
    Align = alTop
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    object shHeader: TShape
      Left = 0
      Top = 0
      Width = 893
      Height = 45
      Align = alClient
      Brush.Color = clWindow
      Pen.Style = psClear
      Shape = stRoundRect
      ExplicitLeft = 1
      ExplicitTop = -8
      ExplicitWidth = 901
      ExplicitHeight = 49
    end
    object txCaption: TLabel
      Left = 114
      Top = 7
      Width = 48
      Height = 32
      Caption = 'Start'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object imIcon: TVirtualImage
      Left = 66
      Top = 7
      Width = 32
      Height = 32
      ImageCollection = dmCommon.icDarkIcons
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 5
      ImageName = '005_Start'
    end
    object btBurgerButton: TSpeedButton
      Left = 7
      Top = 7
      Width = 32
      Height = 32
      ImageIndex = 0
      ImageName = '000_Menu'
      Images = vilLargeIcons
      OnClick = btBurgerButtonClick
    end
  end
  object pnFormContainer: TQzPanel
    Left = 176
    Top = 61
    Width = 733
    Height = 508
    Edges = [qeLeft]
    Align = alClient
    BorderWidth = 1
    TabOrder = 1
  end
  object svSplitView: TSplitView
    AlignWithMargins = True
    Left = 3
    Top = 64
    Width = 170
    Height = 502
    BevelEdges = []
    BevelKind = bkFlat
    CloseStyle = svcCompact
    CompactWidth = 60
    OpenedWidth = 170
    Placement = svpLeft
    TabOrder = 2
    OnClosed = svSplitViewClosed
    OnOpened = svSplitViewOpened
    object nvHeader: TQzNavigationView
      Left = 0
      Top = 0
      Width = 170
      Height = 454
      Align = alClient
      BorderStyle = bsNone
      ButtonHeight = 48
      ButtonOptions = [nboGroupStyle, nboShowCaptions]
      Images = vilLargeIcons
      Items = <
        item
          Action = acSectionWelcome
          AllowReorder = False
        end
        item
          Action = acSectionSimulators
        end>
      ItemIndex = 0
      TabOrder = 0
      OnButtonClicked = nvHeaderButtonClicked
    end
    object nvFooter: TQzNavigationView
      Left = 0
      Top = 454
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
        end>
      TabOrder = 1
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
    Width = 32
    Height = 32
    Left = 308
    Top = 76
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
    Left = 256
    Top = 76
  end
  object alActions: TActionList
    Images = vilLargeIcons
    Left = 204
    Top = 76
    object acSectionWelcome: TAction
      Category = 'Section'
      AutoCheck = True
      Caption = 'Start'
      GroupIndex = 1
      ImageIndex = 5
      ImageName = '005_Start'
      OnExecute = acSectionWelcomeExecute
    end
    object acSectionSettings: TAction
      Category = 'Section'
      Caption = 'Einstellungen'
      GroupIndex = 1
      ImageIndex = 2
      ImageName = '002_Settings'
      OnExecute = acSectionSettingsExecute
    end
    object acSectionSimulators: TAction
      Category = 'Section'
      Caption = 'Simulatoren'
      ImageIndex = 6
      ImageName = '006_Simulator'
      OnExecute = acSectionSimulatorsExecute
    end
  end
  object tiTrayIcon: TTrayIcon
    OnClick = tiTrayIconClick
    OnDblClick = tiTrayIconDblClick
    Left = 376
    Top = 76
  end
  object aeAppEvents: TApplicationEvents
    OnMinimize = aeAppEventsMinimize
    Left = 432
    Top = 76
  end
end
