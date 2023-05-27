unit Qizmos.WelcomeForm;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.VirtualImage, Vcl.ControlList,
  EventBus,
  Qizmos.Forms, Qodelib.ManagedForms;

type
  TwWelcomeForm = class(TManagedForm)
    clModules: TControlList;
    txTitle: TLabel;
    imIcon: TVirtualImage;
    procedure FormCreate(Sender: TObject);
    procedure clModulesBeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
      ARect: TRect; AState: TOwnerDrawState);
    procedure clModulesItemClick(Sender: TObject);
  private
    procedure UpdateTheme;
  protected
    function GetFormId: TQzManagedFormId; override;
    function GetImageIndex: Integer; override;
    procedure ThemeChanged; override;
  end;

implementation

{$R *.dfm}

uses
  Qizmos.DataModule, Qizmos.Types, Qizmos.Events;

{ TwWelcomeForm }

procedure TwWelcomeForm.FormCreate(Sender: TObject);
begin
  UpdateTheme;
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
    0:
      begin
        txTitle.Caption := 'SMTP Blackhole';
        imIcon.ImageIndex := iiSimulatorsSmtp;
      end;
    1:
      begin
        txTitle.Caption := 'HTTP Blackhole';
        imIcon.ImageIndex := iiSimulatorsHttp;
      end;
  end;
end;

procedure TwWelcomeForm.clModulesItemClick(Sender: TObject);
begin
  case clModules.ItemIndex of
    0:
      GlobalEventBus.Post(TEventFactory.NewModuleChangeEvent(mfMainSimulators, mfSimulatorsSmtp));
    1:
      GlobalEventBus.Post(TEventFactory.NewModuleChangeEvent(mfMainSimulators, mfSimulatorsHttp));
  end;
  clModules.ItemIndex := -1;
end;

procedure TwWelcomeForm.ThemeChanged;
begin
  inherited;
  UpdateTheme;
end;

procedure TwWelcomeForm.UpdateTheme;
begin
  imIcon.ImageCollection := dmCommon.GetImageCollection;
end;

end.
