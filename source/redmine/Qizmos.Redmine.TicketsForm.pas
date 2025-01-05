unit Qizmos.Redmine.TicketsForm;

interface

uses
  Winapi.Windows, Winapi.Messages, Winapi.ShellAPI,
  System.SysUtils, System.Variants, System.Classes, System.ImageList,
  System.Generics.Collections, System.Types,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXCtrls,
  Vcl.VirtualImage, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Tabs,
  Vcl.ImgList, Vcl.VirtualImageList,
  VirtualTrees,
  Qodelib.ManagedForms, Qodelib.Panels,
  Qizmos.Core.Forms, Qizmos.Core.Settings,
  Qizmos.Redmine.Api, Qizmos.Redmine.TicketsVisualizer, Qizmos.Redmine.Classes;

type
  TwRedmineTicketsForm = class(TManagedForm)
    pnHeader: TQzPanel;
    txCaption: TLabel;
    imIcon: TVirtualImage;
    btRefresh: TSpeedButton;
    vilLargeIcons: TVirtualImageList;
    vtTickets: TVirtualStringTree;
    vilTreeIcons: TVirtualImageList;
    tsProjects: TTabSet;
    tiRefresh: TTimer;
    aiRefresh: TActivityIndicator;
    tsActive: TToggleSwitch;
    procedure btRefreshClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tiRefreshTimer(Sender: TObject);
    procedure tsActiveClick(Sender: TObject);
    procedure tsProjectsChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure tsProjectsGetImageIndex(Sender: TObject; TabIndex: Integer;
      var ImageIndex: Integer);
    procedure tsProjectsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tsProjectsMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure tsProjectsMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure vtTicketsDblClick(Sender: TObject);
  private
    FTickets: TRedmineTicketList;
    FProjects: TRedmineProjects;
    FTicketsVisualizer: ITicketListVisualizer;
    FTabSetDragging: Boolean;
    FTabSetDragIndex: Integer;
    FTabSetUpdating: Boolean;
    FLastUpdate: DWORD;
    procedure LoadTickets;
    procedure LoadSelectedTicketInBrowser;
  protected
    function GetFormId: TQzManagedFormId; override;
    function GetImageIndex: Integer; override;
    procedure ThemeChanged; override;
    procedure FontChanged; override;
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

procedure TwRedmineTicketsForm.FontChanged;
begin
  inherited;
  tsProjects.Font.Size := ApplicationSettings.FontSize;
  vtTickets.DefaultNodeHeight := (ApplicationSettings.FontSize * 2) + 4;
end;

procedure TwRedmineTicketsForm.FormCreate(Sender: TObject);
begin
  FontChanged;
  FTickets := TRedmineTicketList.Create;
  FProjects := TRedmineProjects.Create;
  FTicketsVisualizer := GlobalContainer.Resolve<ITicketListVisualizer>;
  FTicketsVisualizer.SetVirtualTree(vtTickets);
  FTicketsVisualizer.SetTickets(FTickets);
  FTicketsVisualizer.SetProjects(FProjects);

  if ApplicationSettings.Redmine.ActiveOnStartup then
    tsActive.State := tssOn;
end;

procedure TwRedmineTicketsForm.FormDestroy(Sender: TObject);
begin
  FTickets.Free;
  FProjects.Free;
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
var
  LastSelectedProjectID, LastSelectedTicketID, TabIndex, NewTabIndex: Integer;
  Project: TPair<Integer, String>;
begin
  FLastUpdate := GetTickCount;

  tsProjects.Enabled := false;
  vtTickets.Enabled := false;
  aiRefresh.Visible := true;
  aiRefresh.Animate := true;
  btRefresh.Visible := false;

  try
    NewTabIndex := 0;

    if tsProjects.TabIndex < 0 then
      begin
        LastSelectedProjectID := 0;
        LastSelectedTicketID := 0;
      end
    else
      begin
        LastSelectedProjectID := Integer(tsProjects.Tabs.Objects[tsProjects.TabIndex]);
        LastSelectedTicketID := FTicketsVisualizer.GetSelectedTicketID;
      end;

    FTicketsVisualizer.ClearContent;
    TRedmineApi.GetMyIssues(FTickets, FProjects);

    FTabSetUpdating := true;

    tsProjects.Tabs.Clear;
    for Project in FProjects do
      begin
        TabIndex := tsProjects.Tabs.AddObject(Project.Value, TObject(Project.Key));
        if Project.Key = LastSelectedProjectID then
          NewTabIndex := TabIndex;
      end;

    if tsProjects.Tabs.Count > 0 then
      begin
        tsProjects.TabIndex := NewTabIndex;
        LastSelectedProjectID := Integer(tsProjects.Tabs.Objects[NewTabIndex]);
        FTicketsVisualizer.UpdateContent(LastSelectedProjectID, LastSelectedTicketId);
      end;

    FTabSetUpdating := false;
  finally
    tsProjects.Enabled := true;
    vtTickets.Enabled := true;
    aiRefresh.Animate := false;
    aiRefresh.Visible := false;
    btRefresh.Visible := true;
  end;
end;

procedure TwRedmineTicketsForm.ThemeChanged;
begin
  vilLargeIcons.UpdateImageList;
  vilTreeIcons.UpdateImageList;
end;

procedure TwRedmineTicketsForm.tiRefreshTimer(Sender: TObject);
begin
  if GetTickCount > FLastUpdate + 60000 * ApplicationSettings.Redmine.TicketListRefreshInterval then
    LoadTickets;
end;

procedure TwRedmineTicketsForm.tsActiveClick(Sender: TObject);
begin
  case tsActive.State of
    tssOn:
      begin
        LoadTickets;
        tiRefresh.Enabled := true;
      end;
    tssOff:
      begin
        tiRefresh.Enabled := false;
      end;
  end;
end;

procedure TwRedmineTicketsForm.tsProjectsChange(Sender: TObject;
  NewTab: Integer; var AllowChange: Boolean);
var
  LastSelectedTicketId, ProjectID: Integer;
begin
  if FTabSetUpdating then
    exit;

  LastSelectedTicketId := 0;
  ProjectID := Integer(tsProjects.Tabs.Objects[NewTab]);
  FTicketsVisualizer.UpdateContent(ProjectID, LastSelectedTicketId);
end;

procedure TwRedmineTicketsForm.tsProjectsGetImageIndex(Sender: TObject;
  TabIndex: Integer; var ImageIndex: Integer);
begin
  ImageIndex := 1;
end;

procedure TwRedmineTicketsForm.tsProjectsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  TabIndex: Integer;
begin
  if Button = mbLeft then
    begin
      TabIndex := tsProjects.ItemAtPos(Point(X, Y));
      if TabIndex <> -1 then
        begin
          FTabSetDragging := True;
          FTabSetDragIndex := TabIndex;
        end;
    end;
end;

procedure TwRedmineTicketsForm.tsProjectsMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  TabIndex: Integer;
begin
  if FTabSetDragging then
    begin
      TabIndex := tsProjects.ItemAtPos(Point(X, Y));
      if (TabIndex <> -1) and (TabIndex <> FTabSetDragIndex) then
        begin
          tsProjects.Tabs.Exchange(FTabSetDragIndex, TabIndex);
          FTabSetDragIndex := TabIndex;
          tsProjects.TabIndex := TabIndex;
        end;
    end;
end;

procedure TwRedmineTicketsForm.tsProjectsMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    FTabSetDragging := false;
end;

procedure TwRedmineTicketsForm.vtTicketsDblClick(Sender: TObject);
begin
  LoadSelectedTicketInBrowser;
end;

end.
