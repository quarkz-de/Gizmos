unit Qizmos.DataModule;

interface

uses
  System.SysUtils, System.Classes, System.IOUtils,
  Vcl.BaseImageCollection, Vcl.ImageCollection, Vcl.Forms;

type
  TdmCommon = class(TDataModule)
    icLogo: TImageCollection;
    icIcons: TImageCollection;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  public
    procedure MainFormCreated;
  end;

var
  dmCommon: TdmCommon;

implementation

uses
  Spring.Container,
  Qizmos.Settings;

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

procedure TdmCommon.MainFormCreated;
begin
  //
end;

end.
