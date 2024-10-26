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
    FCreated: TDateTime;
    FUpdated: TDateTime;
  public
    property ID: Integer read FID write FID;
    property Subject: String read FSubject write FSubject;
    property ParentID: Integer read FParentID write FParentID;
    property Created: TDateTime read FCreated write FCreated;
    property Updated: TDateTime read FUpdated write FUpdated;
  end;

  TRedmineTicketList = TObjectList<TRedmineTicket>;

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
