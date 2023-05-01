unit Qizmos.Types;

interface

uses
  Vcl.WinXCtrls;

const
  SwitchStates: array[Boolean] of TToggleSwitchState = (tssOff, tssOn);
  ServerStates: array[Boolean] of String = ('inaktiv', 'aktiv');

  mfMaxItemsPerGroup = 100;

  mfMainBase = 100;
  mfMainSettings = mfMainBase + 1;
  mfMainWelcome = mfMainBase + 2;
  mfMainSimulators = mfMainBase + 3;

  mfSettingsBase = 200;
  mfSettingsCommon = mfSettingsBase + 1;
  mfSettingsInfo = mfSettingsBase + 2;
  mfSettingsSimulators = mfSettingsBase + 3;

  mfSimulatorsBase = 300;
  mfSimulatorsSmtp = mfSimulatorsBase + 1;
  mfSimulatorsHttp = mfSimulatorsBase + 2;

type
  TManagedFormId = type Integer;

  TManagedFormIdHelper = record helper for TManagedFormId
  public
    function ToString: String; inline;
    function ToImageIndex: Integer; inline;
    function IsMainModule: Boolean; inline;
    function IsSubModule(const AMainModule: TManagedFormId): Boolean; inline;
    function BaseOf: TManagedFormId; inline;
  end;

implementation

{ TManagedFormIdHelper }

function TManagedFormIdHelper.BaseOf: TManagedFormId;
begin
  Result := (self mod 100) * 100;
end;

function TManagedFormIdHelper.IsMainModule: Boolean;
begin
  Result := (self > mfMainBase) and (self < mfMainBase + mfMaxItemsPerGroup);
end;

function TManagedFormIdHelper.IsSubModule(
  const AMainModule: TManagedFormId): Boolean;
var
  Base: TManagedFormId;
begin
  Base := self.BaseOf;
  Result := (self > Base) and (self < Base + mfMaxItemsPerGroup);
end;

function TManagedFormIdHelper.ToImageIndex: Integer;
begin
  case self of
    mfMainSettings:
      Result := 2;
    mfMainWelcome:
      Result := 5;
    mfMainSimulators:
      Result := 6;
    mfSettingsCommon:
      Result := -1;
    mfSettingsInfo:
      Result := -1;
    mfSimulatorsSmtp:
      Result := -1;
    mfSimulatorsHttp:
      Result := -1;
    else
      Result := -1;
  end;
end;

function TManagedFormIdHelper.ToString: String;
begin
  case self of
    mfMainSettings:
      Result := 'Einstellungen';
    mfMainWelcome:
      Result := 'Start';
    mfMainSimulators:
      Result := 'Simulatoren';
    mfSettingsCommon:
      Result := 'Allgemein';
    mfSettingsInfo:
      Result := 'Info';
    mfSimulatorsSmtp:
      Result := 'SMTP Blackhole';
    mfSimulatorsHttp:
      Result := 'HTTP Blackhole';
    else
      Result := '';
  end;
end;

end.
