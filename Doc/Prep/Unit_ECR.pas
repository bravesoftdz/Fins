unit Unit_ECR;

interface

uses
 Unit_Mainform, Utils, Windows, SysUtils, DateUtils;

procedure show_error;
function open_ecr: Integer;
procedure close_ecr;
function open_session: Integer;
function open_port: Integer;
function close_port: Integer;
function calc_pads(p_txt:String): String;

function set_date_time_ecr: Integer;
function open_reg_ecr: Integer;
procedure reg_ecr(p_name: string; p_price: double; p_quantity: double);
procedure annul_ecr(p_name: string; p_price: double; p_quantity: double);
function close_reg_summ_ecr(p_summa: double): Integer;
function close_reg_ecr: Integer;
procedure rep_wo_clearance;
function rep_clearance: Integer;
function put_money(l_summa: double):Integer;
function take_money(l_summa: double):Integer;

procedure print_string_ecr(p_text: String; //�����
                           p_wrap,         //������� 0-���, 1-�� ������, 2-�� ������
                           p_align: Integer//������������ 0-�� ������ ����, 1-�� ������, 2-�� ������� ����
                           );
procedure print_header_ecr(p_text: String; //�����
                           p_wrap,         //������� 0-���, 1-�� ������, 2-�� ������
                           p_align: Integer//������������ 0-�� ������ ����, 1-�� ������, 2-�� ������� ����
                           );

function setup_ecr(p_text: String): Integer;

implementation



function set_date_time_ecr: Integer;
var
  AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond: Word;
begin
//���������� ���� � ����� � ��� � ����������
  Result:=0;
  with Form_main do
  begin
    if ECR.SessionOpened then
    begin
       //����� �������, ������ ������������� ����-�����
       Result:=2;
       Exit;
    end;

    // ������������� ������ ������
    ECR.Password := '30';
    //�����
    ECR.Mode := 1;
    ECR.SetMode;
    DecodeDateTime(Now, AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond);
    ECR.Day:=ADay;
    ECR.Month:=AMonth;
    ECR.Year:=AYear;

    //������������� ����
    //��� ���� �������� ����� (�� ������������ �����)
    ECR.SetDate;
    if ECR.SetDate <> 0 then
    begin
      Result:=1;
      show_error;
      Exit;
    end;

    ECR.Hour:=AHour;
    ECR.Minute:=AMinute;
    ECR.Second:=ASecond;

    //������������� �����
    if ECR.SetTime <> 0 then
    begin
      Result:=1;
      show_error;
      Exit;
    end;
  end;

end;


function setup_ecr(p_text: String): Integer;
var
  l_cur_line, p_ret: Integer;

  procedure set_line(p_text:string);
   var
     i, l_len, l_num:Integer;
  begin
  //��������� �������, ���� ������� - ������� �� 39 ������
    i:=0;
    l_len:= Length(p_text);
    //�������� �����, �� ����� 39 ������
    while i < l_len do
    begin
      if ((l_cur_line >= 69) and (l_cur_line <= 88)
        or (l_cur_line >= 0) and (l_cur_line <= 5)
      ) then
//        msg2('������, �� �������� ��������� ECR.CaptionPurpose='+inttostr(l_cur_line)+ '!',
//          '��������!', MB_OK+MB_ICONERROR)
      begin
        with Form_main do
        begin
        ECR.CaptionPurpose:=l_cur_line;
        end;
      end;

      if l_len<39 then
      begin
       l_num:=l_len
      end
       else
      begin
        //�������� �������
        if i+39 > l_len then
          begin
          l_num:=i+l_len;
          end
        else
          begin
          l_num:=39;
          end;
      end;

      with Form_main do
      begin
        ECR.Caption:=Copy(p_text, i, l_num);
        ECR.SetCaption;
        show_error;
      end;

      i:=i+l_num+1;
      l_cur_line:=l_cur_line+1;
    end;

    //���� ������ ������ �� ����� - ���������� ������ � ������� ������ �� ���������
    if l_len=0 then
       begin
        with Form_main do
        begin
        ECR.CaptionPurpose:=l_cur_line;
        ECR.Caption:=p_text;
        ECR.SetCaption;
        end;
        l_cur_line:=l_cur_line+1;
        show_error;
       end;
  end;

begin
//��������� ��������� ���
  Result:=0;
  // �������� ����
  if open_port<>0 then
  begin
    show_error;
    Result:=1;
    Exit;
  end;
  with Form_main do
  begin
    // ������������� ������ ������
    ECR.Password := '30';
    //����� ����������������
    ECR.Mode := 4;
    ECR.SetMode;

    //��������� ����������
    //���� ���� �� ���� ����� ��� ���������� �� ����, ������ ������ ���
    l_cur_line:=0;
{    ECR.CaptionPurpose:=0;
    ECR.Caption:='';
    ECR.SetCaption;
    show_error;}
