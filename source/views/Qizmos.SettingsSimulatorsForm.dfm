object wSettingsSimulatorsForm: TwSettingsSimulatorsForm
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
  object pnSmtpBlackhole: TQzPanel
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
    object txSmtpBlackhole: TLabel
      Left = 8
      Top = 10
      Width = 84
      Height = 15
      Caption = 'SMTP Blackhole'
    end
  end
  object pnSmtpActiveOnStartup: TQzPanel
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
    object txSmtpActiveOnStartup: TLabel
      Left = 28
      Top = 9
      Width = 127
      Height = 15
      Caption = 'Bei Programmstart aktiv'
    end
    object tsSmtpActiveOnStartup: TToggleSwitch
      Left = 552
      Top = 8
      Width = 50
      Height = 20
      Anchors = [akTop, akRight]
      ShowStateCaption = False
      TabOrder = 0
      ThumbWidth = 20
      OnClick = tsSmtpActiveOnStartupClick
    end
  end
end
