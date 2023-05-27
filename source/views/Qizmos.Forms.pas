unit Qizmos.Forms;

interface

uses
  Vcl.Forms,
  Qodelib.ManagedForms,
  Qizmos.Types;

type
  TManagedForm = class(TQzManagedForm)
  protected
    procedure FontChanged; override;
  public
    procedure AfterConstruction; override;
  end;

  TDialogForm = class(TForm)
  public
    procedure AfterConstruction; override;
  end;

implementation

uses
  Qizmos.Settings;

{ TDialogForm }

procedure TDialogForm.AfterConstruction;
begin
  inherited;
  Font.Name := DefaultFontName;
  Font.Size := ApplicationSettings.FontSize;
end;

{ TManagedForm }

procedure TManagedForm.AfterConstruction;
begin
  inherited;
  FontChanged;
  ThemeChanged;
end;

procedure TManagedForm.FontChanged;
begin
  inherited;
  Font.Name := DefaultFontName; // Settings?
  Font.Size := ApplicationSettings.FontSize;
end;

end.
