unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, extctrls, ComCtrls, OleServer, WordXP, Buttons;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    N8: TMenuItem;
    N9: TMenuItem;
    N3: TMenuItem;
    Label4: TLabel;
    N12: TMenuItem;
    N13: TMenuItem;
    Label5: TLabel;
    PopupMenu1: TPopupMenu;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N17: TMenuItem;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    N2: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure FormContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure N10Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N8Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
type
  tcross=record
   stv,stg,razm,nvslova,nhslova:integer;
   parol:string[15];
   crswrd:array[0..500,0..500] of char;
   hslova,vslova:array[1..255] of string[50];
   hwords,vwords:array[1..255] of string[255];
end;
var
  Form1: TForm1;
  otgad,q,canclose:boolean;
  cross:tcross;

implementation
uses unit2, Unit3, unit4, unit5, unit6, Unit7, Unit8, unit9, unit10,
  Unit11, Unit12;
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

procedure TForm1.N3Click(Sender: TObject);
begin
 n17.Click;
 if not form2.Showing then
  begin
   form10.Close;
   form5.RadioGroup1.Enabled:=true;
   otgad:=false;
   form3.showmodal;
  end;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
 Form4.ShowModal
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
 form2.SetFocus
end;

procedure TForm1.N12Click(Sender: TObject);
begin
 inc(cross.stg);
 form3.SpinEdit1.Value:=cross.stg;
 form2.polecreate(form2);
end;

procedure TForm1.N13Click(Sender: TObject);
begin
 inc(cross.stv);
 form3.SpinEdit2.Value:=cross.stv;
 form2.polecreate(form2);
end;

procedure TForm1.N11Click(Sender: TObject);
var
 f:file of tcross;
 x:TextFile;
 i,j:integer;
begin
if otgad then
begin
 savedialog1.FileName:=form8.Edit2.Text+' '+form8.Edit3.Text;
 SaveDialog1.DefaultExt:='crss';
 savedialog1.InitialDir:=extractfilepath(application.ExeName)+'\save\solved';
 SaveDialog1.Filter:='*.crss|*.crss';
 if savedialog1.Execute then
  begin
   assignfile(x,savedialog1.FileName);
   rewrite(x);
   for i:=1 to unit2.i do
    begin
     write(x,form2.bt[i].caption);
    end;
   closefile(x);
  end;
end else
 if proverka then
 begin
  SaveDialog1.Filter:='*.crswrd|*.crswrd';
  SaveDialog1.DefaultExt:='crswrd';
  savedialog1.FileName:=opendialog1.FileName;
  if (cross.parol='')and(form7.CheckBox1.Checked=false) then begin unit7.q:=true;form7.Showmodal;end;
  if (cross.parol<>'')or(form7.CheckBox1.Checked) then
  if savedialog1.Execute then
   begin
    savedialog1.InitialDir:=extractfilepath(application.ExeName)+'\save';
    assignfile(f,savedialog1.FileName);
    for i:=0 to cross.stg do
     for j:=0 to cross.stv do cross.crswrd[i,j]:=chr(ord(cross.crswrd[i,j])-30);
    for i:=1 to 50 do
     for j:=1 to 255 do
      begin
       cross.hslova[j][i]:=chr(ord(cross.hslova[j][i])-100);
       cross.vslova[j][i]:=chr(ord(cross.vslova[j][i])-100);
      end;
    for i:=1 to length(cross.parol) do cross.parol[i]:=chr(ord(cross.parol[i])-100);
    rewrite(f);
    write(f,cross);
    for i:=0 to cross.stg do
     for j:=0 to cross.stv do cross.crswrd[i,j]:=chr(ord(cross.crswrd[i,j])+30);
    for i:=1 to 50 do
     for j:=1 to 255 do
      begin
       cross.hslova[j][i]:=chr(ord(cross.hslova[j][i])+100);
       cross.vslova[j][i]:=chr(ord(cross.vslova[j][i])+100);
      end;
    for i:=1 to length(cross.parol) do cross.parol[i]:=chr(ord(cross.parol[i])+100);
    closefile(f);
   end;
  form7.CheckBox1.Checked:=false;
 end;
end;

procedure TForm1.FormContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
//popupmenu1.Popup(mousepos.X,mousepos.y);
end;

procedure TForm1.N10Click(Sender: TObject);
 var
  i:integer;
  s:string;
  f:file of tcross;
