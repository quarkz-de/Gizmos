unit Qizmos.Core.Shell;

interface

type
  TShellExecute = class
  public
    class function Open(const AItem: String): Boolean;
    class function IsUrl(const AValue: String): Boolean;
  end;

implementation

uses
  Winapi.Windows,
  Winapi.ShellApi,
  Vcl.Forms,
  System.RegularExpressions;

{ TShellExecute }

class function TShellExecute.IsUrl(const AValue: String): Boolean;
begin
  Result := TRegEx.IsMatch(AValue, '^(ht|f)tp(s?)\:\/\/[0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*(:(0-9)*)*(\/?)([a-zA-Z0-9\-\.\?\,\''\/\\\+&%\$#_]*)?$');
end;

class function TShellExecute.Open(const AItem: String): Boolean;
begin
  Result := ShellExecute(Application.Handle, 'open', PChar(AItem), nil, nil, SW_SHOWNORMAL) > 32;
end;

end.
