unit Qizmos.Redmine.Classes;

interface

uses
  System.SysUtils, System.Generics.Collections;

type
  TRedmineUser = class
  private
    FID: Integer;
    FLogin: String;
    FFirstname: String;
    FLastname: String;
    FMail: String;
  public
    procedure Clear;
    function IsValid: Boolean;
    property ID: Integer read FID write FID;
    property Login: String read FLogin write FLogin;
    property Firstname: String read FFirstname write FFirstname;
    property Lastname: String read FLastname write FLastname;
    property Mail: String read FMail write FMail;
  end;

  TRedmineTicket = class
  private
    FID: Integer;
    FSubject: String;
    FParentID: Integer;
    FParent: TRedmineTicket;
    FCreated: TDateTime;
    FUpdated: TDateTime;
    FProjectID: Integer;
    FAssignedTo: String;
    FTracker: String;
    FStatus: String;
  public
    property ID: Integer read FID write FID;
    property Subject: String read FSubject write FSubject;
    property ParentID: Integer read FParentID write FParentID;
    property Parent: TRedmineTicket read FParent write FParent;
    property Created: TDateTime read FCreated write FCreated;
    property Updated: TDateTime read FUpdated write FUpdated;
    property ProjectID: Integer read FProjectID write FProjectID;
    property AssignedTo: String read FAssignedTo write FAssignedTo;
    property Tracker: String read FTracker write FTracker;
    property Status: String read FStatus write FStatus;
  end;

  TRedmineTicketList = TObjectList<TRedmineTicket>;

  TRedmineProjects = TDictionary<Integer, String>;

implementation

{ TRedmineUser }

procedure TRedmineUser.Clear;
begin
  FID := 0;
  FLogin := '';
  FFirstname := '';
  FLastname := '';
  FMail := '';
end;

function TRedmineUser.IsValid: Boolean;
begin
  Result := (ID > 0) and not Login.IsEmpty;
end;

end.
