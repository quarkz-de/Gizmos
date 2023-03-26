object wSimulatorsSmtpForm: TwSimulatorsSmtpForm
  Left = 0
  Top = 0
  Caption = 'SMTP Blackhole'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object pcSmtpBlackhole: TPageControl
    AlignWithMargins = True
    Left = 8
    Top = 49
    Width = 612
    Height = 385
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 8
    ActivePage = tsMessages
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 3
    ExplicitTop = 56
    ExplicitWidth = 622
    ExplicitHeight = 383
    object tsMessages: TTabSheet
      Caption = 'Nachrichten'
    end
    object tsLog: TTabSheet
      Caption = 'Protokoll'
      ImageIndex = 1
      object lvLog: TListView
        Left = 0
        Top = 0
        Width = 604
        Height = 355
        Align = alClient
        Columns = <
          item
            AutoSize = True
            Caption = 'Ereignisse'
          end>
        ColumnClick = False
        Ctl3D = False
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Consolas'
        Font.Style = []
        OwnerDraw = True
        ReadOnly = True
        RowSelect = True
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
  end
  object pnHeader: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 396
    ExplicitTop = 24
    ExplicitWidth = 185
    DesignSize = (
      628
      41)
    object txCaption: TLabel
      Left = 64
      Top = 8
      Width = 166
      Height = 29
      Caption = 'SMTP Blackhole'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object imIcon: TVirtualImage
      Left = 12
      Top = 8
      Width = 32
      Height = 32
      ImageCollection = dmCommon.icIcons
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 7
      ImageName = '007_Mail'
    end
    object tsActive: TToggleSwitch
      Left = 544
      Top = 12
      Width = 76
      Height = 20
      Action = acServerActivate
      Anchors = [akTop, akRight]
      TabOrder = 0
      ThumbWidth = 20
    end
  end
  object smtpServer: TIdSMTPServer
    Bindings = <>
    OnConnect = smtpServerConnect
    OnDisconnect = smtpServerDisconnect
    CommandHandlers = <>
    ExceptionReply.Code = '500'
    ExceptionReply.Text.Strings = (
      'Unknown Internal Error')
    Greeting.Code = '220'
    Greeting.Text.Strings = (
      'Welcome to the INDY SMTP Server')
    HelpReply.Code = ''
    MaxConnectionReply.Code = '300'
    MaxConnectionReply.Text.Strings = (
      'Too many connections. Try again later.')
    ReplyTexts = <>
    ReplyUnknownCommand.Code = '500'
    ReplyUnknownCommand.Text.Strings = (
      'Syntax Error')
    ReplyUnknownCommand.EnhancedCode.StatusClass = 5
    ReplyUnknownCommand.EnhancedCode.Subject = 5
    ReplyUnknownCommand.EnhancedCode.Details = 2
    ReplyUnknownCommand.EnhancedCode.Available = True
    ReplyUnknownCommand.EnhancedCode.ReplyAsStr = '5.5.2'
    OnMailFrom = smtpServerMailFrom
    OnMsgReceive = smtpServerMsgReceive
    OnRcptTo = smtpServerRcptTo
    OnReceived = smtpServerReceived
    OnUserLogin = smtpServerUserLogin
    ServerName = 'Indy SMTP Server'
    Left = 516
    Top = 52
  end
  object alActions: TActionList
    Left = 568
    Top = 52
    object acServerActivate: TAction
      Caption = 'acServerActivate'
      OnExecute = acServerActivateExecute
    end
  end
end
