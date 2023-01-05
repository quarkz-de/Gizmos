unit Gizmos.DataModule;

interface

uses
  System.SysUtils, System.Classes, System.IOUtils,
  Vcl.BaseImageCollection, Vcl.ImageCollection, Vcl.Forms,
  i18nCore, i18nLocalizer;

type
  TdmCommon = class(TDataModule)
    icLogo: TImageCollection;
    locLocalizer: TLocalizer;
    icIcons: TImageCollection;
    icModules: TImageCollection;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    procedure InitializeTranslations;
  public
    procedure MainFormCreated;
  end;

var
  dmCommon: TdmCommon;

implementation

uses
  Spring.Container,
  Gizmos.Settings;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmCommon.DataModuleCreate(Sender: TObject);
begin
  ApplicationSettings.LoadSettings;
end;

procedure TdmCommon.DataModuleDestroy(Sender: TObject);
begin
  ApplicationSettings.SaveSettings;
end;

procedure TdmCommon.InitializeTranslations;
var
  Filename: String;
begin
  Filename := TPath.ChangeExtension(Application.Exename, '.i18n');
{$ifdef DEBUG}
  if not TFile.Exists(Filename) then
    Filename := TPath.Combine(TPath.Combine(TPath.GetDirectoryName(Application.Exename), '..\..'),
      TPath.ChangeExtension(TPath.GetFileName(Application.Exename), '.i18n'));
{$endif}
  if TFile.Exists(Filename) then
    locLocalizer.URI := Filename;
  locLocalizer.Culture := CultureOf(ApplicationSettings.Language);
end;

procedure TdmCommon.MainFormCreated;
begin
  InitializeTranslations;
end;

end.
