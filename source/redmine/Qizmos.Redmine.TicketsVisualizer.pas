unit Qizmos.Redmine.TicketsVisualizer;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.DateUtils,
  System.Math, System.Generics.Collections,
  Spring.Container,
  VirtualTrees, VirtualTrees.Header, VirtualTrees.Types,
  Qizmos.Redmine.Classes;

type
  ITicketListVisualizer = interface
    ['{0700F296-9DDF-477B-A6DE-3271ABF460DD}']
    procedure SetVirtualTree(const ATree: TVirtualStringTree);
    procedure SetTickets(const ATickets: TRedmineTicketList);
    procedure SetProjects(const AProjects: TRedmineProjects);
    function GetSelectedTicket: TRedmineTicket;
    function GetSelectedTicketID: Integer;
    function IsSelected: Boolean;
    procedure UpdateContent(const ASelectProjectId, ASelectedTicketId: Integer);
    procedure ClearContent;
    procedure FilterTickets(const ATicketID: Integer);
  end;

implementation

uses
  Qizmos.Core.Settings;

type
  TRedmineItem = record
    Ticket: TRedmineTicket;
  end;
  PRedmineItem = ^TRedmineItem;

  TTicketListVisualizer = class(TInterfacedObject, ITicketListVisualizer)
  private
    const
      DefaultTreeHeaderHeight = 28;
      DefaultTreeRowHeight = 26;
      colId = 0;
      colTracker = 1;
      colStatus = 2;
      colSubject = 3;
      colAssignedTo = 4;
      colUpdated = 5;
      colMin = colId;
      colMax = colUpdated;
      ColumnNames: array[colMin..colMax] of String = ('Id', 'Tracker', 'Status', 'Subject', 'AssignedTo', 'Updated');
  private
    FTree: TVirtualStringTree;
    FTickets: TRedmineTicketList;
    FProjects: TRedmineProjects;
    procedure AttachTree;
    procedure DecorateTree;
    procedure CreateColumns;
    procedure SortTree;
    procedure LoadSettings;
    procedure SaveSettings;
  protected
    procedure GetNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize:
      Integer);
    procedure GetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure GetImageIndex(Sender: TBaseVirtualTree; Node:
      PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted:
      Boolean; var ImageIndex: TImageIndex);
    procedure CompareNodes(Sender: TBaseVirtualTree; Node1, Node2: PVirtualNode;
      Column: TColumnIndex; var Result: Integer);
    procedure HeaderClick(Sender: TVTHeader; HitInfo: TVTHeaderHitInfo);
    procedure BeforeItemErase(Sender: TBaseVirtualTree; TargetCanvas: TCanvas;
      Node: PVirtualNode; ItemRect: TRect; var ItemColor: TColor;
      var EraseAction: TItemEraseAction);
    procedure ColumnResize(Sender: TVTHeader; Column: TColumnIndex);
    procedure HeaderDragged(Sender: TVTHeader; Column: TColumnIndex; OldPosition: Integer);
  public
    procedure SetVirtualTree(const ATree: TVirtualStringTree);
    procedure SetTickets(const ATickets: TRedmineTicketList);
    procedure SetProjects(const AProjects: TRedmineProjects);
    function GetSelectedTicket: TRedmineTicket;
    function GetSelectedTicketID: Integer;
    function IsSelected: Boolean;
    procedure UpdateContent(const ASelectProjectId, ASelectedTicketId: Integer);
    procedure ClearContent;
    procedure FilterTickets(const ATicketID: Integer);
  end;

{ TTicketListVisualizer }

procedure TTicketListVisualizer.AttachTree;
begin
  FTree.OnGetNodeDataSize := GetNodeDataSize;
  FTree.OnGetText := GetText;
  FTree.OnGetImageIndex := GetImageIndex;
  FTree.OnCompareNodes := CompareNodes;
  FTree.OnHeaderClick := HeaderClick;
  FTree.OnBeforeItemErase := BeforeItemErase;
  FTree.OnColumnResize := ColumnResize;
  FTree.OnHeaderDragged := HeaderDragged;
end;

procedure TTicketListVisualizer.BeforeItemErase(Sender: TBaseVirtualTree;
  TargetCanvas: TCanvas; Node: PVirtualNode; ItemRect: TRect;
  var ItemColor: TColor; var EraseAction: TItemEraseAction);
begin
  if Sender.AbsoluteIndex(Node) mod 2 = 0 then
    ItemColor := TColors.SysWindow
  else
    ItemColor := TColors.SysBtnFace;
  EraseAction := eaColor;
end;

procedure TTicketListVisualizer.ClearContent;
begin
  FTree.Clear;
end;

procedure TTicketListVisualizer.ColumnResize(Sender: TVTHeader;
  Column: TColumnIndex);
begin
  SaveSettings;
end;

