unit Qizmos.Simulators.EMailViewer;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls,
  IdMessage, IdMessageParts,
  Qodelib.Panels,
  Qizmos.Core.Forms, HTMLUn2, HtmlView;

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
    tsHtml: TTabSheet;
    hvBody: THtmlViewer;
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

uses
  IdText, IdAttachment;

procedure TwEMailViewer.FormCreate(Sender: TObject);
begin
  pcMail.ActivePage := tsBody;
  hvBody.DefFontName := Font.Name;
  hvBody.DefFontSize := Font.Size;
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
const
  cTextPlain = 'text/plain';
  cTextHtml = 'text/html';
var
  IdText: TIdText;
  IdAttachment: TIdAttachment;
  HtmlPart: Boolean;
begin
  edSender.Text := AMessage.Sender.Address;
  if edSender.Text = '' then
    edSender.Text := AMessage.From.Address;
  edRecipient.Text := AMessage.Recipients.EMailAddresses;
  edSubject.Text := AMessage.Subject;
  edBody.Lines.Assign(AMessage.Body);
  edHeader.Lines.Assign(AMessage.Headers);

  HtmlPart := false;

  for var I := 0 to AMessage.MessageParts.Count - 1 do
    begin
      case AMessage.MessageParts[I].PartType of
        mptText:
          begin
            IdText := TIdText(AMessage.MessageParts[I]);
            edBody.Lines.Assign(IdText.Body);
            if IdText.ContentType = cTextHtml then
              begin
                HtmlPart := true;
                hvBody.LoadFromString(IdText.Body.Text);
              end
            else if IdText.ContentType = cTextPlain then
              begin
                edBody.Lines.Assign(IdText.Body);
              end;
          end;
        mptAttachment:
          begin
            IdAttachment := TIdAttachment(AMessage.MessageParts[I]);
            // IdAttachment.Name
            // IdAttachment.Filename
          end;
      end;
    end;

  tsHtml.TabVisible := HtmlPart;
  tsBody.TabVisible := not HtmlPart;
end;

end.
