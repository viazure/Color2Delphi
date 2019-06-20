program Color2Delphi;

uses
  Forms,
  p_main in 'p_main.pas' {frm_ConvertColor};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_ConvertColor, frm_ConvertColor);
  Application.Run;
end.
