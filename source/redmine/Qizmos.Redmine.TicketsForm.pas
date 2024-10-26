unit Qizmos.Redmine.TicketsForm;

interface

uses
  Winapi.Windows, Winapi.Messages, Winapi.ShellAPI,
  System.SysUtils, System.Variants, System.Classes, System.ImageList,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXCtrls,
  Vcl.VirtualImage, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.ImgList, Vcl.VirtualImageList,
  VirtualTrees,
  Qodelib.ManagedForms,
  Qizmos.Core.Forms, Qizmos.Redmine.Api, Qodelib.Panels,
  Qizmos.Redmine.TicketsVisualizer, Qizmos.Redmine.Classes;

type
  TwRedmineTicketsForm = class(TManagedForm)
    pnHeader: TQzPanel;
    txCaption: TLabel;
    imIcon: TVirtualImage;
    btRefresh: TSpeedButton;
    vilLargeIcons: TVirtualImageList;
    vtTickets: TVirtualStringTree;
    vilTreeIcons: TVirtualImageList;
    procedure btRefreshClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure vtTicketsDblClick(Sender: TObject);
  private
    FTickets: TRedmineTicketList;
    FTicketsVisualizer: ITicketListVisualizer;
    procedure LoadTickets;
    procedure LoadSelectedTicketInBrowser;
  protected
    function GetFormId: TQzManagedFormId; override;
    function GetImageIndex: Integer; override;
  end;

var
  wRedmineTicketsForm: TwRedmineTicketsForm;

implementation

{$R *.dfm}

uses
  Spring.Container,
  Qizmos.Core.Types;

{ TwRedmineTicketsForm }

procedure TwRedmineTicketsForm.btRefreshClick(Sender: TObject);
begin
  LoadTickets;
end;

procedure TwRedmineTicketsForm.FormCreate(Sender: TObject);
begin
  FTickets := TRedmineTicketList.Create;
  FTicketsVisualizer := GlobalContainer.Resolve<ITicketListVisualizer>;
  FTicketsVisualizer.SetVirtualTree(vtTickets);
  FTicketsVisualizer.SetTickets(FTickets);
  LoadTickets;
end;

procedure TwRedmineTicketsForm.FormDestroy(Sender: TObject);
begin
  FTickets.Free;
end;

function TwRedmineTicketsForm.GetFormId: TQzManagedFormId;
begin
  Result := mfRedmineTickets;
end;

function TwRedmineTicketsForm.GetImageIndex: Integer;
begin
  Result := iiRedmineTickets;
end;

procedure TwRedmineTicketsForm.LoadSelectedTicketInBrowser;
begin
  if FTicketsVisualizer.IsSelected then
    begin
      var Url := TRedmineApi.GetIssueUrl(FTicketsVisualizer.GetSelectedTicket.Id);
      ShellExecute(0, 'open', PChar(Url), nil, nil, SW_SHOWNORMAL);
    end;
end;

procedure TwRedmineTicketsForm.LoadTickets;
begin
  TRedmineApi.GetMyIssues(FTickets);
  FTicketsVisualizer.UpdateContent;
end;

procedure TwRedmineTicketsForm.vtTicketsDblClick(Sender: TObject);
begin
  LoadSelectedTicketInBrowser;
end;

end.
