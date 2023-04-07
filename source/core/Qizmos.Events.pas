unit Qizmos.Events;

interface

uses
  EventBus,
  Qizmos.Forms;

type
  IModuleChangeEvent = interface
    ['{C52EBC6A-D733-44FD-8F0F-F4109D1290B0}']
    function GetFormId: TManagedFormId;
    property FormId: TManagedFormId read GetFormId;
  end;

  TEventFactory = class
  public
    class function NewModuleChangeEvent(const AFormId: TManagedFormId): IModuleChangeEvent;
  end;

implementation

type
  TModuleChangeEvent = class(TInterfacedObject, IModuleChangeEvent)
  private
    FFormId: TManagedFormId;
  protected
    function GetFormId: TManagedFormId;
  public
    constructor Create(const AFormId: TManagedFormId);
    property FormId: TManagedFormId read GetFormId;
  end;

{ TEventFactory }

class function TEventFactory.NewModuleChangeEvent(
  const AFormId: TManagedFormId): IModuleChangeEvent;
begin
  Result := TModuleChangeEvent.Create(AFormId);
end;

{ TModuleChangeEvent }

constructor TModuleChangeEvent.Create(const AFormId: TManagedFormId);
begin
  inherited Create;
  FFormId := AFormId;
end;

function TModuleChangeEvent.GetFormId: TManagedFormId;
begin
  Result := FFormId;
end;

end.
