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
procedure print_by_line(p_text:string);

function set_date_time_ecr: Integer;
function open_reg: Integer;
function open_reg_ecr: Integer;
procedure unreg_ecr(p_name: string; p_price: double; p_quantity: double; p_dep: Integer);
procedure reg_ecr(p_name: string; p_price: double; p_quantity: double; p_dep: Integer);
function annul_ecr(p_name: string; p_price: double; p_quantity: double; p_dep: Integer):Integer;
function close_reg_summ_ecr(p_summa: double): Integer;
function close_reg_ecr: Integer;
procedure rep_wo_clearance(p_mode: Integer);
function rep_clearance: Integer;
function put_money(l_summa: double):Integer;
function take_money(l_summa: double):Integer;
function check_mode: Integer;
function check_mode2: String;

procedure print_string_ecr(p_text: String; //�����
                           p_wrap,         //������� 0-���, 1-�� ������, 2-�� ������
                           p_align: Integer//������������ 0-�� ������ ����, 1-�� ������, 2-�� ������� ����
                           );
procedure print_header_ecr(p_text: String; //�����
                           p_wrap,         //������� 0-���, 1-�� ������, 2-�� ������
                           p_align,        //������������ 0-�� ������ ����, 1-�� ������, 2-�� ������� ����
                           p_font: Integer // ����� (��� ������)
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

    //�������� ������ �������
    ECR.ValuePurpose:=72;
    ECR.Value:=3;
    ECR.SetValue;

    //�������� ������ ������� � Z ������
    ECR.ValuePurpose:=207;
    ECR.Value:=1;
    ECR.SetValue;

    //�������� 1 ������
    ECR.CaptionPurpose:=36;
    ECR.Caption:='����� 1';
    ECR.SetCaption;

    //�������� 2 ������
    ECR.CaptionPurpose:=37;
    ECR.Caption:='����� 2';
    ECR.SetCaption;

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
  if Form_Main.have_cash=1 then
  begin
    if Form_Main.ECR.ResultCode <> 0 then
    begin
      msg2('������ ���: ���: '+string(Form_Main.ECR.ResultCode)
           +', ��������: ' + string(Form_Main.ECR.ResultDescription)
           + '!', '��������!', MB_OK+MB_ICONERROR);
      if Form_Main.ECR.ResultCode = -16 then   //���������� ����� �� ����� ���� �������� � ������ ������
        msg2('����� ���� �� ������� ���������� ����� �����?', '��������!', MB_OK+MB_ICONERROR);
    end;
  end
  else if Form_Main.have_cash=2 then
  begin
    if Form_Main.ECR.ResultCode <> 0 then
    begin
      msg2('������ ���: ���: '+string(Form_Main.ECR.ResultCode)
           +', ��������: ' + string(Form_Main.ECR.ResultCodeDescription)
           + '!', '��������!', MB_OK+MB_ICONERROR);
    end;
  end;

end;

// ������������� ��������� ���� (����� �� ������������ �����) 
function annul_ecr(p_name: string; p_price: double; p_quantity: double; p_dep: Integer):Integer;
begin
  Result:=0;
  with Form_main do
  begin
    if have_cash=1 then
    begin
      ECR.Name := p_name;
      ECR.Price := p_price;
      ECR.Quantity := p_quantity;
      //������� �����, ��� ������ ������ �� ����������!
      ECR.Department := p_dep;
      if ECR.Annulate <> 0 then
      begin
        show_error;
        Result:=1;
      end;
    end
    else if have_cash=2 then
    begin
      // ������ � ����� ��������� ���������
      ECR.Mode := 8;
      // ������������� ������ ���������
      ECR.Password := '1';

      ECR.Name := p_name;
      ECR.Price := p_price;
      ECR.Quantity := p_quantity;
      //������� �����, ��� ������ ������ �� ����������!
      ECR.Department := p_dep;
      if ECR.Annulate <> 0 then
      begin
        show_error;
        Result:=1;
      end;
    end;
  end;
end;

//�������� ����� � ���
function put_money(l_summa: double):Integer;
begin
  Result:=0;
  with Form_main do
  begin
    if have_cash=1 then
    begin
      ECR.Summ := l_summa;
      if ECR.CashIncome <> 0 then
      begin
          Result:=1;
          show_error;
      end;
    end
    else if have_cash=2 then
    begin
      ECR.Summ1 := l_summa;
      ECR.CashIncome;
      if ECR.ResultCode <> 0 then
      begin
          Result:=1;
          show_error
      end;
    end;

  end;
end;

function take_money(l_summa: double):Integer;
begin
//������� ����� �� ���
  Result:=0;
  with Form_main do
  begin
    if (have_cash=1) then
    begin
      ECR.Summ := l_summa;
      if ECR.CashOutcome <> 0 then
      begin
          Result:=1;
          show_error
      end;
    end
    else
    begin
      ECR.Summ1 := l_summa;
      ECR.CashOutcome;
      if ECR.ResultCode <> 0 then
      begin
          Result:=1;
          show_error
      end;

    end;
  end;
end;

// ������� ����
function open_ecr: Integer;
begin
  Result:=0;
  with Form_main do
  begin
  // �������� ����
  if (have_cash=1) then
  begin
    if open_port<>0 then
    begin
      show_error;
      Result:=1;
      Exit;
    end;
  end;

  // ��������� �� �������������������
  // �������, ������ �� ����� ������ ���, ���� ���� ���� ����  
  //  if not ECR.Fiscal then
//    msg2('��� �� ���������������!', '��������!', MB_OK+MB_ICONSTOP);

  // �������� ��������� ���
  if (have_cash =1) and (ECR.GetStatus <> 0) then
  begin
   show_error;
   close_port;
   show_error;
   Result:=1;
  end
  else if (have_cash =2) then
  begin
   {
   ECR.GetECRStatus;
   // ���� ��� �� � ������� "�������� �����, 24 ���� �� ���������" � "�������� �����, 24 ���� ���������"
   if (ECR.ECRMode <> 2) and (ECR.ECRMode <> 3) then
   begin
     // �������� ������
     msg2('��� �� ��������� � ������ ������!','��������!',MB_OK);
     msg2('������� ����� ���:'+ECR.ECRModeDescription,'��������!',MB_OK);
     Result:=1;
   end;}
  end;
  end;
end;

procedure close_ecr;
begin
  //����������� ����
  with Form_main do
  begin
  if (have_cash=1) and (close_port <> 0) then
    Exit;
  end
end;



// ������� �����
function open_session: Integer;
begin
  Result:=0;
  with Form_main do
  begin
    if have_cash=1 then
    begin
      // ������������� ������ ������
      ECR.Password := '30';
      if ECR.SessionOpened then
      begin
         //����� ��� �������
         Result:=1;
         Exit;
      end;
      //��������� �����
      if ECR.OpenSession <> 0 then
      begin
        Result:=2;
        show_error;
      end;
    end
    else if have_cash=2 then
    begin
      // ������������� ������ ���������
      ECR.Password := '1';
      ECR.GetECRStatus;
      
      if (ECR.ECRMode = 2) or (ECR.ECRMode = 3) then
      begin
         //����� ��� �������
         Result:=1;
         Exit;
      end;

      //��������� �����
      ECR.OpenSession;
      if ECR.ResultCode <> 0 then  // ����� �� ���������� ��� ������� ������, ����� ����� <> 0 ?
      begin
        Result:=2;
        show_error;
      end;

    end;  
  end;
end;

procedure rep_wo_clearance(p_mode: Integer);
begin
  //X-�����, ��� �������
  with Form_main do
  begin
    if have_cash=1 then
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
      ECR.ReportType := p_mode;
      if ECR.Report <> 0 then
       show_error;
    end
    else if have_cash=2 then
    begin
      // ������������� ������ ������
      ECR.Password := '30';
      // ������� �����
      ECR.PrintReportWithoutCleaning;
      show_error;

    end;
  end;
end;

function rep_clearance: Integer;
begin
  //Z-�����, � ��������
  Result:=0;
  with Form_main do
  begin
    if have_cash=1 then
    begin
      // ������������� ������ ������
      ECR.Password := '30';
      // ������ � ����� ������� c ��������
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
   end
   else if have_cash=2 then
   begin
      // ������������� ������ ������
      ECR.Password := '30';
      // ��������� ������
      ECR.GetShortECRStatus;
      // �������� � ������� 2 � 3 (��. �������� ECRMode).
      if (ECR.ECRMode = 2) or (ECR.ECRMode = 3) then
      begin
        ECR.PrintReportWithCleaning;
        // ��������� ������
        ECR.GetECRStatus;
        // ���� �� ������� � ����� �������� �����, �� - ������
        if ECR.ECRMode <> 4 then
        begin
          Result:=1;
          show_error;
          Exit;
        end;
      end
      else
      begin
        // ��� ��������� � ������������ ������
        msg2('������������ ����� ���! ECRMode='+string(Form_Main.ECR.ECRMode)
             +', ECRModeDescription: ' + string(Form_Main.ECR.ECRModeDescription)
             + '!', '��������!', MB_OK+MB_ICONERROR);
      end;
      
   end;
  end;
end;

// ����� � ����� �����������
function open_reg_ecr: Integer;
begin
  Result:=0;
  with Form_main do
  begin
    // ������������� ������ ������
    ECR.Password := '30';
    if have_cash=1 then
    begin
      // ������ � ����� �����������
      ECR.Mode := 1;
      if ECR.SetMode <> 0 then
      begin
        Result:=1;
        show_error;
      end;
    end;
  end;
end;

function close_reg_summ_ecr(p_summa: double): Integer;
begin
  // �������� ���� ��������� �� ������
  Result:=0;
  with Form_main do
  begin
    if have_cash=1 then
    begin
      ECR.Summ := p_summa;
      ECR.TypeClose := 0;
      if ECR.Delivery <> 0 then
      begin
        Result:=1;
        show_error;
      end;
    end
    else if have_cash=2 then
    begin
      ECR.Password := '1';
      ECR.Summ1 := p_summa;
      ECR.StringForPrinting := '==========================================';
      ECR.CloseCheck;
      show_error;
    end;
  end;
end;


// ��������� ����� ���
function check_mode: Integer;
begin
  Result:=0;
  with Form_main do
  begin
    if have_cash=2 then
    begin
      // ��������� ������
      ECR.GetShortECRStatus;
      // �������� � ������� 2 � 3 (��. �������� ECRMode).
      Result:=ECR.ECRMode;
    end
    else
    begin
      // ��� ������ ���

    end;
  end;
end;

// ��������� ����� ��� � ���������
function check_mode2: String;
begin
  Result:='';
  with Form_main do
  begin
    if have_cash=2 then
    begin
      // ��������� ������
      ECR.GetShortECRStatus;
      // �������� � ������� 2 � 3 (��. �������� ECRMode).
      Result:=ECR.ECRModeDescription;
    end
    else
    begin
      // ��� ������ ���

    end;
  end;
end;

// ������� ���
function open_reg: Integer;
begin
  Result:=0;
  with Form_main do
  begin
    if have_cash=2 then
    begin
      ECR.Password := '1';
      ECR.CheckType := 0;  // ��� - �������
      ECR.OpenCheck;
      if ECR.ResultCode <> 0 then
      begin
        show_error;
        Result:=1;
      end;
    end;
  end;
end;

// ������� ���
function close_reg_ecr: Integer;
begin
  Result:=0;
  with Form_main do
  begin
    if have_cash=1 then
    begin
      ECR.TypeClose := 0;
      if ECR.CloseCheck <> 0 then
      begin
        Result:=1;
        show_error;
      end;
    end
    else if have_cash=2 then
    begin
      // ������� ���
      ECR.Password := '1';
      ECR.Summ1 := 0;
      ECR.StringForPrinting := '===================';
      ECR.CloseCheck;
      show_error;
    end;
  end;
end;

// ������ �� ������� (����� ������, �� ����� ���������� ������)
procedure print_by_line(p_text:string);
var i, j, a: Integer;
 str: String;
begin
  i:=0;
  j:=0;
  a:=41; // ����� ������
  while i < Length(p_text) do
  begin
     i:=i+a;
     if i > Length(p_text) then
       i:=Length(p_text);
     str:=Copy(p_text, j, i);
      with Form_main do
      begin
       ECR.StringForPrinting:=str;
       ECR.PrintString;
      end; 
     j:=j+a+1;
     if j > Length(p_text) then
       Exit;
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
    if have_cash=1 then
    begin
      ECR.TextWrap:=p_wrap;
      ECR.Caption := p_text;
      ECR.Alignment := p_align;
      ECR.PrintString;
      show_error;
    end
    else if have_cash=2 then
    begin
      ECR.Password:='1';
      ECR.UseReceiptRibbon:=false;
      ECR.UseJournalRibbon:=true;

      print_by_line(p_text);
    end;
  end;
end;

procedure print_header_ecr(p_text: String; //�����
                           p_wrap,         //������� 0-���, 1-�� ������, 2-�� ������
                           p_align,//������������ 0-�� ������ ����, 1-�� ������, 2-�� ������� ����
                           p_font: Integer // ����� (��� ������)
                           );
begin
//������ ������ ������-������ ���������
  with Form_main do
  begin
    if have_cash=1 then
    begin
      ECR.Caption := p_text;
      ECR.FontDblWidth := 1;
      ECR.FontBold := 1;
      ECR.RecFontHeight:=1;
      ECR.Alignment := p_align;
      ECR.TextWrap:=p_wrap;
      ECR.AddField;
      ECR.PrintField;
      show_error;
    end
    else if have_cash=2 then
    begin
      ECR.Password:='1';
      ECR.UseReceiptRibbon:=true;
      ECR.UseJournalRibbon:=true;
      ECR.StringForPrinting:=p_text;
      if p_font=1 then
        ECR.PrintWideString
      else
        ECR.PrintString;
      show_error;
    end;
  end;
end;

// ����������� �������
procedure reg_ecr(p_name: string; p_price: double; p_quantity: double; p_dep: Integer);
begin
  with Form_main do
  begin
    if have_cash=1 then
    begin
      ECR.Name := p_name;
      ECR.Price := p_price;
      ECR.Quantity := p_quantity;
      //������� �����
      ECR.Department := p_dep;
      if ECR.Registration <> 0 then
        show_error;
    end
    else if have_cash=2 then
    begin
      // �������
      ECR.Password := '1';
      // ��������� ������
      ECR.GetShortECRStatus;
      ECR.StringForPrinting := p_name;
      ECR.Price := p_price;
      ECR.Quantity := p_quantity;
      //������� �����
      ECR.Department := p_dep;
      ECR.Sale;
      show_error;


    end;
  end;
end;

// ������� �������
procedure unreg_ecr(p_name: string; p_price: double; p_quantity: double; p_dep: Integer);
begin
  with Form_main do
  begin
    // ������ ��� 2 ����
    if have_cash=2 then
    begin
      // �������
      ECR.Password := '1';
      ECR.StringForPrinting := p_name;
      ECR.Price := p_price;
      ECR.Quantity := p_quantity;
      //������� �����
      ECR.Department := p_dep;
      ECR.ReturnSale;
      show_error;
    end;
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

function open_port: Integer;
begin
  // �������� ����
  with Form_main do
  begin
    if have_cash=1 then
      begin
      ECR.DeviceEnabled := true;
      Result:=0;
      if ECR.ResultCode <> 0 then
      begin
        show_error;
        Result:=1;
      end;
    end
    else if have_cash=2 then
    begin
      Result:=0;
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
