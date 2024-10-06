unit Qizmos.Settings.NotesForm;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.ExtCtrls,
  Qodelib.Trackbars, Qodelib.Panels, Qodelib.ManagedForms,
  Qizmos.Core.Forms;

type
  TwSettingsNotesForm = class(TManagedForm)
    pnView: TQzPanel;
    txView: TLabel;
    pnTheme: TQzPanel;
    txFontName: TLabel;
    cbFontName: TComboBox;
    pnFontSize: TQzPanel;
    txFontSize: TLabel;
    tbFontSize: TTrackBar;
    procedure FormCreate(Sender: TObject);
    procedure cbFontNameChange(Sender: TObject);
    procedure tbFontSizeChange(Sender: TObject);
  private
    procedure LoadValues;
  protected
    function GetFormId: TQzManagedFormId; override;
    function GetImageIndex: Integer; override;
    procedure FontChanged; override;
  end;

var
  wSettingsNotesForm: TwSettingsNotesForm;

implementation

{$R *.dfm}

uses
  Qodelib.Fonts,
  Qizmos.Core.Types, Qizmos.Core.Settings, Qizmos.Settings.FormHelpers;

{ TwSettingsNotesForm }

procedure TwSettingsNotesForm.cbFontNameChange(Sender: TObject);
begin
  if cbFontName.Items.IndexOf(cbFontName.Text) > -1 then
    ApplicationSettings.Notes.EditorFont := cbFontName.Text;
end;

procedure TwSettingsNotesForm.FontChanged;
begin
  inherited;
  TSettingsFormPanelHelper.UpdatePanelFonts(self);
end;

procedure TwSettingsNotesForm.FormCreate(Sender: TObject);
begin
  TFontNames.GetFixedPitchFonts(cbFontName.Items);
  LoadValues;
end;

function TwSettingsNotesForm.GetFormId: TQzManagedFormId;
begin
  Result := mfSettingsNotes;
end;

function TwSettingsNotesForm.GetImageIndex: Integer;
begin
  Result := iiSettingsNotes;
end;

procedure TwSettingsNotesForm.LoadValues;
begin
  tbFontSize.Position := ApplicationSettings.Notes.EditorFontSize;
  cbFontName.Text := ApplicationSettings.Notes.EditorFont;
end;

procedure TwSettingsNotesForm.tbFontSizeChange(Sender: TObject);
begin
  ApplicationSettings.Notes.EditorFontSize := tbFontSize.Position;
end;

end.
