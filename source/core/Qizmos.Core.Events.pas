unit Qizmos.Core.Events;

interface

uses
  Qodelib.ManagedForms,
  Qizmos.Core.Types, Qizmos.Core.Settings;

type
  IThemeChangeEvent = interface
    ['{CEC869F4-50DE-441F-8C81-BF2C4C2B4C93}']
  end;

  IModuleChangeEvent = interface
    ['{C52EBC6A-D733-44FD-8F0F-F4109D1290B0}']
    function GetFormId: TQzManagedFormId;
    function GetSubId: TQzManagedFormId;
    property FormId: TQzManagedFormId read GetFormId;
    property SubId: TQzManagedFormId read GetSubId;
  end;

  ISettingChangeEvent = interface
    ['{74A71D00-110F-46DE-8724-F5DBBF078FF2}']
    function GetValue: TApplicationSettingValue;
    property Value: TApplicationSettingValue read GetValue;
  end;

  TEventFactory = class
  public
    class function NewThemeChangeEvent: IThemeChangeEvent;
    class function NewModuleChangeEvent(
      const AFormId: TQzManagedFormId): IModuleChangeEvent; overload;
    class function NewModuleChangeEvent(
      const AFormId, ASubId: TQzManagedFormId): IModuleChangeEvent; overload;
    class function NewSettingChangeEvent(
      const AValue: TApplicationSettingValue): ISettingChangeEvent;
  end;

implementation

type
  TThemeChangeEvent = class(TInterfacedObject, IThemeChangeEvent);

  TModuleChangeEvent = class(TInterfacedObject, IModuleChangeEvent)
  private
    FFormId: TQzManagedFormId;
    FSubId: TQzManagedFormId;
  protected
    function GetFormId: TQzManagedFormId;
    function GetSubId: TQzManagedFormId;
  public
    constructor Create(const AFormId: TQzManagedFormId); overload;
    constructor Create(const AFormId, ASubId: TQzManagedFormId); overload;
    property FormId: TQzManagedFormId read GetFormId;
    property SubId: TQzManagedFormId read GetSubId;
  end;

  TSettingChangeEvent = class(TInterfacedObject, ISettingChangeEvent)
  private
    FValue: TApplicationSettingValue;
  protected
    function GetValue: TApplicationSettingValue;
  public
    constructor Create(const AValue: TApplicationSettingValue);
    property Value: TApplicationSettingValue read GetValue;
  end;

{ TEventFactory }

class function TEventFactory.NewModuleChangeEvent(
  const AFormId: TQzManagedFormId): IModuleChangeEvent;
begin
  Result := TModuleChangeEvent.Create(AFormId);
end;

class function TEventFactory.NewModuleChangeEvent(const AFormId,
  ASubId: TQzManagedFormId): IModuleChangeEvent;
begin
  Result := TModuleChangeEvent.Create(AFormId, ASubId);
end;

class function TEventFactory.NewSettingChangeEvent(
  const AValue: TApplicationSettingValue): ISettingChangeEvent;
begin
  Result := TSettingChangeEvent.Create(AValue);
end;

class function TEventFactory.NewThemeChangeEvent;
begin
  Result := TThemeChangeEvent.Create;
end;

{ TModuleChangeEvent }

constructor TModuleChangeEvent.Create(const AFormId: TQzManagedFormId);
begin
  inherited Create;
  FFormId := AFormId;
  FSubId := 0;
end;

constructor TModuleChangeEvent.Create(const AFormId, ASubId: TQzManagedFormId);
begin
  inherited Create;
  FFormId := AFormId;
  FSubId := ASubId;
end;

function TModuleChangeEvent.GetFormId: TQzManagedFormId;
begin
  Result := FFormId;
end;

function TModuleChangeEvent.GetSubId: TQzManagedFormId;
begin
  Result := FSubId;
end;

{ TSettingChangeEvent }

constructor TSettingChangeEvent.Create(const AValue: TApplicationSettingValue);
begin
  inherited Create;
  FValue := AValue;
end;

function TSettingChangeEvent.GetValue: TApplicationSettingValue;
begin
  Result := FValue;
end;

end.
