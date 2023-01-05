program Gizmos;

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
  Gizmos.Main in 'Gizmos.Main.pas' {wMainForm},
  Gizmos.DataModule in 'Gizmos.DataModule.pas' {dmCommon: TDataModule},
  Gizmos.Events in 'core\Gizmos.Events.pas',
  Gizmos.Settings in 'core\Gizmos.Settings.pas',
  Gizmos.About in 'views\Gizmos.About.pas' {wAbout},
  Gizmos.Forms in 'views\Gizmos.Forms.pas',
  Gizmos.SettingsForm in 'views\Gizmos.SettingsForm.pas' {wSettingsForm},
  Gizmos.WelcomeForm in 'views\Gizmos.WelcomeForm.pas' {wWelcomeForm},
  Gizmos.ModuleFrame in 'views\Gizmos.ModuleFrame.pas' {frBlackholeModule: TFrame},
  Gizmos.Modules in 'modules\Gizmos.Modules.pas';

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
  Application.Title := 'Gizmos';
  Application.CreateForm(TdmCommon, dmCommon);
  Application.CreateForm(TwMainForm, wMainForm);
  Application.Run;
end.
