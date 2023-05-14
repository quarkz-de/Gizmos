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
    Edges = []
    Align = alTop
    BorderWidth = 1
    Color = clBtnHighlight
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 17
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
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      616
      36)
    object txSmtpActiveOnStartup: TLabel
      Left = 8
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
  object pnHttpBlackhole: TQzPanel
    AlignWithMargins = True
    Left = 12
    Top = 102
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
    TabOrder = 2
    object txHttpBlackhole: TLabel
      Left = 8
      Top = 10
      Width = 82
      Height = 15
      Caption = 'HTTP Blackhole'
    end
  end
  object pnHttpActiveOnStartup: TQzPanel
    AlignWithMargins = True
    Left = 12
    Top = 144
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
    object txHttpActiveOnStartup: TLabel
      Left = 8
      Top = 9
      Width = 127
      Height = 15
      Caption = 'Bei Programmstart aktiv'
    end
    object tsHttpActiveOnStartup: TToggleSwitch
      Left = 552
      Top = 8
      Width = 50
      Height = 20
      Anchors = [akTop, akRight]
      ShowStateCaption = False
      TabOrder = 0
      ThumbWidth = 20
      OnClick = tsHttpActiveOnStartupClick
    end
  end
  object pnHttpPort: TQzPanel
    AlignWithMargins = True
    Left = 12
    Top = 186
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
    object txHttpPort: TLabel
      Left = 8
      Top = 9
      Width = 22
      Height = 15
      Caption = 'Port'
    end
    object edHttpPort: TNumberBox
      Left = 536
      Top = 4
      Width = 66
      Height = 23
      Anchors = [akTop, akRight]
      Decimal = 0
      DisplayFormat = '#####'
      MaxValue = 65535.000000000000000000
      TabOrder = 0
      OnExit = edHttpPortExit
    end
  end
  object pnHttpResultText: TQzPanel
    AlignWithMargins = True
    Left = 12
    Top = 270
    Width = 616
    Height = 36
    Margins.Left = 12
    Margins.Top = 6
    Margins.Right = 12
    Margins.Bottom = 0
    Edges = [qeBottom]
    Align = alTop
    BorderWidth = 1
    TabOrder = 6
    DesignSize = (
      616
      36)
    object txHttpResultText: TLabel
      Left = 8
      Top = 9
      Width = 76
      Height = 15
      Caption = 'R'#252'ckgabe Text'
    end
    object edHttpResultText: TEdit
      Left = 180
      Top = 4
      Width = 422
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Text = 'edHttpResultText'
      OnChange = edHttpResultTextChange
    end
  end
  object pnHttpResultCode: TQzPanel
    AlignWithMargins = True
    Left = 12
    Top = 228
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
    object txHttpResultCode: TLabel
      Left = 8
      Top = 9
      Width = 83
      Height = 15
      Caption = 'R'#252'ckgabe Code'
    end
    object edHttpResultCode: TNumberBox
      Left = 536
      Top = 4
      Width = 66
      Height = 23
      Anchors = [akTop, akRight]
      Decimal = 0
      DisplayFormat = '####'
      MaxValue = 9999.000000000000000000
      TabOrder = 0
      OnChange = edHttpResultCodeChange
    end
  end
end
