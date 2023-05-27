unit Qizmos.SimulatorsSmtpForm;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  System.Generics.Collections,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.WinXCtrls, Vcl.StdCtrls, Vcl.VirtualImage, Vcl.ActnList,
  IdBaseComponent, IdCustomTCPServer,
  IdSMTPServer, IdMessage, IdContext,
  VirtualTrees,
  LoggerPro,
  Qodelib.ManagedForms,
  Qizmos.Forms, Qizmos.SimulatorsSmtpVisualizers, IdComponent, IdTCPServer,
  IdCmdTCPServer, IdExplicitTLSClientServerBase;

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
    vtMessages: TVirtualStringTree;
    pnMessages: TPanel;
    acClearMessages: TAction;
    btClear: TButton;
    btSaveMessage: TButton;
    dSave: TSaveDialog;
    acSaveMessage: TAction;
    acShowMessage: TAction;
    procedure acClearMessagesExecute(Sender: TObject);
    procedure acSaveMessageExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure acServerActivateExecute(Sender: TObject);
    procedure acShowMessageExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure smtpServerConnect(AContext: TIdContext);
    procedure smtpServerDisconnect(AContext: TIdContext);
    procedure smtpServerMailFrom(ASender: TIdSMTPServerContext;
      const AAddress: string; AParams: TStrings; var VAction: TIdMailFromReply);
    procedure smtpServerMsgReceive(ASender: TIdSMTPServerContext; AMsg: TStream;
      var VAction: TIdDataReply);
    procedure smtpServerRcptTo(ASender: TIdSMTPServerContext;
      const AAddress: string; AParams: TStrings; var VAction: TIdRCPToReply;
      var VForward: string);
    procedure smtpServerReceived(ASender: TIdSMTPServerContext;
      var AReceived: string);
    procedure smtpServerUserLogin(ASender: TIdSMTPServerContext;
      const AUsername, APassword: string; var VAuthenticated: Boolean);
    procedure vtMessagesDblClick(Sender: TObject);
    procedure vtMessagesFocusChanged(Sender: TBaseVirtualTree; Node: PVirtualNode;
        Column: TColumnIndex);
  private
    FLog: ILogWriter;
    FMessages: TObjectList<TIdMessage>;
    FMessagesVisualizer: IMessageListVisualizer;
    procedure AddLastMessageToList;
    procedure LoadSettings;
  protected
    function GetFormId: TQzManagedFormId; override;
    function GetImageIndex: Integer; override;
  public
    procedure ThemeChanged; override;
    property Log: ILogWriter read FLog;
  end;

var
  wSimulatorsSmtpForm: TwSimulatorsSmtpForm;

implementation

{$R *.dfm}

uses
  Spring.Container,
  LoggerPro.VCLListViewAppender,
  Qizmos.Types, Qizmos.DataModule, Qizmos.EMailViewer, Qizmos.Settings;

const
  tagServer = 'SERVER';
  tagConnection = 'CONNECT';
  tagMessage = 'MESSAGE';
  MaxLogLines = 500;
  LogLineFormat = '%0:s %3:s [%4:s]';

{ TwSimulatorsSmtpForm }

procedure TwSimulatorsSmtpForm.acClearMessagesExecute(Sender: TObject);
begin
  vtMessages.Clear;
  FMessages.Clear;
  acClearMessages.Enabled := false;
  acSaveMessage.Enabled := false;
end;

procedure TwSimulatorsSmtpForm.acSaveMessageExecute(Sender: TObject);
var
  Msg: TIdMessage;
begin
  Msg := FMessagesVisualizer.GetSelectedMessage;
  if Msg <> nil then
    begin
      if dSave.Execute then
        Msg.SaveToFile(dSave.FileName);
    end;
end;

procedure TwSimulatorsSmtpForm.acServerActivateExecute(Sender: TObject);
begin
  smtpServer.Active := not smtpServer.Active;
  tsActive.State := SwitchStates[smtpServer.Active];
  Log.Info('Serverstatus: %s', [ServerStates[smtpServer.Active]], tagServer);
end;

procedure TwSimulatorsSmtpForm.acShowMessageExecute(Sender: TObject);
var
  Msg: TIdMessage;
begin
  Msg := FMessagesVisualizer.GetSelectedMessage;
  if Msg <> nil then
    TwEMailViewer.Execute(Msg);
end;

procedure TwSimulatorsSmtpForm.AddLastMessageToList;
begin
  FMessagesVisualizer.AddMessage(FMessages.Count - 1);
  acClearMessages.Enabled := true;
end;

procedure TwSimulatorsSmtpForm.FormCreate(Sender: TObject);
begin
  FLog := BuildLogWriter([TVCLListViewAppender.Create(lvLog, MaxLogLines, LogLineFormat)]);
  FMessages := TObjectList<TIdMessage>.Create;
  pcSmtpBlackhole.ActivePage := tsMessages;
  Log.Info('Initialisierung', tagServer);

  FMessagesVisualizer := GlobalContainer.Resolve<IMessageListVisualizer>;
  FMessagesVisualizer.SetVirtualTree(vtMessages);
  FMessagesVisualizer.SetMessages(FMessages);

  acClearMessages.Enabled := false;
  acSaveMessage.Enabled := false;

  LoadSettings;
end;

procedure TwSimulatorsSmtpForm.FormDestroy(Sender: TObject);
begin
  smtpServer.Active := false;
  FMessages.Free;
end;

function TwSimulatorsSmtpForm.GetFormId: TQzManagedFormId;
begin
  Result := mfSimulatorsSmtp;
end;

function TwSimulatorsSmtpForm.GetImageIndex: Integer;
begin
  Result := iiSimulatorsSmtp;
end;

procedure TwSimulatorsSmtpForm.LoadSettings;
begin
  if ApplicationSettings.SmtpServer.ActiveOnStartup then
    tsActive.State := tssOn;
end;

procedure TwSimulatorsSmtpForm.smtpServerConnect(AContext: TIdContext);
begin
  Log.Info(Format('Connected (Port %d)', [AContext.Binding.Port]), tagServer);
end;

procedure TwSimulatorsSmtpForm.smtpServerDisconnect(AContext: TIdContext);
begin
  Log.Info('Disconnected', tagServer);
end;

procedure TwSimulatorsSmtpForm.smtpServerMailFrom(
  ASender: TIdSMTPServerContext; const AAddress: string; AParams: TStrings;
  var VAction: TIdMailFromReply);
begin
  Log.Info('Sender: %s', [AAddress], tagMessage);
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
  TThread.Synchronize(nil, AddLastMessageToList);
  VAction := dOk;
end;

procedure TwSimulatorsSmtpForm.smtpServerRcptTo(ASender: TIdSMTPServerContext;
  const AAddress: string; AParams: TStrings; var VAction: TIdRCPToReply;
  var VForward: string);
begin
  Log.Info('Recipient: %s', [AAddress], tagMessage);
  VAction := rAddressOk;
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
  Log.Info('Username: %s; Password: %s', [AUsername, APassword], tagServer);
  VAuthenticated := true;
end;

procedure TwSimulatorsSmtpForm.ThemeChanged;
begin
  inherited;
  imIcon.ImageCollection := dmCommon.GetImageCollection;
end;

procedure TwSimulatorsSmtpForm.vtMessagesDblClick(Sender: TObject);
begin
  acShowMessage.Execute;
end;

procedure TwSimulatorsSmtpForm.vtMessagesFocusChanged(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex);
begin
  acSaveMessage.Enabled := FMessagesVisualizer.IsSelected;
end;

end.
