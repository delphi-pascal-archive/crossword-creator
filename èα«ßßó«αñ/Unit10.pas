unit Unit10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm10 = class(TForm)
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Memo1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;
  nhrz:integer;
  hrz:array [0..255] of integer;

implementation
 uses unit6, Unit2, unit1;
{$R *.dfm}

procedure TForm10.FormCreate(Sender: TObject);
begin
 Memo1.Lines.Text:='';
end;

procedure TForm10.FormShow(Sender: TObject);
begin
 Height:=form6.Height;
 Width:=form6.Width;
 if Left+Width>=screen.Width then
  Left:=screen.Width-Width;
 if top+Height>=screen.Height then
  top:=screen.Height-Height;
end;

procedure TForm10.Memo1DblClick(Sender: TObject);
procedure setfoc(var t2:integer);
 var tt:integer;
 begin
  for tt:=1 to unit2.i do
   if ((form2.bt[tt].Top=form2.st[t2].top-2)and(form2.bt[tt].Left=form2.st[t2].left+form2.st[t2].Width))
    or((form2.bt[tt].left=form2.st[t2].left-2)and(form2.bt[tt].top=form2.st[t2].top+form2.st[t2].height))
     then
      begin
       form2.SetFocus;
       form2.bt[tt].SetFocus;
       unit2.hor:=false;
       unit2.vert:=true;
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

procedure TForm10.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if unit1.canclose then action:=caHide else action:=canone;
end;

end.
