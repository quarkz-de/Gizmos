object wSimulatorsForm: TwSimulatorsForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Simulatoren'
  ClientHeight = 474
  ClientWidth = 616
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object nvNavigation: TQzNavigationView
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 170
    Height = 468
    Align = alLeft
    BorderStyle = bsNone
    ButtonHeight = 40
    ButtonOptions = [nboGroupStyle, nboShowCaptions]
    Images = viImages
    Items = <>
    TabOrder = 0
    OnButtonClicked = nvNavigationButtonClicked
  end
  object pnFormContainer: TQzPanel
    Left = 176
    Top = 0
    Width = 440
    Height = 474
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
      end>
    ImageCollection = dmCommon.icSvgIcons
    Width = 24
    Height = 24
    Left = 576
    Top = 104
  end
end