//    set_line('');
    set_line('');
    set_line('');
    set_line('');
    set_line('');
    set_line('');
    set_line('');

    //������ ���� "������� �� �������!"
{    ECR.CaptionPurpose:=69;
    ECR.Caption:='';
    ECR.SetCaption;
    show_error;}
    l_cur_line:=69;
    set_line('');
    set_line('');
    set_line('');
    set_line('');
    set_line('');

    //������������ ���
    l_cur_line:=73;
    set_line('');
    l_cur_line:=74;
    set_line('');
    set_line('');
    set_line('');
    set_line('');
    set_line('');
    set_line('');
    set_line('');
    set_line('');
    set_line('');

    //������ ����� �� 88 ������ ����� ���������� ������)

{    ECR.CaptionPurpose:=75;
    ECR.Caption:=Copy(p_text,40,39);
    ECR.SetCaption;
    show_error;

    ECR.CaptionPurpose:=76; //� ������ ������ ����� �� 88 ������ ����� ���������� ������)
    ECR.Caption:=Copy(p_text,80,39);
    ECR.SetCaption;
    show_error;

    ECR.CaptionPurpose:=77; //� ������ ������ ����� �� 88 ������ ����� ���������� ������)
    ECR.Caption:=Copy(p_text,120,39);
    ECR.SetCaption;
    show_error;

    ECR.CaptionPurpose:=78; //� ������ ������ ����� �� 88 ������ ����� ���������� ������)
    ECR.Caption:=Copy(p_text,160,39);
    ECR.SetCaption;
    show_error;}
    //**

    //VALUEPURPOSE
    //�� ���������� ���-�� ������ �� ��
    ECR.ValuePurpose:=80;
    ECR.Value:=0;
    ECR.SetValue;
    //�� ���������� ���-�� ������ �� ��
    ECR.ValuePurpose:=81;
    ECR.Value:=0;
    ECR.SetValue;

    ECR.ValuePurpose:=171;
    ECR.Value:=0;
    ECR.SetValue;

    ECR.ValuePurpose:=167;
    ECR.Value:=0;
    ECR.SetValue;

    ECR.ValuePurpose:=174;
    ECR.Value:=0;
    ECR.SetValue;

    ECR.ValuePurpose:=66;
    ECR.Value:=6;
    ECR.SetValue;

    ECR.ValuePurpose:=67;
    ECR.Value:=6;
    ECR.SetValue;

    ECR.ValuePurpose:=72;
    ECR.Value:=0;
    ECR.SetValue;

    //**

    //��������� ����� ��
    ECR.ValuePurpose:=62;
    ECR.Value:=3;
    ECR.SetValue;

    //��������� ����� ��
    ECR.ValuePurpose:=63;
    ECR.Value:=3;
    ECR.SetValue;

    //��������� ����������� �������� ��
    ECR.ValuePurpose:=60;
    ECR.Value:=1;
    ECR.SetValue;
    //��������� ����������� �������� ��
    ECR.ValuePurpose:=61;
    ECR.Value:=1;
    ECR.SetValue;

    //����� �� ������
    //����� �����������
    ECR.Mode := 1;
    ECR.SetMode;

//    ECR.ResetMode;
    close_port;

//  �һλлûλ»ۻɻ �λ��ڻŻʻһ ���1
//    �Ļλ��лλ �ϻλƻ��˻λ»��һܻ!
//    ����������������������������������������
  end;
end;

procedure show_error;
begin
  //�������� ������ ���
  if Form_Main.ECR.ResultCode <> 0 then
    msg2('������ ���: ���: '+string(Form_Main.ECR.ResultCode)
         +', ��������:' + string(Form_Main.ECR.ResultDescription)
         + '!', '��������!', MB_OK+MB_ICONERROR);

end;

function put_money(l_summa: double):Integer;
begin
//�������� ����� � ���
  Result:=0;
  with Form_main do
  begin
    ECR.Summ := l_summa;
    if ECR.CashIncome <> 0 then
    begin
        Result:=1;
        show_error
    end;
  end;
end;

function take_money(l_summa: double):Integer;
begin
//������� ����� �� ���
  Result:=0;
  with Form_main do
  begin
    ECR.Summ := l_summa;
    if ECR.CashOutcome <> 0 then
    begin
        Result:=1;
        show_error
    end;
  end;
end;

function open_ecr: Integer;
begin
  Result:=0;
  with Form_main do
  begin
  // �������� ����
  if open_port<>0 then
  begin
    show_error;
    Result:=1;
    Exit;
  end;

  // ��������� �� �������������������
  // �������, ������ �� ����� ������ ���, ���� ���� ���� ����  
  //  if not ECR.Fiscal then
//    msg2('��� �� ���������������!', '��������!', MB_OK+MB_ICONSTOP);

  // �������� ��������� ���
  if ECR.GetStatus <> 0 then
  begin
   show_error;
   close_port;
   show_error;
   Result:=1;
  end;

  end;
end;

procedure close_ecr;
begin
  //����������� ����
  if close_port <> 0 then
    Exit;
end;


