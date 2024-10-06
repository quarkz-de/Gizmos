unit Qizmos.Redmine.Api;

interface

uses
  System.SysUtils, System.JSON,
  REST.Client;

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

  TRedmineRestClient = class
  private
    FClient: TRESTClient;
    FRequest: TRESTRequest;
    FResponse: TRESTResponse;
  public
    constructor Create(const AApiUrl: String);
    destructor Destroy; override;
    property Client: TRESTClient read FClient;
    property Request: TRESTRequest read FRequest;
    property Response: TRESTResponse read FResponse;
  end;

  TRedmineApi = class
  private
    class function BuildApiUrl(const ARelativeURL: String): String;
    class function GetBaseUrl: String;
  public
    class function LoadUserData(const AUser: TRedmineUser): Boolean;
    class function GetMyPageUrl: String;
  end;

implementation

uses
  Qizmos.Core.Settings;

{ TRedmineApi }

class function TRedmineApi.BuildApiUrl(const ARelativeURL: String): String;
begin
  Result := String.Join('/', [GetBaseUrl, ARelativeURL]);
end;

class function TRedmineApi.GetBaseUrl: String;
begin
  Result := ApplicationSettings.Redmine.Host;
  if Result.EndsWith('/') then
    Delete(Result, Length(Result), 1);
end;

class function TRedmineApi.GetMyPageUrl: String;
const
  SMyPage = 'my/page';
begin
  Result := BuildApiUrl(SMyPage);
end;

class function TRedmineApi.LoadUserData(const AUser: TRedmineUser): Boolean;
const
  SCurrentUser = 'users/current.json';
var
  Client: TRedmineRestClient;
  JsonValue: TJSONValue;
begin
  AUser.Clear;
  Client := TRedmineRestClient.Create(BuildApiUrl(SCurrentUser));
  try
    Client.Request.Execute;
    Result := Client.Response.Status.Success;
    if Result then
      begin
        JsonValue := Client.Response.JSONValue;
        AUser.ID := JSONValue.GetValue<Integer>('user.id');
        AUser.Login := JSONValue.GetValue<String>('user.login');
        AUser.Firstname := JSONValue.GetValue<String>('user.firstname');
        AUser.Lastname := JSONValue.GetValue<String>('user.lastname');
        AUser.Mail := JSONValue.GetValue<String>('user.mail');
      end;
  finally
    Client.Free;
  end;
end;

{ TRedmineRestClient }

constructor TRedmineRestClient.Create(const AApiUrl: String);
begin
  FClient := TRESTClient.Create(AApiUrl);
  FRequest := TRESTRequest.Create(nil);
  FResponse := TRESTResponse.Create(nil);

  FClient.SetHTTPHeader('X-Redmine-API-Key', ApplicationSettings.Redmine.ApiKey);
  FClient.AddParameter('key', ApplicationSettings.Redmine.ApiKey);
  FClient.ContentType := 'application/json';
  FRequest.Client := FClient;
  FRequest.Response := FResponse;
end;

destructor TRedmineRestClient.Destroy;
begin
  FRequest.Free;
  FResponse.Free;
  FClient.Free;
  inherited;
end;

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
