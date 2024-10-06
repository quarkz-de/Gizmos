unit Qizmos.App.Main;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.ImageList,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ImgList,
  Vcl.VirtualImageList, Vcl.Buttons, Vcl.StdCtrls, Vcl.VirtualImage,
  Vcl.ExtCtrls, Vcl.WinXCtrls, Vcl.AppEvnts,
  EventBus,
  Qodelib.NavigationView, Qodelib.ManagedForms, Qodelib.Panels,
  Qizmos.Core.Forms, Qizmos.Core.Events;

type
  TwMainForm = class(TManagedForm)
    vilLargeIcons: TVirtualImageList;
    vilIcons: TVirtualImageList;
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
    btSwitchStyle: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure acHelpAboutExecute(Sender: TObject);
    procedure aeAppEventsMinimize(Sender: TObject);
    procedure btBurgerButtonClick(Sender: TObject);
    procedure btSwitchStyleClick(Sender: TObject);
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
  Qizmos.App.DataModule, Qizmos.App.WelcomeForm, Qizmos.App.About,
  Qizmos.Core.Settings, Qizmos.Core.Types,
  Qizmos.Settings.Form, Qizmos.Simulators.Form, Qizmos.Notes.Form,
  Qizmos.Redmine.Form;

{ TwMain }

procedure TwMainForm.acHelpAboutExecute(Sender: TObject);
begin
  TwAbout.ExecuteDialog;
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
    mfMainNotes:
      nvHeader.ItemIndex := 1;
    mfMainSimulators:
      nvHeader.ItemIndex := 2;
    mfMainRedmine:
      nvHeader.ItemIndex := 3;
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

procedure TwMainForm.btSwitchStyleClick(Sender: TObject);
begin
  case ApplicationSettings.Theme of
    atSystem:
      begin
        if TApplicationSettings.IsDarkThemeEnabled then
          ApplicationSettings.Theme := atLight
        else
          ApplicationSettings.Theme := atDark;
      end;
    atLight:
      ApplicationSettings.Theme := atDark;
    atDark:
      ApplicationSettings.Theme := atLight;
  end;
end;

procedure TwMainForm.FontChanged;
const
  HeaderFontSizeDelta = 2;
begin
  inherited;
  nvHeader.Font.Size := Font.Size + HeaderFontSizeDelta;
  nvFooter.Font.Size := Font.Size + HeaderFontSizeDelta;
end;

procedure TwMainForm.FormCreate(Sender: TObject);
begin
  ManagedForms.ShowForm(mfMainWelcome);
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
  ManagedForms.ShowForm(nvFooter.Items[Index].Tag);
  nvHeader.ItemIndex := -1;
end;

procedure TwMainForm.nvHeaderButtonClicked(Sender: TObject; Index: Integer);
begin
  ManagedForms.ShowForm(nvHeader.Items[Index].Tag);
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
var
  Helper: TNavigationViewFormHelper;
begin
  inherited;
  ManagedForms.Container := pnFormContainer;

  Helper := TNavigationViewFormHelper.Create(self, nvHeader);
  Helper.AddForm(TwWelcomeForm);
  Helper.AddForm(TwNotesForm);
  Helper.AddForm(TwSimulatorsForm);
  Helper.AddForm(TwRedmineForm);
  Helper.Free;

  Helper := TNavigationViewFormHelper.Create(self, nvFooter);
  Helper.AddForm(TwSettingsForm);
  Helper.Free;
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
  vilIcons.UpdateImageList;
  vilLargeIcons.UpdateImageList;
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
