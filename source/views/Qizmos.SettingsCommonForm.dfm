object wSettingsCommonForm: TwSettingsCommonForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Einstellungen'
  ClientHeight = 480
  ClientWidth = 640
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object txTheme: TLabel
    Left = 12
    Top = 24
    Width = 36
    Height = 15
    Caption = 'Thema'
  end
  object cbTheme: TComboBox
    Left = 68
    Top = 21
    Width = 109
    Height = 23
    Style = csDropDownList
    TabOrder = 0
    OnChange = cbThemeChange
    Items.Strings = (
      'System'
      'Hell'
      'Dunkel')
  end
end
