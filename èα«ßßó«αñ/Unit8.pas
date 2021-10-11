unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm8 = class(TForm)
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;
  s:string;

implementation
Uses unit1, unit2, Unit5, DateUtils;
{$R *.dfm}

function proverka:boolean;
var i:integer;
s:string;
begin
 if not unit1.otgad then
  begin
   Result:=false;
   s:='';
   for i:=1 to cross.nhslova do
    if Length(cross.hwords[i])=0 then s:=s+cross.hslova[i]+';';
   for i:=1 to cross.nvslova do
    if Length(cross.vwords[i])=0 then s:=s+cross.vslova[i]+';';
   if Length(s)>0 then if messagedlg('Не ко всем словам есть вопросы. Продолжить?',mtInformation,[mbYes, mbNo],0)=mryes then Result:=true;
   if Length(s)=0 then Result:=true;
  end else result:=true;
end;

procedure TForm8.Edit1KeyPress(Sender: TObject; var Key: Char);
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
 end;
end;

procedure TForm8.CheckBox1Click(Sender: TObject);
begin
 if checkbox1.Checked then
  Begin
   if cross.parol<>'' then edit1.Enabled:=true;
   edit2.Enabled:=false;
   edit3.Enabled:=false;
   edit1.Color:=clwindow;
   edit2.Color:=clsilver;
   edit3.Color:=clsilver;
  end
 else
  begin
   edit1.Enabled:=false;
   edit2.Enabled:=true;
   edit3.Enabled:=true;
   edit1.Color:=clsilver;
   edit2.Color:=clwindow;
   edit3.Color:=clwindow;
  end;
end;

procedure TForm8.Button2Click(Sender: TObject);
begin
 form8.Close;
end;

procedure TForm8.Button1Click(Sender: TObject);
begin
 if checkbox1.Checked then
  begin
   if s=cross.parol then begin form8.Close;unit1.otgad:=false;form2.opening;end
    else messagedlg('Введен неверный пароль',mtInformation,mbokcancel,0);
  end else
   if proverka then
   begin
    if (length(edit2.Text)>=1) then
    begin
     form8.Close;
     unit1.otgad:=true;
     form2.otgadopening;
     
    end else  MessageDlg('Введите Фамилию',mtinformation,mbokcancel,0)
   end else form8.Close;
end;

procedure TForm8.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 edit1.Text:='';
 s:='';
 CheckBox1.Checked:=false;
 form1.Enabled:=true;
end;

procedure TForm8.FormShow(Sender: TObject);
begin
 if Left+Width>=screen.Width then
  Left:=screen.Width-Width;
 if top+Height>=screen.Height then
  top:=screen.Height-Height;
end;

end.
