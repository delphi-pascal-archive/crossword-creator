unit Unit12;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Spin, ExtCtrls, Menus, ExtDlgs;

type
  TForm12 = class(TForm)
    ColorDialog1: TColorDialog;
    MainMenu1: TMainMenu;
    StaticText3: TStaticText;
    SpinEdit1: TSpinEdit;
    Panel3: TPanel;
    Panel5: TPanel;
    Panel4: TPanel;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    SpinEdit2: TSpinEdit;
    BitBtn1: TBitBtn;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    SavePictureDialog1: TSavePictureDialog;
    SaveDialog1: TSaveDialog;
    N4: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;
  f11canclose:boolean;

implementation

uses unit2, unit1, unit11;


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
   if Length(s)>0 then if messagedlg('Нет вопросов к словам: '+copy(s,1,length(s)-1)+'. Продолжить?',mtInformation,[mbYes, mbNo],0)=mryes then Result:=true;
   if Length(s)=0 then Result:=true;
  end else result:=true;
end;

procedure TForm12.BitBtn1Click(Sender: TObject);
var
  deltaX,deltaY,maxX,maxY,i,t1:integer;
procedure deltaXY;
var i,j:integer;
begin
 deltaX:=cross.stg;
 deltaY:=cross.stv;
 maxX:=0;
 maxY:=0;
 for i:=1 to cross.stv do
  for j:=1 to cross.stg do
   if ord(cross.crswrd[j,i])>191 then
    begin
     if i<deltaY then deltaY:=i;
     if j<deltaX then deltaX:=j;
     if i>maxY then maxY:=i;
     if j>maxX then maxX:=j;
    end;
end;
begin
 t1:=0;
 deltaXY;
 form11.Image1.Height:=(maxY-deltaY+1)*SpinEdit1.Value+5;
 form11.Image1.Width:=(maxX-deltaX+1)*SpinEdit1.Value+5;
 Form11.Image1.Picture.Bitmap.Height:=(maxY-deltaY+1)*SpinEdit1.Value+5;
 Form11.Image1.Picture.Bitmap.Width:=(maxX-deltaX+1)*SpinEdit1.Value+5;
 form11.Image1.Canvas.Brush.Color:=Panel3.Color;
 form11.Image1.Canvas.FillRect(rect(0,0,form11.Image1.Width,form11.Image1.Height));
 form11.Image1.Canvas.Brush.Color:=Panel4.Color;
 form11.Image1.Canvas.Pen.Color:=Panel5.Color;
 form11.image1.Canvas.Pen.Width:=SpinEdit2.Value;
 //rectangl:=rect(((form2.bt[i].Left+Form2.HorzScrollBar.Position)div(cross.razm)-deltaX)*SpinEdit1.Value+2,((form2.bt[i].top+Form2.vertScrollBar.Position)div(cross.razm)-deltaY)*SpinEdit1.Value+2,((form2.bt[i].Left+Form2.HorzScrollBar.Position)div(cross.razm)-deltaX)*SpinEdit1.Value+SpinEdit1.Value+3,((form2.bt[i].top+Form2.vertScrollBar.Position)div(cross.razm)-deltaY)*SpinEdit1.Value+SpinEdit1.Value+3);
 for i:=1 to unit2.i do
  if (unit1.otgad)or(form2.bt[i].Caption<>' ')then
   begin
    form11.Image1.Canvas.Rectangle(rect(((form2.bt[i].Left+Form2.HorzScrollBar.Position)div(cross.razm)-deltaX)*SpinEdit1.Value+2,((form2.bt[i].top+Form2.vertScrollBar.Position)div(cross.razm)-deltaY)*SpinEdit1.Value+2,((form2.bt[i].Left+Form2.HorzScrollBar.Position)div(cross.razm)-deltaX)*SpinEdit1.Value+SpinEdit1.Value+3,((form2.bt[i].top+Form2.vertScrollBar.Position)div(cross.razm)-deltaY)*SpinEdit1.Value+SpinEdit1.Value+3));
    if (((form2.bt[i].Left+Form2.HorzScrollBar.Position)div(cross.razm)=0)or(ord(cross.crswrd[(form2.bt[i].Left+Form2.HorzScrollBar.Position)div(cross.razm)-1,(form2.bt[i].top+Form2.vertScrollBar.Position)div(cross.razm)])<192))and((ord(cross.crswrd[(form2.bt[i].Left+Form2.HorzScrollBar.Position)div(cross.razm)+1,(form2.bt[i].top+Form2.vertScrollBar.Position)div(cross.razm)])>191))or(((ord(cross.crswrd[(form2.bt[i].Left+Form2.HorzScrollBar.Position)div(cross.razm),(form2.bt[i].top+Form2.vertScrollBar.Position)div(cross.razm)+1])>191))and(((form2.bt[i].top+Form2.vertScrollBar.Position)div(cross.razm)=0)or(ord(cross.crswrd[(form2.bt[i].Left+Form2.HorzScrollBar.Position)div(cross.razm),(form2.bt[i].top+Form2.vertScrollBar.Position)div(cross.razm)-1])<192))and((ord(cross.crswrd[(form2.bt[i].Left+Form2.HorzScrollBar.Position)div(cross.razm),(form2.bt[i].top+Form2.vertScrollBar.Position)div(cross.razm)+1])>191))) then
     begin
      inc(t1);
      form11.Image1.Canvas.TextOut(((form2.bt[i].Left+Form2.HorzScrollBar.Position)div(cross.razm)-deltaX)*SpinEdit1.Value+2+(SpinEdit2.Value div 2)+(SpinEdit2.Value mod 2)*2,((form2.bt[i].top+Form2.vertScrollBar.Position)div(cross.razm)-deltaY)*SpinEdit1.Value+2+(SpinEdit2.Value div 2)+(SpinEdit2.Value mod 2)*2,inttostr(t1));
     end;
  // form11.Image1.Canvas.TextRect(rect(((form2.bt[i].Left+Form2.HorzScrollBar.Position)div(cross.razm)-deltaX)*SpinEdit1.Value+2,((form2.bt[i].top+Form2.vertScrollBar.Position)div(cross.razm)-deltaY)*SpinEdit1.Value+2,((form2.bt[i].Left+Form2.HorzScrollBar.Position)div(cross.razm)-deltaX)*SpinEdit1.Value+(SpinEdit1.Value)+3,((form2.bt[i].top+Form2.vertScrollBar.Position)div(cross.razm)-deltaY)*SpinEdit1.Value+(SpinEdit1.Value )+3),((form2.bt[i].Left+Form2.HorzScrollBar.Position)div(cross.razm)-deltaX)*SpinEdit1.Value+2,((form2.bt[i].top+Form2.vertScrollBar.Position)div(cross.razm)-deltaY)*SpinEdit1.Value+2,'88');
