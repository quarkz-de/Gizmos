unit Qizmos.Redmine.Api;

interface

uses
  System.SysUtils, System.Classes, System.JSON, System.Generics.Collections,
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
    procedure Execute; overload;
    procedure Execute(const AParameters: TDictionary<string, string>); overload;
    property Client: TRESTClient read FClient;
    property Request: TRESTRequest read FRequest;
    property Response: TRESTResponse read FResponse;
  end;

  TRedmineApi = class
  private
    class function IsActive: Boolean;
    class function BuildApiUrl(const ARelativeURL: String): String;
    class function GetBaseUrl: String;
    class function LoadParentIssues(const AIssueList: TRedmineTicketList): String;
    class function LoadIssues(const AIssueList: TRedmineTicketList;
      const AProjects: TRedmineProjects; const AEndPoint: String): Boolean;
  public
    class function LoadUserData(const AUser: TRedmineUser): Boolean;
    class function GetMyPageUrl: String;
    class function GetMyIssues(const AIssueList: TRedmineTicketList;
      const AProjects: TRedmineProjects): Boolean;
    class function GetIssueUrl(const AIssueNumber: Integer): String;
  end;

implementation

uses
  Qizmos.Core.Settings;

type
  TRedmineApiSettings = class
  public
    class function HasApiKey: Boolean;
    class function GetApiKey: String;
    class function HasHost: Boolean;
    class function GetHost: String;
  end;

{ TRedmineApi }

class function TRedmineApi.BuildApiUrl(const ARelativeURL: String): String;
begin
  Result := String.Join('/', [GetBaseUrl, ARelativeURL]);
end;

class function TRedmineApi.GetBaseUrl: String;
begin
  Result := TRedmineApiSettings.GetHost;
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
  const AIssueList: TRedmineTicketList;
  const AProjects: TRedmineProjects): Boolean;
const
  SMyIssues = 'issues.json?assigned_to_id=me';
  SIssues = 'issues.json?issue_id=%s';
var
  IdList: String;
begin
  AIssueList.Clear;
  Result := false;
  if not IsActive then
    Exit;

  try
    Result := LoadIssues(AIssueList, AProjects, SMyIssues);
  except
    Result := false;
  end;

  if Result then
    begin
      IdList := LoadParentIssues(AIssueList);
      while not IdList.IsEmpty do
        begin
          LoadIssues(AIssueList, AProjects, Format(SIssues, [IdList]));
          IdList := LoadParentIssues(AIssueList);
        end;
    end;
end;

class function TRedmineApi.GetMyPageUrl: String;
const
  SMyPage = 'my/page';
begin
  Result := BuildApiUrl(SMyPage);
end;

class function TRedmineApi.IsActive: Boolean;
begin
  Result := TRedmineApiSettings.HasApiKey and TRedmineApiSettings.HasHost;
end;

class function TRedmineApi.LoadIssues(const AIssueList: TRedmineTicketList;
  const AProjects: TRedmineProjects; const AEndPoint: String): Boolean;
const
  SOffset = 'offset';
  SLimit = 'limit';
  ChunkSize = 25;
var
  Client: TRedmineRestClient;
  JsonValue, JsonIssue: TJSONValue;
  JsonArray: TJSONArray;
  ExistingTickets: TDictionary<Integer, TRedmineTicket>;
  Issue: TRedmineTicket;
  ParentID, IssueID: Integer;
  Parameters: TDictionary<string, string>;
  Offset, Limit, IssueCount: Integer;
  ValidChunk: Boolean;
  NameValue: String;
