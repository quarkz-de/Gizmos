unit Qizmos.SimulatorsForm;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.ImageList,
  System.Actions,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.VirtualImage,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ImgList, Vcl.VirtualImageList,
  Vcl.ActnList,
  Qodelib.NavigationView,
  Qizmos.Forms;

type
  TwSimulatorsForm = class(TManagedForm)
    alActions: TActionList;
    acSmtpBlackhole: TAction;
    acHttpBlackhole: TAction;
    viImages: TVirtualImageList;
    nvSettings: TQzNavigationView;
    shBorder: TShape;
    procedure acHttpBlackholeExecute(Sender: TObject);
    procedure acSmtpBlackholeExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FForms: TManagedFormList;
  public
  end;

var
  wSimulatorsForm: TwSimulatorsForm;

implementation

{$R *.dfm}

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
  FForms := TSimulatorsFormList.Create(self);
  acSmtpBlackhole.Execute;
end;

procedure TwSimulatorsForm.FormDestroy(Sender: TObject);
begin
  FForms.Free;
end;

end.
