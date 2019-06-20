unit p_main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  Tfrm_ConvertColor = class(TForm)
    pnl_total: TPanel;
    lbl_title: TLabel;
    btn_convert: TBitBtn;
    edt_HTML: TEdit;
    edt_dephiHEX: TEdit;
    edt_delphiInt: TEdit;
    shp_colorPicker: TShape;
    dlgColor_picker: TColorDialog;
    edt_delphiNorm: TEdit;
    rb_Html: TRadioButton;
    rb_delphiInt: TRadioButton;
    rb_delphiHex: TRadioButton;
    rb_delphiNorm: TRadioButton;
    procedure btn_convertClick(Sender: TObject);
    procedure shp_colorPickerMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    function IntColorToHtmlColor(c: Integer): string;
    function HexColorToHtmlColor(s: string): string;
    function HtmlColorToHexColor(s: string): string;
    function TColorToHex(c: TColor): string;
    procedure Convert;
  public
    { Public declarations }
  end;

var
  frm_ConvertColor: Tfrm_ConvertColor;
  cPicked, cTemp : TColor;
  cHtml, cInt, cHex, cNorm: string;

implementation

{$R *.dfm}
{由 Delphi 的颜色常数转换到 Html 颜色}
function Tfrm_ConvertColor.IntColorToHtmlColor(c: Integer): string;
var
  R,G,B: Byte;
begin
  R := c and $FF;
  G := (c shr 8) and $FF;
  B := (c shr 16) and $FF;
  Result := #35 + Format('%.2x%.2x%.2x',[R,G,B]);
end;

{HexString to HtmlColor}
function Tfrm_ConvertColor.HexColorToHtmlColor(s: string): string;
var
  i: Integer;
  R,G,B: Byte;
begin
  i := StrToInt(s);
  R := i and $FF;
  G := (i shr 8) and $FF;
  B := (i shr 16) and $FF;
  Result := #35 + Format('%.2x%.2x%.2x',[R,G,B]);
end;

{从HtmlColor to HexColor}
function Tfrm_ConvertColor.HtmlColorToHexColor(s: string): string;
var
  R, G, B: string;
begin
  s := Copy(s,2,6);
  R := Copy(s,1,2);
  G := Copy(s,3,2);
  B := Copy(s,5,2);
  Result := '$' + B + G + R;
end;

{DelphiColor 转换 为 十六进制字符串的颜色}
function Tfrm_ConvertColor.TColorToHex(c: TColor): string;
begin
  Result:= '$' + IntToHex(c,6);
end;

procedure Tfrm_ConvertColor.Convert;
begin
  edt_HTML.Text := cHtml;
  edt_delphiInt.Text :=  cInt;
  edt_dephiHEX.Text := cHex;
  edt_delphiNorm.Text := cNorm;
end;

procedure Tfrm_ConvertColor.btn_convertClick(Sender: TObject);
begin
  try
    if rb_Html.Checked then
    begin
      cHtml := Trim(edt_HTML.Text);
      cHex := HtmlColorToHexColor(cHtml);
      cInt := IntToStr(ColorToRGB(StringToColor(cHex)));
      cNorm := ColorToString(StringToColor(cInt));
    end
    else if rb_delphiInt.Checked then
    begin
      cInt := Trim(edt_delphiInt.Text);
      cHtml := IntColorToHtmlColor(StrToInt(cInt));
      cHex := TColorToHex(StrToInt(cInt));
    end
    else if rb_delphiHex.Checked then
    begin
      cHex := Trim(edt_dephiHEX.Text);
      cHtml := HexColorToHtmlColor(cHex);
      cInt := IntToStr(ColorToRGB(StringToColor(cHex)));
    end;
    if cInt <> '' then
    begin
      shp_colorPicker.Brush.Color := StringToColor(cInt);
      lbl_title.Font.Color := StringToColor(cInt);
    end;
  except
    Application.MessageBox('录入数据有误！','提示', MB_OK);
  end;

  Convert;
end;

procedure Tfrm_ConvertColor.shp_colorPickerMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    if dlgColor_picker.Execute() then
  begin
    cPicked := dlgColor_picker.Color;
    shp_colorPicker.Brush.Color := cPicked;
    lbl_title.Font.Color := cPicked;
    cHtml := IntColorToHtmlColor(cPicked);
    cHex := TColorToHex(cPicked);
    cInt := IntToStr(ColorToRGB(cPicked));
    cNorm := ColorToString(cPicked);
    Convert;
  end;
end;

end.
