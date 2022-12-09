unit Blackholes.Main;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.ImageList,
  System.Actions,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ImgList,
  Vcl.VirtualImageList, Vcl.Buttons, Vcl.StdCtrls, Vcl.VirtualImage,
  Vcl.ExtCtrls, Vcl.WinXCtrls, Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnMan, Vcl.ToolWin, Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.TitleBarCtrls,
  Vcl.ActnList, Vcl.StdActns,
  Eventbus,
  Blackholes.Events, Blackholes.Forms, Qodelib.NavigationView;

type
  TwMainForm = class(TForm)
    vilLargeIcons: TVirtualImageList;
    amActions: TActionManager;
    acFileExit: TFileExit;
    acHelpAbout: TAction;
    acSectionWelcome: TAction;
    acSectionSettings: TAction;
    vilIcons: TVirtualImageList;
    svSplitView: TSplitView;
    pnl1: TPanel;
    imBurgerButton: TVirtualImage;
    nvNavigation: TQzNavigationView;
    nvFooter: TQzNavigationView;
    procedure FormCreate(Sender: TObject);
    procedure imBurgerButtonClick(Sender: TObject);
    procedure acSectionWelcomeExecute(Sender: TObject);
    procedure acSectionSettingsExecute(Sender: TObject);
    procedure acHelpAboutExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure nvFooterButtonClicked(Sender: TObject; Index: Integer);
    procedure nvNavigationButtonClicked(Sender: TObject; Index: Integer);
    procedure svSplitViewClosed(Sender: TObject);
    procedure svSplitViewOpened(Sender: TObject);
  private
    FForms: TApplicationFormList;
    procedure InitSettings;
  protected
    property Forms: TApplicationFormList read FForms;
  public
    [Subscribe]
    procedure OnThemeChange(AEvent: IThemeChangeEvent);
  end;

var
  wMainForm: TwMainForm;

implementation

{$R *.dfm}

uses
  Blackholes.DataModule, Blackholes.Settings, Blackholes.About;

{ TwMain }

procedure TwMainForm.acHelpAboutExecute(Sender: TObject);
begin
  TwAbout.ExecuteDialog;
end;

procedure TwMainForm.acSectionSettingsExecute(Sender: TObject);
begin
  FForms.ShowForm(qftSettings);
end;

procedure TwMainForm.acSectionWelcomeExecute(Sender: TObject);
begin
  FForms.ShowForm(qftWelcome);
end;

procedure TwMainForm.FormCreate(Sender: TObject);
begin
  FForms := TApplicationFormList.Create(self);
  acSectionWelcome.Execute;
  GlobalEventBus.RegisterSubscriberForEvents(Self);
  dmCommon.MainFormCreated;
  InitSettings;
end;

procedure TwMainForm.FormDestroy(Sender: TObject);
begin
  ApplicationSettings.FormPosition.SavePosition(self);
  FForms.Free;
end;

procedure TwMainForm.imBurgerButtonClick(Sender: TObject);
begin
  svSplitView.Opened := not svSplitView.Opened;
end;

procedure TwMainForm.InitSettings;
begin
  ApplicationSettings.FormPosition.LoadPosition(self);
  svSplitView.Opened := ApplicationSettings.DrawerOpened;
end;

procedure TwMainForm.nvFooterButtonClicked(Sender: TObject; Index: Integer);
begin
  nvNavigation.ItemIndex := -1;
end;

procedure TwMainForm.nvNavigationButtonClicked(Sender: TObject; Index: Integer);
begin
  nvFooter.ItemIndex := -1;
end;

procedure TwMainForm.OnThemeChange(AEvent: IThemeChangeEvent);
begin
  CustomTitleBar.SystemColors := AEvent.ThemeName = 'Windows';
  imBurgerButton.ImageCollection := dmCommon.GetImageCollection;
  vilIcons.ImageCollection := dmCommon.GetImageCollection;
  vilLargeIcons.ImageCollection := dmCommon.GetImageCollection;
end;

procedure TwMainForm.svSplitViewClosed(Sender: TObject);
begin
  ApplicationSettings.DrawerOpened := false;
  nvNavigation.ButtonOptions := nvNavigation.ButtonOptions - [nboShowCaptions];
  nvFooter.ButtonOptions := nvFooter.ButtonOptions - [nboShowCaptions];
end;

procedure TwMainForm.svSplitViewOpened(Sender: TObject);
begin
  ApplicationSettings.DrawerOpened := true;
  nvNavigation.ButtonOptions := nvNavigation.ButtonOptions + [nboShowCaptions];
  nvFooter.ButtonOptions := nvFooter.ButtonOptions + [nboShowCaptions];
end;

end.
