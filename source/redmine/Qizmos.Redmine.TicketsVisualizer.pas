unit Qizmos.Redmine.TicketsVisualizer;

interface

uses
  System.SysUtils, System.DateUtils, System.Math, System.Generics.Collections,
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
    procedure UpdateContent(const ASelectTicketId: Integer);
    procedure ClearContent;
  end;

implementation

type
  TRedmineItemKind = (rikProject, rikTicket);

  TRedmineItem = record
    ID: Integer;
    Name: String;
    case Kind: TRedmineItemKind of
      rikProject:
        (
        );
      rikTicket:
        (
          Ticket: TRedmineTicket;
        );
  end;
  PRedmineItem = ^TRedmineItem;

  TTicketListVisualizer = class(TInterfacedObject, ITicketListVisualizer)
  private
    const
      DefaultTreeHeaderHeight = 28;
      DefaultTreeRowHeight = 26;
      colId = 0;
      colSubject = 1;
      colUpdated = 2;
  private
    FTree: TVirtualStringTree;
    FTickets: TRedmineTicketList;
    FProjects: TRedmineProjects;
    procedure AttachTree;
    procedure DecorateTree;
    procedure CreateColumns;
    procedure SortTree;
  protected
    procedure GetNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize:
      Integer);
    procedure FreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure GetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure GetImageIndex(Sender: TBaseVirtualTree; Node:
      PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted:
      Boolean; var ImageIndex: TImageIndex);
    procedure CompareNodes(Sender: TBaseVirtualTree; Node1, Node2: PVirtualNode;
      Column: TColumnIndex; var Result: Integer);
    procedure HeaderClick(Sender: TVTHeader; HitInfo: TVTHeaderHitInfo);
  public
    procedure SetVirtualTree(const ATree: TVirtualStringTree);
    procedure SetTickets(const ATickets: TRedmineTicketList);
    procedure SetProjects(const AProjects: TRedmineProjects);
    function GetSelectedTicket: TRedmineTicket;
    function GetSelectedTicketID: Integer;
    function IsSelected: Boolean;
    procedure UpdateContent(const ASelectTicketId: Integer);
    procedure ClearContent;
  end;

{ TTicketListVisualizer }

procedure TTicketListVisualizer.AttachTree;
begin
  FTree.OnGetNodeDataSize := GetNodeDataSize;
  FTree.OnFreeNode := FreeNode;
  FTree.OnGetText := GetText;
  FTree.OnGetImageIndex := GetImageIndex;
  FTree.OnCompareNodes := CompareNodes;
  FTree.OnHeaderClick := HeaderClick;
end;

procedure TTicketListVisualizer.ClearContent;
begin
  FTree.Clear;
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
      Result := CompareValue(Data1.ID, Data2.ID);
    colUpdated:
      if (Data1.Kind = rikTicket) and (Data2.Kind = rikTicket) then
        Result := CompareDateTime(Data1.Ticket.Updated, Data2.Ticket.Updated)
      else
        Result := 0;
  end;
end;

procedure TTicketListVisualizer.CreateColumns;
var
  Column: TVirtualTreeColumn;
begin
  FTree.Header.Columns.Clear;

  FTree.Header.Columns.BeginUpdate;

  Column := FTree.Header.Columns.Add;
  Column.Text := '#';
  Column.Width := 100;

  Column := FTree.Header.Columns.Add;
  Column.Text := 'Thema';
  Column.Width := 300;

  Column := FTree.Header.Columns.Add;
  Column.Text := 'Aktualisiert';
  Column.Width := 200;

  FTree.Header.AutoSizeIndex := colSubject;

  FTree.Header.Columns.EndUpdate;
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

procedure TTicketListVisualizer.FreeNode(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var
  Data: PRedmineItem;
begin
  Data := FTree.GetNodeData(Node);
  Finalize(Data^);
end;

procedure TTicketListVisualizer.GetImageIndex(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
  var Ghosted: Boolean; var ImageIndex: TImageIndex);
var
  Data: PRedmineItem;
begin
  if (Column = colId) and (Kind in [ikNormal, ikSelected]) then
    begin
      Data := FTree.GetNodeData(Node);
      case Data.Kind of
        rikProject:
          ImageIndex := 1;
        rikTicket:
          ImageIndex := 0;
        else
          ImageIndex := -1;
      end;
    end
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
      if Data.Kind = rikTicket then
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
        case Data.Kind of
          rikProject:
            CellText := Data.Name;
          rikTicket:
            CellText := '#' + Data.ID.ToString;
          else
            CellText := '';
        end;
    colSubject:
        case Data.Kind of
          rikTicket:
            CellText := Data.Name;
          else
            CellText := '';
        end;
    colUpdated:
      begin
        case Data.Kind of
          rikTicket:
            CellText := Data.Ticket.Updated.ToString;
          else
            CellText := '';
        end;
      end;
  end;
end;

procedure TTicketListVisualizer.HeaderClick(Sender: TVTHeader;
  HitInfo: TVTHeaderHitInfo);
begin
  if HitInfo.Column in [colId, colUpdated] then
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
end;

function TTicketListVisualizer.IsSelected: Boolean;
begin
  Result := FTree.FocusedNode <> nil;
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
end;

procedure TTicketListVisualizer.SortTree;
begin
  FTree.SortTree(FTree.Header.SortColumn, FTree.Header.SortDirection, false);
end;

procedure TTicketListVisualizer.UpdateContent(const ASelectTicketId: Integer);
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

  for Ticket in FTickets do
    begin
      if not ProjectNodes.TryGetValue(Ticket.ProjectID, ProjectNode) then
        begin
          ProjectNode := FTree.AddChild(nil);
          ProjectNodes.Add(Ticket.ProjectID, ProjectNode);
          Data := FTree.GetNodeData(ProjectNode);
          Data.ID := Ticket.ProjectID;
          Data.Kind := rikProject;
          var ProjectName := 'unbekanntes Projekt';
          if FProjects.TryGetValue(Ticket.ProjectID, ProjectName) then
            Data.Name := ProjectName;
        end;

      if Ticket.ParentID > 0 then
        begin
          if not TicketNodes.TryGetValue(Ticket.ParentID, ParentNode) then
            begin
              Node := FTree.AddChild(ProjectNode);
              Data := FTree.GetNodeData(Node);
              Data.ID := Ticket.ParentID;
              Data.Kind := rikTicket;
              Data.Name := Ticket.Parent.Subject;
              Data.Ticket := Ticket.Parent;
              if Ticket.ParentID = ASelectTicketId then
                NodeToSelect := Node;
              ParentNode := Node;
              TicketNodes.Add(Ticket.ParentID, ParentNode);
            end;
        end
      else
        ParentNode := ProjectNode;

      if not TicketNodes.TryGetValue(Ticket.ID, Node) then
        begin
          Node := FTree.AddChild(ParentNode);
          Data := FTree.GetNodeData(Node);
          Data.ID := Ticket.ID;
          Data.Kind := rikTicket;
          Data.Name := Ticket.Subject;
          Data.Ticket := Ticket;
          if Ticket.ID = ASelectTicketId then
            NodeToSelect := Node;
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
