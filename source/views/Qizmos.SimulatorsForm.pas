unit Qizmos.SimulatorsForm;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.VirtualImageList,
  Qodelib.NavigationView, Qodelib.Panels, Qodelib.ManagedForms,
  Qizmos.Forms, Qizmos.Types, System.ImageList, Vcl.ImgList;

type
  TwSimulatorsForm = class(TManagedForm)
    viImages: TVirtualImageList;
    nvNavigation: TQzNavigationView;
    pnFormContainer: TQzPanel;
    procedure FormCreate(Sender: TObject);
    procedure nvNavigationButtonClicked(Sender: TObject; Index: Integer);
  public
    function GetFormId: TQzManagedFormId; override;
    function GetImageIndex: Integer; override;
    procedure ThemeChanged; override;
    procedure RegisterForms; override;
  end;

var
  wSimulatorsForm: TwSimulatorsForm;

implementation

{$R *.dfm}

uses
  Qizmos.DataModule,
  Qizmos.SimulatorsSmtpForm, Qizmos.SimulatorsHttpForm;

{ TwSimulatorsForm }

procedure TwSimulatorsForm.FormCreate(Sender: TObject);
begin
  ManagedForms.ShowForm(mfSimulatorsSmtp);
end;

function TwSimulatorsForm.GetFormId: TQzManagedFormId;
begin
  Result := mfMainSimulators;
end;

function TwSimulatorsForm.GetImageIndex: Integer;
begin
  Result := iiMainSimulators;
end;

procedure TwSimulatorsForm.nvNavigationButtonClicked(Sender: TObject;
  Index: Integer);
begin
  ManagedForms.ShowForm(nvNavigation.Items[Index].Tag);
end;

procedure TwSimulatorsForm.RegisterForms;
var
  Helper: TNavigationViewFormHelper;
begin
  inherited;

  ManagedForms.Container := pnFormContainer;

  Helper := TNavigationViewFormHelper.Create(self, nvNavigation);
  Helper.AddForm(TwSimulatorsSmtpForm);
  Helper.AddForm(TwSimulatorsHttpForm);
  Helper.Free;
end;

procedure TwSimulatorsForm.ThemeChanged;
begin
  inherited;
  viImages.ImageCollection := dmCommon.GetImageCollection;
end;

end.
