object wRedmineTicketsForm: TwRedmineTicketsForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Tickets'
  ClientHeight = 480
  ClientWidth = 640
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object pnHeader: TQzPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 49
    Edges = [qeBottom]
    Align = alTop
    BorderWidth = 1
    TabOrder = 0
    object txCaption: TLabel
      Left = 64
      Top = 8
      Width = 73
      Height = 32
      Caption = 'Tickets'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object imIcon: TVirtualImage
      Left = 12
      Top = 8
      Width = 32
      Height = 32
      ImageCollection = dmCommon.icSvgIcons
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 31
      ImageName = '031_Ticket'
    end
    object btRefresh: TSpeedButton
      AlignWithMargins = True
      Left = 601
      Top = 7
      Width = 32
      Height = 34
      Hint = 'Ticketliste manuell aktualisieren'
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 7
      Margins.Bottom = 7
      Align = alRight
      ImageIndex = 33
      ImageName = '033_Refresh'
      Images = vilLargeIcons
      OnClick = btRefreshClick
      ExplicitLeft = 600
      ExplicitHeight = 32
    end
    object aiRefresh: TActivityIndicator
      AlignWithMargins = True
      Left = 555
      Top = 7
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 7
      Margins.Bottom = 7
      Align = alRight
      IndicatorType = aitRefresh
    end
    object tsActive: TToggleSwitch
      AlignWithMargins = True
      Left = 465
      Top = 7
      Width = 76
      Height = 34
      Hint = 'automatische Aktualisierung ein-/ausschalten'
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 7
      Margins.Bottom = 7
      Align = alRight
      TabOrder = 1
      ThumbWidth = 20
      OnClick = tsActiveClick
      ExplicitHeight = 20
    end
  end
  object vtTickets: TVirtualStringTree
    Left = 0
    Top = 117
    Width = 640
    Height = 363
    Align = alClient
    Colors.BorderColor = 15987699
    Colors.DisabledColor = clGray
    Colors.DropMarkColor = 15385233
    Colors.DropTargetColor = 15385233
    Colors.DropTargetBorderColor = 15385233
    Colors.FocusedSelectionColor = 15385233
    Colors.FocusedSelectionBorderColor = 15385233
    Colors.GridLineColor = 15987699
    Colors.HeaderHotColor = clBlack
    Colors.HotColor = clBlack
    Colors.SelectionRectangleBlendColor = 15385233
    Colors.SelectionRectangleBorderColor = 15385233
    Colors.SelectionTextColor = clBlack
    Colors.TreeLineColor = 9471874
    Colors.UnfocusedColor = clGray
    Colors.UnfocusedSelectionColor = clWhite
    Colors.UnfocusedSelectionBorderColor = clWhite
    Header.AutoSizeIndex = -1
    Header.MainColumn = -1
    Images = vilTreeIcons
    PopupMenu = pmTickets
    TabOrder = 1
    TreeOptions.MiscOptions = [toAcceptOLEDrop, toFullRepaintOnResize, toInitOnSave, toWheelPanning, toEditOnClick]
    OnDblClick = vtTicketsDblClick
    Touch.InteractiveGestures = [igPan, igPressAndTap]
    Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
    Columns = <>
  end
  object tsProjects: TTabSet
    Left = 0
    Top = 49
    Width = 640
    Height = 33
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Images = vilTreeIcons
    SoftTop = True
    Style = tsIDETabs
    TabHeight = 30
    TabPosition = tpTop
    OnChange = tsProjectsChange
    OnGetImageIndex = tsProjectsGetImageIndex
    OnMouseDown = tsProjectsMouseDown
    OnMouseMove = tsProjectsMouseMove
    OnMouseUp = tsProjectsMouseUp
  end
  object pnToolbar: TQzPanel
    Left = 0
    Top = 82
    Width = 640
    Height = 35
    Edges = [qeTop]
    Align = alTop
    BorderWidth = 1
    TabOrder = 3
    object edFind: TSearchBox
      Left = 12
      Top = 6
      Width = 121
      Height = 23
      Hint = 'Einschr'#228'nken auf Haupt-Ticket'
      NumbersOnly = True
      TabOrder = 0
      TextHint = 'Ticket #'
      OnInvokeSearch = edFindInvokeSearch
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
      end
      item
        CollectionIndex = 35
        CollectionName = '035_Chevron_Right'
        Name = '035_Chevron_Right'
      end
      item
        CollectionIndex = 36
        CollectionName = '036_Close'
        Name = '036_Close'
      end>
    ImageCollection = dmCommon.icSvgIcons
    Width = 32
    Height = 32
    Left = 332
    Top = 72
  end
  object vilTreeIcons: TVirtualImageList
    Images = <
      item
        CollectionIndex = 31
        CollectionName = '031_Ticket'
        Name = '031_Ticket'
      end
      item
        CollectionIndex = 9
        CollectionName = '009_Expand'
        Name = '009_Expand'
      end
      item
        CollectionIndex = 35
        CollectionName = '035_Chevron_Right'
        Name = '035_Chevron_Right'
      end>
    ImageCollection = dmCommon.icSvgIcons
    Left = 408
    Top = 72
  end
  object tiRefresh: TTimer
    Enabled = False
    OnTimer = tiRefreshTimer
    Left = 496
    Top = 76
  end
  object alActions: TActionList
    Left = 412
    Top = 196
    object acCollapseAll: TAction
      Caption = 'Alle &einklappen'
      OnExecute = acCollapseAllExecute
    end
    object acExpandAll: TAction
      Caption = 'Alle aus&klappen'
      OnExecute = acExpandAllExecute
    end
    object acRefresh: TAction
      Caption = '&Aktualisieren'
      ImageIndex = 33
      OnExecute = acRefreshExecute
    end
  end
  object pmTickets: TPopupMenu
    Left = 480
    Top = 196
    object Aktualisieren1: TMenuItem
      Action = acRefresh
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Alleausklappen1: TMenuItem
      Action = acExpandAll
    end
    object Alleeinklappen1: TMenuItem
      Action = acCollapseAll
    end
  end
end