function open_session: Integer;
begin
  Result:=0;
  with Form_main do
  begin
    // ������� ������
    // ������������� ������ ������
    ECR.Password := '30';
    if ECR.SessionOpened then
    begin
       //����� ��� �������
       Result:=1;
       Exit;
    end;
    //��������� ������
    if ECR.OpenSession <> 0 then
    begin
      Result:=2;
      show_error;
    end;
  end;
end;

procedure rep_wo_clearance;
begin
  //X-�����, ��� �������
  with Form_main do
  begin

    // ������������� ������ ������
    ECR.Password := '30';
    // ������ � ����� ������� ��� �������
    ECR.Mode := 2;
    if ECR.SetMode <> 0 then
    begin
      show_error;
      Exit;
    end;
    // ������� �����
    ECR.ReportType := 2;
    if ECR.Report <> 0 then
     show_error;
  end;
end;

function rep_clearance: Integer;
begin
  //Z-�����, � ��������
  Result:=0;
  with Form_main do
  begin
    // ������������� ������ ������
    ECR.Password := '30';
    // ������ � ����� ������� ��� �������
    ECR.Mode := 3;
    if ECR.SetMode <> 0 then
    begin
      Result:=1;
      show_error;
      Exit;
    end;
    // ������� �����
    ECR.ReportType := 1;
    if ECR.Report <> 0 then
    begin
      Result:=1;
      show_error;
   end;
  end;
end;

function open_reg_ecr: Integer;
begin
  Result:=0;
  with Form_main do
  begin
    // ������ � ����� �����������
    // ������������� ������ ������
    ECR.Password := '30';
    // ������ � ����� �����������
    ECR.Mode := 1;
    if ECR.SetMode <> 0 then
    begin
      show_error;
      Result:=1;
    end;
  end;
end;

function close_reg_summ_ecr(p_summa: double): Integer;
begin
  // �������� ���� ��������� �� ������
  Result:=0;
  with Form_main do
  begin
    ECR.Summ := p_summa;
    ECR.TypeClose := 0;
//    if ECR.CloseCheck <> 0 then
    if ECR.Delivery <> 0 then
    begin
      Result:=1;
      show_error;
    end;
  end;
end;

function close_reg_ecr: Integer;
begin
  // �������� ����
  Result:=0;
  with Form_main do
  begin
    ECR.TypeClose := 0;
    if ECR.CloseCheck <> 0 then
    begin
      Result:=1;
      show_error;
    end;
  end;
end;

procedure print_string_ecr(p_text: String; //�����
                           p_wrap,         //������� 0-���, 1-�� ������, 2-�� ������
                           p_align: Integer//������������ 0-�� ������ ����, 1-�� ������, 2-�� ������� ����
                           );
begin
//������ ������
  with Form_main do
  begin
    ECR.TextWrap:=p_wrap;
    ECR.Caption := p_text;
    ECR.Alignment := p_align;
    ECR.PrintString;
    show_error;
  end;
end;

procedure print_header_ecr(p_text: String; //�����
                           p_wrap,         //������� 0-���, 1-�� ������, 2-�� ������
                           p_align: Integer//������������ 0-�� ������ ����, 1-�� ������, 2-�� ������� ����
                           );
begin
//������ ������ ������-������ ���������
  with Form_main do
  begin
    ECR.Caption := p_text;
    ECR.FontDblWidth := 1;
    ECR.FontBold := 1;
    ECR.RecFontHeight:=1;
//    ECR.RecFont := 1;
    ECR.Alignment := p_align;
    ECR.TextWrap:=p_wrap;

    ECR.AddField;
    ECR.PrintField;
    show_error;
  end;
end;

procedure reg_ecr(p_name: string; p_price: double; p_quantity: double);
begin
  with Form_main do
  begin
  // ����������� �������
  ECR.Name := p_name;
  ECR.Price := p_price;
  ECR.Quantity := p_quantity;
  ECR.Department := 1;
  if ECR.Registration <> 0 then
    show_error;
  end;
end;

function calc_pads(p_txt:String): String;
var
  i:Integer;
begin
//���������� ������ ��������, ��� �������������� ������������ �������

 Result:='';
 for i:=1 to 18-Length(p_txt) do
 begin
  Result:=Result+' ';
 end;

end;

procedure annul_ecr(p_name: string; p_price: double; p_quantity: double);
begin
  with Form_main do
  begin
  // ������������� �������
  ECR.Name := p_name;
  ECR.Price := p_price;
  ECR.Quantity := p_quantity;
  //����� ��� �� ����� �����??
  //  ECR.Department := 1;
  if ECR.Annulate <> 0 then
    show_error;
  end;
end;

function open_port: Integer;
begin
  // �������� ����
  with Form_main do
  begin
    ECR.DeviceEnabled := true;
    Result:=0;
    if ECR.ResultCode <> 0 then
    begin
      show_error;
      Result:=1;
    end;
  end;
end;

function close_port: Integer;
begin
  // ����������� ����
  with Form_main do
  begin
    ECR.DeviceEnabled := false;
    Result:=0;
    if ECR.ResultCode <> 0 then
    begin
      show_error;
      Result:=1;
    end;
  end;
end;

end.
