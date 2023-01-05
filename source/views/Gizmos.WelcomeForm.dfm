object wWelcomeForm: TwWelcomeForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'dmCommon.icLogo'
  ClientHeight = 479
  ClientWidth = 761
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  DesignSize = (
    761
    479)
  TextHeight = 13
  object imLogo: TVirtualImage
    Left = 16
    Top = 16
    Width = 48
    Height = 48
    ImageCollection = dmCommon.icLogo
    ImageWidth = 0
    ImageHeight = 0
    ImageIndex = 0
    ImageName = 'Logo'
    OnClick = imLogoClick
  end
  object txHeaderText: TLabel
    Left = 78
    Top = 8
    Width = 148
    Height = 59
    Caption = 'Gizmos'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -43
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    OnClick = txHeaderTextClick
  end
  object txVersion: TLabel
    Left = 240
    Top = 9
    Width = 54
    Height = 13
    Caption = 'Version 1.0'
  end
  object txCopyright: TLabel
    Left = 240
    Top = 28
    Width = 159
    Height = 13
    Caption = 'Copyright '#169' 2022 Reiner L'#228'mmle'
  end
  object txWebsite: TLinkLabel
    Left = 240
    Top = 47
    Width = 85
    Height = 17
    Caption = 
      '<a href="http://www.quarkz.de">Website</a> | <a href="https://gi' +
      'thub.com/quarkz-de/Gizmos">GitHub</a>'
    TabOrder = 0
    OnLinkClick = txWebsiteLinkClick
  end
  object sbModules: TScrollBox
    Left = 78
    Top = 92
    Width = 389
    Height = 365
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderStyle = bsNone
    TabOrder = 1
  end
  object bt1: TButton
    Left = 500
    Top = 92
    Width = 75
    Height = 25
    Caption = 'bt1'
    TabOrder = 2
    OnClick = bt1Click
  end
end
