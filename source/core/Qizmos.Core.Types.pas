unit Qizmos.Core.Types;

interface

uses
  Vcl.WinXCtrls;

const
  // Managed Form IDs
  mfMaxItemsPerGroup = 100;

  mfMainForm = 1;

  mfMainBase = 100;
  mfMainSettings = mfMainBase + 1;
  mfMainWelcome = mfMainBase + 2;
  mfMainSimulators = mfMainBase + 3;
  mfMainNotes = mfMainBase + 4;
  mfMainRedmine = mfMainBase + 5;

  mfSettingsBase = 200;
  mfSettingsCommon = mfSettingsBase + 1;
  mfSettingsInfo = mfSettingsBase + 2;
  mfSettingsSimulators = mfSettingsBase + 3;
  mfSettingsNotes = mfSettingsBase + 4;
  mfSettingsRedmine = mfSettingsBase + 5;

  mfSimulatorsBase = 300;
  mfSimulatorsSmtp = mfSimulatorsBase + 1;
  mfSimulatorsHttp = mfSimulatorsBase + 2;

  mfRedmineBase = 400;
  mfRedmineUser = mfRedmineBase + 1;

  // Image Indexes
  iiMainSettings = 2;
  iiMainWelcome = 28;
  iiMainSimulators = 6;
  iiMainNotes = 11;
  iiMainRedmine = 29;

  iiSettingsCommon = 2;
  iiSettingsSimulators = 6;
  iiSettingsInfo = 1;
  iiSettingsNotes = 11;
  iiSettingsRedmine = 29;

  iiSimulatorsSmtp = 7;
  iiSimulatorsHttp = 8;
  iiNotes = 11;
  iiRedmine = 29;
  iiRedmineUser = 30;

  // Other
  SwitchStates: array[Boolean] of TToggleSwitchState = (tssOff, tssOn);
  ServerStates: array[Boolean] of String = ('inaktiv', 'aktiv');
  DefaultFontName = 'Segoe UI';

implementation

end.