procedure TTicketListVisualizer.CompareNodes(Sender: TBaseVirtualTree; Node1,
  Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
var
  Data1, Data2: PRedmineItem;
begin
  Data1 := FTree.GetNodeData(Node1);
  Data2 := FTree.GetNodeData(Node2);

  case Column of
    colId:
      Result := CompareValue(Data1.Ticket.ID, Data2.Ticket.ID);
    colTracker:
      Result := CompareText(Data1.Ticket.Tracker, Data2.Ticket.Tracker);
    colStatus:
      Result := CompareText(Data1.Ticket.Status, Data2.Ticket.Status);
    colSubject:
      Result := CompareText(Data1.Ticket.Subject, Data2.Ticket.Subject);
    colAssignedTo:
      Result := CompareText(Data1.Ticket.AssignedTo, Data2.Ticket.AssignedTo);
    colUpdated:
      Result := CompareDateTime(Data1.Ticket.Updated, Data2.Ticket.Updated)
  end;
end;

procedure TTicketListVisualizer.CreateColumns;
var
  Column: TVirtualTreeColumn;
begin
  FTree.Header.Columns.BeginUpdate;

  FTree.Header.Columns.Clear;

  Column := FTree.Header.Columns.Add;
  Column.Text := '#';
  Column.Width := 140;

  Column := FTree.Header.Columns.Add;
  Column.Text := 'Tracker';
  Column.Width := 100;

  Column := FTree.Header.Columns.Add;
  Column.Text := 'Status';
  Column.Width := 100;

  Column := FTree.Header.Columns.Add;
  Column.Text := 'Thema';
  Column.Width := 300;

  Column := FTree.Header.Columns.Add;
  Column.Text := 'Zugewiesen an';
  Column.Width := 200;

  Column := FTree.Header.Columns.Add;
  Column.Text := 'Aktualisiert';
  Column.Width := 200;

  FTree.Header.Columns.EndUpdate;

  FTree.Header.SortColumn := colId;
end;

procedure TTicketListVisualizer.DecorateTree;
begin
  FTree.TreeOptions.PaintOptions := FTree.TreeOptions.PaintOptions + [toShowRoot];
  FTree.TreeOptions.SelectionOptions := FTree.TreeOptions.SelectionOptions + [toFullRowSelect];
  FTree.TreeOptions.AutoOptions := FTree.TreeOptions.AutoOptions + [toAutoSpanColumns];
  FTree.DefaultNodeHeight := DefaultTreeRowHeight;
  FTree.Header.Options := FTree.Header.Options + [hoVisible, hoAutoResize];
  FTree.Header.Height := DefaultTreeHeaderHeight;
  FTree.Header.SortColumn := colId;
  FTree.Header.SortDirection := sdDescending;
  FTree.DefaultText := '';
end;

procedure TTicketListVisualizer.FilterTickets(const ATicketID: Integer);
var
  Node: PVirtualNode;
  Data: PRedmineItem;
begin
  FTree.BeginUpdate;
  try
    Node := FTree.GetFirst;
    while Assigned(Node) do
      begin
        Data := FTree.GetNodeData(Node);
        FTree.IsVisible[Node] := (ATicketID = 0) or (Data.Ticket.ID = ATicketID);
        Node := FTree.GetNextSibling(Node);
      end;
  finally
    FTree.EndUpdate;
  end
end;

procedure TTicketListVisualizer.GetImageIndex(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
  var Ghosted: Boolean; var ImageIndex: TImageIndex);
begin
  if (Column = colId) and (Kind in [ikNormal, ikSelected]) then
    ImageIndex := 0
  else
    ImageIndex := -1;
end;

procedure TTicketListVisualizer.GetNodeDataSize(Sender: TBaseVirtualTree;
  var NodeDataSize: Integer);
begin
  NodeDataSize := SizeOf(TRedmineItem);
end;

function TTicketListVisualizer.GetSelectedTicket: TRedmineTicket;
var
  Data: PRedmineItem;
begin
  Result := nil;
  if FTree.FocusedNode <> nil then
    begin
      Data := FTree.GetNodeData(FTree.FocusedNode);
      Result := Data.Ticket;
    end;
end;

function TTicketListVisualizer.GetSelectedTicketID: Integer;
begin
  if IsSelected then
    Result := GetSelectedTicket.Id
  else
    Result := 0;
end;

procedure TTicketListVisualizer.GetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: string);
var
  Data: PRedmineItem;
begin
  Data := FTree.GetNodeData(Node);

  case Column of
    colId:
      CellText := '#' + Data.Ticket.ID.ToString;
    colTracker:
      CellText := Data.Ticket.Tracker;
    colStatus:
      CellText := Data.Ticket.Status;
    colSubject:
      CellText := Data.Ticket.Subject;
    colAssignedTo:
      CellText := Data.Ticket.AssignedTo;
    colUpdated:
      CellText := Data.Ticket.Updated.ToString;
  end;
