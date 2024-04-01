unit Qizmos.Notes.Events;

interface

uses
  EventBus,
  Qizmos.Notes.Types, Qizmos.Notes.Visualizers, Qizmos.Core.Settings;

type
  INoteEditEvent = interface
    ['{016258B6-5B8F-475B-AACF-E70214D012F7}']
    function GetNote: TNote;
    property Note: TNote read GetNote;
  end;

  ISelectItemEvent = interface
    ['{C2C7C11C-B75B-4D2D-A8DD-27D71A522252}']
    function GetItemType: TNotesTreeItemType;
    property ItemType: TNotesTreeItemType read GetItemType;
  end;

  TEventFactory = class
  public
    class function NewNoteEditEvent(
      const ANote: TNote): INoteEditEvent;
    class function NewSelectItemEvent(
      const AItemType: TNotesTreeItemType): ISelectItemEvent;
  end;

implementation

type
  TNoteEditEvent = class(TInterfacedObject, INoteEditEvent)
  private
    FNote: TNote;
  protected
    function GetNote: TNote;
  public
    constructor Create(const ANote: TNote);
    property Note: TNote read GetNote;
  end;

  TSelectItemEvent = class(TInterfacedObject, ISelectItemEvent)
  private
    FItemType: TNotesTreeItemType;
  protected
    function GetItemType: TNotesTreeItemType;
  public
    constructor Create(const AItemType: TNotesTreeItemType);
    property ItemType: TNotesTreeItemType read GetItemType;
  end;

{ TNoteEditEvent }

constructor TNoteEditEvent.Create(const ANote: TNote);
begin
  inherited Create;
  FNote := ANote;
end;

function TNoteEditEvent.GetNote: TNote;
begin
  Result := FNote;
end;

{ TSelectItemEvent }

constructor TSelectItemEvent.Create(const AItemType: TNotesTreeItemType);
begin
  inherited Create;
  FItemType := AItemType;
end;

function TSelectItemEvent.GetItemType: TNotesTreeItemType;
begin
  Result := FItemType;
end;

{ TEventFactory }

class function TEventFactory.NewNoteEditEvent(
  const ANote: TNote): INoteEditEvent;
begin
  Result := TNoteEditEvent.Create(ANote);
end;

class function TEventFactory.NewSelectItemEvent(
  const AItemType: TNotesTreeItemType): ISelectItemEvent;
begin
  Result := TSelectItemEvent.Create(AItemType);
end;

end.
