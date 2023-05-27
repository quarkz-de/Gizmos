unit Qizmos.SimulatorsForm;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  System.Actions,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.VirtualImageList,
  Vcl.ActnList,
  Qodelib.NavigationView, Qodelib.Panels, Qodelib.ManagedForms,
  Qizmos.Forms, Qizmos.Types, System.ImageList, Vcl.ImgList;

type
  TwSimulatorsForm = class(TManagedForm)
    alActions: TActionList;
    acSmtpBlackhole: TAction;
    acHttpBlackhole: TAction;
    viImages: TVirtualImageList;
    nvSettings: TQzNavigationView;
    pnFormContainer: TQzPanel;
    procedure acHttpBlackholeExecute(Sender: TObject);
    procedure acSmtpBlackholeExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  public
    function GetFormId: TQzManagedFormId; override;
    function GetImageIndex: Integer; override;
    procedure ThemeChanged; override;
    procedure RegisterForms; override;
    procedure ActiveFormChanged(ActiveForm: TQzManagedForm); override;
  end;

var
  wSimulatorsForm: TwSimulatorsForm;

implementation

{$R *.dfm}

uses
  Qizmos.DataModule,
  Qizmos.SimulatorsSmtpForm, Qizmos.SimulatorsHttpForm;

{ TwSimulatorsForm }

procedure TwSimulatorsForm.acHttpBlackholeExecute(Sender: TObject);
begin
  ManagedForms.ShowForm(mfSimulatorsHttp);
end;

procedure TwSimulatorsForm.acSmtpBlackholeExecute(Sender: TObject);
begin
  ManagedForms.ShowForm(mfSimulatorsSmtp);
end;

procedure TwSimulatorsForm.ActiveFormChanged(ActiveForm: TQzManagedForm);
begin
  inherited;

end;

procedure TwSimulatorsForm.FormCreate(Sender: TObject);
begin
  acSmtpBlackhole.Execute;
end;

function TwSimulatorsForm.GetFormId: TQzManagedFormId;
begin
  Result := mfMainSimulators;
end;

function TwSimulatorsForm.GetImageIndex: Integer;
begin
  Result := iiMainSimulators;
end;

procedure TwSimulatorsForm.RegisterForms;
begin
  inherited;
  ManagedForms.Container := pnFormContainer;
  ManagedForms.AddForm(TwSimulatorsSmtpForm);
  ManagedForms.AddForm(TwSimulatorsHttpForm)
end;

procedure TwSimulatorsForm.ThemeChanged;
begin
  inherited;
  viImages.ImageCollection := dmCommon.GetImageCollection;
end;

end.
