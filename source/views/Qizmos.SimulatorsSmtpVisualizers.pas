unit Qizmos.SimulatorsSmtpVisualizers;

interface

uses
  System.SysUtils, System.Generics.Collections,
  Spring.Container,
  IdMessage,
  VirtualTrees, VirtualTrees.Header, VirtualTrees.Types;

type
  IMessageListVisualizer = interface
    ['{8CEDFB42-28F0-43E8-821E-243B23C00B5C}']
    procedure SetVirtualTree(const ATree: TVirtualStringTree);
    procedure SetMessages(const AMessages: TObjectList<TIdMessage>);
    procedure AddMessage(const AIndex: Integer);
    function GetSelectedMessage: TIdMessage;
    function IsSelected: Boolean;
  end;

implementation

const
  DefaultTreeHeaderHeight = 28;
  DefaultTreeRowHeight = 26;

  colMessageListReceived = 0;
  colMessageListSender = 1;
  colMessageListSubject = 2;

type
  TMessageListVisualizer = class(TInterfacedObject, IMessageListVisualizer)
  private
    FTree: TVirtualStringTree;
    FMessages: TObjectList<TIdMessage>;
    procedure AttachTree;
    procedure DecorateTree;
    procedure CreateColumns;
  protected
    procedure GetNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize:
      Integer);
    procedure GetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure GetImageIndex(Sender: TBaseVirtualTree; Node:
      PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted:
      Boolean; var ImageIndex: TImageIndex);
  public
    procedure SetVirtualTree(const ATree: TVirtualStringTree);
    procedure SetMessages(const AMessages: TObjectList<TIdMessage>);
    procedure AddMessage(const AIndex: Integer);
    function GetSelectedMessage: TIdMessage;
    function IsSelected: Boolean;
  end;

{ TMessageListVisualizer }

procedure TMessageListVisualizer.AddMessage(const AIndex: Integer);
var
  Node: PVirtualNode;
  Data: PInteger;
begin
  Node := FTree.AddChild(nil);
  Data := FTree.GetNodeData(Node);
  Data^ := AIndex;
end;

procedure TMessageListVisualizer.AttachTree;
begin
  FTree.OnGetNodeDataSize := GetNodeDataSize;
  FTree.OnGetText := GetText;
  FTree.OnGetImageIndex := GetImageIndex;
end;

procedure TMessageListVisualizer.CreateColumns;
var
  Column: TVirtualTreeColumn;
begin
  FTree.Header.Columns.Clear;

  FTree.Header.Columns.BeginUpdate;

  Column := FTree.Header.Columns.Add;
  Column.Text := 'Empfangen';
  Column.Width := 100;

  Column := FTree.Header.Columns.Add;
  Column.Text := 'Absender';
  Column.Width := 200;

  Column := FTree.Header.Columns.Add;
  Column.Text := 'Betreff';
  Column.Width := 300;

  FTree.Header.AutoSizeIndex := colMessageListSubject;

  FTree.Header.Columns.EndUpdate;
end;

procedure TMessageListVisualizer.DecorateTree;
begin
  FTree.TreeOptions.PaintOptions := FTree.TreeOptions.PaintOptions - [toShowRoot];
  FTree.TreeOptions.SelectionOptions := FTree.TreeOptions.SelectionOptions + [toFullRowSelect];
  FTree.DefaultNodeHeight := DefaultTreeRowHeight;
  FTree.Header.Options := FTree.Header.Options + [hoVisible, hoAutoResize];
  FTree.Header.Height := DefaultTreeHeaderHeight;
end;

procedure TMessageListVisualizer.GetImageIndex(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
  var Ghosted: Boolean; var ImageIndex: TImageIndex);
begin

end;

procedure TMessageListVisualizer.GetNodeDataSize(Sender: TBaseVirtualTree;
  var NodeDataSize: Integer);
begin

end;

function TMessageListVisualizer.GetSelectedMessage: TIdMessage;
var
  Data: PInteger;
begin
  if FTree.FocusedNode <> nil then
    begin
      Data := FTree.GetNodeData(FTree.FocusedNode);
      Result := FMessages[Data^];
    end
  else
    Result := nil;
end;

procedure TMessageListVisualizer.GetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: string);
var
  Data: PInteger;
begin
  Data := FTree.GetNodeData(Node);

  case Column of
    colMessageListReceived:
      CellText := FormatDateTime('dd.mm.yyyy hh:nn:ss', FMessages[Data^].Date);
    colMessageListSender:
      begin
        CellText := FMessages[Data^].Sender.Text;
        if CellText = '' then
          CellText := FMessages[Data^].From.Text;
      end;
    colMessageListSubject:
      CellText := FMessages[Data^].Subject;
  end;
end;

function TMessageListVisualizer.IsSelected: Boolean;
begin
  Result := FTree.FocusedNode <> nil;
end;

procedure TMessageListVisualizer.SetMessages(
  const AMessages: TObjectList<TIdMessage>);
begin
  FMessages := AMessages;
end;

procedure TMessageListVisualizer.SetVirtualTree(
  const ATree: TVirtualStringTree);
begin
  FTree := ATree;
  AttachTree;
  DecorateTree;
  CreateColumns;
end;

initialization
  GlobalContainer.RegisterType<TMessageListVisualizer>.Implements<IMessageListVisualizer>;
end.
