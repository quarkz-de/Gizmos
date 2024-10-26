unit Qizmos.Redmine.TicketsVisualizer;

interface

uses
  System.SysUtils, System.DateUtils, System.Math,
  Spring.Container,
  VirtualTrees, VirtualTrees.Header, VirtualTrees.Types,
  Qizmos.Redmine.Classes;

type
  ITicketListVisualizer = interface
    ['{0700F296-9DDF-477B-A6DE-3271ABF460DD}']
    procedure SetVirtualTree(const ATree: TVirtualStringTree);
    procedure SetTickets(const ATickets: TRedmineTicketList);
    function GetSelectedTicket: TRedmineTicket;
    function IsSelected: Boolean;
    procedure UpdateContent;
  end;

implementation

type
  TTicketListVisualizer = class(TInterfacedObject, ITicketListVisualizer)
  private
    const
      DefaultTreeHeaderHeight = 28;
      DefaultTreeRowHeight = 26;
      colId = 0;
      colSubject = 1;
      colUpdated = 2;
    type
      PTicket = ^TRedmineTicket;
  private
    FTree: TVirtualStringTree;
    FTickets: TRedmineTicketList;
    procedure AttachTree;
    procedure DecorateTree;
    procedure CreateColumns;
    procedure SortTree;
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
  public
    procedure SetVirtualTree(const ATree: TVirtualStringTree);
    procedure SetTickets(const ATickets: TRedmineTicketList);
    function GetSelectedTicket: TRedmineTicket;
    function IsSelected: Boolean;
    procedure UpdateContent;
  end;

{ TTicketListVisualizer }

procedure TTicketListVisualizer.AttachTree;
begin
  FTree.OnGetNodeDataSize := GetNodeDataSize;
  FTree.OnGetText := GetText;
  FTree.OnGetImageIndex := GetImageIndex;
  FTree.OnCompareNodes := CompareNodes;
  FTree.OnHeaderClick := HeaderClick;
end;

procedure TTicketListVisualizer.CompareNodes(Sender: TBaseVirtualTree; Node1,
  Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
var
  Data1, Data2: PTicket;
begin
  Data1 := FTree.GetNodeData(Node1);
  Data2 := FTree.GetNodeData(Node2);

  case Column of
    colId:
      Result := CompareValue(Data1^.ID, Data2^.ID);
    colUpdated:
      Result := CompareDateTime(Data1^.Updated, Data2^.Updated);
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
  FTree.DefaultNodeHeight := DefaultTreeRowHeight;
  FTree.Header.Options := FTree.Header.Options + [hoVisible, hoAutoResize];
  FTree.Header.Height := DefaultTreeHeaderHeight;
  FTree.Header.SortColumn := colId;
  FTree.Header.SortDirection := sdDescending;
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

end;

function TTicketListVisualizer.GetSelectedTicket: TRedmineTicket;
var
  Data: PTicket;
begin
  if FTree.FocusedNode <> nil then
    begin
      Data := FTree.GetNodeData(FTree.FocusedNode);
      Result := Data^;
    end
  else
    Result := nil;
end;

procedure TTicketListVisualizer.GetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: string);
var
  Data: PTicket;
begin
  Data := FTree.GetNodeData(Node);

  case Column of
    colId:
      CellText := Data^.ID.ToString;
    colSubject:
      CellText := Data^.Subject;
    colUpdated:
      CellText := Data^.Updated.ToString;
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

procedure TTicketListVisualizer.UpdateContent;
var
  Node: PVirtualNode;
  Data: PTicket;
  Ticket: TRedmineTicket;
begin
  FTree.BeginUpdate;
  FTree.Clear;
  for Ticket in FTickets do
    begin
      Node := FTree.AddChild(nil);
      Data := FTree.GetNodeData(Node);
      Data^ := Ticket;
    end;
  SortTree;
  FTree.EndUpdate;
end;

initialization
  GlobalContainer.RegisterType<TTicketListVisualizer>.Implements<ITicketListVisualizer>;
end.
