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
  TextHeight = 13
  object txTheme: TLabel
    Left = 20
    Top = 24
    Width = 32
    Height = 13
    Caption = 'Theme'
  end
  object txLanguage: TLabel
    Left = 20
    Top = 63
    Width = 47
    Height = 13
    Caption = 'Language'
  end
  object cbTheme: TComboBox
    Left = 124
    Top = 21
    Width = 109
    Height = 21
    Style = csDropDownList
    TabOrder = 0
    OnChange = cbThemeChange
    Items.Strings = (
      'light'
      'dark')
  end
  object cbLanguage: TCultureBox
    Left = 124
    Top = 60
    Width = 209
    Height = 21
    Color = clWindow
    DisplayName = cnLocalizedDisplayName
    Items.Cultures = (
      '*')
    Localizer = dmCommon.locLocalizer
    TabOrder = 1
    OnClick = cbLanguageClick
  end
  object trTranslator: TTranslator
    Localizer = dmCommon.locLocalizer
    Translatables.Properties = (
      'cbTheme.Items[0]'
      'cbTheme.Items[1]'
      'txLanguage.Caption'
      'txTheme.Caption')
    Left = 372
    Top = 20
  end
end
