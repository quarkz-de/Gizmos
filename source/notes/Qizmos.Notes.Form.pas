unit Qizmos.Notes.Form;

interface

uses
  System.SysUtils, System.Classes, System.Actions, System.ImageList,
  System.IOUtils, System.Types, System.UITypes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.ComCtrls, Vcl.ActnList,
  Vcl.ExtCtrls, Vcl.Menus, Vcl.Themes, Vcl.ActnMan, Vcl.ActnCtrls,
  Vcl.ImgList, Vcl.VirtualImageList, Vcl.ToolWin,
  Vcl.PlatformDefaultStyleActnCtrls,
  VirtualTrees,
  Eventbus,
  MarkdownProcessor,
  SynEdit, SynHighlighterURI, SynEditHighlighter,
  HTMLUn2, HtmlView, UrlConn, HtmlGlobals,
  Qodelib.ManagedForms, Qodelib.Panels,
  Qizmos.Core.Forms, Qizmos.Core.Types, Qizmos.Core.Markdown,
  Qizmos.Core.Events, Qizmos.Notes.Visualizers, Vcl.Dialogs;

type
  TwNotesForm = class(TManagedForm)
    pcNote: TPageControl;
    tsEdit: TTabSheet;
    tsView: TTabSheet;
    edText: TSynEdit;
    hvText: THtmlViewer;
    Connectors: ThtConnectionManager;
    FileConnector: ThtFileConnector;
    ResourceConnector: ThtResourceConnector;
    spSplitter: TSplitter;
    Panel1: TPanel;
    pmNotes: TPopupMenu;
    miNewNotebook: TMenuItem;
    miNewNote: TMenuItem;
    miDeleteItem: TMenuItem;
    amActions: TActionManager;
    vilIcons: TVirtualImageList;
    acNewNotebook: TAction;
    acNewNote: TAction;
    acDeleteItem: TAction;
    acFormatBold: TAction;
    acFormatItalic: TAction;
    acFormatStrikeThrough: TAction;
    acFormatHeading1: TAction;
    acFormatHeading2: TAction;
    acFormatHeading3: TAction;
    tbEditor: TActionToolBar;
    acFormatCode: TAction;
    acFormatBulletedList: TAction;
    acFormatNumberedList: TAction;
    acFormatInsertLink: TAction;
    pnHeader: TQzPanel;
    vilIcons24: TVirtualImageList;
    tbNotes: TToolBar;
    btNewNotebook: TToolButton;
    btNewNote: TToolButton;
    synUri: TSynURISyn;
    vtNotebook: TVirtualStringTree;
    btDeleteNote: TToolButton;
    acSelectFolder: TAction;
    btSelectFolder: TToolButton;
    btSeparator1: TToolButton;
    dSelectFolder: TFileOpenDialog;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acDeleteItemExecute(Sender: TObject);
    procedure acNewNotebookExecute(Sender: TObject);
    procedure acNewNoteExecute(Sender: TObject);
    procedure acFormatBoldExecute(Sender: TObject);
    procedure acFormatBulletedListExecute(Sender: TObject);
    procedure acFormatCodeExecute(Sender: TObject);
    procedure acFormatItalicExecute(Sender: TObject);
    procedure acFormatStrikeThroughExecute(Sender: TObject);
    procedure acFormatHeading1Execute(Sender: TObject);
    procedure acFormatHeading2Execute(Sender: TObject);
    procedure acFormatHeading3Execute(Sender: TObject);
    procedure acFormatNumberedListExecute(Sender: TObject);
    procedure acSelectFolderExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure hvTextHotSpotClick(Sender: TObject; const SRC: ThtString;
      var Handled: Boolean);
    procedure vtNotebookFocusChanged(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex);
    procedure vtNotebookFocusChanging(Sender: TBaseVirtualTree;
      OldNode, NewNode: PVirtualNode; OldColumn, NewColumn: TColumnIndex;
      var Allowed: Boolean);
  private
    MarkdownProcessor: TMarkdownProcessor;
    MarkdownEditHelper: TMarkdownEditHelper;
    FTreeVisualizer: INotesTreeVisualizer;
    function IsModified: Boolean;
    procedure UpdateButtons;
    procedure UpdatePreview;
    procedure UpdateEditorSettings;
    procedure UpdateTreeSettings;
    procedure InitNotebook;
    procedure LoadNote(const AFilename: String);
    procedure SaveNote(const AFilename: String);
  public
    function GetFormId: TQzManagedFormId; override;
    function GetImageIndex: Integer; override;
    procedure ThemeChanged; override;
    [Subscribe]
    procedure OnSettingChange(AEvent: ISettingChangeEvent);
    procedure SaveChanges;
  end;
