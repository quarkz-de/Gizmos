program Blackholes;

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
  Blackholes.Main in 'Blackholes.Main.pas' {wMainForm},
  Blackholes.DataModule in 'Blackholes.DataModule.pas' {dmCommon: TDataModule},
  Blackholes.Events in 'core\Blackholes.Events.pas',
  Blackholes.Settings in 'core\Blackholes.Settings.pas',
  Blackholes.About in 'views\Blackholes.About.pas' {wAbout},
  Blackholes.Forms in 'views\Blackholes.Forms.pas',
  Blackholes.SettingsForm in 'views\Blackholes.SettingsForm.pas' {wSettingsForm},
  Blackholes.WelcomeForm in 'views\Blackholes.WelcomeForm.pas' {wWelcomeForm};

{$R *.res}

begin
{$ifdef DEBUG}
  ReportMemoryLeaksOnShutdown := True;
{$endif}
  GlobalContainer.Build;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Blackholes';
  Application.CreateForm(TdmCommon, dmCommon);
  Application.CreateForm(TwMainForm, wMainForm);
  Application.Run;
end.
