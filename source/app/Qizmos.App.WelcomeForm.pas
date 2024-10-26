unit Qizmos.App.WelcomeForm;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.VirtualImage, Vcl.ControlList,
  EventBus,
  Qodelib.ManagedForms,
  Qizmos.Core.Forms;

type
  TwWelcomeForm = class(TManagedForm)
    clModules: TControlList;
    txTitle: TLabel;
    imIcon: TVirtualImage;
    procedure FormCreate(Sender: TObject);
    procedure clModulesBeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
      ARect: TRect; AState: TOwnerDrawState);
    procedure clModulesItemClick(Sender: TObject);
  protected
    function GetFormId: TQzManagedFormId; override;
    function GetImageIndex: Integer; override;
  end;

implementation

{$R *.dfm}

uses
  Qizmos.App.DataModule, Qizmos.Core.Types, Qizmos.Core.Events;

const
  biNotes = 0;
  biSimulatorsSmtp = 1;
  biSimulatorsHttp = 2;
  biRedmine = 3;

  biMaxItems = 4;

{ TwWelcomeForm }

procedure TwWelcomeForm.FormCreate(Sender: TObject);
begin
  clModules.ItemCount := biMaxItems;
end;

function TwWelcomeForm.GetFormId: TQzManagedFormId;
begin
  Result := mfMainWelcome;
end;

function TwWelcomeForm.GetImageIndex: Integer;
begin
  Result := iiMainWelcome;
end;

procedure TwWelcomeForm.clModulesBeforeDrawItem(AIndex: Integer;
  ACanvas: TCanvas; ARect: TRect; AState: TOwnerDrawState);
begin
  case AIndex of
    biNotes:
      begin
        txTitle.Caption := 'Notizen';
        imIcon.ImageIndex := iiNotes;
      end;
    biSimulatorsSmtp:
      begin
        txTitle.Caption := 'SMTP Blackhole';
        imIcon.ImageIndex := iiSimulatorsSmtp;
      end;
    biSimulatorsHttp:
      begin
        txTitle.Caption := 'HTTP Blackhole';
        imIcon.ImageIndex := iiSimulatorsHttp;
      end;
    biRedmine:
      begin
        txTitle.Caption := 'Redmine';
        imIcon.ImageIndex := iiRedmine;
      end;
  end;
end;

procedure TwWelcomeForm.clModulesItemClick(Sender: TObject);
begin
  case clModules.ItemIndex of
    biNotes:
      GlobalEventBus.Post(TEventFactory.NewModuleChangeEvent(mfMainNotes, 0));
    biSimulatorsSmtp:
      GlobalEventBus.Post(TEventFactory.NewModuleChangeEvent(mfMainSimulators, mfSimulatorsSmtp));
    biSimulatorsHttp:
      GlobalEventBus.Post(TEventFactory.NewModuleChangeEvent(mfMainSimulators, mfSimulatorsHttp));
    biRedmine:
      GlobalEventBus.Post(TEventFactory.NewModuleChangeEvent(mfMainRedmine, mfRedmineUser));
  end;

  clModules.ItemIndex := -1;
end;

end.
