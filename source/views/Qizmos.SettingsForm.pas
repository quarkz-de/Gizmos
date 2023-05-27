unit Qizmos.SettingsForm;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.VirtualImageList, Vcl.ComCtrls, Vcl.ActnList,
  Qodelib.NavigationView, Qodelib.Panels, Qodelib.ManagedForms,
  Qizmos.Forms, System.ImageList, Vcl.ImgList;

type
  TwSettingsForm = class(TManagedForm)
    viImages: TVirtualImageList;
    nvSettings: TQzNavigationView;
    alActions: TActionList;
    acSettings: TAction;
    acInfo: TAction;
    pnFormContainer: TQzPanel;
    acSimulators: TAction;
    procedure acInfoExecute(Sender: TObject);
    procedure acSettingsExecute(Sender: TObject);
    procedure acSimulatorsExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  protected
    function GetFormId: TQzManagedFormId; override;
    function GetImageIndex: Integer; override;
    procedure ThemeChanged; override;
    procedure RegisterForms; override;
    procedure ActiveFormChanged(ActiveForm: TQzManagedForm); override;
  end;

implementation

{$R *.dfm}

uses
  Qizmos.Settings, Qizmos.DataModule, Qizmos.Types,
  Qizmos.SettingsCommonForm, Qizmos.SettingsInfoForm,
  Qizmos.SettingsSimulatorsForm;

const
  iiSystemTheme = 0;
  iiLightTheme = 1;
  iiDarkTheme = 2;

{ TwSettingsForm }

procedure TwSettingsForm.acInfoExecute(Sender: TObject);
begin
  ManagedForms.ShowForm(mfSettingsInfo);
end;

procedure TwSettingsForm.acSettingsExecute(Sender: TObject);
begin
  ManagedForms.ShowForm(mfSettingsCommon);
end;

procedure TwSettingsForm.acSimulatorsExecute(Sender: TObject);
begin
  ManagedForms.ShowForm(mfSettingsSimulators);
end;

procedure TwSettingsForm.ActiveFormChanged(ActiveForm: TQzManagedForm);
begin
  inherited;

end;

procedure TwSettingsForm.FormCreate(Sender: TObject);
begin
  acSettings.Execute;
end;

function TwSettingsForm.GetFormId: TQzManagedFormId;
begin
  Result := mfMainSettings;
end;

function TwSettingsForm.GetImageIndex: Integer;
begin
  Result := iiMainSettings;
end;

procedure TwSettingsForm.RegisterForms;
begin
  inherited;
  ManagedForms.Container := pnFormContainer;
  ManagedForms.AddForm(TwSettingsCommonForm);
  ManagedForms.AddForm(TwSettingsSimulatorsForm);
  ManagedForms.AddForm(TwSettingsInfoForm);
end;

procedure TwSettingsForm.ThemeChanged;
begin
  inherited;
  viImages.ImageCollection := dmCommon.GetImageCollection;
end;

end.
