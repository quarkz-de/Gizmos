unit Qizmos.SettingsForm;

interface

uses
  Winapi.Windows, Winapi.Messages, Winapi.ShellAPI,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.VirtualImage, System.ImageList, Vcl.ImgList,
  Vcl.VirtualImageList, Vcl.ComCtrls, Vcl.ActnList,
  Qodelib.NavigationView,
  Qizmos.Forms, Qizmos.Events, Qodelib.Panels;

type
  TwSettingsForm = class(TManagedForm)
    viImages: TVirtualImageList;
    nvSettings: TQzNavigationView;
    alActions: TActionList;
    acSettings: TAction;
    acInfo: TAction;
    pnFormContainer: TQzPanel;
    procedure FormDestroy(Sender: TObject);
    procedure acInfoExecute(Sender: TObject);
    procedure acSettingsExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FForms: TManagedFormList;
  protected
    property Forms: TManagedFormList read FForms;
  public
    procedure ThemeChanged; override;
  end;

implementation

{$R *.dfm}

uses
  Qodelib.IOUtils,
  Qizmos.Settings, Qizmos.DataModule, Qizmos.Types;

const
  iiSystemTheme = 0;
  iiLightTheme = 1;
  iiDarkTheme = 2;

{ TwSettingsForm }

procedure TwSettingsForm.acInfoExecute(Sender: TObject);
begin
  FForms.ShowForm(mfSettingsInfo);
end;

procedure TwSettingsForm.acSettingsExecute(Sender: TObject);
begin
  FForms.ShowForm(mfSettingsCommon);
end;

procedure TwSettingsForm.FormCreate(Sender: TObject);
begin
  FForms := TSettingsFormList.Create(pnFormContainer);
  acSettings.Execute;
end;

procedure TwSettingsForm.FormDestroy(Sender: TObject);
begin
  FForms.Free;
end;

procedure TwSettingsForm.ThemeChanged;
begin
  inherited;
  viImages.ImageCollection := dmCommon.GetImageCollection;
  if FForms <> nil then
    FForms.ThemeChanged;
end;

end.
