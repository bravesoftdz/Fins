program DirUp;

uses
  Forms,
  uMain in 'uMain.pas' {frmMain},
  uSelFiles in 'uSelFiles.pas' {frmSelFiles};
var
  s: String;
{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  s:=ParamStr(1);
  if s = '-load' then
  begin
    //������� �������� ���������� ������
    frmMain.g_load:=1;
    frmMain.setForm;
  end
  else
  begin
    //��������� �����
    frmMain.setForm;
    frmMain.unload;
  end;

  Application.Run;
end.
