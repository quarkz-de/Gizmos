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
  end
  object txHeaderText: TLabel
    Left = 78
    Top = 8
    Width = 217
    Height = 59
    Caption = 'Blackholes'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -43
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object txVersion: TLabel
    Left = 308
    Top = 9
    Width = 54
    Height = 13
    Caption = 'Version 1.0'
  end
  object txCopyright: TLabel
    Left = 308
    Top = 28
    Width = 159
    Height = 13
    Caption = 'Copyright '#169' 2022 Reiner L'#228'mmle'
  end
  object txWebsite: TLinkLabel
    Left = 308
    Top = 47
    Width = 98
    Height = 17
    Caption = 'Website: <a href="http://www.quarkz.de">quarkz.de</a>'
    TabOrder = 0
    OnLinkClick = txWebsiteLinkClick
  end
end
