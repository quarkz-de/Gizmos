unit Qizmos.WelcomeForm;

interface

uses
  Winapi.Windows, Winapi.Messages, Winapi.ShellAPI,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.VirtualImage, Vcl.ControlList,
  EventBus,
  Qizmos.Forms;

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
  public
    procedure ThemeChanged; override;
  end;

implementation

{$R *.dfm}

uses
  Qizmos.DataModule, Qizmos.Types, Qizmos.Main, Qizmos.Events;

{ TwWelcomeForm }

procedure TwWelcomeForm.FormCreate(Sender: TObject);
begin
  UpdateTheme;
end;

procedure TwWelcomeForm.clModulesBeforeDrawItem(AIndex: Integer;
  ACanvas: TCanvas; ARect: TRect; AState: TOwnerDrawState);
begin
  case AIndex of
    0:
      begin
        txTitle.Caption := 'SMTP Blackhole';
        imIcon.ImageIndex := 7;
      end;
    1:
      begin
        txTitle.Caption := 'HTTP Blackhole';
        imIcon.ImageIndex := 8;
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
