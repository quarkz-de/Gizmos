unit Qizmos.Simulators.HttpVisualizers;

interface

uses
  System.SysUtils, System.Classes,
  Spring.Container,
  VirtualTrees, VirtualTrees.Header, VirtualTrees.Types;

type
  IHttpMessageListVisualizer = interface
    ['{614C9358-7811-4205-8A40-BDB78979E58A}']
    procedure SetVirtualTree(const ATree: TVirtualStringTree);
    procedure AddMessage(const ACommand, AURI: String; const AParams: TStrings);
  end;

implementation

const
  DefaultTreeHeaderHeight = 28;
  DefaultTreeRowHeight = 26;

  colMessageListKey = 0;
  colMessageListValue = 1;

type
  THttpMessageListVisualizer = class(TInterfacedObject, IHttpMessageListVisualizer)
  private
    FTree: TVirtualStringTree;
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
    procedure FreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
  public
    procedure SetVirtualTree(const ATree: TVirtualStringTree);
    procedure AddMessage(const ACommand, AURI: String; const AParams: TStrings);
  end;

  TKeyValue = record
    Key: String;
    Value: String;
  end;
  PKeyValue = ^TKeyValue;

{ THttpMessageListVisualizer }

procedure THttpMessageListVisualizer.AddMessage(const ACommand, AURI: String;
  const AParams: TStrings);
var
  RootNode, Node: PVirtualNode;
  Data: PKeyValue;
  I: Integer;
  Key: String;
begin
  RootNode := FTree.AddChild(nil);
  Data := FTree.GetNodeData(RootNode);
  Data.Key := ACommand;
  Data.Value := AURI;

  Node := FTree.AddChild(RootNode);
  Data := FTree.GetNodeData(Node);
  Data.Key := 'Empfangen';
  Data.Value := FormatDateTime('dd.mm.yyyy hh:nn:ss,zzz', Now);

  for I := 0 to AParams.Count - 1 do
    begin
      Key := AParams.Names[I];
      if Key <> '' then
        begin
          Node := FTree.AddChild(RootNode);
          Data := FTree.GetNodeData(Node);
          Data.Key := Key;
          Data.Value := AParams.Values[Key];
        end;
    end;
end;

procedure THttpMessageListVisualizer.AttachTree;
begin
  FTree.OnGetNodeDataSize := GetNodeDataSize;
  FTree.OnGetText := GetText;
  FTree.OnGetImageIndex := GetImageIndex;
  FTree.OnFreeNode := FreeNode;
end;

procedure THttpMessageListVisualizer.CreateColumns;
var
  Column: TVirtualTreeColumn;
begin
  FTree.Header.Columns.Clear;

  FTree.Header.Columns.BeginUpdate;

  Column := FTree.Header.Columns.Add;
  Column.Text := 'Bezeichnung';
  Column.Width := 200;

  Column := FTree.Header.Columns.Add;
  Column.Text := 'Wert';
  Column.Width := 300;

  FTree.Header.AutoSizeIndex := colMessageListValue;

  FTree.Header.Columns.EndUpdate;
end;

procedure THttpMessageListVisualizer.DecorateTree;
begin
  FTree.TreeOptions.PaintOptions := FTree.TreeOptions.PaintOptions + [toShowRoot];
  FTree.TreeOptions.SelectionOptions := FTree.TreeOptions.SelectionOptions + [toFullRowSelect];
  FTree.DefaultNodeHeight := DefaultTreeRowHeight;
  FTree.Header.Options := FTree.Header.Options + [hoVisible, hoAutoResize];
  FTree.Header.Height := DefaultTreeHeaderHeight;
end;

procedure THttpMessageListVisualizer.FreeNode(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var
  Data: PKeyValue;
begin
  Data := Sender.GetNodeData(Node);
  Finalize(Data^);
end;

procedure THttpMessageListVisualizer.GetImageIndex(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
  var Ghosted: Boolean; var ImageIndex: TImageIndex);
begin

end;

procedure THttpMessageListVisualizer.GetNodeDataSize(Sender: TBaseVirtualTree;
  var NodeDataSize: Integer);
begin
  NodeDataSize := SizeOf(TKeyValue);
end;

procedure THttpMessageListVisualizer.GetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: string);
var
  Data: PKeyValue;
begin
  Data := FTree.GetNodeData(Node);

  case Column of
    colMessageListKey:
      CellText := Data.Key;
    colMessageListValue:
      CellText := Data.Value;
  end;
end;

procedure THttpMessageListVisualizer.SetVirtualTree(
  const ATree: TVirtualStringTree);
begin
  FTree := ATree;
  AttachTree;
  DecorateTree;
  CreateColumns;
end;

initialization
  GlobalContainer.RegisterType<THttpMessageListVisualizer>.Implements<IHttpMessageListVisualizer>;
end.
