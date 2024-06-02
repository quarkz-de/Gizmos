object wSettingsNotesForm: TwSettingsNotesForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Notizen'
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
    Edges = []
    Align = alTop
    BorderWidth = 1
    Color = clBtnHighlight
    ParentBackground = False
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
    object txFontName: TLabel
      Left = 8
      Top = 11
      Width = 48
      Height = 15
      Caption = 'Schriftart'
    end
    object cbFontName: TComboBox
      Left = 408
      Top = 7
      Width = 194
      Height = 23
      Anchors = [akTop, akRight]
      TabOrder = 0
      OnChange = cbFontNameChange
      Items.Strings = (
        'An System anpassen'
        'Hell'
        'Dunkel')
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
      Left = 8
      Top = 9
      Width = 65
      Height = 15
      Caption = 'Schriftgr'#246#223'e'
    end
    object tbFontSize: TTrackBar
      Left = 408
      Top = 5
      Width = 194
      Height = 28
      Anchors = [akTop, akRight]
      Max = 14
      Min = 8
      PageSize = 1
      Position = 9
      TabOrder = 0
      OnChange = tbFontSizeChange
    end
  end
end
