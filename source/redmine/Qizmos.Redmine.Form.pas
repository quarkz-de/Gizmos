unit Qizmos.Redmine.Form;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.ImageList,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.ImgList, Vcl.VirtualImageList,
  Qodelib.ManagedForms,
  Qizmos.Core.Forms, Qizmos.Core.Types, Qizmos.Redmine.Api,
  Qodelib.Panels, Qodelib.NavigationView;

type
  TwRedmineForm = class(TManagedForm)
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
  wRedmineForm: TwRedmineForm;

implementation

{$R *.dfm}

uses
  Qizmos.Redmine.UserForm, Qizmos.Redmine.TicketsForm;

{ TwRedmineForm }

procedure TwRedmineForm.FormCreate(Sender: TObject);
begin
  ManagedForms.ShowForm(mfRedmineTickets);
end;

function TwRedmineForm.GetFormId: TQzManagedFormId;
begin
  Result := mfMainRedmine;
end;

function TwRedmineForm.GetImageIndex: Integer;
begin
  Result := iiMainRedmine;
end;

procedure TwRedmineForm.nvNavigationButtonClicked(Sender: TObject;
  Index: Integer);
begin
  ManagedForms.ShowForm(nvNavigation.Items[Index].Tag);
end;

procedure TwRedmineForm.RegisterForms;
var
  Helper: TNavigationViewFormHelper;
begin
  inherited;

  ManagedForms.Container := pnFormContainer;

  Helper := TNavigationViewFormHelper.Create(self, nvNavigation);
  Helper.AddForm(TwRedmineUserForm);
  Helper.AddForm(TwRedmineTicketsForm);
  Helper.Free;
end;

procedure TwRedmineForm.ThemeChanged;
begin
  inherited;
  viImages.UpdateImageList;
end;

end.