begin
 n17.Click;
 OpenDialog1.DefaultExt:='crswrd';
 OpenDialog1.Filter:='*.crswrd|*.crswrd';
 if not form2.Showing then
 if opendialog1.Execute then if fileexists(opendialog1.FileName) then
  begin
   form2.OnCreate(form2);
   form5.OnCreate(form5);
   assignfile(f,opendialog1.FileName);
   reset(f);
   read(f,cross);
   closefile(f);
   for i:=1 to length(cross.parol) do cross.parol[i]:=chr(ord(cross.parol[i])+100);
  {!!}label3.Caption:=cross.parol;
   n9.Enabled:=true;
   form1.Enabled:=false;
   form8.Showmodal;
   form10.Close;
   s:=OpenDialog1.FileName;
   repeat
    delete(s,1,pos('\',s));
   until pos('\',s)=0;
   delete(s,pos('.crswrd',s),length(s));
   form1.Caption:=form1.Caption+': "'+s+'"';
  end;
end;

procedure TForm1.N14Click(Sender: TObject);
begin
 unit7.q:=false;
 form7.Showmodal;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if form2.Showing then
  if messagedlg('Вы действительно хотите выйти? Все несохраненные данные будут утеряны.',mtInformation,mbokcancel,0)=mrcancel then
   Action := caNone;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
 form1.Close;
end;

procedure TForm1.N15Click(Sender: TObject);
begin
 q:=false;
 form9.showmodal
end;

procedure TForm1.N16Click(Sender: TObject);
begin
 form9.OnShow(form9);
 q:=true;
 if otgad then begin form9.spinedit1.Value:=form9.spinedit1.Value+1; form9.spinedit2.Value:=form9.spinedit2.Value+1; end;
 form2.crsmeshenie;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 q:=false;
 canclose:=false;
end;

procedure TForm1.N17Click(Sender: TObject);
begin
 canclose:=true;
 if form2.Showing then
 if messagedlg('Вы действительно хотите закрыть этот кроссворд? Все несохраненные данные будут утеряны.',mtInformation,mbokcancel,0)=mrok then
  Begin
   form1.Caption:='Кроссворд';
   cross.parol:='';
   BitBtn1.Visible:=false;
   BitBtn2.Visible:=false;
   BitBtn3.Visible:=false;
   form2.OnCreate(form2);
   form2.Nomera;
   form2.Close;
   form4.Close;
   form5.OnCreate(form5);
   form5.Close;
   form6.Memo1.Clear;
   form6.Close;
   form7.Close;
   form8.Close;
   form9.Close;
   form10.Memo1.Clear;
   form10.Close;
   n9.Enabled:=true;
   n2.Enabled:=false;
   n5.Enabled:=false;
   n6.Enabled:=false;
   n7.Enabled:=false;
   n11.Enabled:=false;
   n12.Enabled:=false;
   n13.Enabled:=false;
   n14.Enabled:=false;
   n15.Enabled:=false;
   n16.Enabled:=false;
  end;
 canclose:=false;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 n12.Click
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
 n15.Click
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
 n13.Click
end;

procedure TForm1.FormShow(Sender: TObject);
begin
 if Left+Width>=screen.Width then
  Left:=screen.Width-Width;
 if top+Height>=screen.Height then
  top:=screen.Height-Height;
end;

procedure TForm1.N2Click(Sender: TObject);
var
 z,t1,t2,tx,nh,nv,otv:integer;
 slovo:boolean;
 s:string;
begin
 nv:=0;
 nh:=0;
 otv:=0;
 for t1:=1 to unit2.i do if form2.bt[t1].Caption<>cross.crswrd[(form2.bt[t1].left+form2.HorzScrollBar.Position)div cross.razm,(form2.bt[t1].Top+form2.VertScrollBar.Position)div cross.razm] then form2.bt[t1].Font.Color:=clred else form2.bt[t1].Font.Color:=clgreen;
 for t2:=0 to cross.stv do
  for t1:=0 to cross.stg do
   begin
    if (ord(cross.crswrd[t1,t2])>191)and((t1=0)or(ord(cross.crswrd[t1-1,t2])<192))and(ord(cross.crswrd[t1+1,t2])>191) then
     begin
      inc(nh);
      tx:=t1;
      s:='';
      z:=0;
      slovo:=true;
      while ord(cross.crswrd[tx,t2])>191 do
       begin
        repeat
         inc(z);
        until (z=unit2.i)or(((form2.bt[z].left+form2.HorzScrollBar.Position) div cross.razm=tx)and((form2.bt[z].top+form2.VertScrollBar.Position) div cross.razm=t2));
        if form2.bt[z].Caption<>cross.crswrd[tx,t2] then slovo:=false;
        inc(tx);
       end;
      if slovo then inc(otv);
     end;
    if (ord(cross.crswrd[t1,t2])>191)and((t2=0)or(ord(cross.crswrd[t1,t2-1])<192))and(ord(cross.crswrd[t1,t2+1])>191) then
     begin
      inc(nv);
      tx:=t2;
      s:='';
      z:=0;
      slovo:=true;
      while ord(cross.crswrd[t1,tx])>191 do
       begin
        repeat
         inc(z);
        until (z=unit2.i)or(((form2.bt[z].left+form2.HorzScrollBar.Position) div cross.razm=t1)and((form2.bt[z].top+form2.VertScrollBar.Position) div cross.razm=tx));
        if form2.bt[z].Caption<>cross.crswrd[t1,tx] then slovo:=false;
        inc(tx);
       end;
      if slovo then inc(otv);
     end;
   end;
 if messagedlg('Правильно отвечено '+inttostr(otv)+' из '+inttostr(nh+nv),mtInformation,mbokcancel,0)=mrok then ;
  for t1:=1 to unit2.i do form2.bt[t1].Font.Color:=form4.Button3.Font.Color;
end;

procedure TForm1.N6Click(Sender: TObject);
var
 i:integer;
 x:TextFile;
 s:wideString;
begin
 OpenDialog1.Filter:='*.crss|*.crss';
 OpenDialog1.DefaultExt:='crss';
 OpenDialog1.FileName:=form8.Edit2.Text+'.crss';
 if opendialog1.Execute then if fileexists(opendialog1.FileName) then
  begin
   AssignFile(x,opendialog1.FileName);
   reset(x);
   read(x,s);
   if length(s)=unit2.i then
    for i:=1 to length(s) do
     form2.bt[i].Caption:=s[i] else
      messagedlg('Неправильный формат файла.',mtInformation,mbokcancel,0);
  end else messagedlg('Файла с таким именем не существует.',mtInformation,mbokcancel,0);
end;

procedure TForm1.N7Click(Sender: TObject);
begin
 form11.show;
 form12.show;
end;

end.
