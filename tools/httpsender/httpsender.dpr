program httpsender;

{$apptype console}

uses
  System.Classes,
  System.SysUtils,
  System.Net.HttpClient,
  System.Net.HttpClientComponent,
  IdHttp;

const
  TestUrl = 'http://localhost:48080/httptest';

procedure SendDemoRequestIndy;
var
  HTTP: TIdHTTP;
  Params, Response: TStringList;
  Line: String;
begin
  WriteLn('Testing TIdHTTP...');
  HTTP := TIdHTTP.Create;
  try
    Params := TStringList.Create;
    Response := TStringList.Create;
    try
      Params.Add('param1=one');
      Params.Add('param2=two');
	  Response.Text := HTTP.Post(TestUrl, Params);
	  for Line in Response do
	    WriteLn(Line);
    finally
      Params.Free;
      Response.Free;
    end;
  finally
    HTTP.Free;
  end;
end;

procedure SendDemoRequestNetHttp;
var
  HTTP: TNetHTTPClient;
  Params, Response: TStringList;
  Line: String;
  HTTPResponse: IHTTPResponse;
begin
  WriteLn('Testing TNetHTTPClient...');
  HTTP := TNetHTTPClient.Create(nil);
  try
    Params := TStringList.Create;
	Response := TStringList.Create;
    try
      Params.Add('param1=one');
      Params.Add('param2=two');
	  HTTPResponse := HTTP.Post(TestUrl, Params);
	  WriteLn('StatusCode = ' + IntToStr(HTTPResponse.StatusCode));
	  WriteLn('StatusText = ' + HTTPResponse.StatusText);
      Response.Text := HTTPResponse.ContentAsString;
	  for Line in Response do
	    WriteLn(Line);
    finally
      Params.Free;
	  Response.Free;
    end;
  finally
    HTTP.Free;
  end;
end;

procedure SendDemoRequest;
begin
  SendDemoRequestIndy;
  SendDemoRequestNetHttp;
end;

begin
  SendDemoRequest;
end.