unit Qizmos.Forms;

interface

uses
  System.Classes, System.Generics.Collections, System.Generics.Defaults,
  Vcl.Forms, Vcl.Controls,
  EventBus;

const
  mfMaxItemsPerGroup = 100;

  mfMainBase = 100;
  mfMainSettings = mfMainBase + 1;
  mfMainWelcome = mfMainBase + 2;
  mfMainSimulators = mfMainBase + 3;

  mfSettingsBase = 200;
  mfSettingsCommon = mfSettingsBase + 1;
  mfSettingsInfo = mfSettingsBase + 2;

  mfSimulatorsBase = 300;
  mfSimulatorsSmtp = mfSimulatorsBase + 1;
  mfSimulatorsHttp = mfSimulatorsBase + 2;

type
  TManagedFormId = type Integer;

  TManagedFormIdHelper = record helper for TManagedFormId
  public
    function ToString: String; inline;
    function ToImageIndex: Integer; inline;
    function IsMainModule: Boolean; inline;
    function IsSubModule(const AMainModule: TManagedFormId): Boolean; inline;
    function BaseOf: TManagedFormId; inline;
  end;

  TManagedForm = class(TForm)
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
    FParent: TForm;
    FForms: TDictionary<TManagedFormId, TManagedForm>;
    function GetActiveForm: TManagedForm;
  protected
    function AddForm(const AFormId: TManagedFormId;
      const AClass: TManagedFormClass): TManagedForm;
    procedure CreateForms; virtual; abstract;
    property ParentForm: TForm read FParent;
  public
    constructor Create(const AParent: TForm);
    destructor Destroy; override;
    procedure ShowForm(const AForm: TManagedFormId);
    property ActiveForm: TManagedForm read GetActiveForm;
  end;

  TApplicationFormList = class(TManagedFormList)
  private
    procedure CreateForms; override;
  end;

  TSettingsFormList = class(TManagedFormList)
  private
    procedure CreateForms; override;
  end;

  TSimulatorsFormList = class(TManagedFormList)
  private
    procedure CreateForms; override;
  end;

implementation

uses
  Qizmos.Events,
  Qizmos.WelcomeForm,
  Qizmos.SettingsForm, Qizmos.SettingsCommonForm, Qizmos.SettingsInfoForm,
  Qizmos.SimulatorsForm, Qizmos.SimulatorsSmtpForm, Qizmos.SimulatorsHttpForm;

{ TManagedFormList }

function TManagedFormList.AddForm(const AFormId: TManagedFormId;
  const AClass: TManagedFormClass): TManagedForm;
begin
  Result := AClass.Create(ParentForm);
  Result.FormId := AFormId;
  FForms.Add(AFormId, Result);
end;

constructor TManagedFormList.Create(const AParent: TForm);
var
  Form: TManagedForm;
begin
  inherited Create;
  FForms := TDictionary<TManagedFormId, TManagedForm>.Create;
  FParent := AParent;
  CreateForms;
  for Form in FForms.Values do
    Form.Font := FParent.Font;
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
          Form.Parent := FParent;
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

{ TManagedFormIdHelper }

function TManagedFormIdHelper.BaseOf: TManagedFormId;
begin
  Result := (self mod 100) * 100;
end;

function TManagedFormIdHelper.IsMainModule: Boolean;
begin
  Result := (self > mfMainBase) and (self < mfMainBase + mfMaxItemsPerGroup);
end;

function TManagedFormIdHelper.IsSubModule(
  const AMainModule: TManagedFormId): Boolean;
var
  Base: TManagedFormId;
begin
  Base := self.BaseOf;
  Result := (self > Base) and (self < Base + mfMaxItemsPerGroup);
end;

function TManagedFormIdHelper.ToImageIndex: Integer;
begin
  case self of
    mfMainSettings:
      Result := 2;
    mfMainWelcome:
      Result := 5;
    mfMainSimulators:
      Result := 6;
    mfSettingsCommon:
      Result := -1;
    mfSettingsInfo:
      Result := -1;
    mfSimulatorsSmtp:
      Result := -1;
    mfSimulatorsHttp:
      Result := -1;
    else
      Result := -1;
  end;
end;

function TManagedFormIdHelper.ToString: String;
begin
  case self of
    mfMainSettings:
      Result := 'Einstellungen';
    mfMainWelcome:
      Result := 'Start';
    mfMainSimulators:
      Result := 'Simulatoren';
    mfSettingsCommon:
      Result := 'Allgemein';
    mfSettingsInfo:
      Result := 'Info';
    mfSimulatorsSmtp:
      Result := 'SMTP Blackhole';
    mfSimulatorsHttp:
      Result := 'HTTP Blackhole';
    else
      Result := '';
  end;
end;

end.
