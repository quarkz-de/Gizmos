unit Gizmos.Events;

interface

uses
  EventBus,
  Gizmos.Settings;

type
  ISettingChangeEvent = interface
    ['{E6B7B890-DEFA-4F6B-8A93-91FD1FFE9822}']
    function GetValue: TApplicationSettingValue;
    property Value: TApplicationSettingValue read GetValue;
  end;

  TEventFactory = class
  public
    class function NewSettingChangeEvent(
      const AValue: TApplicationSettingValue): ISettingChangeEvent;
  end;

implementation

type
  TSettingChangeEvent = class(TInterfacedObject, ISettingChangeEvent)
  private
    FValue: TApplicationSettingValue;
  protected
    function GetValue: TApplicationSettingValue;
  public
    constructor Create(const AValue: TApplicationSettingValue);
    property Value: TApplicationSettingValue read GetValue;
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

{ TEventFactory }

class function TEventFactory.NewSettingChangeEvent(
  const AValue: TApplicationSettingValue): ISettingChangeEvent;
begin
  Result := TSettingChangeEvent.Create(AValue);
end;

end.
