unit Qizmos.Forms;

interface

uses
  System.Classes, System.Generics.Collections, System.Generics.Defaults,
  Vcl.Forms, Vcl.Controls;

const
  mfMainSettings = 0;
  mfMainWelcome = 1;

  mfSettingsCommon = 0;
  mfSettingsInfo = 1;

type
  TManagedFormId = type Integer;

  TManagedForm = class(TForm)
  private
    FFormId: TManagedFormId;
  public
    property FormId: TManagedFormId read FFormId write FFormId;
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

implementation

uses
  Qizmos.WelcomeForm, Qizmos.SettingsForm, Qizmos.SettingsCommonForm,
  Qizmos.SettingsInfoForm;

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
end;

{ TSettingsFormList }

procedure TSettingsFormList.CreateForms;
begin
  AddForm(mfSettingsCommon, TwSettingsCommonForm);
  AddForm(mfSettingsInfo, TwSettingsInfoForm);
end;

end.
