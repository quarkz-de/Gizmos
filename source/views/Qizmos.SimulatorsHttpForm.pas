unit Qizmos.SimulatorsHttpForm;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXCtrls,
  Vcl.VirtualImage, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ActnList, Vcl.ComCtrls,
  VirtualTrees,
  EventBus,
  LoggerPro,
  IdCustomTCPServer, IdCustomHTTPServer,
  IdHTTPServer, IdContext,
  Qodelib.ManagedForms,
  Qizmos.Forms, Qizmos.SimulatorsHttpVisualizers, Qizmos.Events,
  IdBaseComponent, IdComponent;

type
  TwSimulatorsHttpForm = class(TManagedForm)
    pnHeader: TPanel;
    txCaption: TLabel;
    imIcon: TVirtualImage;
    tsActive: TToggleSwitch;
    pcSmtpBlackhole: TPageControl;
    tsMessages: TTabSheet;
    vtMessages: TVirtualStringTree;
    pnMessages: TPanel;
    btClear: TButton;
    tsLog: TTabSheet;
    lvLog: TListView;
    alActions: TActionList;
    acServerActivate: TAction;
    acClearMessages: TAction;
    httpServer: TIdHTTPServer;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acServerActivateExecute(Sender: TObject);
    procedure httpServerCommandGet(AContext: TIdContext; ARequestInfo:
        TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    procedure httpServerConnect(AContext: TIdContext);
    procedure httpServerDisconnect(AContext: TIdContext);
  private
    FLog: ILogWriter;
    FMessagesVisualizer: IHttpMessageListVisualizer;
    procedure LoadSettings;
    procedure SetServerPort;
  protected
    function GetFormId: TQzManagedFormId; override;
    function GetImageIndex: Integer; override;
  public
    procedure ThemeChanged; override;
    property Log: ILogWriter read FLog;
    [Subscribe]
    procedure OnSettingChange(AEvent: ISettingChangeEvent);
  end;

var
  wSimulatorsHttpForm: TwSimulatorsHttpForm;

implementation

{$R *.dfm}

uses
  Spring.Container,
  LoggerPro.VCLListViewAppender,
  Qizmos.Types, Qizmos.DataModule, Qizmos.Settings;

const
  tagServer = 'SERVER';
  tagConnection = 'CONNECT';
  tagMessage = 'MESSAGE';
  MaxLogLines = 500;
  LogLineFormat = '%0:s %3:s [%4:s]';

procedure TwSimulatorsHttpForm.acServerActivateExecute(Sender: TObject);
begin
  httpServer.Active := not httpServer.Active;
  tsActive.State := SwitchStates[httpServer.Active];
  Log.Info('Serverstatus: %s', [ServerStates[httpServer.Active]], tagServer);
end;

procedure TwSimulatorsHttpForm.httpServerCommandGet(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
begin
  Log.Info('Command %s', [HTTPRequestStrings[Ord(ARequestInfo.CommandType)]], tagMessage);
  Log.Info('Params %s', [ARequestInfo.Params.CommaText], tagMessage);

  TThread.Synchronize(nil,
    procedure
    begin
      FMessagesVisualizer.AddMessage(ARequestInfo.Command, ARequestInfo.URI, ARequestInfo.Params);
    end);

  AResponseInfo.ResponseNo := ApplicationSettings.HttpServer.ResultCode;
  AResponseInfo.ResponseText := IntToStr(ApplicationSettings.HttpServer.ResultCode);
  AResponseInfo.ContentText := ApplicationSettings.HttpServer.ResultText;
end;

procedure TwSimulatorsHttpForm.FormCreate(Sender: TObject);
begin
  FLog := BuildLogWriter([TVCLListViewAppender.Create(lvLog, MaxLogLines, LogLineFormat)]);
  FMessagesVisualizer := GlobalContainer.Resolve<IHttpMessageListVisualizer>;
  FMessagesVisualizer.SetVirtualTree(vtMessages);
  LoadSettings;
end;

procedure TwSimulatorsHttpForm.FormDestroy(Sender: TObject);
begin
  httpServer.Active := false;
end;

function TwSimulatorsHttpForm.GetFormId: TQzManagedFormId;
begin
  Result := mfSimulatorsHttp;
end;

function TwSimulatorsHttpForm.GetImageIndex: Integer;
begin
  Result := iiSimulatorsHttp;
end;

procedure TwSimulatorsHttpForm.httpServerConnect(AContext: TIdContext);
begin
  Log.Info(Format('Connected (Port %d)', [AContext.Binding.Port]), tagServer);
end;

procedure TwSimulatorsHttpForm.httpServerDisconnect(AContext: TIdContext);
begin
  Log.Info('Disconnected', tagServer);
end;

procedure TwSimulatorsHttpForm.LoadSettings;
begin
  SetServerPort;
  if ApplicationSettings.HttpServer.ActiveOnStartup then
    tsActive.State := tssOn;
end;

procedure TwSimulatorsHttpForm.OnSettingChange(AEvent: ISettingChangeEvent);
begin
  if AEvent.Value = svHttpPort then
    SetServerPort;
end;

procedure TwSimulatorsHttpForm.SetServerPort;
var
  WasActive: Boolean;
begin
  WasActive := httpServer.Active;
  httpServer.Active := false;

  httpServer.Bindings[0].Port := ApplicationSettings.HttpServer.Port;
  Log.Info('Server Port: %d', [ApplicationSettings.HttpServer.Port], tagServer);

  if WasActive then
    httpServer.Active := true;
end;

procedure TwSimulatorsHttpForm.ThemeChanged;
begin
  inherited;
  imIcon.ImageCollection := dmCommon.GetImageCollection;
end;

end.
