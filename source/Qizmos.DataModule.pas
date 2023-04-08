unit Qizmos.DataModule;

interface

uses
  System.SysUtils, System.Classes, System.IOUtils,
  Vcl.BaseImageCollection, Vcl.ImageCollection, Vcl.Forms;

type
  TdmCommon = class(TDataModule)
    icLogo: TImageCollection;
    icLightIcons: TImageCollection;
    icDarkIcons: TImageCollection;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    procedure ThemeChanged;
  public
    procedure MainFormCreated;
    function GetImageCollection: TImageCollection;
  end;

var
  dmCommon: TdmCommon;

implementation

uses
  Spring.Container,
  EventBus,
  Qizmos.Settings, Qizmos.Events;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmCommon.DataModuleCreate(Sender: TObject);
begin
  ApplicationSettings.LoadSettings;
  ThemeChanged;
end;

procedure TdmCommon.DataModuleDestroy(Sender: TObject);
begin
  ApplicationSettings.SaveSettings;
end;

function TdmCommon.GetImageCollection: TImageCollection;
begin
  if ApplicationSettings.IsDarkTheme then
    Result := icLightIcons
  else
    Result := icDarkIcons;
end;

procedure TdmCommon.MainFormCreated;
begin
  ThemeChanged;
end;

procedure TdmCommon.ThemeChanged;
begin
  GlobalEventBus.Post(TEventFactory.NewThemeChangeEvent);
end;

end.
