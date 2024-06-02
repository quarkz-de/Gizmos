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
  Qizmos.Core.Events in 'core\Qizmos.Core.Events.pas',
  Qizmos.Core.Settings in 'core\Qizmos.Core.Settings.pas',
  Qizmos.Core.Types in 'core\Qizmos.Core.Types.pas',
  Qizmos.Core.Forms in 'core\Qizmos.Core.Forms.pas',
  Qizmos.Core.Markdown in 'core\Qizmos.Core.Markdown.pas',
  Qizmos.Core.Shell in 'core\Qizmos.Core.Shell.pas',
  Qizmos.App.Main in 'app\Qizmos.App.Main.pas' {wMainForm},
  Qizmos.App.DataModule in 'app\Qizmos.App.DataModule.pas' {dmCommon: TDataModule},
  Qizmos.App.About in 'app\Qizmos.App.About.pas' {wAbout},
  Qizmos.App.WelcomeForm in 'app\Qizmos.App.WelcomeForm.pas' {wWelcomeForm},
  Qizmos.Settings.Form in 'settings\Qizmos.Settings.Form.pas' {wSettingsForm},
  Qizmos.Settings.CommonForm in 'settings\Qizmos.Settings.CommonForm.pas' {wSettingsCommonForm},
  Qizmos.Settings.InfoForm in 'settings\Qizmos.Settings.InfoForm.pas' {wSettingsInfoForm},
  Qizmos.Settings.NotesForm in 'settings\Qizmos.Settings.NotesForm.pas' {wSettingsNotesForm},
  Qizmos.Settings.SimulatorsForm in 'settings\Qizmos.Settings.SimulatorsForm.pas' {wSettingsSimulatorsForm},
  Qizmos.Settings.FormHelpers in 'settings\Qizmos.Settings.FormHelpers.pas',
  Qizmos.Simulators.Form in 'simulators\Qizmos.Simulators.Form.pas' {wSimulatorsForm},
  Qizmos.Simulators.SmtpForm in 'simulators\Qizmos.Simulators.SmtpForm.pas' {wSimulatorsSmtpForm},
  Qizmos.Simulators.HttpForm in 'simulators\Qizmos.Simulators.HttpForm.pas' {wSimulatorsHttpForm},
  Qizmos.Simulators.SmtpVisualizers in 'simulators\Qizmos.Simulators.SmtpVisualizers.pas',
  Qizmos.Simulators.HttpVisualizers in 'simulators\Qizmos.Simulators.HttpVisualizers.pas',
  Qizmos.Simulators.EMailViewer in 'simulators\Qizmos.Simulators.EMailViewer.pas' {wEMailViewer},
  Qizmos.Notes.Form in 'notes\Qizmos.Notes.Form.pas' {wNotesForm},
  Qizmos.Notes.Visualizers in 'notes\Qizmos.Notes.Visualizers.pas';

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
  Application.CreateForm(TwSettingsNotesForm, wSettingsNotesForm);
  Application.ShowMainForm := not (ApplicationSettings.StartMinimized and ApplicationSettings.MinimizeToTray);
  Application.Run;
end.