end;

procedure TTicketListVisualizer.HeaderClick(Sender: TVTHeader;
  HitInfo: TVTHeaderHitInfo);
begin
  if Sender.SortColumn = HitInfo.Column then
    begin
      if Sender.SortDirection = sdAscending then
        Sender.SortDirection := sdDescending
      else
        Sender.SortDirection := sdAscending;
    end
  else
    Sender.SortColumn := HitInfo.Column;

  SortTree;
end;

procedure TTicketListVisualizer.HeaderDragged(Sender: TVTHeader;
  Column: TColumnIndex; OldPosition: Integer);
begin
  SaveSettings;
end;

function TTicketListVisualizer.IsSelected: Boolean;
begin
  Result := FTree.FocusedNode <> nil;
end;

procedure TTicketListVisualizer.LoadSettings;
var
  I, IntValue: Integer;
begin
  for I := colMin to colMax do
    begin
      if ApplicationSettings.Redmine.TicketListColumnWidths.TryGetValue(ColumnNames[I], IntValue) then
        FTree.Header.Columns[I].Width := IntValue;
      if ApplicationSettings.Redmine.TicketListColumnPositions.TryGetValue(ColumnNames[I], IntValue) then
        FTree.Header.Columns[I].Position := IntValue;
    end;
end;

procedure TTicketListVisualizer.SaveSettings;
var
  I: Integer;
begin
  for I := colMin to colMax do
    begin
      ApplicationSettings.Redmine.TicketListColumnWidths.AddOrSetValue(
        ColumnNames[I], FTree.Header.Columns[I].Width);
      ApplicationSettings.Redmine.TicketListColumnPositions.AddOrSetValue(
        ColumnNames[I], FTree.Header.Columns[I].Position);
    end;
end;

procedure TTicketListVisualizer.SetProjects(const AProjects: TRedmineProjects);
begin
  FProjects := AProjects;
end;

procedure TTicketListVisualizer.SetTickets(
  const ATickets: TRedmineTicketList);
begin
  FTickets := ATickets;
end;

procedure TTicketListVisualizer.SetVirtualTree(
  const ATree: TVirtualStringTree);
begin
  FTree := ATree;
  AttachTree;
  DecorateTree;
  CreateColumns;
  LoadSettings;
end;

procedure TTicketListVisualizer.SortTree;
begin
  FTree.SortTree(FTree.Header.SortColumn, FTree.Header.SortDirection, false);
end;

procedure TTicketListVisualizer.UpdateContent(const ASelectProjectId, ASelectedTicketId: Integer);
var
  Node, ParentNode, ProjectNode, NodeToSelect: PVirtualNode;
  Data: PRedmineItem;
  Ticket: TRedmineTicket;
  TicketNodes, ProjectNodes: TDictionary<Integer, PVirtualNode>;
begin
  NodeToSelect := nil;
  ProjectNodes := TDictionary<Integer, PVirtualNode>.Create;
  TicketNodes := TDictionary<Integer, PVirtualNode>.Create;

  FTree.BeginUpdate;
  FTree.Clear;

  ProjectNode := nil;

  for Ticket in FTickets do
    begin
      if Ticket.ProjectID = ASelectProjectId then
        begin
          if Ticket.ParentID > 0 then
            begin
              if not TicketNodes.TryGetValue(Ticket.ParentID, ParentNode) then
                begin
                  Node := FTree.AddChild(ProjectNode);
                  Data := FTree.GetNodeData(Node);
                  Data.Ticket := Ticket.Parent;
                  ParentNode := Node;
                  if Ticket.Parent.ID = ASelectedTicketId then
                    NodeToSelect := Node;
                  TicketNodes.Add(Ticket.ParentID, ParentNode);
                end;
            end
          else
            ParentNode := ProjectNode;

          if TicketNodes.TryGetValue(Ticket.ID, Node) then
            begin
              if (Ticket.ParentID > 0) and TicketNodes.TryGetValue(Ticket.ParentID, ParentNode) then
                FTree.NodeParent[Node] := ParentNode;
            end
          else
            begin
              Node := FTree.AddChild(ParentNode);
              Data := FTree.GetNodeData(Node);
              Data.Ticket := Ticket;
              TicketNodes.Add(Ticket.ID, Node);
              if Ticket.ID = ASelectedTicketId then
                NodeToSelect := Node;
            end;
        end;
    end;

  SortTree;

  if Assigned(NodeToSelect) then
    begin
      FTree.FocusedNode := NodeToSelect;
      FTree.Selected[NodeToSelect] := true;
    end;

  FTree.FullExpand;
  FTree.EndUpdate;

  ProjectNodes.Free;
  TicketNodes.Free;
end;

initialization
  GlobalContainer.RegisterType<TTicketListVisualizer>.Implements<ITicketListVisualizer>;
end.
