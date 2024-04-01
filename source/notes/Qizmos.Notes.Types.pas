unit Qizmos.Notes.Types;

interface

uses
  System.SysUtils, System.Classes, System.Generics.Collections;

type
  TNote = class;

  TNoteBook = class(TPersistent)
  private
    FFolder: String;
    FNotes: TObjectList<TNote>;
    function GetIndexFilename: String;
  public
    constructor Create;
    destructor Destroy; override;
    procedure LoadData;
    procedure SaveData;
    procedure Assign(Source: TPersistent); override;
    property Folder: String read FFolder write FFolder;
    property IndexFilename: String read GetIndexFilename;
  published
    property Notes: TObjectList<TNote> read FNotes;
  end;

  TNote = class(TPersistent)
  private
    FName: String;
    FText: String;
    FIdent: String;
    FNotes: TObjectList<TNote>;
    function GetIdent: String;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
    property Ident: String read GetIdent write FIdent;
    property Name: String read FName write FName;
    property Text: String read FText write FText;
    property Notes: TObjectList<TNote> read FNotes;
  end;

implementation

uses
  System.IOUtils, System.JSON,
  Neon.Core.Persistence, Neon.Core.Persistence.JSON;

const
  SNotebookIndexFilename = '.index.json';

{ TNoteBook }

procedure TNoteBook.Assign(Source: TPersistent);
begin
  if Source is TNoteBook then
    begin
      FNotes := TNoteBook(Source).Notes;
    end
  else
    inherited Assign(Source);
end;

constructor TNoteBook.Create;
begin
  FNotes := TObjectList<TNote>.Create;
end;

destructor TNoteBook.Destroy;
begin
  FNotes.Free;
  inherited;
end;

function TNoteBook.GetIndexFilename: String;
begin
  Result := TPath.Combine(Folder, SNotebookIndexFilename);
end;

procedure TNoteBook.LoadData;
var
  JSON: TJSONValue;
  Strings: TStringList;
begin
  if FileExists(GetIndexFilename) then
    begin
      Strings := TStringList.Create;
      Strings.LoadFromFile(GetIndexFilename);
      JSON := TJSONObject.ParseJSONValue(Strings.Text);
      TNeon.JSONToObject(self, JSON, TNeonConfiguration.Default);
      JSON.Free;
      Strings.Free;
    end;
end;

procedure TNoteBook.SaveData;
var
  JSON: TJSONValue;
  Stream: TFileStream;
begin
  JSON := TNeon.ObjectToJSON(self);
  Stream := TFileStream.Create(GetIndexFilename, fmCreate);
  TNeon.PrintToStream(JSON, Stream, true);
  Stream.Free;
  JSON.Free;
end;

{ TNote }

procedure TNote.Assign(Source: TPersistent);
var
  Note: TNote;
begin
  if Source is TNote then
    begin
      Note := TNote(Source);
      Ident := Note.Ident;
      Name := Note.Name;
      Text := Note.Text;  // todo
      FNotes := Note.Notes;
    end
  else
    inherited Assign(Source);
end;

constructor TNote.Create;
begin
  FNotes := TObjectList<TNote>.Create;
end;

destructor TNote.Destroy;
begin
  FNotes.Free;
  inherited;
end;

function TNote.GetIdent: String;
var
  Guid: TGuid;
begin
  if FIdent = '' then
    begin
      if CreateGuid(Guid) = S_OK then
        FIdent := GuidToString(Guid);
    end;
  Result := FIdent;
end;

end.
