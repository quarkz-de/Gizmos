program Qizmos;

uses
  Spring.Container,
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  Vcl.Styles.Hooks,
  Vcl.Styles.UxTheme,
  Vcl.Styles.Utils.Menus,
  Vcl.Styles.Utils.Forms,
  Vcl.Styles.Utils.ComCtrls,
  Vcl.Styles.Utils.ScreenTips,
  Qodelib.Instance,
  Qizmos.Main in 'Qizmos.Main.pas' {wMainForm},
  Qizmos.DataModule in 'Qizmos.DataModule.pas' {dmCommon: TDataModule},
  Qizmos.Events in 'core\Qizmos.Events.pas',
  Qizmos.Settings in 'core\Qizmos.Settings.pas',
  Qizmos.About in 'views\Qizmos.About.pas' {wAbout},
  Qizmos.Forms in 'views\Qizmos.Forms.pas',
  Qizmos.SettingsForm in 'views\Qizmos.SettingsForm.pas' {wSettingsForm},
  Qizmos.WelcomeForm in 'views\Qizmos.WelcomeForm.pas' {wWelcomeForm},
  Qizmos.SettingsCommonForm in 'views\Qizmos.SettingsCommonForm.pas' {wSettingsCommonForm},
  Qizmos.SettingsInfoForm in 'views\Qizmos.SettingsInfoForm.pas' {wSettingsInfoForm};

{$R *.res}

begin
{$ifdef DEBUG}
  ReportMemoryLeaksOnShutdown := True;
{$endif}
  if not CheckSingleInstance('{6E17851E-B957-436A-BBC1-737C9A637566}') then
    Halt(0);
  GlobalContainer.Build;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Qizmos';
  Application.CreateForm(TdmCommon, dmCommon);
  Application.CreateForm(TwMainForm, wMainForm);
  Application.CreateForm(TwSettingsCommonForm, wSettingsCommonForm);
  Application.CreateForm(TwSettingsInfoForm, wSettingsInfoForm);
  Application.Run;
end.
