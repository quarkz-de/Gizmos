unit Qizmos.SettingsCommonForm;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Qizmos.Forms;

type
  TwSettingsCommonForm = class(TManagedForm)
    txTheme: TLabel;
    cbTheme: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure cbThemeChange(Sender: TObject);
  private
    { Private-Deklarationen }
    procedure LoadValues;
  public
    { Public-Deklarationen }
  end;

var
  wSettingsCommonForm: TwSettingsCommonForm;

implementation

{$R *.dfm}

uses
  Qizmos.Settings;

const
  iiSystemTheme = 0;
  iiLightTheme = 1;
  iiDarkTheme = 2;

{ TwSettingsCommonForm }

procedure TwSettingsCommonForm.cbThemeChange(Sender: TObject);
begin
  case cbTheme.ItemIndex of
    iiSystemTheme:
      ApplicationSettings.Theme := atSystem;
    iiLightTheme:
      ApplicationSettings.Theme := atLight;
    iiDarkTheme:
      ApplicationSettings.Theme := atDark;
  end;
end;

procedure TwSettingsCommonForm.FormCreate(Sender: TObject);
begin
  LoadValues;
end;

procedure TwSettingsCommonForm.LoadValues;
begin
  case ApplicationSettings.Theme of
    atSystem:
      cbTheme.ItemIndex := iiSystemTheme;
    atLight:
      cbTheme.ItemIndex := iiLightTheme;
    atDark:
      cbTheme.ItemIndex := iiDarkTheme;
  end;
end;

end.