begin
  Parameters := TDictionary<string, string>.Create;
  Offset := 0;
  Limit := ChunkSize;

  ExistingTickets := TDictionary<Integer, TRedmineTicket>.Create;
  for Issue in AIssueList do
    ExistingTickets.Add(Issue.ID, Issue);

  Client := TRedmineRestClient.Create(BuildApiUrl(AEndPoint));
  try
    Parameters.AddOrSetValue(SOffset, IntToStr(Offset));
    Parameters.AddOrSetValue(SLimit, IntToStr(Limit));
    Client.Execute(Parameters);
    Result := Client.Response.Status.Success;
    ValidChunk := Result;
    while ValidChunk do
      begin
        JsonValue := Client.Response.JSONValue;
        if JSonValue.TryGetValue<TJSONArray>('issues', JsonArray) then
          begin
            IssueCount := 0;
            for JsonIssue in JsonArray do
              begin
                IssueID := JsonIssue.GetValue<Integer>('id');
                if not ExistingTickets.TryGetValue(IssueID, Issue) then
                  begin
                    Issue := TRedmineTicket.Create;
                    Issue.ID := IssueID;
                    AIssueList.Add(Issue);
                  end;
                Issue.Subject := JsonIssue.GetValue<String>('subject');
                if JsonIssue.TryGetValue<Integer>('parent.id', ParentID) then
                  Issue.ParentID := ParentID
                else
                  Issue.ParentID := 0;
                Issue.Created := JsonIssue.GetValue<TDateTime>('created_on');
                Issue.Updated := JsonIssue.GetValue<TDateTime>('updated_on');
                Issue.ProjectID := JsonIssue.GetValue<Integer>('project.id');
                if JsonIssue.TryGetValue<String>('tracker.name', NameValue) then
                  Issue.Tracker := NameValue;
                if JsonIssue.TryGetValue<String>('status.name', NameValue) then
                  Issue.Status := NameValue;
                if JsonIssue.TryGetValue<String>('assigned_to.name', NameValue) then
                  Issue.AssignedTo := NameValue;
                if JsonIssue.TryGetValue<String>('project.name', NameValue) then
                  AProjects.AddOrSetValue(Issue.ProjectID, NameValue);
                Inc(IssueCount);
              end;
            if IssueCount = ChunkSize then
              begin
                Offset := Offset + ChunkSize;
                Parameters.AddOrSetValue(SOffset, IntToStr(Offset));
                Client.Execute(Parameters);
              end
            else
              ValidChunk := false;
          end
        else
          ValidChunk := false;
      end;
  finally
    Client.Free;
    Parameters.Free;
    ExistingTickets.Free;
  end;
end;

class function TRedmineApi.LoadParentIssues(
  const AIssueList: TRedmineTicketList): String;
var
  IssueDict: TDictionary<Integer, TRedmineTicket>;
  AdditionalIssues: TList<TRedmineTicket>;
  Issue, ParentIssue: TRedmineTicket;
  IDs: TStringList;
begin
  AdditionalIssues := TList<TRedmineTicket>.Create;
  IssueDict := TDictionary<Integer, TRedmineTicket>.Create;

  for Issue in AIssueList do
    IssueDict.Add(Issue.ID, Issue);

  for Issue in AIssueList do
    begin
      if (Issue.ParentID > 0) then
        begin
          if IssueDict.TryGetValue(Issue.ParentID, ParentIssue) then
            Issue.Parent := ParentIssue
          else
            begin
              ParentIssue := TRedmineTicket.Create;
              ParentIssue.ID := Issue.ParentID;
              Issue.Parent := ParentIssue;
              AdditionalIssues.Add(ParentIssue);
              IssueDict.Add(ParentIssue.ID, ParentIssue);
              AIssueList.Add(ParentIssue);
            end;
        end;
    end;

  IDs := TStringList.Create;
  for Issue in AdditionalIssues do
    IDs.Add(Issue.ID.ToString);
  Result := IDs.CommaText;
  IDs.Free;

  AdditionalIssues.Free;
  IssueDict.Free;
end;

class function TRedmineApi.LoadUserData(const AUser: TRedmineUser): Boolean;
const
  SCurrentUser = 'users/current.json';
var
  Client: TRedmineRestClient;
  JsonValue: TJSONValue;
begin
  AUser.Clear;
  Result := false;
  if not IsActive then
    Exit;

  Client := TRedmineRestClient.Create(BuildApiUrl(SCurrentUser));
  try
    Client.Execute;
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

  FClient.SetHTTPHeader('X-Redmine-API-Key', TRedmineApiSettings.GetApiKey);
  FClient.AddParameter('key', TRedmineApiSettings.GetApiKey);
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

procedure TRedmineRestClient.Execute(
  const AParameters: TDictionary<string, string>);
var
  Param: TPair<string, string>;
begin
  for Param in AParameters do
    begin
      if Request.Params.ContainsParameter(Param.Key) then
        Request.Params.ParameterByName(Param.Key).Value := Param.Value
      else
        Request.AddParameter(Param.Key, Param.Value);
    end;
  Request.Execute;
end;

procedure TRedmineRestClient.Execute;
begin
  Request.Execute;
end;

{ TRedmineApiSettings }

class function TRedmineApiSettings.GetApiKey: String;
begin
  Result := ApplicationSettings.Redmine.ApiKey;
end;

class function TRedmineApiSettings.GetHost: String;
begin
  Result := ApplicationSettings.Redmine.Host;
end;

class function TRedmineApiSettings.HasApiKey: Boolean;
begin
  Result := not ApplicationSettings.Redmine.ApiKey.IsEmpty;
end;

class function TRedmineApiSettings.HasHost: Boolean;
begin
  Result := not ApplicationSettings.Redmine.Host.IsEmpty;
end;

end.
