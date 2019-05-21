unit Unit_form_pass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, wwdbedit;

type
  TForm_pass = class(TForm)
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure wwDBEdit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_pass: TForm_pass;

implementation

uses Unit_Mainform;

{$R *.dfm}

procedure TForm_pass.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm_pass.Button1Click(Sender: TObject);
begin
  Form_main.User:=wwDBEdit2.text;
  Form_main.Pass:=wwDBEdit1.text;
  Close;
end;

procedure TForm_pass.FormCreate(Sender: TObject);
begin
  if Form_main.User <> '' then
    wwDBEdit2.text:=Form_main.User;
end;

procedure TForm_pass.wwDBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Form_main.User:=wwDBEdit2.text;
    Form_main.Pass:=wwDBEdit1.text;
    Close;
  end
end;

end.