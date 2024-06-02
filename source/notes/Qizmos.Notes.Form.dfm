object wNotesForm: TwNotesForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Notizen'
  ClientHeight = 543
  ClientWidth = 871
  Color = clBtnFace
  ParentFont = True
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnDeactivate = FormDeactivate
  TextHeight = 15
  object spSplitter: TSplitter
    Left = 233
    Top = 41
    Height = 502
    ExplicitLeft = 221
    ExplicitTop = 16
    ExplicitHeight = 527
  end
  object pcNote: TPageControl
    AlignWithMargins = True
    Left = 239
    Top = 44
    Width = 629
    Height = 496
    ActivePage = tsView
    Align = alClient
    TabHeight = 30
    TabOrder = 0
    TabWidth = 80
    OnChanging = pcNoteChanging
    object tsEdit: TTabSheet
      Caption = 'Bearbeiten'
      object edText: TSynEdit
        Left = 0
        Top = 27
        Width = 621
        Height = 429
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Consolas'
        Font.Pitch = fpFixed
        Font.Style = []
        Font.Quality = fqClearTypeNatural
        TabOrder = 0
        UseCodeFolding = False
        BorderStyle = bsNone
        Gutter.Font.Charset = DEFAULT_CHARSET
        Gutter.Font.Color = clWindowText
        Gutter.Font.Height = -11
        Gutter.Font.Name = 'Consolas'
        Gutter.Font.Style = []
        Gutter.ShowLineNumbers = True
        Gutter.Bands = <
          item
            Kind = gbkMarks
            Width = 13
          end
          item
            Kind = gbkLineNumbers
          end
          item
            Kind = gbkFold
          end
          item
            Kind = gbkTrackChanges
          end
          item
            Kind = gbkMargin
            Width = 3
          end>
        Highlighter = synUri
        RightEdge = 0
        SelectedColor.Alpha = 0.400000005960464500
      end
      object tbEditor: TActionToolBar
        Left = 0
        Top = 0
        Width = 621
        Height = 27
        ActionManager = amActions
        Caption = 'tbEditor'
        Color = clMenuBar
        ColorMap.DisabledFontColor = 10461087
        ColorMap.HighlightColor = clWhite
        ColorMap.BtnSelectedFont = clBlack
        ColorMap.UnusedColor = clWhite
        EdgeBorders = [ebBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Spacing = 0
      end
    end
    object tsView: TTabSheet
      Caption = 'Anzeige'
      ImageIndex = 1
      object hvText: THtmlViewer
        Left = 0
        Top = 0
        Width = 621
        Height = 456
        BorderStyle = htNone
        DefFontName = 'Segoe UI'
        DefFontSize = 10
        DefHotSpotColor = clHighlight
        DefOverLinkColor = clHighlight
        DefPreFontName = 'Consolas'
        DefVisitedLinkColor = clHighlight
        HistoryMaxCount = 0
        NoSelect = False
        PrintMarginBottom = 2.000000000000000000
        PrintMarginLeft = 2.000000000000000000
        PrintMarginRight = 2.000000000000000000
        PrintMarginTop = 2.000000000000000000
        PrintScale = 1.000000000000000000
        Text = ''
        OnHotSpotClick = hvTextHotSpotClick
        Align = alClient
        TabOrder = 0
        Touch.InteractiveGestures = [igPan]
        Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia]
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 233
    Height = 502
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object vtNotebook: TVirtualStringTree
      Left = 0
      Top = 0
      Width = 233
      Height = 502
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
      DragOperations = [doMove]
      DragType = dtVCL
      Header.AutoSizeIndex = 0
      Header.MainColumn = -1
      Images = vilIcons
      TabOrder = 0
      OnFocusChanged = vtNotebookFocusChanged
      OnFocusChanging = vtNotebookFocusChanging
      Touch.InteractiveGestures = [igPan, igPressAndTap]
      Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
      Columns = <>
    end
  end
  object pnHeader: TQzPanel
    Left = 0
    Top = 0
    Width = 871
    Height = 41
    Edges = [qeBottom]
    Align = alTop
    BorderWidth = 1
    TabOrder = 2
    object tbNotes: TToolBar
      AlignWithMargins = True
      Left = 4
      Top = 5
      Width = 863
      Height = 31
      Margins.Left = 4
      Margins.Top = 5
      Margins.Right = 4
      Margins.Bottom = 4
      ButtonHeight = 30
      ButtonWidth = 107
      Caption = 'tbNotes'
      Images = vilIcons24
      List = True
      ShowCaptions = True
      TabOrder = 0
      object btSelectFolder: TToolButton
        Left = 0
        Top = 0
        Action = acSelectFolder
        AutoSize = True
      end
      object btSeparator1: TToolButton
        Left = 76
        Top = 0
        Width = 8
        Caption = 'btSeparator1'
        ImageIndex = 14
        ImageName = '014_Edit'
        Style = tbsSeparator
      end
      object btNewNotebook: TToolButton
        Left = 84
        Top = 0
        Action = acNewNotebook
        AutoSize = True
      end
      object btNewNote: TToolButton
        Left = 195
        Top = 0
        Action = acNewNote
        AutoSize = True
      end
      object btDeleteNote: TToolButton
        Left = 293
        Top = 0
        Action = acDeleteItem
        AutoSize = True
      end
    end
  end
  object Connectors: ThtConnectionManager
    Left = 116
    Top = 88
  end
  object FileConnector: ThtFileConnector
    ConnectionManager = Connectors
    Left = 116
    Top = 136
  end
  object ResourceConnector: ThtResourceConnector
    ConnectionManager = Connectors
    Left = 117
    Top = 184
  end
  object pmNotes: TPopupMenu
    Images = vilIcons
    Left = 24
    Top = 180
    object miNewNotebook: TMenuItem
      Action = acNewNotebook
    end
    object miNewNote: TMenuItem
      Action = acNewNote
    end
    object miDeleteItem: TMenuItem
      Action = acDeleteItem
    end
  end
  object amActions: TActionManager
    ActionBars = <
      item
      end
      item
        Items = <
          item
            Action = acFormatBold
            ImageIndex = 15
            ImageName = '015_Bold'
            ShowCaption = False
            ShortCut = 16450
          end
          item
            Action = acFormatItalic
            ImageIndex = 16
            ImageName = '016_Italic'
            ShowCaption = False
            ShortCut = 16457
          end
          item
            Action = acFormatStrikeThrough
            ImageIndex = 17
            ImageName = '017_Strikethrough'
            ShowCaption = False
          end
          item
            Caption = '|'
            CommandStyle = csSeparator
            CommandProperties.Width = -1
            CommandProperties.Font.Charset = DEFAULT_CHARSET
            CommandProperties.Font.Color = clWindowText
            CommandProperties.Font.Height = -11
            CommandProperties.Font.Name = 'Tahoma'
            CommandProperties.Font.Style = []
            CommandProperties.ParentFont = False
          end
          item
            Action = acFormatHeading1
            ImageIndex = 18
            ImageName = '018_Header_1'
            ShowCaption = False
            ShortCut = 16433
          end
          item
            Action = acFormatHeading2
            ImageIndex = 19
            ImageName = '019_Header_2'
            ShowCaption = False
            ShortCut = 16434
          end
          item
            Action = acFormatHeading3
            ImageIndex = 20
            ImageName = '020_Header_3'
            ShowCaption = False
            ShortCut = 16435
          end
          item
            Caption = '|'
            CommandStyle = csSeparator
            CommandProperties.Width = -1
            CommandProperties.Font.Charset = DEFAULT_CHARSET
            CommandProperties.Font.Color = clWindowText
            CommandProperties.Font.Height = -11
            CommandProperties.Font.Name = 'Tahoma'
            CommandProperties.Font.Style = []
            CommandProperties.ParentFont = False
          end
          item
            Action = acFormatCode
            ImageIndex = 21
            ImageName = '021_Source_Code'
            ShowCaption = False
            ShortCut = 24643
          end
          item
            Action = acFormatBulletedList
            ImageIndex = 23
            ImageName = '023_Bulleted_List'
            ShowCaption = False
            ShortCut = 24661
          end
          item
            Action = acFormatNumberedList
            ImageIndex = 24
            ImageName = '024_Numbered_List'
            ShowCaption = False
            ShortCut = 24655
          end
          item
            Caption = '|'
            CommandStyle = csSeparator
            CommandProperties.Width = -1
            CommandProperties.Font.Charset = DEFAULT_CHARSET
            CommandProperties.Font.Color = clWindowText
            CommandProperties.Font.Height = -11
            CommandProperties.Font.Name = 'Tahoma'
            CommandProperties.Font.Style = []
            CommandProperties.ParentFont = False
          end
          item
            Action = acFormatInsertLink
            ImageIndex = 25
            ImageName = '025_Link'
            ShowCaption = False
            ShortCut = 24652
          end>
        ActionBar = tbEditor
      end>
    Images = vilIcons
    State = asSuspended
    Left = 25
    Top = 88
    StyleName = 'Platform Default'
    object acNewNotebook: TAction
      Category = 'Notes'
      Caption = 'Neuer &Ordner'
      Hint = 'Neues Notizbuch'
      ImageIndex = 26
      ImageName = '026_Folder'
      OnExecute = acNewNotebookExecute
    end
    object acNewNote: TAction
      Category = 'Notes'
      Caption = '&Neue Notiz'
      Hint = 'Neue Notiz'
      ImageIndex = 12
      ImageName = '012_Note'
      OnExecute = acNewNoteExecute
    end
    object acDeleteItem: TAction
      Category = 'Notes'
      Caption = '&L'#246'schen'
      Hint = 'Element l'#246'schen'
      ImageIndex = 13
      ImageName = '013_Delete'
      OnExecute = acDeleteItemExecute
    end
    object acFormatBold: TAction
      Category = 'Format'
      Caption = '&Fett'
      ImageIndex = 15
      ImageName = '015_Bold'
      ShortCut = 16450
      OnExecute = acFormatBoldExecute
    end
    object acFormatItalic: TAction
      Category = 'Format'
      Caption = '&Kursiv'
      ImageIndex = 16
      ImageName = '016_Italic'
      ShortCut = 16457
      OnExecute = acFormatItalicExecute
    end
    object acFormatStrikeThrough: TAction
      Category = 'Format'
      Caption = '&Durchgestrichen'
      ImageIndex = 17
      ImageName = '017_Strikethrough'
      OnExecute = acFormatStrikeThroughExecute
    end
    object acFormatHeading1: TAction
      Category = 'Format'
      Caption = #220'berschrift &1'
      ImageIndex = 18
      ImageName = '018_Header_1'
      ShortCut = 16433
      OnExecute = acFormatHeading1Execute
    end
    object acFormatHeading2: TAction
      Category = 'Format'
      Caption = #220'berschrift &2'
      ImageIndex = 19
      ImageName = '019_Header_2'
      ShortCut = 16434
      OnExecute = acFormatHeading2Execute
    end
    object acFormatHeading3: TAction
      Category = 'Format'
      Caption = #220'berschrift &3'
      ImageIndex = 20
      ImageName = '020_Header_3'
      ShortCut = 16435
      OnExecute = acFormatHeading3Execute
    end
    object acFormatCode: TAction
      Category = 'Format'
      Caption = '&Code'
      ImageIndex = 21
      ImageName = '021_Source_Code'
      ShortCut = 24643
      OnExecute = acFormatCodeExecute
    end
    object acFormatBulletedList: TAction
      Category = 'Format'
      Caption = 'Auf&z'#228'hlung'
      ImageIndex = 23
      ImageName = '023_Bulleted_List'
      ShortCut = 24661
      OnExecute = acFormatBulletedListExecute
    end
    object acFormatNumberedList: TAction
      Category = 'Format'
      Caption = 'Nummerierte &Liste'
      ImageIndex = 24
      ImageName = '024_Numbered_List'
      ShortCut = 24655
      OnExecute = acFormatNumberedListExecute
    end
    object acFormatInsertLink: TAction
      Category = 'Format'
      Caption = 'L&ink'
      ImageIndex = 25
      ImageName = '025_Link'
      ShortCut = 24652
    end
    object acSelectFolder: TAction
      Category = 'Notes'
      Caption = #214'&ffnen'
      ImageIndex = 11
      ImageName = '011_Notebook'
      OnExecute = acSelectFolderExecute
    end
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
      end>
    ImageCollection = dmCommon.icSvgIcons
    Left = 24
    Top = 132
  end
  object vilIcons24: TVirtualImageList
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
      end>
    ImageCollection = dmCommon.icSvgIcons
    Width = 24
    Height = 24
    Left = 21
    Top = 246
  end
  object synUri: TSynURISyn
    URIAttri.Foreground = 13661955
    VisitedURIAttri.Foreground = 13661955
    Left = 116
    Top = 249
  end
  object dSelectFolder: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = [fdoPickFolders]
    Title = 'Notizen-Ordner ausw'#228'hlen'
    Left = 20
    Top = 317
  end
end
