unit Gizmos.ModuleFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXCtrls,
  Vcl.StdCtrls, Vcl.VirtualImage, Vcl.Buttons, System.ImageList, Vcl.ImgList,
  Vcl.VirtualImageList,
  EventBus,
  Gizmos.Events;

type
  TfrBlackholeModule = class(TFrame)
    txModuleName: TLabel;
    tsModuleState: TToggleSwitch;
    txModuleEvents: TLabel;
    imBurgerButton: TVirtualImage;
    btOptions: TSpeedButton;
    viIcons: TVirtualImageList;
  private
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

uses
  Gizmos.DataModule;

{ TfrBlackholeModule }

constructor TfrBlackholeModule.Create(AOwner: TComponent);
begin
  inherited;
//  GlobalEventBus.RegisterSubscriberForEvents(Self);
end;

end.
