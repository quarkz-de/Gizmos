unit Qizmos.SimulatorsForm;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.ImageList,
  System.Actions,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.VirtualImage,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ImgList, Vcl.VirtualImageList,
  Vcl.ActnList,
  Qodelib.NavigationView, Qodelib.Panels,
  Qizmos.Forms, Qizmos.Events, Qizmos.Types;

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
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FForms: TManagedFormList;
  public
    procedure ThemeChanged; override;
    procedure SelectSubForm(const AForm: TManagedFormId); override;
  end;

var
  wSimulatorsForm: TwSimulatorsForm;

implementation

{$R *.dfm}

uses
  Qizmos.DataModule;

{ TwSimulatorsForm }

procedure TwSimulatorsForm.acHttpBlackholeExecute(Sender: TObject);
begin
  FForms.ShowForm(mfSimulatorsHttp);
end;

procedure TwSimulatorsForm.acSmtpBlackholeExecute(Sender: TObject);
begin
  FForms.ShowForm(mfSimulatorsSmtp);
end;

procedure TwSimulatorsForm.FormCreate(Sender: TObject);
begin
  FForms := TSimulatorsFormList.Create(pnFormContainer);
  acSmtpBlackhole.Execute;
end;

procedure TwSimulatorsForm.FormDestroy(Sender: TObject);
begin
  FForms.Free;
end;

procedure TwSimulatorsForm.SelectSubForm(const AForm: TManagedFormId);
begin
  case AForm of
    mfSimulatorsSmtp:
      begin
        acSmtpBlackhole.Execute;
        nvSettings.ItemIndex := 0;
      end;
    mfSimulatorsHttp:
      begin
        acHttpBlackhole.Execute;
        nvSettings.ItemIndex := 1;
      end;
  end;
end;

procedure TwSimulatorsForm.ThemeChanged;
begin
  inherited;
  viImages.ImageCollection := dmCommon.GetImageCollection;
  if FForms <> nil then
    FForms.ThemeChanged;
end;

end.
