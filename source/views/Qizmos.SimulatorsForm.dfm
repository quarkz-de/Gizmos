object wSimulatorsForm: TwSimulatorsForm
  Left = 0
  Top = 0
  Caption = 'Simulatoren'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object shBorder: TShape
    Left = 170
    Top = 0
    Width = 1
    Height = 441
    Align = alLeft
    Brush.Style = bsClear
    Pen.Color = clWindowFrame
    ExplicitTop = 23
    ExplicitHeight = 419
  end
  object nvSettings: TQzNavigationView
    Left = 0
    Top = 0
    Width = 170
    Height = 441
    Align = alLeft
    BorderStyle = bsNone
    ButtonHeight = 40
    ButtonOptions = [nboGroupStyle, nboShowCaptions]
    Images = viImages
    Items = <
      item
        Action = acSmtpBlackhole
        ImageName = '002_Settings'
      end
      item
        Action = acHttpBlackhole
        ImageName = '001_Help'
      end>
    ItemIndex = 0
    TabOrder = 0
    ExplicitTop = 49
    ExplicitHeight = 391
  end
  object alActions: TActionList
    Images = viImages
    Left = 576
    Top = 60
    object acSmtpBlackhole: TAction
      Caption = 'SMTP Blackhole'
      Checked = True
      GroupIndex = 1
      ImageIndex = 0
      ImageName = '007_Mail'
      OnExecute = acSmtpBlackholeExecute
    end
    object acHttpBlackhole: TAction
      Caption = 'HTTP Blackhole'
      GroupIndex = 1
      ImageIndex = 1
      ImageName = '008_Message'
      OnExecute = acHttpBlackholeExecute
    end
  end
  object viImages: TVirtualImageList
    Images = <
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
    ImageCollection = dmCommon.icIcons
    Width = 24
    Height = 24
    Left = 576
    Top = 104
  end
end
