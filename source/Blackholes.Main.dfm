object wMainForm: TwMainForm
  Left = 0
  Top = 0
  Caption = 'Blackholes'
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
  StyleElements = [seFont, seClient]
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 17
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
        ImageCollection = dmCommon.icDarkIcons
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = 0
        ImageName = '000_Menu'
        OnClick = imBurgerButtonClick
      end
    end
    object nvNavigation: TQzNavigationView
      Left = 0
      Top = 45
      Width = 170
      Height = 475
      Align = alClient
      BorderStyle = bsNone
      ButtonHeight = 48
      ButtonOptions = [nboAllowReorder, nboGroupStyle, nboShowCaptions]
      Images = vilLargeIcons
      Items = <
        item
          Action = acSectionWelcome
          AllowReorder = False
        end>
      ItemIndex = 0
      TabOrder = 1
      OnButtonClicked = nvNavigationButtonClicked
    end
    object nvFooter: TQzNavigationView
      Left = 0
      Top = 520
      Width = 170
      Height = 49
      Align = alBottom
      BorderStyle = bsNone
      ButtonHeight = 48
      ButtonOptions = [nboGroupStyle, nboShowCaptions]
      Images = vilLargeIcons
      Items = <
        item
          Action = acSectionSettings
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
        CollectionName = '001_Home'
        Name = '001_Home'
      end
      item
        CollectionIndex = 2
        CollectionName = '002_Settings'
        Name = '002_Settings'
      end>
    ImageCollection = dmCommon.icDarkIcons
    Width = 32
    Height = 32
    Left = 524
    Top = 40
  end
  object amActions: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Items = <
              item
                Caption = '-'
              end
              item
                Action = acFileExit
              end>
            Caption = '&Datei'
          end
          item
            Items = <
              item
                Action = acHelpAbout
              end>
            Caption = '&Hilfe'
          end>
      end>
    Images = vilIcons
    Left = 424
    Top = 40
    StyleName = 'Platform Default'
    object acFileExit: TFileExit
      Category = 'Datei'
      Caption = '&Beenden'
      Hint = 'Beenden|Anwendung beenden'
    end
    object acHelpAbout: TAction
      Category = 'Hilfe'
      Caption = '&'#220'ber...'
      OnExecute = acHelpAboutExecute
    end
    object acSectionWelcome: TAction
      Category = 'Bereich'
      AutoCheck = True
      Caption = 'Startseite'
      GroupIndex = 1
      ImageIndex = 1
      ImageName = '001_Home'
      OnExecute = acSectionWelcomeExecute
    end
    object acSectionSettings: TAction
      Category = 'Bereich'
      Caption = 'Einstellungen'
      GroupIndex = 1
      ImageIndex = 2
      ImageName = '002_Settings'
      OnExecute = acSectionSettingsExecute
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
        CollectionName = '001_Home'
        Name = '001_Home'
      end
      item
        CollectionIndex = 2
        CollectionName = '002_Settings'
        Name = '002_Settings'
      end>
    ImageCollection = dmCommon.icDarkIcons
    Left = 476
    Top = 40
  end
end
