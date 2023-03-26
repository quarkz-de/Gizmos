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
  OnDestroy = FormDestroy
  TextHeight = 13
  object shHeader: TShape
    Left = 0
    Top = 0
    Width = 777
    Height = 49
    Align = alTop
    Brush.Color = clWindow
    Pen.Style = psClear
  end
  object imIcon: TVirtualImage
    Left = 12
    Top = 8
    Width = 32
    Height = 32
    ImageCollection = dmCommon.icIcons
    ImageWidth = 0
    ImageHeight = 0
    ImageIndex = 2
    ImageName = '002_Settings'
  end
  object txCaption: TLabel
    Left = 64
    Top = 8
    Width = 138
    Height = 29
    Caption = 'Einstellungen'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object shBorder: TShape
    Left = 170
    Top = 49
    Width = 1
    Height = 419
    Align = alLeft
    Brush.Style = bsClear
    Pen.Color = clWindowFrame
    ExplicitTop = -101
    ExplicitHeight = 569
  end
  object nvSettings: TQzNavigationView
    Left = 0
    Top = 49
    Width = 170
    Height = 419
    Align = alLeft
    BorderStyle = bsNone
    ButtonHeight = 40
    ButtonOptions = [nboGroupStyle, nboShowCaptions]
    Images = viImages
    Items = <
      item
        Action = acSettings
      end
      item
        Action = acInfo
      end>
    ItemIndex = 0
    TabOrder = 0
  end
  object viImages: TVirtualImageList
    Images = <
      item
        CollectionIndex = 1
        CollectionName = '001_Help'
        Name = '001_Help'
      end
      item
        CollectionIndex = 2
        CollectionName = '002_Settings'
        Name = '002_Settings'
      end>
    ImageCollection = dmCommon.icIcons
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
      ImageIndex = 1
      ImageName = '002_Settings'
      OnExecute = acSettingsExecute
    end
    object acInfo: TAction
      Caption = 'Info'
      GroupIndex = 1
      ImageIndex = 0
      ImageName = '001_Help'
      OnExecute = acInfoExecute
    end
  end
end
