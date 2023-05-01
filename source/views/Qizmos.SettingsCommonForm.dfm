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
  object pnView: TQzPanel
    AlignWithMargins = True
    Left = 12
    Top = 12
    Width = 616
    Height = 36
    Margins.Left = 12
    Margins.Top = 12
    Margins.Right = 12
    Margins.Bottom = 0
    Edges = [qeBottom]
    Align = alTop
    BorderWidth = 1
    TabOrder = 0
    object txView: TLabel
      Left = 8
      Top = 10
      Width = 60
      Height = 15
      Caption = 'Darstellung'
    end
  end
  object pnTheme: TQzPanel
    AlignWithMargins = True
    Left = 12
    Top = 54
    Width = 616
    Height = 36
    Margins.Left = 12
    Margins.Top = 6
    Margins.Right = 12
    Margins.Bottom = 0
    Edges = [qeBottom]
    Align = alTop
    BorderWidth = 1
    TabOrder = 1
    DesignSize = (
      616
      36)
    object txTheme: TLabel
      Left = 28
      Top = 11
      Width = 114
      Height = 15
      Caption = 'Standard Farbschema'
    end
    object cbTheme: TComboBox
      Left = 408
      Top = 7
      Width = 194
      Height = 23
      Style = csDropDownList
      Anchors = [akTop, akRight]
      TabOrder = 0
      OnChange = cbThemeChange
      Items.Strings = (
        'An System anpassen'
        'Hell'
        'Dunkel')
    end
  end
  object pnAutoRun: TQzPanel
    AlignWithMargins = True
    Left = 12
    Top = 138
    Width = 616
    Height = 36
    Margins.Left = 12
    Margins.Top = 6
    Margins.Right = 12
    Margins.Bottom = 0
    Edges = [qeBottom]
    Align = alTop
    BorderWidth = 1
    TabOrder = 3
    DesignSize = (
      616
      36)
    object txAutoRun: TLabel
      Left = 28
      Top = 9
      Width = 109
      Height = 15
      Caption = 'Mit Windows starten'
    end
    object tsAutoRun: TToggleSwitch
      Left = 552
      Top = 8
      Width = 50
      Height = 20
      Anchors = [akTop, akRight]
      ShowStateCaption = False
      TabOrder = 0
      ThumbWidth = 20
      OnClick = tsAutoRunClick
    end
  end
  object pnFontSize: TQzPanel
    AlignWithMargins = True
    Left = 12
    Top = 96
    Width = 616
    Height = 36
    Margins.Left = 12
    Margins.Top = 6
    Margins.Right = 12
    Margins.Bottom = 0
    Edges = [qeBottom]
    Align = alTop
    BorderWidth = 1
    TabOrder = 2
    DesignSize = (
      616
      36)
    object txFontSize: TLabel
      Left = 28
      Top = 9
      Width = 279
      Height = 15
      Caption = 'Schriftgr'#246#223'e (erfordert den Neustart des Programms)'
    end
    object tbFontSize: TTrackBar
      Left = 452
      Top = 5
      Width = 150
      Height = 28
      Anchors = [akTop, akRight]
      Max = 12
      Min = 8
      PageSize = 1
      Position = 9
      TabOrder = 0
      OnChange = tbFontSizeChange
    end
  end
  object pnMinimizeToTray: TQzPanel
    AlignWithMargins = True
    Left = 12
    Top = 222
    Width = 616
    Height = 36
    Margins.Left = 12
    Margins.Top = 6
    Margins.Right = 12
    Margins.Bottom = 0
    Edges = [qeBottom]
    Align = alTop
    BorderWidth = 1
    TabOrder = 5
    DesignSize = (
      616
      36)
    object txMinimizeToTray: TLabel
      Left = 28
      Top = 9
      Width = 192
      Height = 15
      Caption = 'In den Infobereich (Tray) minimieren'
    end
    object tsMinimizeToTray: TToggleSwitch
      Left = 552
      Top = 8
      Width = 50
      Height = 20
      Anchors = [akTop, akRight]
      ShowStateCaption = False
      TabOrder = 0
      ThumbWidth = 20
      OnClick = tsMinimizeToTrayClick
    end
  end
  object pnStartMinimized: TQzPanel
    AlignWithMargins = True
    Left = 12
    Top = 180
    Width = 616
    Height = 36
    Margins.Left = 12
    Margins.Top = 6
    Margins.Right = 12
    Margins.Bottom = 0
    Edges = [qeBottom]
    Align = alTop
    BorderWidth = 1
    TabOrder = 4
    DesignSize = (
      616
      36)
    object txStartMinimized: TLabel
      Left = 28
      Top = 9
      Width = 91
      Height = 15
      Caption = 'Minimiert starten'
    end
    object tsStartMinimized: TToggleSwitch
      Left = 552
      Top = 8
      Width = 50
      Height = 20
      Anchors = [akTop, akRight]
      ShowStateCaption = False
      TabOrder = 0
      ThumbWidth = 20
      OnClick = tsStartMinimizedClick
    end
  end
end
