object wRedmineUserForm: TwRedmineUserForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Benutzer'
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
  object txIdLabel: TLabel
    Left = 12
    Top = 60
    Width = 11
    Height = 15
    Caption = 'ID'
  end
  object txId: TLabel
    Left = 96
    Top = 60
    Width = 20
    Height = 15
    Caption = 'txId'
  end
  object txLoginLabel: TLabel
    Left = 14
    Top = 88
    Width = 30
    Height = 15
    Caption = 'Login'
  end
  object txLogin: TLabel
    Left = 96
    Top = 88
    Width = 40
    Height = 15
    Caption = 'txLogin'
  end
  object txVornameLabel: TLabel
    Left = 14
    Top = 116
    Width = 47
    Height = 15
    Caption = 'Vorname'
  end
  object txFirstname: TLabel
    Left = 96
    Top = 116
    Width = 62
    Height = 15
    Caption = 'txFirstname'
  end
  object txLastnameLabel: TLabel
    Left = 14
    Top = 144
    Width = 58
    Height = 15
    Caption = 'Nachname'
  end
  object txLastname: TLabel
    Left = 97
    Top = 144
    Width = 61
    Height = 15
    Caption = 'txLastname'
  end
  object txMailLabel: TLabel
    Left = 14
    Top = 172
    Width = 23
    Height = 15
    Caption = 'Mail'
  end
  object txMail: TLabel
    Left = 97
    Top = 172
    Width = 33
    Height = 15
    Caption = 'txMail'
  end
  object imMyPage: TVirtualImage
    Left = 14
    Top = 204
    Width = 16
    Height = 16
    ImageCollection = dmCommon.icSvgIcons
    ImageWidth = 0
    ImageHeight = 0
    ImageIndex = 32
    ImageName = '032_External_Link'
  end
  object pnHeader: TPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = -16
    DesignSize = (
      640
      41)
    object txCaption: TLabel
      Left = 64
      Top = 8
      Width = 196
      Height = 32
      Caption = 'Redmine Benutzer'
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
      ImageIndex = 30
      ImageName = '030_User'
    end
    object btRefresh: TSpeedButton
      Left = 608
      Top = 7
      Width = 32
      Height = 32
      Anchors = [akTop, akRight]
      ImageIndex = 33
      ImageName = '033_Refresh'
      Images = vilLargeIcons
      OnClick = btRefreshClick
    end
  end
  object txMyPage: TLinkLabel
    Left = 36
    Top = 204
    Width = 65
    Height = 19
    Caption = 'Meine Seite'
    TabOrder = 1
    OnLinkClick = txMyPageLinkClick
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
      end>
    ImageCollection = dmCommon.icSvgIcons
    Width = 32
    Height = 32
    Left = 308
    Top = 76
  end
end
