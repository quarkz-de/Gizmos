unit Qizmos.App.DataModule;

interface

uses
  System.SysUtils, System.Classes,
  Vcl.BaseImageCollection, Vcl.ImageCollection, Vcl.Forms,
  SVGIconImageCollection;

type
  TdmCommon = class(TDataModule)
    icLogo: TImageCollection;
    icSvgIcons: TSVGIconImageCollection;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    procedure ThemeChanged;
  public
    procedure MainFormCreated;
  end;

var
  dmCommon: TdmCommon;

implementation

uses
  Spring.Container,
  EventBus,
  Qizmos.Core.Settings, Qizmos.Core.Events;

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

procedure TdmCommon.MainFormCreated;
begin
  ThemeChanged;
end;

procedure TdmCommon.ThemeChanged;
begin
  GlobalEventBus.Post(TEventFactory.NewThemeChangeEvent);
end;

end.
