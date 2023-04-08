unit Qizmos.Forms;

interface

uses
  System.Classes, System.Generics.Collections, System.Generics.Defaults,
  Vcl.Forms, Vcl.Controls,
  EventBus,
  Qizmos.Types, Qizmos.Events;

type
  TManagedForm = class(TForm)
  private
    FFormId: TManagedFormId;
    FImageIndex: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    procedure ThemeChanged; virtual;
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

implementation

uses
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
  ThemeChanged;
end;

procedure TManagedForm.ThemeChanged;
begin

end;

end.
