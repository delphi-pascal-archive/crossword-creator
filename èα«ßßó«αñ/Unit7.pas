unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm7 = class(TForm)
    Memo1: TMemo;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;
  s,s1:string;
  q:boolean;

implementation
 uses unit2,unit1;
{$R *.dfm}

procedure TForm7.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 if (key=#8)or(key=#27) then begin edit1.Text:='';s:=''; end else
 begin
 if (ord(key)>223)and(ord(key)<256) then key:=chr(ord(key)-32);
 if (ord(key)>191)and(ord(key)<255)and(length(edit1.Text)<15) then
  begin
   s:=s+key;
   edit1.ReadOnly:=false;
   edit1.Text:=edit1.Text+'*';
   edit1.ReadOnly:=true;
  end else begin key:=chr(0); beep; end
 end
end;

procedure TForm7.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
 if (key=#8)or(key=#27) then begin edit2.Text:='';s1:=''; end else
 begin
 if (ord(key)>223)and(ord(key)<256) then key:=chr(ord(key)-32);
 if (ord(key)>191)and(ord(key)<255)and(length(edit2.Text)<15) then
  begin
   s1:=s1+key;
   edit2.ReadOnly:=false;
   edit2.Text:=edit2.Text+'*';
   edit2.ReadOnly:=true;
  end else begin key:=chr(0); beep; end
 end
end;

procedure TForm7.Button2Click(Sender: TObject);
begin
 form7.Close
end;

procedure TForm7.FormShow(Sender: TObject);
begin
 if Left+Width>=screen.Width then
  Left:=screen.Width-Width;
 if top+Height>=screen.Height then
  top:=screen.Height-Height;
 s:=''; s1:='';
 label2.Caption:=cross.parol
end;

procedure TForm7.Button1Click(Sender: TObject);
begin
 if checkbox1.Checked then
  begin
   cross.parol:='';
   if q then form1.N11.Click;
   form7.Close;
  end else
   if (s=s1)and(s<>'') then
    begin
     cross.parol:=s;
  //   if q then form1.N11.Click;
     form7.Close;
    end else messagedlg('Введенный вами проверочный пароль не совпадает с паролем',mtInformation,mbokcancel,0);

end;

procedure TForm7.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 edit1.Text:='';
 edit2.Text:='';
 if not q then checkbox1.Checked:=false;
 q:=false;
end;

procedure TForm7.CheckBox1Click(Sender: TObject);
begin
 if checkbox1.Checked then
  begin
   edit1.Enabled:=false;
   edit2.Enabled:=false;
   edit1.Color:=clsilver;
   edit2.Color:=clsilver;
  end else
   begin
    edit1.Enabled:=true;
    edit2.Enabled:=true;
    edit1.Color:=clwindow;
    edit2.Color:=clwindow;
   end;
end;

end.
