unit Gizmos.Settings;

interface

uses
  System.SysUtils, System.Classes,
  Winapi.Windows,
  Vcl.Forms, Vcl.Themes, Vcl.Styles,
  i18nCore;

type
  TApplicationFormPosition = class(TPersistent)
  private
    FWindowState: TWindowState;
    FTop: Integer;
    FLeft: Integer;
    FHeight: Integer;
    FWidth: Integer;
  public
    procedure Assign(Source: TPersistent); override;
    procedure LoadPosition(const AForm: TForm);
    procedure SavePosition(const AForm: TForm);
  published
    property WindowState: TWindowState read FWindowState write FWindowState;
    property Top: Integer read FTop write FTop;
    property Left: Integer read FLeft write FLeft;
    property Height: Integer read FHeight write FHeight;
    property Width: Integer read FWidth write FWidth;
  end;

  TApplicationSettingValue = (svEditorFont);

  TApplicationTheme = (atLight, atDark);

  TApplicationSettings = class(TPersistent)
  private
    FTheme: TApplicationTheme;
    FDrawerOpened: Boolean;
    FFormPosition: TApplicationFormPosition;
    FLanguage: String;
    procedure SetTheme(const AValue: TApplicationTheme);
    function GetTheme: TApplicationTheme;
    function GetSettingsFilename: String;
    function GetSettingsFoldername: String;
    procedure SetFormPositon(const Value: TApplicationFormPosition);
    procedure ChangeEvent(const AValue: TApplicationSettingValue);
  public
    constructor Create;
    destructor Destroy; override;
    procedure LoadSettings;
    procedure SaveSettings;
  published
    property Theme: TApplicationTheme read GetTheme write SetTheme;
    property DrawerOpened: Boolean read FDrawerOpened write FDrawerOpened;
    property FormPosition: TApplicationFormPosition read FFormPosition
      write SetFormPositon;
    property Language: String read FLanguage write FLanguage;
  end;

var
  ApplicationSettings: TApplicationSettings;

implementation

uses
  System.IOUtils, System.JSON,
  Neon.Core.Persistence, Neon.Core.Persistence.JSON,
  EventBus,
  Qodelib.IOUtils,
  Gizmos.Events, Gizmos.DataModule;

{ TApplicationSettings }

procedure TApplicationSettings.ChangeEvent(const AValue: TApplicationSettingValue);
begin
  GlobalEventBus.Post(TEventFactory.NewSettingChangeEvent(AValue));
end;

constructor TApplicationSettings.Create;
begin
  inherited Create;
  FTheme := atLight;
  FFormPosition := TApplicationFormPosition.Create;
  FDrawerOpened := true;
  FLanguage := 'en-US';
end;

destructor TApplicationSettings.Destroy;
begin
  FormPosition.Free;
  inherited;
end;

function TApplicationSettings.GetSettingsFilename: String;
begin
  Result := TPath.Combine(GetSettingsFoldername, 'Gizmos.json');
end;

function TApplicationSettings.GetSettingsFoldername: String;
begin
  Result := TPath.Combine(TKnownFolders.GetAppDataPath, 'quarkz');
end;

function TApplicationSettings.GetTheme: TApplicationTheme;
begin
  Result := FTheme;
end;

procedure TApplicationSettings.LoadSettings;
var
  JSON: TJSONValue;
  Strings: TStringList;
begin
  if FileExists(GetSettingsFilename) then
    begin
      Strings := TStringList.Create;
      Strings.LoadFromFile(GetSettingsFilename);
      JSON := TJSONObject.ParseJSONValue(Strings.Text);
      TNeon.JSONToObject(self, JSON, TNeonConfiguration.Default);
      JSON.Free;
      Strings.Free;
    end;
end;

procedure TApplicationSettings.SaveSettings;
var
  JSON: TJSONValue;
  Stream: TFileStream;
begin
  ForceDirectories(GetSettingsFoldername);
  JSON := TNeon.ObjectToJSON(self);
  Stream := TFileStream.Create(GetSettingsFilename, fmCreate);
  TNeon.PrintToStream(JSON, Stream, true);
  Stream.Free;
  JSON.Free;
end;

procedure TApplicationSettings.SetFormPositon(
  const Value: TApplicationFormPosition);
begin
  FFormPosition.Assign(Value);
end;

procedure TApplicationSettings.SetTheme(const AValue: TApplicationTheme);
var
  ThemeName: String;
begin
  FTheme := AValue;
  case FTheme of
    atLight:
      ThemeName := 'Windows11 Modern Light';
    atDark:
      ThemeName := 'Windows11 Modern Dark';
    else
      ThemeName := 'Windows';
  end;

  TStyleManager.TrySetStyle(ThemeName);
end;

{ TApplicationFormPosition }

procedure TApplicationFormPosition.Assign(Source: TPersistent);
begin
  if Source is TApplicationFormPosition then
    begin
      WindowState := TApplicationFormPosition(Source).WindowState;
      Top := TApplicationFormPosition(Source).Top;
      Left := TApplicationFormPosition(Source).Left;
      Height := TApplicationFormPosition(Source).Height;
      Width := TApplicationFormPosition(Source).Width;
    end
  else
    inherited Assign(Source);
end;

procedure TApplicationFormPosition.SavePosition(const AForm: TForm);
begin
  WindowState := AForm.WindowState;
  Top := AForm.Top;
  Left := AForm.Left;
  Height := AForm.Height;
  Width := AForm.Width;
end;

procedure TApplicationFormPosition.LoadPosition(const AForm: TForm);
begin
  if (Width > 0) and (Height > 0) then
  begin
    AForm.WindowState := WindowState;
    AForm.Top := Top;
    AForm.Left := Left;
    AForm.Height := Height;
    AForm.Width := Width;
  end;
end;

initialization
  ApplicationSettings := TApplicationSettings.Create;

finalization
  FreeAndNil(ApplicationSettings);

end.

