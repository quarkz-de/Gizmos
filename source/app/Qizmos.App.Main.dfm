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
  object pnHeader: TQzPanel
    Left = 0
    Top = 0
    Width = 909
    Height = 45
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 8
    Edges = [qeBottom]
    Align = alTop
    BorderWidth = 1
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      909
      45)
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
      ImageCollection = dmCommon.icSvgIcons
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 28
      ImageName = '028_Apps'
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
    object btSwitchStyle: TSpeedButton
      Left = 873
      Top = 7
      Width = 32
      Height = 32
      Anchors = [akTop, akRight]
      ImageIndex = 27
      ImageName = '027_Light_Dark_Style'
      Images = vilLargeIcons
      OnClick = btSwitchStyleClick
    end
  end
  object pnFormContainer: TQzPanel
    Left = 176
    Top = 45
    Width = 733
    Height = 524
    Edges = [qeLeft]
    Align = alClient
    BorderWidth = 1
    TabOrder = 1
  end
  object svSplitView: TSplitView
    AlignWithMargins = True
    Left = 3
    Top = 48
    Width = 170
    Height = 518
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
      Height = 470
      Align = alClient
      BorderStyle = bsNone
      ButtonHeight = 48
      ButtonOptions = [nboGroupStyle, nboShowCaptions]
      Images = vilLargeIcons
      Items = <>
      TabOrder = 0
      OnButtonClicked = nvHeaderButtonClicked
    end
    object nvFooter: TQzNavigationView
      Left = 0
      Top = 470
      Width = 170
      Height = 48
      Align = alBottom
      BorderStyle = bsNone
      ButtonHeight = 48
      ButtonOptions = [nboGroupStyle, nboShowCaptions]
      Images = vilLargeIcons
      Items = <>
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
      end
      item
        CollectionIndex = 11
        CollectionName = '011_Notebook'
        Name = '011_Notebook'
      end
      item
        CollectionIndex = 12
        CollectionName = '012_Note'
        Name = '012_Note'
      end
      item
        CollectionIndex = 13
        CollectionName = '013_Delete'
        Name = '013_Delete'
      end
      item
        CollectionIndex = 14
        CollectionName = '014_Edit'
        Name = '014_Edit'
      end
      item
        CollectionIndex = 15
        CollectionName = '015_Bold'
        Name = '015_Bold'
      end
      item
        CollectionIndex = 16
        CollectionName = '016_Italic'
        Name = '016_Italic'
      end
      item
        CollectionIndex = 17
        CollectionName = '017_Strikethrough'
        Name = '017_Strikethrough'
      end
      item
        CollectionIndex = 18
        CollectionName = '018_Header_1'
        Name = '018_Header_1'
      end
      item
        CollectionIndex = 19
        CollectionName = '019_Header_2'
        Name = '019_Header_2'
      end
      item
        CollectionIndex = 20
        CollectionName = '020_Header_3'
        Name = '020_Header_3'
      end
      item
        CollectionIndex = 21
        CollectionName = '021_Source_Code'
        Name = '021_Source_Code'
      end
      item
        CollectionIndex = 22
        CollectionName = '022_Horizontal_Line'
        Name = '022_Horizontal_Line'
      end
      item
        CollectionIndex = 23
        CollectionName = '023_Bulleted_List'
        Name = '023_Bulleted_List'
      end
      item
        CollectionIndex = 24
        CollectionName = '024_Numbered_List'
        Name = '024_Numbered_List'
      end
      item
        CollectionIndex = 25
        CollectionName = '025_Link'
        Name = '025_Link'
      end
      item
        CollectionIndex = 26
        CollectionName = '026_Folder'
        Name = '026_Folder'
      end
      item
        CollectionIndex = 27
        CollectionName = '027_Light_Dark_Style'
        Name = '027_Light_Dark_Style'
      end
      item
        CollectionIndex = 28
        CollectionName = '028_Apps'
        Name = '028_Apps'
      end
      item
        CollectionIndex = 29
        CollectionName = '029_Redmine'
        Name = '029_Redmine'
      end
      item
        CollectionIndex = 30
        CollectionName = '030_User'
        Name = '030_User'
      end
      item
        CollectionIndex = 31
        CollectionName = '031_Ticket'
        Name = '031_Ticket'
      end
      item
        CollectionIndex = 32
        CollectionName = '032_External_Link'
        Name = '032_External_Link'
      end
      item
        CollectionIndex = 33
        CollectionName = '033_Refresh'
        Name = '033_Refresh'
      end
      item
        CollectionIndex = 34
        CollectionName = '034_Project'
        Name = '034_Project'
      end>
    ImageCollection = dmCommon.icSvgIcons
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
      end
      item
        CollectionIndex = 11
        CollectionName = '011_Notebook'
        Name = '011_Notebook'
      end
      item
        CollectionIndex = 12
        CollectionName = '012_Note'
        Name = '012_Note'
      end
      item
        CollectionIndex = 13
        CollectionName = '013_Delete'
        Name = '013_Delete'
      end
      item
        CollectionIndex = 14
        CollectionName = '014_Edit'
        Name = '014_Edit'
      end
      item
        CollectionIndex = 15
        CollectionName = '015_Bold'
        Name = '015_Bold'
      end
      item
        CollectionIndex = 16
        CollectionName = '016_Italic'
        Name = '016_Italic'
      end
      item
        CollectionIndex = 17
        CollectionName = '017_Strikethrough'
        Name = '017_Strikethrough'
      end
      item
        CollectionIndex = 18
        CollectionName = '018_Header_1'
        Name = '018_Header_1'
      end
      item
        CollectionIndex = 19
        CollectionName = '019_Header_2'
        Name = '019_Header_2'
      end
      item
        CollectionIndex = 20
        CollectionName = '020_Header_3'
        Name = '020_Header_3'
      end
      item
        CollectionIndex = 21
        CollectionName = '021_Source_Code'
        Name = '021_Source_Code'
      end
      item
        CollectionIndex = 22
        CollectionName = '022_Horizontal_Line'
        Name = '022_Horizontal_Line'
      end
      item
        CollectionIndex = 23
        CollectionName = '023_Bulleted_List'
        Name = '023_Bulleted_List'
      end
      item
        CollectionIndex = 24
        CollectionName = '024_Numbered_List'
        Name = '024_Numbered_List'
      end
      item
        CollectionIndex = 25
        CollectionName = '025_Link'
        Name = '025_Link'
      end
      item
        CollectionIndex = 26
        CollectionName = '026_Folder'
        Name = '026_Folder'
      end
      item
        CollectionIndex = 27
        CollectionName = '027_Light_Dark_Style'
        Name = '027_Light_Dark_Style'
      end
      item
        CollectionIndex = 28
        CollectionName = '028_Apps'
        Name = '028_Apps'
      end
      item
        CollectionIndex = 29
        CollectionName = '029_Redmine'
        Name = '029_Redmine'
      end
      item
        CollectionIndex = 30
        CollectionName = '030_User'
        Name = '030_User'
      end
      item
        CollectionIndex = 31
        CollectionName = '031_Ticket'
        Name = '031_Ticket'
      end
      item
        CollectionIndex = 32
        CollectionName = '032_External_Link'
        Name = '032_External_Link'
      end
      item
        CollectionIndex = 33
        CollectionName = '033_Refresh'
        Name = '033_Refresh'
      end
      item
        CollectionIndex = 34
        CollectionName = '034_Project'
        Name = '034_Project'
      end>
    ImageCollection = dmCommon.icSvgIcons
    Left = 256
    Top = 76
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
