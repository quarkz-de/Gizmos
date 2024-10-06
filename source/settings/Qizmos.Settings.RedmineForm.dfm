object wSettingsRedmineForm: TwSettingsRedmineForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Redmine'
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
    object txSmtpBlackhole: TLabel
      Left = 8
      Top = 10
      Width = 32
      Height = 15
      Caption = 'Server'
    end
  end
  object pnActiveOnStartup: TQzPanel
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
    object txActiveOnStartup: TLabel
      Left = 8
      Top = 9
      Width = 127
      Height = 15
      Caption = 'Bei Programmstart aktiv'
    end
    object tsActiveOnStartup: TToggleSwitch
      Left = 552
      Top = 8
      Width = 50
      Height = 20
      Anchors = [akTop, akRight]
      ShowStateCaption = False
      TabOrder = 0
      ThumbWidth = 20
      OnClick = tsActiveOnStartupClick
    end
  end
  object pnHttpBlackhole: TQzPanel
    AlignWithMargins = True
    Left = 12
    Top = 144
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
    ExplicitTop = 102
    object txHttpBlackhole: TLabel
      Left = 8
      Top = 10
      Width = 46
      Height = 15
      Caption = 'Benutzer'
    end
  end
  object pnHostname: TQzPanel
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
    TabOrder = 3
    ExplicitLeft = 17
    ExplicitTop = 80
    DesignSize = (
      616
      36)
    object txHostname: TLabel
      Left = 8
      Top = 9
      Width = 25
      Height = 15
      Caption = 'Host'
    end
    object edHostname: TEdit
      Left = 180
      Top = 4
      Width = 422
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Text = 'edHostname'
      OnChange = edHostnameChange
    end
  end
  object pnApiKey: TQzPanel
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
    ExplicitTop = 270
    DesignSize = (
      616
      36)
    object txApiKey: TLabel
      Left = 8
      Top = 9
      Width = 40
      Height = 15
      Caption = 'API Key'
    end
    object edApiKey: TEdit
      Left = 180
      Top = 4
      Width = 422
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Text = 'edApiKey'
      OnChange = edApiKeyChange
    end
  end
end
