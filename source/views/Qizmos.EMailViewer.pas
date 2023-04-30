unit Qizmos.EMailViewer;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls,
  IdMessage, IdMessageParts, IdText, IdAttachment,
  Qodelib.Panels,
  Qizmos.Forms;

type
  TwEMailViewer = class(TDialogForm)
    pnHeader: TQzPanel;
    txSender: TLabel;
    txRecipient: TLabel;
    edSender: TEdit;
    edRecipient: TEdit;
    txSubject: TLabel;
    edSubject: TEdit;
    pcMail: TPageControl;
    tsBody: TTabSheet;
    tsHeader: TTabSheet;
    edBody: TMemo;
    edHeader: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  public
    procedure LoadMessage(AMessage: TIdMessage);
    class function Execute(AMessage: TIdMessage): TwEMailViewer;
  end;

var
  wEMailViewer: TwEMailViewer;

implementation

{$R *.dfm}

procedure TwEMailViewer.FormCreate(Sender: TObject);
begin
  pcMail.ActivePage := tsBody;
end;

procedure TwEMailViewer.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.WndParent := 0;
end;

class function TwEMailViewer.Execute(AMessage: TIdMessage): TwEMailViewer;
begin
  Result := TwEMailViewer.Create(Application);
  Result.LoadMessage(AMessage);
  Result.Show;
end;

procedure TwEMailViewer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TwEMailViewer.LoadMessage(AMessage: TIdMessage);
begin
  edSender.Text := AMessage.Sender.Address;
  if edSender.Text = '' then
    edSender.Text := AMessage.From.Address;
  edRecipient.Text := AMessage.Recipients.EMailAddresses;
  edSubject.Text := AMessage.Subject;
  edBody.Lines.Assign(AMessage.Body);
  edHeader.Lines.Assign(AMessage.Headers);
(*
  for var I := 0 to AMessage.MessageParts.Count - 1 do
    begin
      case AMessage.MessageParts[I].PartType of
        mptText:
          begin
            //TIdText(AMessage.MessageParts[I]).Body
          end;
        mptAttachment:
          begin

          end;
      end;
    end;
*)
end;

end.
