unit Qizmos.Forms;

interface

uses
  System.Classes, System.Generics.Collections, System.Generics.Defaults,
  Vcl.Forms, Vcl.Controls,
  EventBus,
  Qizmos.Types, Qizmos.Events, Qizmos.Settings;

type
  TAppForm = class(TForm)
  protected
    procedure FontChanged; virtual;
    procedure ThemeChanged; virtual;
  public
    procedure AfterConstruction; override;
  end;

  TManagedForm = class(TAppForm)
  private
    FFormId: TManagedFormId;
    FImageIndex: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    property FormId: TManagedFormId read FFormId write FFormId;
    property ImageIndex: Integer read FImageIndex write FImageIndex;
  end;

  TManagedFormClass = class of TManagedForm;

  TManagedFormList = class(TObject)
  private
    FContainer: TWinControl;
    FForms: TDictionary<TManagedFormId, TManagedForm>;
    function GetActiveForm: TManagedForm;
  protected
    function AddForm(const AFormId: TManagedFormId;
      const AClass: TManagedFormClass): TManagedForm;
    procedure CreateForms; virtual; abstract;
    property Container: TWinControl read FContainer;
  public
    constructor Create(const AContainer: TWinControl);
    destructor Destroy; override;
    procedure ShowForm(const AForm: TManagedFormId);
    procedure ThemeChanged; virtual;
    property ActiveForm: TManagedForm read GetActiveForm;
  end;

  TApplicationFormList = class(TManagedFormList)
  protected
    procedure CreateForms; override;
  end;

  TSettingsFormList = class(TManagedFormList)
  protected
    procedure CreateForms; override;
  end;

  TSimulatorsFormList = class(TManagedFormList)
  protected
    procedure CreateForms; override;
  end;

  TDialogForm = class(TAppForm)
  end;

implementation

uses
  Qizmos.WelcomeForm,
  Qizmos.SettingsForm, Qizmos.SettingsCommonForm, Qizmos.SettingsInfoForm,
  Qizmos.SettingsSimulatorsForm,
  Qizmos.SimulatorsForm, Qizmos.SimulatorsSmtpForm, Qizmos.SimulatorsHttpForm;

const
  DefaultFontName = 'Segoe UI';
  DefaultFontSize = 9;

{ TManagedFormList }

function TManagedFormList.AddForm(const AFormId: TManagedFormId;
  const AClass: TManagedFormClass): TManagedForm;
begin
  Result := AClass.Create(Container);
  Result.FormId := AFormId;
  FForms.Add(AFormId, Result);
end;

constructor TManagedFormList.Create(const AContainer: TWinControl);
var
  Form: TManagedForm;
begin
  inherited Create;
  FForms := TDictionary<TManagedFormId, TManagedForm>.Create;
  FContainer := AContainer;
  CreateForms;
  for Form in FForms.Values do
    begin
//      Form.FontChanged;
//      Form.Font.Name := DefaultFontName;
//      Form.Font.Size := ApplicationSettings.FontSize; //DefaultFontSize;
    end;
end;

destructor TManagedFormList.Destroy;
begin
  FForms.Free;
  inherited Destroy;
end;

function TManagedFormList.GetActiveForm: TManagedForm;
var
  Form: TManagedForm;
begin
  Result := nil;
  for Form in FForms.Values do
    if (Form <> nil) and (Form.Visible) then
      begin
        Result := Form;
        Break;
      end;
end;

procedure TManagedFormList.ShowForm(const AForm: TManagedFormId);
var
  Form: TManagedForm;
begin
  for Form in FForms.Values do
    begin
      if Form.FormId = AForm then
        begin
          Form.Parent := Container;
          Form.Align := alClient;
          Form.Visible := true;
          Form.Activate;
          GlobalEventBus.Post(TEventFactory.NewModuleChangeEvent(AForm));
        end
      else
        begin
          Form.Deactivate;
          Form.Visible := false;
          Form.Parent := nil;
        end;
    end;
end;

procedure TManagedFormList.ThemeChanged;
var
  Form: TManagedForm;
begin
  for Form in FForms.Values do
    Form.ThemeChanged;
end;

{ TApplicationFormList }

procedure TApplicationFormList.CreateForms;
begin
  AddForm(mfMainWelcome, TwWelcomeForm);
  AddForm(mfMainSettings, TwSettingsForm);
  AddForm(mfMainSimulators, TwSimulatorsForm);
end;

{ TSettingsFormList }

procedure TSettingsFormList.CreateForms;
begin
  AddForm(mfSettingsCommon, TwSettingsCommonForm);
  AddForm(mfSettingsSimulators, TwSettingsSimulatorsForm);
  AddForm(mfSettingsInfo, TwSettingsInfoForm);
end;

{ TSimulatorsFormList }

procedure TSimulatorsFormList.CreateForms;
begin
  AddForm(mfSimulatorsSmtp, TwSimulatorsSmtpForm);
  AddForm(mfSimulatorsHttp, TwSimulatorsHttpForm)
end;

{ TManagedForm }

constructor TManagedForm.Create(AOwner: TComponent);
begin
  inherited;
  BorderStyle := bsNone;
end;

{ TAppForm }

procedure TAppForm.AfterConstruction;
begin
  inherited;
  Font.Name := DefaultFontName;
  Font.Size := ApplicationSettings.FontSize; //DefaultFontSize;

  FontChanged;
  ThemeChanged;
end;

procedure TAppForm.FontChanged;
begin

end;

procedure TAppForm.ThemeChanged;
begin

end;

end.
