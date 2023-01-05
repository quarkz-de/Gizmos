object frBlackholeModule: TfrBlackholeModule
  AlignWithMargins = True
  Left = 0
  Top = 0
  Width = 452
  Height = 64
  Color = clBtnShadow
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  DesignSize = (
    452
    64)
  object txModuleName: TLabel
    Left = 74
    Top = 12
    Width = 243
    Height = 15
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'txModuleName'
    EllipsisPosition = epEndEllipsis
  end
  object txModuleEvents: TLabel
    Left = 74
    Top = 33
    Width = 243
    Height = 15
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'txModuleEvents'
    EllipsisPosition = epEndEllipsis
  end
  object imBurgerButton: TVirtualImage
    Left = 12
    Top = 8
    Width = 48
    Height = 48
    ImageCollection = dmCommon.icIcons
    ImageWidth = 0
    ImageHeight = 0
    ImageIndex = 4
    ImageName = '004_Mail'
  end
  object btOptions: TSpeedButton
    Left = 333
    Top = 22
    Width = 23
    Height = 22
    Anchors = [akTop, akRight]
    ImageIndex = 0
    ImageName = '003_Menu_Vertical'
    Images = viIcons
  end
  object tsModuleState: TToggleSwitch
    Left = 362
    Top = 22
    Width = 76
    Height = 20
    Anchors = [akTop, akRight]
    TabOrder = 0
    ThumbWidth = 20
  end
  object viIcons: TVirtualImageList
    Images = <
      item
        CollectionIndex = 3
        CollectionName = '003_Menu_Vertical'
        Name = '003_Menu_Vertical'
      end>
    ImageCollection = dmCommon.icIcons
    Left = 280
    Top = 16
  end
end
