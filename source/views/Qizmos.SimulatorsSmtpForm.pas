unit Qizmos.SimulatorsSmtpForm;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  System.Generics.Collections,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.WinXCtrls, Vcl.StdCtrls, Vcl.VirtualImage, Vcl.ActnList,
  IdBaseComponent, IdComponent, IdCustomTCPServer, IdTCPServer,
  IdCmdTCPServer, IdExplicitTLSClientServerBase, IdSMTPServer, IdMessage,
  LoggerPro,
  Qizmos.Forms, IdContext;

type
  TwSimulatorsSmtpForm = class(TManagedForm)
    smtpServer: TIdSMTPServer;
    pcSmtpBlackhole: TPageControl;
    tsMessages: TTabSheet;
    tsLog: TTabSheet;
    pnHeader: TPanel;
    tsActive: TToggleSwitch;
    txCaption: TLabel;
    imIcon: TVirtualImage;
    lvLog: TListView;
    alActions: TActionList;
    acServerActivate: TAction;
    procedure FormDestroy(Sender: TObject);
    procedure acServerActivateExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure smtpServerConnect(AContext: TIdContext);
    procedure smtpServerDisconnect(AContext: TIdContext);
    procedure smtpServerMailFrom(ASender: TIdSMTPServerContext; const AAddress:
        string; AParams: TStrings; var VAction: TIdMailFromReply);
    procedure smtpServerMsgReceive(ASender: TIdSMTPServerContext; AMsg: TStream;
        var VAction: TIdDataReply);
    procedure smtpServerRcptTo(ASender: TIdSMTPServerContext; const AAddress:
        string; AParams: TStrings; var VAction: TIdRCPToReply; var VForward:
        string);
    procedure smtpServerReceived(ASender: TIdSMTPServerContext; var AReceived:
        string);
    procedure smtpServerUserLogin(ASender: TIdSMTPServerContext; const AUsername,
        APassword: string; var VAuthenticated: Boolean);
  private
    FLog: ILogWriter;
    FMessages: TObjectList<TIdMessage>;
  public
    property Log: ILogWriter read FLog;
  end;

var
  wSimulatorsSmtpForm: TwSimulatorsSmtpForm;

implementation

{$R *.dfm}

uses
  LoggerPro.VCLListViewAppender;

const
  tagServer = 'SERVER';
  tagConnection = 'CONNECT';
  tagMessage = 'MESSAGE';
  MaxLogLines = 500;
  LogLineFormat = '%0:s %3:s [%4:s]';

{ TwSimulatorsSmtpForm }

procedure TwSimulatorsSmtpForm.acServerActivateExecute(Sender: TObject);
const
  SwitchStates: array[Boolean] of TToggleSwitchState = (tssOff, tssOn);
  ServerStates: array[Boolean] of String = ('inaktiv', 'aktiv');
begin
  smtpServer.Active := not smtpServer.Active;
  tsActive.State := SwitchStates[smtpServer.Active];
  Log.InfoFmt('Serverstatus: %s', [ServerStates[smtpServer.Active]], tagServer);
end;

procedure TwSimulatorsSmtpForm.FormCreate(Sender: TObject);
begin
  FLog := BuildLogWriter([TVCLListViewAppender.Create(lvLog, MaxLogLines, LogLineFormat)]);
  FMessages := TObjectList<TIdMessage>.Create;
  pcSmtpBlackhole.ActivePage := tsMessages;
  Log.Info('Initialisierung', tagServer);
end;

procedure TwSimulatorsSmtpForm.FormDestroy(Sender: TObject);
begin
  FMessages.Free;
end;

procedure TwSimulatorsSmtpForm.smtpServerConnect(AContext: TIdContext);
begin
  Log.Info('Connected', tagServer);
end;

procedure TwSimulatorsSmtpForm.smtpServerDisconnect(AContext: TIdContext);
begin
  Log.Info('Disconnected', tagServer);
end;

procedure TwSimulatorsSmtpForm.smtpServerMailFrom(
  ASender: TIdSMTPServerContext; const AAddress: string; AParams: TStrings;
  var VAction: TIdMailFromReply);
begin
  Log.InfoFmt('Sender: %s', [AAddress], tagMessage);
  VAction := mAccept;
end;

procedure TwSimulatorsSmtpForm.smtpServerMsgReceive(
  ASender: TIdSMTPServerContext; AMsg: TStream; var VAction: TIdDataReply);
var
  Msg: TIdMessage;
begin
  Msg := TIdMessage.Create;
  Msg.LoadFromStream(AMsg);
  FMessages.Add(Msg);

  VAction := dOk;
end;

procedure TwSimulatorsSmtpForm.smtpServerRcptTo(ASender: TIdSMTPServerContext;
  const AAddress: string; AParams: TStrings; var VAction: TIdRCPToReply;
  var VForward: string);
begin
  Log.InfoFmt('Recipient: %s', [AAddress], tagMessage);
end;

procedure TwSimulatorsSmtpForm.smtpServerReceived(
  ASender: TIdSMTPServerContext; var AReceived: string);
begin
  Log.Info('Message received', tagMessage);
end;

procedure TwSimulatorsSmtpForm.smtpServerUserLogin(
  ASender: TIdSMTPServerContext; const AUsername, APassword: string;
  var VAuthenticated: Boolean);
begin
  Log.InfoFmt('Username: %s; Password: %s', [AUsername, APassword], tagServer);
  VAuthenticated := true;
end;

end.