implementation

{$R *.dfm}
{$R ..\..\res\Qizmos.Notes.res}

uses
  Spring.Container,
  Qizmos.Core.Shell, Qizmos.Core.Settings;

{ TwNoteForm }

procedure TwNotesForm.FormActivate(Sender: TObject);
begin
  amActions.State := asNormal;
end;

procedure TwNotesForm.FormCreate(Sender: TObject);
begin
  MarkdownProcessor := TMarkdownProcessor.CreateDialect(mdCommonMark);
  GlobalEventBus.RegisterSubscriberForEvents(Self);
  UpdateEditorSettings;
  UpdateTreeSettings;
  pcNote.ActivePage := tsEdit;
  MarkdownEditHelper := TMarkdownEditHelper.Create(edText);

  FTreeVisualizer := GlobalContainer.Resolve<INotesTreeVisualizer>;
  FTreeVisualizer.SetVirtualTree(vtNotebook);

  InitNotebook;
end;

procedure TwNotesForm.FormDeactivate(Sender: TObject);
begin
  amActions.State := asSuspended;
end;

procedure TwNotesForm.FormDestroy(Sender: TObject);
begin
  SaveChanges;
  MarkdownProcessor.Free;
  MarkdownEditHelper.Free;
end;

procedure TwNotesForm.acDeleteItemExecute(Sender: TObject);
begin
  if MessageDlg(Format('"%s" wirklich löschen?',
    [TPath.GetFileNameWithoutExtension(FTreeVisualizer.GetSelectedItemName)]),
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    FTreeVisualizer.DeleteSelectedItem;
end;

procedure TwNotesForm.acFormatBoldExecute(Sender: TObject);
begin
  MarkdownEditHelper.FormatText(mfsBold);
end;

procedure TwNotesForm.acFormatBulletedListExecute(Sender: TObject);
begin
  MarkdownEditHelper.FormatText(mfsUnorderedList);
end;

procedure TwNotesForm.acFormatCodeExecute(Sender: TObject);
begin
  MarkdownEditHelper.FormatText(mfsCode);
end;

procedure TwNotesForm.acFormatHeading1Execute(Sender: TObject);
begin
  MarkdownEditHelper.FormatText(mfsHeading1);
end;

procedure TwNotesForm.acFormatHeading2Execute(Sender: TObject);
begin
  MarkdownEditHelper.FormatText(mfsHeading2);
end;

procedure TwNotesForm.acFormatHeading3Execute(Sender: TObject);
begin
  MarkdownEditHelper.FormatText(mfsHeading3);
end;

procedure TwNotesForm.acFormatItalicExecute(Sender: TObject);
begin
  MarkdownEditHelper.FormatText(mfsItalic);
end;

procedure TwNotesForm.acFormatNumberedListExecute(Sender: TObject);
begin
  MarkdownEditHelper.FormatText(mfsOrderedList);
end;

procedure TwNotesForm.acFormatStrikeThroughExecute(Sender: TObject);
begin
  MarkdownEditHelper.FormatText(mfsStrikeThrough);
end;

procedure TwNotesForm.acNewNotebookExecute(Sender: TObject);
var
  Foldername: String;
begin
  Foldername := FTreeVisualizer.NewFolder;
  TDirectory.CreateDirectory(Foldername);
end;

procedure TwNotesForm.acNewNoteExecute(Sender: TObject);
var
  Filename: String;
begin
  Filename := FTreeVisualizer.NewNote;
  edText.Modified := true;
  SaveNote(Filename);
end;

procedure TwNotesForm.acSelectFolderExecute(Sender: TObject);
begin
  dSelectFolder.FileName := ApplicationSettings.Notes.Folder;
  if dSelectFolder.Execute then
    begin
      ApplicationSettings.Notes.Folder := dSelectFolder.FileName;
      InitNotebook;
    end;
end;

function TwNotesForm.GetFormId: TQzManagedFormId;
begin
  Result := mfMainNotes;
end;

function TwNotesForm.GetImageIndex: Integer;
begin
  Result := iiMainNotes;
end;

procedure TwNotesForm.hvTextHotSpotClick(Sender: TObject;
  const SRC: ThtString; var Handled: Boolean);
begin
  TShellExecute.Open(SRC);
end;

procedure TwNotesForm.InitNotebook;
begin
  FTreeVisualizer.SetNotebook(ApplicationSettings.Notes.Folder);
  FTreeVisualizer.UpdateContent;
  UpdateButtons;
end;

function TwNotesForm.IsModified: Boolean;
begin
  Result := edText.Modified;  // or Note not saved
end;

procedure TwNotesForm.LoadNote(const AFilename: String);
begin
  if TFile.Exists(AFilename) then
    begin
      edText.Lines.LoadFromFile(AFilename);
      edText.Modified := false;
      UpdatePreview;
      pcNote.Visible := true;
    end
  else
    pcNote.Visible := false
end;

procedure TwNotesForm.OnSettingChange(AEvent: ISettingChangeEvent);
begin
  case AEVent.Value of
    svEditorFont:
      UpdateEditorSettings;
    svFont:
      UpdateTreeSettings;
  end;
end;

procedure TwNotesForm.SaveChanges;
begin
//  SaveNote(CurrentNote);
end;

procedure TwNotesForm.SaveNote(const AFilename: String);
begin
  if IsModified then
    begin
      edText.Lines.SaveToFile(AFilename);
      edText.Modified := false;
    end;
end;

procedure TwNotesForm.ThemeChanged;
begin
  inherited;
  vilIcons.UpdateImageList;
  vilIcons24.UpdateImageList;
  UpdatePreview;
end;

procedure TwNotesForm.UpdateButtons;
begin
  case FTreeVisualizer.GetSelectedItemType of
    itNone:
      acDeleteItem.Enabled := false;
    itFolder:
      acDeleteItem.Enabled := TDirectory.IsEmpty(FTreeVisualizer.GetSelectedItemName);
    itNote:
      acDeleteItem.Enabled := true;
    else
      acDeleteItem.Enabled := false;
  end;
end;

procedure TwNotesForm.UpdateEditorSettings;
begin
  edText.Font.Name := ApplicationSettings.Notes.EditorFont;
  edText.Font.Size := ApplicationSettings.Notes.EditorFontSize;
end;

procedure TwNotesForm.UpdatePreview;
const
  Template = '<html><head><link rel="StyleSheet" type="text/css" href="res:///%s.css"></head><body>%s</body></html>';
var
  Html, Style: String;
begin
  Style := 'Css_' + StringReplace(TStyleManager.ActiveStyle.Name, ' ', '_', [rfReplaceAll]);
  Html := Format(Template, [Style, MarkdownProcessor.Process(edText.Text)]);
  hvText.LoadFromString(Html);
end;

procedure TwNotesForm.UpdateTreeSettings;
begin
  vtNotebook.DefaultNodeHeight := (ApplicationSettings.FontSize * 2) + 4;
end;

procedure TwNotesForm.vtNotebookFocusChanged(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex);
var
  Filename: String;
begin
  if FTreeVisualizer.GetItemType(Node) = itNote then
    begin
      Filename := FTreeVisualizer.GetNote(Node);
      LoadNote(Filename);
      pcNote.Visible := true;
    end
  else
    pcNote.Visible := false;

  UpdateActions;
end;

procedure TwNotesForm.vtNotebookFocusChanging(Sender: TBaseVirtualTree;
  OldNode, NewNode: PVirtualNode; OldColumn, NewColumn: TColumnIndex;
  var Allowed: Boolean);
var
  Filename: String;
begin
  if FTreeVisualizer.GetItemType(OldNode) = itNote then
    begin
      Filename := FTreeVisualizer.GetNote(OldNode);
      SaveNote(Filename);
    end;
end;

end.
