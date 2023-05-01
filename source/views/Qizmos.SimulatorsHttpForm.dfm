object wSimulatorsHttpForm: TwSimulatorsHttpForm
  Left = 0
  Top = 0
  Caption = 'HTTP Blackhole'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object pnHeader: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = -4
    ExplicitWidth = 628
    DesignSize = (
      624
      41)
    object txCaption: TLabel
      Left = 64
      Top = 8
      Width = 165
      Height = 32
      Caption = 'HTTP Blackhole'
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
      ImageIndex = 8
      ImageName = '008_Message'
    end
    object tsActive: TToggleSwitch
      Left = 524
      Top = 12
      Width = 76
      Height = 20
      Action = acServerActivate
      Anchors = [akTop, akRight]
      TabOrder = 0
      ThumbWidth = 20
      ExplicitLeft = 528
    end
  end
  object pcSmtpBlackhole: TPageControl
    AlignWithMargins = True
    Left = 8
    Top = 49
    Width = 608
    Height = 384
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 8
    ActivePage = tsMessages
    Align = alClient
    TabOrder = 1
    object tsMessages: TTabSheet
      Caption = 'Nachrichten'
      object vtMessages: TVirtualStringTree
        Left = 0
        Top = 41
        Width = 600
        Height = 313
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
        Touch.InteractiveGestures = [igPan, igPressAndTap]
        Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
        ExplicitTop = 39
        Columns = <>
      end
      object pnMessages: TPanel
        Left = 0
        Top = 0
        Width = 600
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitWidth = 604
        object btClear: TButton
          Left = 8
          Top = 8
          Width = 109
          Height = 25
          Action = acClearMessages
          TabOrder = 0
        end
      end
    end
    object tsLog: TTabSheet
      Caption = 'Protokoll'
      ImageIndex = 1
      object lvLog: TListView
        Left = 0
        Top = 0
        Width = 600
        Height = 354
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
    end
  end
  object httpServer: TIdHTTPServer
    Bindings = <
      item
        IP = '0.0.0.0'
        Port = 80
      end>
    OnConnect = httpServerConnect
    OnDisconnect = httpServerDisconnect
    OnCommandGet = httpServerCommandGet
    Left = 496
    Top = 52
  end
end
