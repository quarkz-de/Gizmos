object wAbout: TwAbout
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #220'ber Qizmos'
  ClientHeight = 216
  ClientWidth = 376
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  DesignSize = (
    376
    216)
  TextHeight = 17
  object txCopyright: TLabel
    Left = 152
    Top = 103
    Width = 195
    Height = 17
    Caption = 'Copyright '#169' 2022 Reiner L'#228'mmle'
  end
  object txAppName: TLabel
    Left = 152
    Top = 20
    Width = 129
    Height = 50
    Caption = 'Qizmos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object txVersion: TLabel
    Left = 152
    Top = 76
    Width = 64
    Height = 17
    Caption = 'Version 1.0'
  end
  object imLogo: TVirtualImage
    Left = 8
    Top = 20
    Width = 128
    Height = 128
    ImageCollection = dmCommon.icLogo
    ImageWidth = 0
    ImageHeight = 0
    ImageIndex = 0
    ImageName = 'Logo'
  end
  object btOk: TButton
    Left = 273
    Top = 183
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 0
    ExplicitLeft = 269
    ExplicitTop = 182
  end
  object txHomepage: TLinkLabel
    Left = 152
    Top = 129
    Width = 93
    Height = 19
    Caption = 
      '<a href="http://www.quarkz.de">Website</a> | <a href="https://gi' +
      'thub.com/quarkz-de/Qizmos">GitHub</a>'
    TabOrder = 1
    UseVisualStyle = True
    OnLinkClick = txHomepageLinkClick
  end
end
