unit Qizmos.Redmine.Api;

interface

uses
  System.SysUtils, System.JSON,
  REST.Client,
  Qizmos.Redmine.Classes;

type
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
    class function GetMyIssues(const AIssueList: TRedmineTicketList): Boolean;
    class function GetIssueUrl(const AIssueNumber: Integer): String;
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

class function TRedmineApi.GetIssueUrl(const AIssueNumber: Integer): String;
const
  SIssue = 'issues/%d';
begin
  Result := BuildApiUrl(Format(SIssue, [AIssueNumber]));
end;

class function TRedmineApi.GetMyIssues(
  const AIssueList: TRedmineTicketList): Boolean;
const
  SMyIssues = 'issues.json?assigned_to_id=me';
var
  Client: TRedmineRestClient;
  JsonValue, JsonIssue: TJSONValue;
  JsonArray: TJSONArray;
  Issue: TRedmineTicket;
  ParentID: Integer;
begin
(*
{
	"issues": [
		{
			"id": 2,
			"project": {
				"id": 1,
				"name": "Qizmos"
			},
			"tracker": {
				"id": 1,
				"name": "Fehler"
			},
			"status": {
				"id": 1,
				"name": "Neu",
				"is_closed": false
			},
			"priority": {
				"id": 2,
				"name": "Normal"
			},
			"author": {
				"id": 5,
				"name": "Reiner Lämmle"
			},
			"assigned_to": {
				"id": 5,
				"name": "Reiner Lämmle"
			},
			"parent": {
				"id": 1
			},
			"subject": "Unterticket zu #1",
			"description": "",
			"start_date": "2024-10-26",
			"due_date": null,
			"done_ratio": 0,
			"is_private": false,
			"estimated_hours": null,
			"total_estimated_hours": null,
			"spent_hours": 0.0,
			"total_spent_hours": 0.0,
			"created_on": "2024-10-26T09:26:04Z",
			"updated_on": "2024-10-26T09:26:43Z",
			"closed_on": null
		},
		{
			"id": 1,
			"project": {
				"id": 1,
				"name": "Qizmos"
			},
			"tracker": {
				"id": 2,
				"name": "Feature"
			},
			"status": {
				"id": 1,
				"name": "Neu",
				"is_closed": false
			},
			"priority": {
				"id": 2,
				"name": "Normal"
			},
			"author": {
				"id": 5,
				"name": "Reiner Lämmle"
			},
			"assigned_to": {
				"id": 5,
				"name": "Reiner Lämmle"
			},
			"subject": "Redmine-Client in Qizmos einbauen",
			"description": "",
			"start_date": "2024-10-26",
			"due_date": null,
			"done_ratio": 0,
			"is_private": false,
			"estimated_hours": null,
			"total_estimated_hours": 0.0,
			"spent_hours": 0.0,
			"total_spent_hours": 0.0,
			"created_on": "2024-10-04T08:18:14Z",
			"updated_on": "2024-10-26T09:26:04Z",
			"closed_on": null
		}
	],
	"total_count": 2,
	"offset": 0,
	"limit": 25
}
*)
  AIssueList.Clear;

// todo: while total_count = limit do inc(offset)

  Client := TRedmineRestClient.Create(BuildApiUrl(SMyIssues));
  try
    Client.Request.Execute;
    Result := Client.Response.Status.Success;
    if Result then
      begin
        JsonValue := Client.Response.JSONValue;
        JsonArray := JSonValue.GetValue<TJSONArray>('issues');
        for JsonIssue in JsonArray do
          begin
            Issue := TRedmineTicket.Create;
            Issue.ID := JsonIssue.GetValue<Integer>('id');
            Issue.Subject := JsonIssue.GetValue<String>('subject');
            if JsonIssue.TryGetValue<Integer>('parent.id', ParentID) then
              Issue.ParentID := ParentID
            else
              Issue.ParentID := 0;
            Issue.Created := JsonIssue.GetValue<TDateTime>('created_on');
            Issue.Updated := JsonIssue.GetValue<TDateTime>('updated_on');
            AIssueList.Add(Issue);
          end;
      end;
  finally
    Client.Free;
  end;
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
        AUser.ID := JsonValue.GetValue<Integer>('user.id');
        AUser.Login := JsonValue.GetValue<String>('user.login');
        AUser.Firstname := JsonValue.GetValue<String>('user.firstname');
        AUser.Lastname := JsonValue.GetValue<String>('user.lastname');
        AUser.Mail := JsonValue.GetValue<String>('user.mail');
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

end.
