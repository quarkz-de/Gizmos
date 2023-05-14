unit Qizmos.SettingsFormHelpers;

interface

uses
  Vcl.Forms, Vcl.Graphics;

type
  TSettingsFormPanelHelper = class
  public
    class procedure UpdatePanelFonts(const AContainer: TCustomForm);
  end;

implementation

uses
  QodeLib.Panels;

{ TSettingsFormPanelHelper }

class procedure TSettingsFormPanelHelper.UpdatePanelFonts(
  const AContainer: TCustomForm);
const
  DefaultHeight1 = 32;
var
  I: Integer;
  Panel: TQzPanel;
begin
  for I := 0 to AContainer.ControlCount - 1 do
    if AContainer.Controls[I] is TQzPanel then
      begin
        Panel := TQzPanel(AContainer.Controls[I]);
        Panel.Height := DefaultHeight1 + Panel.Font.Size;

        if Panel.Color <> clBtnFace then
          begin
            Panel.Font := AContainer.Font;
            Panel.Font.Size := Panel.Font.Size + 2;
          end;
      end;
end;

end.
