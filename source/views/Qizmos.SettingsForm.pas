unit Qizmos.SettingsForm;

interface

uses
  Winapi.Windows, Winapi.Messages, Winapi.ShellAPI,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.VirtualImage, System.ImageList, Vcl.ImgList,
  Vcl.VirtualImageList, Vcl.ComCtrls, Vcl.ActnList,
  Eventbus,
  Qodelib.NavigationView,
  Qizmos.Forms, Qizmos.Events;

type
  TwSettingsForm = class(TManagedForm)
    imIcon: TVirtualImage;
    txCaption: TLabel;
    shHeader: TShape;
    viImages: TVirtualImageList;
    nvSettings: TQzNavigationView;
    alActions: TActionList;
    acSettings: TAction;
    acInfo: TAction;
    shBorder: TShape;
    procedure FormDestroy(Sender: TObject);
    procedure acInfoExecute(Sender: TObject);
    procedure acSettingsExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FForms: TManagedFormList;
  protected
    property Forms: TManagedFormList read FForms;
  public
  end;

implementation

{$R *.dfm}

uses
  Qodelib.IOUtils,
  Qizmos.Settings;

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
  FForms := TSettingsFormList.Create(self);
  acSettings.Execute;
end;

procedure TwSettingsForm.FormDestroy(Sender: TObject);
begin
  FForms.Free;
end;

end.
