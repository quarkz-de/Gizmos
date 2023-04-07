unit Qizmos.Main;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.ImageList,
  System.Actions,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ImgList,
  Vcl.VirtualImageList, Vcl.Buttons, Vcl.StdCtrls, Vcl.VirtualImage,
  Vcl.ExtCtrls, Vcl.WinXCtrls, Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnMan, Vcl.ToolWin, Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.TitleBarCtrls,
  Vcl.ActnList, Vcl.StdActns, Vcl.AppEvnts,
  EventBus,
  Qodelib.NavigationView,
  Qizmos.Events, Qizmos.Forms;

type
  TwMainForm = class(TForm)
    vilLargeIcons: TVirtualImageList;
    vilIcons: TVirtualImageList;
    svSplitView: TSplitView;
    nvHeader: TQzNavigationView;
    nvFooter: TQzNavigationView;
    alActions: TActionList;
    acSectionWelcome: TAction;
    acSectionSettings: TAction;
    acSectionSimulators: TAction;
    tiTrayIcon: TTrayIcon;
    aeAppEvents: TApplicationEvents;
    pnHeader: TPanel;
    shHeader: TShape;
    imBurgerButton: TVirtualImage;
    txCaption: TLabel;
    imIcon: TVirtualImage;
    sh2: TShape;
    procedure FormCreate(Sender: TObject);
    procedure imBurgerButtonClick(Sender: TObject);
    procedure acSectionWelcomeExecute(Sender: TObject);
    procedure acSectionSettingsExecute(Sender: TObject);
    procedure acHelpAboutExecute(Sender: TObject);
    procedure acSectionSimulatorsExecute(Sender: TObject);
    procedure aeAppEventsMinimize(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure nvFooterButtonClicked(Sender: TObject; Index: Integer);
    procedure nvHeaderButtonClicked(Sender: TObject; Index: Integer);
    procedure svSplitViewClosed(Sender: TObject);
    procedure svSplitViewOpened(Sender: TObject);
    procedure tiTrayIconDblClick(Sender: TObject);
  private
    FForms: TManagedFormList;
    procedure InitSettings;
    procedure WMSettingChange(var Message: TWMSettingChange); message WM_SETTINGCHANGE;
  protected
    property Forms: TManagedFormList read FForms;
  public
    [Subscribe]
    procedure OnModuleChange(AEvent: IModuleChangeEvent);
  end;

var
  wMainForm: TwMainForm;

implementation

{$R *.dfm}

uses
  Qizmos.DataModule, Qizmos.Settings, Qizmos.About;

{ TwMain }

procedure TwMainForm.acHelpAboutExecute(Sender: TObject);
begin
  TwAbout.ExecuteDialog;
end;

procedure TwMainForm.acSectionSettingsExecute(Sender: TObject);
begin
  FForms.ShowForm(mfMainSettings);
end;

procedure TwMainForm.acSectionSimulatorsExecute(Sender: TObject);
begin
  FForms.ShowForm(mfMainSimulators);
end;

procedure TwMainForm.acSectionWelcomeExecute(Sender: TObject);
begin
  FForms.ShowForm(mfMainWelcome);
end;

procedure TwMainForm.aeAppEventsMinimize(Sender: TObject);
begin
  Hide;
  WindowState := wsMinimized;
  tiTrayIcon.Visible := true;
end;

procedure TwMainForm.FormCreate(Sender: TObject);
begin
  FForms := TApplicationFormList.Create(self);
  acSectionWelcome.Execute;
  GlobalEventBus.RegisterSubscriberForEvents(Self);
  dmCommon.MainFormCreated;
  InitSettings;
end;

procedure TwMainForm.FormDestroy(Sender: TObject);
begin
  ApplicationSettings.FormPosition.SavePosition(self);
  FForms.Free;
end;

procedure TwMainForm.imBurgerButtonClick(Sender: TObject);
begin
  svSplitView.Opened := not svSplitView.Opened;
end;

procedure TwMainForm.InitSettings;
begin
  svSplitView.Opened := ApplicationSettings.DrawerOpened;
  ApplicationSettings.FormPosition.LoadPosition(self);
end;

procedure TwMainForm.nvFooterButtonClicked(Sender: TObject; Index: Integer);
begin
  nvHeader.ItemIndex := -1;
end;

procedure TwMainForm.nvHeaderButtonClicked(Sender: TObject; Index: Integer);
begin
  nvFooter.ItemIndex := -1;
end;

procedure TwMainForm.OnModuleChange(AEvent: IModuleChangeEvent);
begin
  if AEvent.FormId.IsMainModule then
    begin
      txCaption.Caption := AEvent.FormId.ToString;
      imIcon.ImageIndex := AEvent.FormId.ToImageIndex;
      Caption := 'Qizmos - ' + AEvent.FormId.ToString;
    end;
end;

procedure TwMainForm.svSplitViewClosed(Sender: TObject);
begin
  ApplicationSettings.DrawerOpened := false;
  nvHeader.ButtonOptions := nvHeader.ButtonOptions - [nboShowCaptions];
  nvFooter.ButtonOptions := nvFooter.ButtonOptions - [nboShowCaptions];
end;

procedure TwMainForm.svSplitViewOpened(Sender: TObject);
begin
  ApplicationSettings.DrawerOpened := true;
  nvHeader.ButtonOptions := nvHeader.ButtonOptions + [nboShowCaptions];
  nvFooter.ButtonOptions := nvFooter.ButtonOptions + [nboShowCaptions];
end;

procedure TwMainForm.tiTrayIconDblClick(Sender: TObject);
begin
  tiTrayIcon.Visible := false;
  Show;
  WindowState := wsNormal;
  Application.BringToFront;
end;

procedure TwMainForm.WMSettingChange(var Message: TWMSettingChange);
begin
  if SameText('ImmersiveColorSet', String(Message.Section)) then
    ApplicationSettings.WindowsThemeChanged;
end;

end.
