unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm6 = class(TForm)
    Memo1: TMemo;
    procedure FormDeactivate(Sender: TObject);
    procedure zapolnenie(var t1,t2,si:integer;horizontal:boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Memo1DblClick(Sender: TObject);
    procedure Memo1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  hi,vi,nhrz:integer;
  hrz:array[0..255] of integer;

implementation
 Uses Unit5,unit1,unit10,unit2;
{$R *.dfm}

procedure TForm6.FormDeactivate(Sender: TObject);
begin
 if not unit1.otgad then
  begin
   if vi=0 then cross.hwords[hi]:=memo1.Lines.Text else
   if hi=0 then cross.vwords[vi]:=memo1.Lines.Text;
   form6.Close
  end
end;

procedure tform6.zapolnenie(var t1,t2,si:integer;horizontal:boolean);
var
 x1,x2,i:integer;
 s:string;
begin
 x1:=t1;
 x2:=t2;
 s:='';
 if horizontal then
  begin
   while ord(cross.crswrd[x1,x2])>191 do
    begin
     s:=s+cross.crswrd[x1,x2];
     inc(x1)
    end;
   for i:=1 to cross.nhslova do if s=cross.hslova[i] then
    begin
     inc(nhrz);
     memo1.Lines.Text:=memo1.Lines.Text+inttostr(si)+'.)'+cross.hwords[i]+'. ';
     hrz[nhrz]:=length(memo1.Text);
    end;
  end;
 if not horizontal then
  begin
   while ord(cross.crswrd[x1,x2])>191 do
    begin
     s:=s+cross.crswrd[x1,x2];
     inc(x2)
    end;
   for i:=1 to cross.nvslova do if s=cross.vslova[i] then
    begin
     inc(unit10.nhrz);
     form10.memo1.Lines.Text:=form10.memo1.Lines.Text+inttostr(si)+'.)'+cross.vwords[i]+'. ';
     unit10.hrz[unit10.nhrz]:=length(form10.Memo1.Text);
    end;
  end;
end;

procedure TForm6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if not otgad then Memo1.Clear else
  if unit1.canclose then action:=caHide else action:=canone;
end;

procedure TForm6.FormCreate(Sender: TObject);
begin
 memo1.Lines.Text:='';
end;

procedure TForm6.FormShow(Sender: TObject);
begin
if Left+Width>=screen.Width then
  Left:=screen.Width-Width;
 if top+Height>=screen.Height then
  top:=screen.Height-Height;
end;

procedure TForm6.Memo1DblClick(Sender: TObject);
 procedure setfoc(var t2:integer);
 var tt:integer;
 begin
  for tt:=1 to unit2.i do
   if (form2.bt[tt].Top=form2.st[t2].top-2)and(form2.bt[tt].Left=form2.st[t2].left+form2.st[t2].Width) then
    begin
     form2.SetFocus;
     form2.bt[tt].SetFocus;
     unit2.hor:=true;
     unit2.vert:=false;
     break;
    end;
 end;
var t1,t2:integer;
 cool:boolean;
begin
 cool:=false;
 for t1:=1 to nhrz do
  begin
   if (Memo1.SelStart+1>hrz[t1-1])and(Memo1.SelStart+1<=hrz[t1]) then
    begin
     for t2:=1 to unit2.si do
      begin
       if strtoint(form2.st[t2].Caption)=strtoint(copy(memo1.Text,hrz[t1-1],pos('.)',copy(Memo1.Text,hrz[t1-1],6))-1))then
        begin
         setfoc(t2);
         cool:=true;
         break;
        end;
      end;
    end;
   if cool then break;
  end;
end;

procedure TForm6.Memo1Click(Sender: TObject);
begin
 form1.Label5.Caption:=inttostr(Memo1.CaretPos.X);
 form1.Label4.Caption:=inttostr(Memo1.CaretPos.y);
 form1.Label3.Caption:=inttostr(Memo1.SelStart);
end;

end.
