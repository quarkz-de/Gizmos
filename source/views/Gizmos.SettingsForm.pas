unit Gizmos.SettingsForm;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls,
  Eventbus, i18nCore, i18nCtrls,
  Gizmos.Forms, Gizmos.Events, i18nLocalizer, Vcl.WinXCtrls;

type
  TwSettingsForm = class(TApplicationForm)
    txTheme: TLabel;
    cbTheme: TComboBox;
    cbLanguage: TCultureBox;
    txLanguage: TLabel;
    trTranslator: TTranslator;
    procedure cbLanguageClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbThemeChange(Sender: TObject);
  private
    FLoadingValues: Boolean;
    procedure LoadValues;
    procedure InitControls;
  public
  end;

implementation

{$R *.dfm}

uses
  Gizmos.Settings;

const
  iiLightTheme = 0;
  iiDarkTheme = 1;

{ TwSettingsForm }

procedure TwSettingsForm.cbLanguageClick(Sender: TObject);
begin
  if not FLoadingValues and (cbLanguage.ItemSelected <> nil) then
    ApplicationSettings.Language := cbLanguage.ItemSelected.Locale;
end;

procedure TwSettingsForm.cbThemeChange(Sender: TObject);
begin
  case cbTheme.ItemIndex of
    iiLightTheme:
      ApplicationSettings.Theme := atLight;
    iiDarkTheme:
      ApplicationSettings.Theme := atDark;
  end;
end;

procedure TwSettingsForm.FormCreate(Sender: TObject);
begin
  InitControls;
  LoadValues;
end;

procedure TwSettingsForm.InitControls;
begin

end;

procedure TwSettingsForm.LoadValues;
begin
  FLoadingValues := true;
  try
    case ApplicationSettings.Theme of
      atLight:
        cbTheme.ItemIndex := iiLightTheme;
      atDark:
        cbTheme.ItemIndex := iiDarkTheme;
    end;
    cbLanguage.ItemSelected := CultureOf(ApplicationSettings.Language);

  finally
    FLoadingValues := false;
  end;
end;

end.
