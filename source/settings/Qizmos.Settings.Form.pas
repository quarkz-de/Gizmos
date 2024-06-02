unit Qizmos.Settings.Form;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.ImageList, 
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ImgList,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.VirtualImageList, Vcl.ComCtrls,
  Qodelib.NavigationView, Qodelib.Panels, Qodelib.ManagedForms,
  Qizmos.Core.Forms;

type
  TwSettingsForm = class(TManagedForm)
    viImages: TVirtualImageList;
    nvNavigation: TQzNavigationView;
    pnFormContainer: TQzPanel;
    procedure FormCreate(Sender: TObject);
    procedure nvNavigationButtonClicked(Sender: TObject; Index: Integer);
  protected
    function GetFormId: TQzManagedFormId; override;
    function GetImageIndex: Integer; override;
    procedure ThemeChanged; override;
    procedure RegisterForms; override;
  end;

implementation

{$R *.dfm}

uses
  Qizmos.App.DataModule, Qizmos.Core.Settings, Qizmos.Core.Types,
  Qizmos.Settings.CommonForm, Qizmos.Settings.InfoForm,
  Qizmos.Settings.NotesForm, Qizmos.Settings.SimulatorsForm;

const
  iiSystemTheme = 0;
  iiLightTheme = 1;
  iiDarkTheme = 2;

{ TwSettingsForm }

procedure TwSettingsForm.FormCreate(Sender: TObject);
begin
  ManagedForms.ShowForm(mfSettingsCommon);
end;

function TwSettingsForm.GetFormId: TQzManagedFormId;
begin
  Result := mfMainSettings;
end;

function TwSettingsForm.GetImageIndex: Integer;
begin
  Result := iiMainSettings;
end;

procedure TwSettingsForm.nvNavigationButtonClicked(Sender: TObject;
  Index: Integer);
begin
  ManagedForms.ShowForm(nvNavigation.Items[Index].Tag);
end;

procedure TwSettingsForm.RegisterForms;
var
  Helper: TNavigationViewFormHelper;
begin
  inherited;

  ManagedForms.Container := pnFormContainer;

  Helper := TNavigationViewFormHelper.Create(self, nvNavigation);
  Helper.AddForm(TwSettingsCommonForm);
  Helper.AddForm(TwSettingsNotesForm);
  Helper.AddForm(TwSettingsSimulatorsForm);
  Helper.AddForm(TwSettingsInfoForm);
  Helper.Free;
end;

procedure TwSettingsForm.ThemeChanged;
begin
  inherited;
  viImages.UpdateImageList;
end;

end.
