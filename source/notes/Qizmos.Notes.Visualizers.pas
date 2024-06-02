unit Qizmos.Notes.Visualizers;

interface

uses
  System.SysUtils, System.Classes,
  System.Types, System.UITypes, System.IOUtils,
  Winapi.ActiveX,
  Spring.Container,
  VirtualTrees;

type
  TNotesTreeItemType = (itNone, itFolder, itNote);

  INotesTreeVisualizer = interface
    ['{E19DF1AA-DE43-4B86-9B98-3AB754881DE6}']
    procedure SetVirtualTree(const ATree: TVirtualStringTree);
    procedure SetNotebook(const AValue: String);
    procedure UpdateContent;
    function NewNote: String;
    function NewFolder: String;
    function DeleteSelectedItem: Boolean;
    function GetSelectedItemType: TNotesTreeItemType;
    function GetSelectedItemName: String;
    function GetSelectedFolder: String;
    function GetItemType(const Node: PVirtualNode): TNotesTreeItemType;
    function GetNote(const Node: PVirtualNode): String;
  end;

const
  NotesFileExtension = '.md';
  NewNoteName = 'neue Notiz';
  NewFolderName = 'neuer Ordner';

implementation

type
  TNotesTreeVisualizer = class(TInterfacedObject, INotesTreeVisualizer)
  private
    FTree: TVirtualStringTree;
    FRootFolder: String;
    procedure GetNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize:
      Integer);
    procedure FreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure GetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure GetImageIndex(Sender: TBaseVirtualTree; Node:
      PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted:
      Boolean; var ImageIndex: TImageIndex);
    procedure Edited(Sender: TBaseVirtualTree; Node:
      PVirtualNode; Column: TColumnIndex);
    procedure Editing(Sender: TBaseVirtualTree; Node:
      PVirtualNode; Column: TColumnIndex; var Allowed: Boolean);
    procedure NewText(Sender: TBaseVirtualTree; Node:
      PVirtualNode; Column: TColumnIndex; NewText: string);
    procedure CompareNodes(Sender: TBaseVirtualTree; Node1,
      Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
    procedure DragAllowed(Sender: TBaseVirtualTree; Node:
      PVirtualNode; Column: TColumnIndex; var Allowed: Boolean);
    procedure DragDrop(Sender: TBaseVirtualTree; Source:
      TObject; DataObject: IDataObject; Formats: TFormatArray; Shift:
      TShiftState; Pt: TPoint; var Effect: Integer; Mode: TDropMode);
    procedure DragOver(Sender: TBaseVirtualTree; Source:
      TObject; Shift: TShiftState; State: TDragState; Pt: TPoint; Mode:
      TDropMode; var Effect: Integer; var Accept: Boolean);
    function NotebookNodeOfFocusedNode: PVirtualNode;
    procedure AddFiles(const ARoot: PVirtualNode; const AFolder: String);
    function CreateUniqueFilename(const AFilename: String): String;
    function CreateUniqueFoldername(const AFoldername: String): String;
  public
    procedure SetVirtualTree(const ATree: TVirtualStringTree);
    procedure SetNotebook(const AValue: String);
    procedure UpdateContent;
    function NewNote: String;
    function NewFolder: String;
    function DeleteSelectedItem: Boolean;
    function GetSelectedItemType: TNotesTreeItemType;
    function GetSelectedNote: String;
    function GetSelectedItemName: String;
    function GetSelectedFolder: String;
    function GetItemType(const Node: PVirtualNode): TNotesTreeItemType;
    function GetNote(const Node: PVirtualNode): String;
  end;

  TNotesTreeItem = record
    ItemType: TNotesTreeItemType;
    Filename: String;
  end;
  PNotesTreeItem = ^TNotesTreeItem;

{ TNotesTreeVisualizer }

procedure TNotesTreeVisualizer.AddFiles(const ARoot: PVirtualNode;
  const AFolder: String);
var
  Filenames: TStringDynArray;
  Filename: String;
  Node: PVirtualNode;
  Data: PNotesTreeItem;
begin
  Filenames := TDirectory.GetDirectories(AFolder, '*.*', TSearchOption.soTopDirectoryOnly);
  for Filename in Filenames do
    begin
      Node := FTree.AddChild(ARoot);
      Data := FTree.GetNodeData(Node);
      Data.ItemType := itFolder;
      Data.Filename := Filename;
      AddFiles(Node, Filename);
    end;

  Filenames := TDirectory.GetFiles(AFolder, '*' + NotesFileExtension, TSearchOption.soTopDirectoryOnly);
  for Filename in Filenames do
    begin
      Node := FTree.AddChild(ARoot);
      Data := FTree.GetNodeData(Node);
      Data.ItemType := itNote;
      Data.Filename := Filename;
    end;
end;

procedure TNotesTreeVisualizer.CompareNodes(Sender: TBaseVirtualTree; Node1,
  Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
var
  Data1, Data2: PNotesTreeItem;
begin
  Data1 := FTree.GetNodeData(Node1);
  Data2 := FTree.GetNodeData(Node2);

  case Data1.ItemType of
    itFolder:
      if Data2.ItemType = itNote then
        Result := -1
      else
        Result := AnsiCompareText(Data1.Filename, Data2.Filename);
    itNote:
      if Data2.ItemType = itFolder then
        Result := 1
      else
        Result := AnsiCompareText(TPath.GetFileNameWithoutExtension(Data1.Filename),
          TPath.GetFileNameWithoutExtension(Data2.Filename));
    else
      Result := 0;
  end;
end;

function TNotesTreeVisualizer.CreateUniqueFilename(
  const AFilename: String): String;
var
  Suffix: Integer;
  Folder, BaseName, Extension: String;
begin
  Suffix := 1;
  Folder := TPath.GetDirectoryName(AFilename);
  Basename := TPath.GetFileNameWithoutExtension(AFilename);
  Extension := TPath.GetExtension(AFilename);
  Result := AFilename;
  while TFile.Exists(Result) do
    begin
      Result := TPath.Combine(Folder, Format('%s (%d)%s', [Basename, Suffix, Extension]));
      Inc(Suffix);
    end;
end;

function TNotesTreeVisualizer.CreateUniqueFoldername(
  const AFoldername: String): String;
var
  Suffix: Integer;
  Folder: String;
begin
  Suffix := 1;
  Folder := TPath.GetDirectoryName(AFoldername);
  Result := AFoldername;
  while TDirectory.Exists(Result) do
    begin
      Result := TPath.Combine(Folder, Format('%s (%d)', [Folder, Suffix]));
      Inc(Suffix);
    end;
end;

function TNotesTreeVisualizer.DeleteSelectedItem: Boolean;
var
  Data: PNotesTreeItem;
  Node, NextNode: PVirtualNode;
begin
  Result := false;
  Node := FTree.FocusedNode;
  if Node <> nil then
    begin
      NextNode := Node.PrevSibling;
      if NextNode = nil then
        NextNode := Node.NextSibling;
      if NextNode = nil then
        NextNode := Node.Parent;

      Data := FTree.GetNodeData(Node);
      case Data.ItemType of
        itFolder:
          begin
            if TDirectory.IsEmpty(Data.Filename) then
              begin
                TDirectory.Delete(Data.Filename);
                Result := true;
              end;
          end;
        itNote:
          begin
            TFile.Delete(Data.Filename);
            Result := true;
          end;
      end;

      if Result then
        begin
          FTree.DeleteNode(Node);

          if NextNode <> nil then
            begin
              FTree.FocusedNode := NextNode;
              FTree.Selected[NextNode] := true;
            end;
        end;
    end;
end;

procedure TNotesTreeVisualizer.DragAllowed(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; var Allowed: Boolean);
//var
//  Data: PNotesTreeItem;
begin
//  Data := Sender.GetNodeData(Node);
//  Allowed := Data.ItemType = itNote;
  Allowed := true;
end;

procedure TNotesTreeVisualizer.DragDrop(Sender: TBaseVirtualTree;
  Source: TObject; DataObject: IDataObject; Formats: TFormatArray;
  Shift: TShiftState; Pt: TPoint; var Effect: Integer; Mode: TDropMode);
var
  Node, SourceNode, TargetNode: PVirtualNode;
  AttachMode: TVTNodeAttachMode;
  Data: PNotesTreeItem;
  TargetPath: String;
begin
  SourceNode := Sender.FocusedNode;
  TargetNode := Sender.DropTargetNode;

  if TargetNode <> nil then
    begin
      Data := Sender.GetNodeData(TargetNode);
      case Data.ItemType of
        itFolder:
          begin
            AttachMode := amAddChildLast;
            TargetPath := Data.Filename;

            Node := TargetNode;
            while Node.Parent <> nil do
              begin
                if Node.Parent = SourceNode then
                  AttachMode := amNoWhere;
                Node := Node.Parent;
              end;
          end;
        itNote:
          AttachMode := amNoWhere;
        else
          AttachMode := amNoWhere;
      end;
    end
  else
    begin
      AttachMode := amAddChildLast;
      TargetNode := nil;
    end;

  if AttachMode <> amNoWhere then
    begin
      Data := Sender.GetNodeData(SourceNode);
      case Data.ItemType of
        itFolder:
          TDirectory.Move(Data.Filename, CreateUniqueFoldername(TPath.Combine(TargetPath, TPath.GetFileName(Data.Filename))));
        itNote:
          TFile.Move(Data.Filename, CreateUniqueFilename(TPath.Combine(TargetPath, TPath.GetFilename(Data.Filename))));
      end;
      Sender.MoveTo(SourceNode, TargetNode, AttachMode, false);
      FTree.Expanded[TargetNode] := true;
    end;
end;

procedure TNotesTreeVisualizer.DragOver(Sender: TBaseVirtualTree;
  Source: TObject; Shift: TShiftState; State: TDragState; Pt: TPoint;
  Mode: TDropMode; var Effect: Integer; var Accept: Boolean);
begin
  Accept := (Source = Sender);
end;

procedure TNotesTreeVisualizer.Edited(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex);
begin

end;

procedure TNotesTreeVisualizer.Editing(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; var Allowed: Boolean);
begin
  Allowed := true;
end;

procedure TNotesTreeVisualizer.FreeNode(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var
  Data: PNotesTreeItem;
begin
  Data := FTree.GetNodeData(Node);
  Finalize(Data^);
end;

procedure TNotesTreeVisualizer.GetImageIndex(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
  var Ghosted: Boolean; var ImageIndex: TImageIndex);
var
  Data: PNotesTreeItem;
begin
  case Kind of
    ikNormal, ikSelected:
      begin
        Data := FTree.GetNodeData(Node);
        case Data.ItemType of
          itFolder:
            ImageIndex := 26;
          itNote:
            ImageIndex := 12;
          else
            ImageIndex := -1;
        end;
      end;
    else
      ImageIndex := -1;
  end;
end;

function TNotesTreeVisualizer.GetItemType(
  const Node: PVirtualNode): TNotesTreeItemType;
var
  Data: PNotesTreeItem;
begin
  if Node = nil then
    begin
      Result := itNone;
    end
  else
    begin
      Data := FTree.GetNodeData(Node);
      Result := Data.ItemType;
    end;
end;

procedure TNotesTreeVisualizer.GetNodeDataSize(Sender: TBaseVirtualTree;
  var NodeDataSize: Integer);
begin
  NodeDataSize := SizeOf(TNotesTreeItem);
end;

function TNotesTreeVisualizer.GetNote(const Node: PVirtualNode): String;
var
  Data: PNotesTreeItem;
begin
  if Node = nil then
    begin
      Result := '';
    end
  else
    begin
      Data := FTree.GetNodeData(Node);
      Result := Data.Filename;
    end;
end;

function TNotesTreeVisualizer.GetSelectedFolder: String;
var
  Data: PNotesTreeItem;
begin
  if FTree.FocusedNode = nil then
    Result := FRootFolder
  else
    begin
      Data := FTree.GetNodeData(FTree.FocusedNode);
      Result := TPath.GetDirectoryName(Data.Filename);
    end;
end;

function TNotesTreeVisualizer.GetSelectedItemName: String;
var
  Data: PNotesTreeItem;
begin
  if FTree.FocusedNode = nil then
    Result := ''
  else
    begin
      Data := FTree.GetNodeData(FTree.FocusedNode);
      Result := Data.Filename;
    end;
end;

function TNotesTreeVisualizer.GetSelectedItemType: TNotesTreeItemType;
begin
  Result := GetItemType(FTree.FocusedNode);
end;

function TNotesTreeVisualizer.GetSelectedNote: String;
begin

end;

procedure TNotesTreeVisualizer.GetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: string);
var
  Data: PNotesTreeItem;
begin
  Data := FTree.GetNodeData(Node);
  CellText := TPath.GetFileNameWithoutExtension(Data.Filename);
end;

function TNotesTreeVisualizer.NewFolder: String;
var
  Node: PVirtualNode;
  Data: PNotesTreeItem;
begin
  Result := 'neuer Ordner';
  Result := CreateUniqueFoldername(TPath.Combine(GetSelectedFolder, NewFolderName));
  try
    TDirectory.CreateDirectory(Result);
  except
    Result := '';
    Exit;
  end;

  FTree.BeginUpdate;

  Node := FTree.AddChild(nil);
  Data := FTree.GetNodeData(Node);
  Data.ItemType := itFolder;
  Data.Filename := Result;

  FTree.EndUpdate;

  FTree.FocusedNode := Node;
  FTree.Selected[Node] := true;
  FTree.EditNode(Node, -1);
end;

function TNotesTreeVisualizer.NewNote: String;
var
  Node, ParentNode: PVirtualNode;
  Data: PNotesTreeItem;
begin
  ParentNode := NotebookNodeOfFocusedNode;

  FTree.BeginUpdate;

  Result := CreateUniqueFilename(TPath.Combine(GetSelectedFolder, NewNoteName + NotesFileExtension));

  Node := FTree.AddChild(ParentNode);
  Data := FTree.GetNodeData(Node);
  Data.ItemType := itNote;
  Data.Filename := Result;

  FTree.EndUpdate;

  FTree.FocusedNode := Node;
  FTree.Selected[Node] := true;
  FTree.EditNode(Node, -1);
end;

procedure TNotesTreeVisualizer.NewText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; NewText: string);
var
  Data: PNotesTreeItem;
  OldFilename, NewFilename: String;
  I: Integer;
begin
  Data := FTree.GetNodeData(Node);

  OldFilename := Data.Filename;
  NewFilename := NewText;
  for I := 1 to Length(NewFilename) do
    if not TPath.IsValidFileNameChar(NewFilename[I]) then
      NewFilename[I] := '_';

  case Data.ItemType of
    itFolder:
      NewFilename := CreateUniqueFoldername(
        TPath.Combine(TPath.GetDirectoryName(OldFilename), NewFilename));
    itNote:
      NewFilename := CreateUniqueFilename(
        TPath.Combine(TPath.GetDirectoryName(OldFilename), NewFilename + NotesFileExtension));
  end;

  try
    case Data.ItemType of
      itFolder:
        TDirectory.Move(OldFilename, NewFilename);
      itNote:
        TFile.Move(OldFilename, NewFilename);
    end;
    Data.Filename := NewFilename;
  except
    Data.Filename := OldFilename;
  end;
end;

function TNotesTreeVisualizer.NotebookNodeOfFocusedNode: PVirtualNode;
var
  Node: PVirtualNode;
  Data: PNotesTreeItem;
begin
  Node := FTree.FocusedNode;

  if Node <> nil then
    begin
      Data := FTree.GetNodeData(Node);
      if Data.ItemType = itNote then
        Node := Node.Parent;
    end;

  Result := Node;
end;

procedure TNotesTreeVisualizer.SetNotebook(const AValue: String);
begin
  FRootFolder := AValue;
end;

procedure TNotesTreeVisualizer.SetVirtualTree(const ATree: TVirtualStringTree);
begin
  FTree := ATree;
  FTree.OnGetNodeDataSize := GetNodeDataSize;
  FTree.OnFreeNode := FreeNode;
  FTree.OnGetText := GetText;
  FTree.OnGetImageIndex := GetImageIndex;
  FTree.OnEdited := Edited;
  FTree.OnEditing := Editing;
  FTree.OnNewText := NewText;
  FTree.OnCompareNodes := CompareNodes;
  FTree.OnDragAllowed := DragAllowed;
  FTree.OnDragDrop := DragDrop;
  FTree.OnDragOver := DragOver;
end;

procedure TNotesTreeVisualizer.UpdateContent;
begin
  FTree.Clear;
  FTree.BeginUpdate;
  AddFiles(nil, FRootFolder);
  FTree.EndUpdate;
  FTree.FullExpand;
end;

initialization
  GlobalContainer.RegisterType<TNotesTreeVisualizer>.Implements<INotesTreeVisualizer>;
end.
