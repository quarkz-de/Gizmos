unit Qizmos.Main;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.ImageList,
  System.Actions,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ImgList,
  Vcl.VirtualImageList, Vcl.Buttons, Vcl.StdCtrls, Vcl.VirtualImage,
  Vcl.ExtCtrls, Vcl.WinXCtrls, Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnMan, Vcl.ActnMenus,
  Vcl.ActnList, Vcl.AppEvnts,
  EventBus,
  Qodelib.NavigationView, Qodelib.ManagedForms,
  Qizmos.Forms, Qizmos.Events, Qodelib.Panels;

type
  TwMainForm = class(TManagedForm)
    vilLargeIcons: TVirtualImageList;
    vilIcons: TVirtualImageList;
    alActions: TActionList;
    acSectionWelcome: TAction;
    acSectionSettings: TAction;
    acSectionSimulators: TAction;
    tiTrayIcon: TTrayIcon;
    aeAppEvents: TApplicationEvents;
    pnHeader: TQzPanel;
    txCaption: TLabel;
    imIcon: TVirtualImage;
    btBurgerButton: TSpeedButton;
    pnFormContainer: TQzPanel;
    svSplitView: TSplitView;
    nvHeader: TQzNavigationView;
    nvFooter: TQzNavigationView;
    procedure FormCreate(Sender: TObject);
    procedure acSectionWelcomeExecute(Sender: TObject);
    procedure acSectionSettingsExecute(Sender: TObject);
    procedure acHelpAboutExecute(Sender: TObject);
    procedure acSectionSimulatorsExecute(Sender: TObject);
    procedure aeAppEventsMinimize(Sender: TObject);
    procedure btBurgerButtonClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure nvFooterButtonClicked(Sender: TObject; Index: Integer);
    procedure nvHeaderButtonClicked(Sender: TObject; Index: Integer);
    procedure svSplitViewClosed(Sender: TObject);
    procedure svSplitViewOpened(Sender: TObject);
    procedure tiTrayIconClick(Sender: TObject);
    procedure tiTrayIconDblClick(Sender: TObject);
  private
    procedure InitSettings;
    procedure WMSettingChange(var Message: TWMSettingChange); message WM_SETTINGCHANGE;
    procedure RestoreFromTray;
  protected
    function GetFormId: TQzManagedFormId; override;
    procedure FontChanged; override;
    procedure RegisterForms; override;
    procedure ActiveFormChanged(ActiveForm: TQzManagedForm); override;
    procedure ThemeChanged; override;
  public
    [Subscribe]
    procedure OnModuleChange(AEvent: IModuleChangeEvent);
    [Subscribe]
    procedure OnThemeChange(AEvent: IThemeChangeEvent);
    [Subscribe]
    procedure OnSettingChange(AEvent: ISettingChangeEvent);
  end;

var
  wMainForm: TwMainForm;

implementation

{$R *.dfm}

uses
  Qizmos.DataModule, Qizmos.Settings, Qizmos.About, Qizmos.Types,
  Qizmos.WelcomeForm, Qizmos.SettingsForm, Qizmos.SimulatorsForm;

{ TwMain }

procedure TwMainForm.acHelpAboutExecute(Sender: TObject);
begin
  TwAbout.ExecuteDialog;
end;

procedure TwMainForm.acSectionSettingsExecute(Sender: TObject);
begin
  ManagedForms.ShowForm(mfMainSettings);
end;

procedure TwMainForm.acSectionSimulatorsExecute(Sender: TObject);
begin
  ManagedForms.ShowForm(mfMainSimulators);
end;

procedure TwMainForm.acSectionWelcomeExecute(Sender: TObject);
begin
  ManagedForms.ShowForm(mfMainWelcome);
end;

procedure TwMainForm.ActiveFormChanged(ActiveForm: TQzManagedForm);
begin
  txCaption.Caption := ActiveForm.Caption;
  imIcon.ImageIndex := ActiveForm.ImageIndex;
  Caption := 'Qizmos - ' + ActiveForm.Caption;

  if ActiveForm.FormId = mfMainSettings then
    nvHeader.ItemIndex := -1
  else
    nvFooter.ItemIndex := -1;

  case ActiveForm.FormId of
    mfMainSettings:
      nvFooter.ItemIndex := 0;
    mfMainWelcome:
      nvHeader.ItemIndex := 0;
    mfMainSimulators:
      nvHeader.ItemIndex := 1;
  end;
end;

procedure TwMainForm.aeAppEventsMinimize(Sender: TObject);
begin
  if ApplicationSettings.MinimizeToTray then
    begin
      Hide;
      WindowState := wsMinimized;
      tiTrayIcon.Visible := true;
    end;
end;

procedure TwMainForm.btBurgerButtonClick(Sender: TObject);
begin
  svSplitView.Opened := not svSplitView.Opened;
end;

procedure TwMainForm.FontChanged;
begin
  inherited;
  nvHeader.Font.Size := Font.Size + 2;
  nvFooter.Font.Size := Font.Size + 2;
end;

procedure TwMainForm.FormCreate(Sender: TObject);
begin
  acSectionWelcome.Execute;
  GlobalEventBus.RegisterSubscriberForEvents(Self);
  dmCommon.MainFormCreated;
  InitSettings;
end;

procedure TwMainForm.FormDestroy(Sender: TObject);
begin
  ApplicationSettings.FormPosition.SavePosition(self);
end;

function TwMainForm.GetFormId: TQzManagedFormId;
begin
  Result := mfMainForm;
end;

procedure TwMainForm.InitSettings;
begin
  svSplitView.Opened := ApplicationSettings.DrawerOpened;
  ApplicationSettings.FormPosition.LoadPosition(self);
  if ApplicationSettings.StartMinimized then
    begin
      if ApplicationSettings.MinimizeToTray then
        tiTrayIcon.Visible := true
      else
        WindowState := wsMinimized;
    end;
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
var
  Form: TQzManagedForm;
begin
  Form := ManagedForms.ShowForm(AEvent.FormId);
  if Assigned(Form) then
    Form.ManagedForms.ShowForm(AEvent.SubId);
end;

procedure TwMainForm.OnSettingChange(AEvent: ISettingChangeEvent);
begin
  case AEvent.Value of
    svFont:
      FontChanged;
  end;
end;

procedure TwMainForm.OnThemeChange(AEvent: IThemeChangeEvent);
begin
  ThemeChanged;
end;

procedure TwMainForm.RegisterForms;
begin
  inherited;
  ManagedForms.Container := pnFormContainer;
  ManagedForms.AddForm(TwWelcomeForm);
  ManagedForms.AddForm(TwSettingsForm);
  ManagedForms.AddForm(TwSimulatorsForm);
end;

procedure TwMainForm.RestoreFromTray;
begin
  tiTrayIcon.Visible := false;
  Show;
  WindowState := wsNormal;
  Application.BringToFront;
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

procedure TwMainForm.ThemeChanged;
begin
  inherited;
  imIcon.ImageCollection := dmCommon.GetImageCollection;
  vilIcons.ImageCollection := dmCommon.GetImageCollection;
  vilLargeIcons.ImageCollection := dmCommon.GetImageCollection;
end;

procedure TwMainForm.tiTrayIconClick(Sender: TObject);
begin
  RestoreFromTray;
end;

procedure TwMainForm.tiTrayIconDblClick(Sender: TObject);
begin
  RestoreFromTray;
end;

procedure TwMainForm.WMSettingChange(var Message: TWMSettingChange);
begin
  if SameText('ImmersiveColorSet', String(Message.Section)) then
    ApplicationSettings.WindowsThemeChanged;
end;

end.