//   form11.Image1.Canvas.TextOut(((form2.bt[i].Left+Form2.HorzScrollBar.Position)div(cross.razm)-deltaX)*SpinEdit1.Value+2,((form2.bt[i].top+Form2.vertScrollBar.Position)div(cross.razm)-deltaY)*SpinEdit1.Value+2,'88');
   end;
  form11.panel1.Left:=form11.Image1.Clientwidth;
  form11.panel1.Top:=form11.Image1.Clientheight;
end;

procedure TForm12.Panel3Click(Sender: TObject);
begin
 if ColorDialog1.Execute then
  form12.Panel3.Color:=ColorDialog1.Color;
end;

procedure TForm12.Panel5Click(Sender: TObject);
begin
 if ColorDialog1.Execute then
  form12.Panel5.Color:=ColorDialog1.Color;
end;

procedure TForm12.Panel4Click(Sender: TObject);
begin
 if ColorDialog1.Execute then
  form12.Panel4.Color:=ColorDialog1.Color;
end;

procedure TForm12.N2Click(Sender: TObject);
//var
// x:TextFile;
begin
 if SavePictureDialog1.Execute then
  begin
//   assignfile(x,SavePictureDialog1.FileName);
//   rewrite(x);
   Form11.Image1.Picture.SaveToFile(SavePictureDialog1.FileName);
//   closefile(x);
  end;
end;

procedure TForm12.N3Click(Sender: TObject);
var
 x:TextFile;
 t1,t2,si:integer;
procedure zapolnenie(const horizontal:boolean);
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
     write(x,inttostr(si)+'.'+cross.hwords[i]+'.  ');
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
     write(x,inttostr(si)+'.'+cross.vwords[i]+'. ');
    end;

  end;
end;

{--}
begin
 if proverka then
 if SaveDialog1.Execute then
 begin
  Assignfile(x,SaveDialog1.FileName);
  rewrite(x);
  si:=0;
  writeln(x,'По горизонтали:');
  for t2:=0 to cross.stv do
   for t1:=0 to cross.stg do
    if (ord(cross.crswrd[t1,t2])>191)and((t1=0)or(ord(cross.crswrd[t1-1,t2])<192))and(ord(cross.crswrd[t1+1,t2])>191) then
     begin
      inc(si);
      zapolnenie(true);
     end else if (ord(cross.crswrd[t1,t2])>191)and((t2=0)or(ord(cross.crswrd[t1,t2-1])<192))and(ord(cross.crswrd[t1,t2+1])>191) then inc(si);
  writeln(x,'');
  si:=0;
  writeln(x,'По вертикали:');
  for t2:=0 to cross.stv do
   for t1:=0 to cross.stg do
    if (ord(cross.crswrd[t1,t2])>191)and((t2=0)or(ord(cross.crswrd[t1,t2-1])<192))and(ord(cross.crswrd[t1,t2+1])>191) then
     begin
      inc(si);
      zapolnenie(false);
     end else if (ord(cross.crswrd[t1,t2])>191)and((t1=0)or(ord(cross.crswrd[t1-1,t2])<192))and(ord(cross.crswrd[t1+1,t2])>191) then inc(si);
  CloseFile(x);
 end;
end;

procedure TForm12.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 f11canclose:=true;
 form11.Close;
end;

procedure TForm12.N4Click(Sender: TObject);
begin
 close;
end;

procedure TForm12.FormShow(Sender: TObject);
begin
if Left+Width>=screen.Width then
  Left:=screen.Width-Width;
 if top+Height>=screen.Height then
  top:=screen.Height-Height;
end;

end.
