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
    ExplicitWidth = 608
    ExplicitHeight = 384
    object tsMessages: TTabSheet
      Caption = 'Nachrichten'
      object vtMessages: TVirtualStringTree
        Left = 0
        Top = 41
        Width = 604
        Height = 314
        Align = alClient
        BorderStyle = bsNone
        Colors.BorderColor = 15987699
        Colors.DisabledColor = clGray
        Colors.DropMarkColor = 15385233
        Colors.DropTargetColor = 15385233
        Colors.DropTargetBorderColor = 15385233
        Colors.FocusedSelectionColor = 15385233
        Colors.FocusedSelectionBorderColor = 15385233
        Colors.GridLineColor = 15987699
        Colors.HeaderHotColor = clBlack
        Colors.HotColor = clBlack
        Colors.SelectionRectangleBlendColor = 15385233
        Colors.SelectionRectangleBorderColor = 15385233
        Colors.SelectionTextColor = clBlack
        Colors.TreeLineColor = 9471874
        Colors.UnfocusedColor = clGray
        Colors.UnfocusedSelectionColor = clWhite
        Colors.UnfocusedSelectionBorderColor = clWhite
        Header.AutoSizeIndex = 0
        Header.MainColumn = -1
        TabOrder = 0
        OnDblClick = vtMessagesDblClick
        OnFocusChanged = vtMessagesFocusChanged
        Touch.InteractiveGestures = [igPan, igPressAndTap]
        Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
        Columns = <>
      end
      object pnMessages: TPanel
        Left = 0
        Top = 0
        Width = 604
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitWidth = 600
        object btClear: TButton
          Left = 8
          Top = 8
          Width = 109
          Height = 25
          Action = acClearMessages
          TabOrder = 0
        end
        object btSaveMessage: TButton
          Left = 127
          Top = 8
          Width = 169
          Height = 25
          Action = acSaveMessage
          TabOrder = 1
        end
      end
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
    ExplicitWidth = 624
    DesignSize = (
      628
      41)
    object txCaption: TLabel
      Left = 64
      Top = 8
      Width = 170
      Height = 32
      Caption = 'SMTP Blackhole'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object imIcon: TVirtualImage
      Left = 12
      Top = 8
      Width = 32
      Height = 32
      ImageCollection = dmCommon.icDarkIcons
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 7
      ImageName = '007_Mail'
    end
    object tsActive: TToggleSwitch
      Left = 528
      Top = 12
      Width = 76
      Height = 20
      Action = acServerActivate
      Anchors = [akTop, akRight]
      TabOrder = 0
      ThumbWidth = 20
      ExplicitLeft = 524
    end
  end
  object smtpServer: TIdSMTPServer
    Bindings = <
      item
        IP = '0.0.0.0'
        Port = 25
      end>
    OnConnect = smtpServerConnect
    OnDisconnect = smtpServerDisconnect
    CommandHandlers = <>
    ExceptionReply.Code = '500'
    ExceptionReply.Text.Strings = (
      'Unknown Internal Error')
    Greeting.Code = '220'
    Greeting.Text.Strings = (
      'Welcome to the Qizmos SMTP Blackhole Server')
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
    ServerName = 'Qizmos SMTP Blackhole'
    Left = 516
    Top = 52
  end
  object alActions: TActionList
    Left = 568
    Top = 52
    object acServerActivate: TAction
      Category = 'Server'
      Caption = 'acServerActivate'
      OnExecute = acServerActivateExecute
    end
    object acClearMessages: TAction
      Category = 'Messages'
      Caption = 'Alles l'#246'schen'
      OnExecute = acClearMessagesExecute
    end
    object acSaveMessage: TAction
      Category = 'Messages'
      Caption = 'Nachricht speichern'
      OnExecute = acSaveMessageExecute
    end
    object acShowMessage: TAction
      Category = 'Messages'
      Caption = 'Nachricht '#246'ffnen'
      OnExecute = acShowMessageExecute
    end
  end
  object dSave: TSaveDialog
    DefaultExt = 'eml'
    Filter = 'E-Mail-Nachrichten (*.eml)|*.eml'
    Options = [ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Left = 568
    Top = 115
  end
end
