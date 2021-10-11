unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,  Forms,
  Dialogs, StdCtrls, Menus, buttons, ExtCtrls, Controls;

type

  TForm2 = class(TForm)
    PaintBox1: TPaintBox;

    procedure btMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Primen(Sender: TObject);
    procedure polecreate(Sender: TObject);
    procedure btKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Razmer(sender:TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PaintBox1Click(Sender: TObject);
    procedure btcreate(sender: Tobject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure showr(sender:TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure PaintBox1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure btprint(var Key: Char);
    procedure crswrdz(var Key: Char);
    procedure slovoz;
    procedure opening;
    procedure udalenie(var z:integer);
    procedure otgadopening;
    procedure crsmeshenie;
    procedure Nomera;
    procedure print(var key:char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    bt: array [1..4000] of Tbitbtn;
    st: array [1..500] of Tstatictext;
    { Public declarations }
  end;


var
  Form2: TForm2;
  xx,yy,i,si,px,py,ppx,ppy,ppxsb,ppysb:integer;
  opens,hor,vert,q:boolean;
 // crswrd:array[0..4000,0..4000]of char;


implementation

uses Unit1,Unit3,Unit4,Unit5,unit6,unit9,unit10;

{$R *.dfm}

Procedure TForm2.Razmer(sender: Tobject);
begin
  q:=false;
end;

Procedure TForm2.Primen(Sender: TObject);
var
 t:integer;
Begin
 form2.polecreate(form2);
 form2.HorzScrollBar.Position:=0;
 form2.VertScrollBar.Position:=0;
 for t:=1 to i do
  begin
   bt[t].width:=cross.razm;
   bt[t].Height:=cross.razm;
   bt[t].Font.Size:=form4.SpinEdit2.Value;
   bt[t].Font.Name:=form4.ComboBox1.Text;
   bt[t].Font.Color:=form4.Button3.Font.Color;
   bt[t].Left:=bt[t].Left div unit4.buttonsize*cross.razm;
   bt[t].Top:=bt[t].top div unit4.buttonsize*cross.razm;
  end;
 ppxsb:=form2.HorzScrollBar.Position;
 ppysb:=form2.VertScrollBar.Position; 
 ppx:=(bt[i].Left div cross.razm)*cross.razm-HorzScrollBar.Position;
 ppy:=(bt[i].Top div cross.razm)*cross.razm-VertScrollBar.Position;
 form2.Color:=unit4.clr
end;

procedure TForm2.polecreate(Sender: TObject);
var
 j,k:integer;
begin
 if not unit1.otgad then
  begin
   paintbox1.Canvas.Brush.Color:=unit4.clr;
   paintbox1.Width:=cross.stg*cross.razm;
   paintbox1.height:=cross.stv*cross.razm;
   for k:=0 to cross.stv do
    begin
     for j:=0 to cross.stg do
      begin
       if cross.crswrd[j,k]='z' then paintbox1.Canvas.Brush.Color:=clblack else paintbox1.Canvas.Brush.Color:=unit4.clr;
       paintbox1.Canvas.Rectangle(j*cross.razm,k*cross.razm,j*cross.razm+cross.razm,k*cross.razm+cross.razm);
      end;
    end;
   if q then razmer(form2);
  end
end;

procedure Tform2.btKeyPress(Sender: TObject; var Key: Char);
var
 z:integer;
begin
//if key=#13 then form1.Label4.Caption:='enter!!!' else if key=#8 then form1.Label4.Caption:='del!!!' else if key=#27 then form1.Label4.Caption:='esc!!!' else if key=#32 then form1.Label4.Caption:='space!!!';
 if not unit1.otgad then
  begin
   z:=0;
   repeat
    inc(z);
   until bt[z].Focused;
   if z<>i then
   if (ord(key)>191)and(ord(key)<256) then
    begin
     if (ord(key)>191)and(ord(key)<224) then bt[z].Caption:=key else if (ord(key)>223)and(ord(key)<256) then BEGIN key:=chr(ord(key)-32);bt[z].Caption:=key; end;
     cross.crswrd[(bt[z].Left+form2.HorzScrollBar.Position) div cross.razm,(bt[z].Top+form2.vertScrollBar.Position) div cross.razm]:=key
    end;
   if z=i then formkeypress(form2,key);
   if (key=#8)and(z<>i) then udalenie(z)
    else
     begin
      bt[z].Hide;
      bt[z].Show;
     end;
   slovoz
  end else print(key);
end;

procedure tform2.udalenie(var z:integer);
var
 pg,pv:integer;
begin
 pg:=(bt[z].Left+form2.HorzScrollBar.Position)div cross.razm;
 pv:=(bt[z].top+form2.vertScrollBar.Position)div cross.razm;
 if ((ord(cross.crswrd[pg+1,pv])>191)and not((ord(cross.crswrd[pg+2,pv])<191)and((ord(cross.crswrd[pg+1,pv+1])>191)or(ord(cross.crswrd[pg+1,pv-1])>191))))or((ord(cross.crswrd[pg,pv+1])>191)and not((ord(cross.crswrd[pg,pv+2])<191)and((ord(cross.crswrd[pg+1,pv+1])>191)or(ord(cross.crswrd[pg-1,pv+1])>191)))) then messagedlg('нельзя удалять буквы в середине или на пересечении слов',mtInformation,mbokcancel,0)
  else
   begin
    cross.crswrd[pg,pv]:=' ';
    if cross.crswrd[pg,pv+1]='z' then cross.crswrd[pg,pv+1]:=' ';
    if cross.crswrd[pg,pv-1]='z' then cross.crswrd[pg,pv-1]:=' ';
    if cross.crswrd[pg+1,pv]='z' then cross.crswrd[pg+1,pv]:=' ';
    if cross.crswrd[pg-1,pv]='z' then cross.crswrd[pg-1,pv]:=' ';
    for pg:=z to i-1 do
     begin
      bt[pg].Left:=bt[pg+1].Left;
      bt[pg].Top:=bt[pg+1].Top;
      bt[pg].Caption:=bt[pg+1].Caption;                     
     end;
    bt[i].Destroy;
    dec(i);
    if i>1 then bt[z-1].SetFocus;
    paintbox1.Repaint
   end;
end;

procedure TForm2.btMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 //for j:=1 to j do
 //if bt[j].Focused then form1.label1.Caption:=bt[j].name;
end;

procedure TForm2.FormShow(Sender: TObject);
Begin
 cross.stg:=form3.SpinEdit1.Value;
 cross.stv:=form3.SpinEdit2.Value;
 cross.razm:=form4.SpinEdit1.Value;
 q:=true;
 Polecreate(form2);
 if Left+Width>=screen.Width then
  Left:=screen.Width-Width;
 if top+Height>=screen.Height then
  top:=screen.Height-Height;
 form1.N17.Enabled:=True;
end;



procedure TForm2.FormCreate(Sender: TObject);
var
 t:integer;
begin
 form2.HorzScrollBar.Position:=0;
 form2.VertScrollBar.Position:=0;
 if not opens then
 begin
  for t:=1 to i do bt[t].Destroy;
  for t:=0 to 500 do
   for i:=0 to 500 do cross.crswrd[t,i]:=' ';
  for t:=1 to 255 do
    begin
     cross.hslova[t]:='';
     cross.vslova[t]:='';
     cross.hwords[t]:='';
     cross.vwords[t]:='';
    end;
 end;
 i:=0;
 //cross.parol:='';
 q:=true
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
 //form2.polecreate(form2)
end;

procedure TForm2.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 form1.Label1.Caption:=inttostr(x);
 form1.Label2.Caption:=inttostr(y);
 if not unit1.otgad then
  begin
   if cross.crswrd[x div cross.razm,y div cross.razm]<>'z' then
    begin
     PaintBox1.Canvas.Brush.Color:=unit4.clr;
     PaintBox1.Canvas.Rectangle((xx div cross.razm)*cross.razm,(yy div cross.razm)*cross.razm,(xx div cross.razm)*cross.razm+cross.razm,(yy div cross.razm)*cross.razm+cross.razm);
     PaintBox1.Canvas.Brush.Color:=clgreen;
     PaintBox1.Canvas.Rectangle((x div cross.razm)*cross.razm,(y div cross.razm)*cross.razm,(x div cross.razm)*cross.razm+cross.razm,(y div cross.razm)*cross.razm+cross.razm);
     px:=(x);py:=(y);
     xx:=x;
     yy:=y;
    end;
  end;
end;

procedure tform2.btcreate(sender: Tobject);
begin
 inc(i);
 bt[i]:=Tbitbtn.Create(paintbox1);
 bt[i].Parent:=form2;
 bt[i].width:=cross.razm;
 bt[i].Height:=cross.razm;
 bt[i].Font.Size:=form4.SpinEdit2.Value;
 bt[i].Font.Color:=form4.Button3.Font.Color;
 bt[i].Left:=ppx;
 bt[i].Top:=ppy;
 bt[i].TabStop:=false;
 bt[i].Caption:=' ';
 bt[i].Font.Name:=form4.ComboBox1.Text;
 //bt[i].OnContextPopup:=PaintBox1ContextPopup;
 bt[i].OnMouseMove:=btmousemove;
 bt[i].OnClick:=showr;
 bt[i].OnKeyPress:=btkeypress;
 bt[i].PopupMenu:=form1.PopupMenu1;
 //bt[i].OnMouseMove:=showr;
 //bt[i].Name:='n'+inttostr(i);
 if (not opens)and(not unit1.otgad) then
 begin
  paintbox1.OnPaint(form2);
  if form2.Width<bt[i].Left+cross.razm then form2.HorzScrollBar.Position:=form2.HorzScrollBar.Position+2*cross.razm;
  if form2.Height<bt[i].Top+cross.razm then form2.VertScrollBar.Position:=form2.VertScrollBar.Position+2*cross.razm;
  if (bt[i].Left+form2.HorzScrollBar.Position) div cross.razm>=cross.stg then begin cross.stg:=(bt[i].Left+form2.HorzScrollBar.Position)div cross.razm+1; form3.SpinEdit1.Value:=cross.stg; q:=true; polecreate(form2); end;
  if (bt[i].Top+form2.VertScrollBar.Position) div cross.razm>=cross.stv then begin cross.stv:=(bt[i].Top+form2.VertScrollBar.Position)div cross.razm+1; form3.SpinEdit2.Value:=cross.stv; q:=true; polecreate(form2); end;
 {!!}form1.Label1.Caption:=inttostr(i);
 end;
end;

procedure tform2.showr(sender:TObject);
var
 z:integer;
begin
 z:=0;
 repeat
  inc(z);
 until bt[z].Focused;
 form1.Label4.Caption:=chr(ord(cross.crswrd[(bt[z].Left+HorzScrollBar.Position)div cross.razm,(bt[z].top+vertScrollBar.Position)div cross.razm]));
 if unit1.otgad then
  begin
   hor:=false;
   vert:=false;
  end
end;

procedure TForm2.PaintBox1Click(Sender: TObject);
var
 z:integer;
begin
 if not unit1.otgad then
  begin
   for z:=1 to i do if bt[z].Focused then begin bt[z].Hide;bt[z].Show;end;
   if cross.crswrd[px div cross.razm,py div cross.razm]<>'z' then
    begin
     if bt[i].Caption=' ' then begin bt[i].Destroy;dec(i);end;
     ppxsb:=form2.HorzScrollBar.Position;
     ppysb:=form2.VertScrollBar.Position;
     ppx:=(px div cross.razm)*cross.razm-ppxsb;
     ppy:=(py div cross.razm)*cross.razm-ppysb;
     btcreate(form2);
    end;
  end;
end;

procedure TForm2.crswrdz(var Key: Char);
var
 t1,t2:integer;
begin
 cross.crswrd[(bt[i].Left+ppxsb) div cross.razm,(bt[i].Top+ppysb) div cross.razm]:=key;

 for t1:=1 to cross.stv do
  for t2:=1 to cross.stg do
    begin
     if (ord(cross.crswrd[t2-1,t1-1])>191)and(ord(cross.crswrd[t2,t1])>191) then if ord(cross.crswrd[t2-1,t1])>191 then cross.crswrd[t2,t1-1]:='z';
     if (ord(cross.crswrd[t2+1,t1-1])>191)and(ord(cross.crswrd[t2,t1])>191) then if ord(cross.crswrd[t2+1,t1])>191 then cross.crswrd[t2,t1-1]:='z';
     if (ord(cross.crswrd[t2-1,t1+1])>191)and(ord(cross.crswrd[t2,t1])>191) then if ord(cross.crswrd[t2-1,t1])>191 then cross.crswrd[t2,t1+1]:='z';
     if (ord(cross.crswrd[t2+1,t1+1])>191)and(ord(cross.crswrd[t2,t1])>191) then if ord(cross.crswrd[t2+1,t1])>191 then cross.crswrd[t2,t1+1]:='z';
    end;
 slovoz;
end;

procedure tform2.slovoz;
var
 t1,t2,t1x,t2x,tt1,tt2,tt:integer;
 s:string;
begin
 //form5.ListBox1.Items.Clear;
 //form5.ListBox2.Items.Clear;
 tt:=0; tt1:=0; tt2:=0;
 for t1:=0 to cross.stv do
  for t2:=0 to cross.stg do
   begin
    if (ord(cross.crswrd[t2,t1])>191)and(ord(cross.crswrd[t2+1,t1])>191)and((ord(cross.crswrd[t2-1,t1])<191)or(t2=0)) then
     begin
      form5.ListBox1.Items.Strings[tt1]:=inttostr(tt+1)+'. ';
      t2x:=t2;s:='';
      repeat
       s:=s+cross.crswrd[t2x,t1];
       inc(t2x);
      until ord(cross.crswrd[t2x,t1])<192;
      form5.ListBox1.Items.Strings[tt1]:=form5.ListBox1.Items.Strings[tt1]+s;
      inc(tt1); inc(tt);
     end;

    if (ord(cross.crswrd[t2,t1])>191)and(ord(cross.crswrd[t2,t1+1])>191)and((ord(cross.crswrd[t2,t1-1])<191)or(t1=0)) then
     begin
      if (ord(cross.crswrd[t2,t1])>191)and(ord(cross.crswrd[t2+1,t1])>191)and((ord(cross.crswrd[t2-1,t1])<191)or(t2=0)) then dec(tt);
      form5.ListBox2.Items.Strings[tt2]:=inttostr(tt+1)+'. ';
      t1x:=t1;s:='';
      repeat
       s:=s+cross.crswrd[t2,t1x];
       inc(t1x);
      until ord(cross.crswrd[t2,t1x])<192;
      form5.ListBox2.Items.Strings[tt2]:=form5.ListBox2.Items.Strings[tt2]+s;
      inc(tt2); inc(tt);
     end;
   end;
 if not opens then form5.slovoz;
end;

procedure TForm2.btprint(var Key: Char);
var
 t,pg,pv:integer;
 prov,prov1:boolean;
begin
 prov:=true;
 prov1:=true;
 if ppxsb-form2.HorzScrollBar.Position<>0 then begin ppx:=ppx-(form2.HorzScrollBar.Position-ppxsb);ppxsb:=form2.HorzScrollBar.Position;end;
 if ppysb-form2.VertScrollBar.Position<>0 then begin ppy:=ppy-(form2.VertScrollBar.Position-ppysb);ppysb:=form2.VertScrollBar.Position;end;
 pg:=(ppx+ppxsb) div cross.razm;
 pv:=(ppy+ppysb) div cross.razm;
 if form5.radiogroup1.ItemIndex=0 then
  begin
   for t:=1 to i do
    if (bt[t].Left=ppx+cross.razm)and(bt[t].Top=ppy) then prov:=false;
   if ((ord(cross.crswrd[pg+1,pv+1])>191)and(ord(cross.crswrd[pg+2,pv+1])>191))or((ord(cross.crswrd[pg+1,pv-1])>191)and(ord(cross.crswrd[pg+2,pv-1])>191)) then prov1:=false;
   if prov then
    begin
   //  if ppx+ppxsb+cross.razm>=cross.stg*cross.razm then form1.N12.Click;
     if prov1 then ppx:=PPX+cross.razm;
     {!!}form1.Label4.Caption:=inttostr(ppx);form1.Label5.Caption:=inttostr(i);
     bt[i].Caption:=key;
     crswrdz(key)
    end else
   begin
    repeat
     prov:=true;
     ppx:=ppx+cross.razm;
     for t:=1 to i do
      if (bt[t].Left=ppx)and(bt[t].Top=ppy) then prov:=false;
    until prov;
    bt[i].Caption:=key;
    crswrdz(key)
   end
  end else
  begin
   for t:=1 to i do
    if (bt[t].Left=ppx)and(bt[t].Top=ppy+cross.razm) then prov:=false;
   if ((ord(cross.crswrd[pg+1,pv+1])>191)and(ord(cross.crswrd[pg+1,pv+2])>191))or((((ppx+ppxsb)div cross.razm>0)and(ord(cross.crswrd[pg-1,pv+1])>191)and(ord(cross.crswrd[pg-1,pv+2])>191))) then prov1:=false;
   if prov then
    begin
//    if ppy+ppysb+cross.razm>=cross.stv*cross.razm then form1.N13.Click;
     if prov1 then ppy:=ppy+cross.razm;
     bt[i].Caption:=key;
     crswrdz(key)
    end else
   begin
    repeat
     prov:=true;
     ppy:=ppy+cross.razm;
     for t:=1 to i do
      if (bt[t].Left=ppx)and(bt[t].Top=ppy) then prov:=false;
    until prov;
    bt[i].Caption:=key;
    crswrdz(key)
   end;
  end;
 if prov1 then btcreate(form2);
end;

procedure TForm2.FormKeyPress(Sender: TObject; var Key: Char);
begin
 {!!form1.Label3.Caption:=inttostr(ord(key));}
 if not unit1.otgad then
  begin
   if (ord(key)>223)and(ord(key)<256) then key:=chr(ord(key)-32);
   if (ord(key)>191)and(ord(key)<255) then btprint(key);
  end;
end;

procedure tform2.crsmeshenie;
var
 t1,t2,lmax,tmax:integer;
procedure crr;
 begin
  if (t1-form9.spinedit1.value>=0)and(t2-form9.spinedit2.value>=0)then
   cross.crswrd[t1,t2]:=cross.crswrd[t1-form9.spinedit1.value,t2-form9.spinedit2.value]
  else cross.crswrd[t1,t2]:=' '
 end;
begin
 if form9.spinedit1.value>0 then cross.stg:=cross.stg+form9.spinedit1.value;
 if form9.spinedit2.value>0 then cross.stv:=cross.stv+form9.spinedit2.value;
 if form9.spinedit1.value<0 then for t1:=0 to cross.stg do
 if form9.spinedit2.value<0 then for t2:=0 to cross.stv do crr
  else for t2:=cross.stv downto 0 do crr
 else for t1:=cross.stg downto 0 do
  if form9.spinedit2.value<0 then for t2:=0 to cross.stv do crr
  else for t2:=cross.stv downto 0 do crr;
 lmax:=0;tmax:=0;
 for t1:=1 to i do
  begin
   bt[t1].Left:=bt[t1].Left+form9.spinedit1.value*cross.razm;
   bt[t1].top:=bt[t1].top+form9.spinedit2.value*cross.razm;
   if (bt[t1].Left+HorzScrollBar.Position>lmax)and(t1<i) then lmax:=bt[t1].Left+HorzScrollBar.Position;
   if (bt[t1].top+VertScrollBar.Position>tmax)and(t1<i) then tmax:=bt[t1].top+VertScrollBar.Position;
  end;
 if (cross.stv<tmax div cross.razm)or(unit1.q) then begin form3.SpinEdit2.Value:=tmax div cross.razm +1;cross.stv:=form3.SpinEdit2.Value;end;
 if (cross.stg<lmax div cross.razm)or(unit1.q) then begin form3.SpinEdit1.Value:=lmax div cross.razm +1;cross.stg:=form3.SpinEdit1.Value; end;
 if not (unit1.otgad)and(bt[i].Caption=' ') then begin bt[i].Destroy;dec(i);ppx:=bt[i].Left;ppy:=bt[i].Top;bt[i].SetFocus;end;
 nomera;
 q:=true;
 polecreate(form2);
end;

procedure TForm2.PaintBox1Paint(Sender: TObject);
var
 j,k:integer;
begin
 if not unit1.otgad then
  begin
   paintbox1.Canvas.Brush.Color:=unit4.clr;
   paintbox1.Width:=cross.stg*cross.razm;
   paintbox1.height:=cross.stv*cross.razm;
   for k:=form2.VertScrollBar.Position div cross.razm to form2.VertScrollBar.Position div cross.razm +form2.Height div cross.razm do
    begin
     for j:=form2.HorzScrollBar.Position div cross.razm to form2.HorzScrollBar.Position div cross.razm +form2.Width div cross.razm do
      begin
       if cross.crswrd[j,k]='z' then paintbox1.Canvas.Brush.Color:=clblack else paintbox1.Canvas.Brush.Color:=unit4.clr;
       paintbox1.Canvas.Rectangle(j*cross.razm,k*cross.razm,j*cross.razm+cross.razm,k*cross.razm+cross.razm);
      end;
    end;
   if q then razmer(form2);
 end;
end;

procedure TForm2.PaintBox1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
 //if ord(cross.crswrd[mousepos.X div cross.razm,mousepos.y div cross.razm])<191 then
 if not unit1.otgad then if form5.radiogroup1.ItemIndex=0 then form5.radiogroup1.ItemIndex:=1 else form5.radiogroup1.ItemIndex:=0
end;

procedure tform2.opening;
var t1,t2:integer;
begin
 AutoSize:=false;
 form6.OnCreate(form6);
 form1.N2.Enabled:=false;
 form1.BitBtn1.Visible:=true;
 form1.BitBtn2.Visible:=true;
 form1.BitBtn3.Visible:=true;
 opens:=true;
 form3.SpinEdit1.Value:=cross.stg;
 form3.SpinEdit2.Value:=cross.stv;
 form3.Button1.Click;
 for t1:=1 to 50 do
  for t2:=1 to 255 do
   begin
    cross.hslova[t2][t1]:=chr(ord(cross.hslova[t2][t1])+100);
    cross.vslova[t2][t1]:=chr(ord(cross.vslova[t2][t1])+100);
   end;
  for t1:=0 to cross.stv do
   for t2:=0 to cross.stg do
    begin
     cross.crswrd[t2,t1]:=chr(ord(cross.crswrd[t2,t1])+30);
     if ord(cross.crswrd[t2,t1])>191 then
      begin
       ppx:=t2*cross.razm;
       ppy:=t1*cross.razm;
       btcreate(form2);
       bt[i].caption:=cross.crswrd[t2,t1];
      end;
    end;
 slovoz;
 opens:=false;
 ppx:=bt[i].Left+cross.razm;
 ppy:=bt[i].Top+cross.razm;
 btcreate(form2);
 nomera;
end;

procedure tform2.otgadopening;
var
 t1,t2:integer;
begin
 AutoSize:=false;
 form4.CheckBox1.Checked:=true;
 form10.OnCreate(form6);
 form10.Close;
 form6.Close;
 opens:=true;
 form3.SpinEdit1.Value:=cross.stg;
 form3.SpinEdit2.Value:=cross.stv;
 form3.Button1.Click;
 for t1:=1 to 50 do
  for t2:=1 to 255 do
   begin
    cross.hslova[t2][t1]:=chr(ord(cross.hslova[t2][t1])+100);
    cross.vslova[t2][t1]:=chr(ord(cross.vslova[t2][t1])+100);
   end;
  for t1:=0 to cross.stv do
   for t2:=0 to cross.stg do
    begin
     cross.crswrd[t2,t1]:=chr(ord(cross.crswrd[t2,t1])+30);
     if ord(cross.crswrd[t2,t1])>191 then
      begin
       ppx:=t2*cross.razm;
       ppy:=t1*cross.razm;
       btcreate(form2);
       //bt[i].caption:={cross.crswrd[t2,t1]}'';
      end else cross.crswrd[t2,t1]:=' '
    end;
// slovoz;
 opens:=false;
 form2.Color:=unit4.clr;
 form9.OnShow(form9);

 paintbox1.Height:=0;
 paintbox1.Width:=0;
 form5.Close;
 form6.Memo1.Font.Size:=10;
 form6.Memo1.ReadOnly:=true;
 form6.Caption:='По горизонтали:';
 crsmeshenie;
 form6.Show;
 form10.Show;
 form1.N2.Enabled:=true;
 form1.N6.Enabled:=true;
 {ppx:=bt[i].Left+cross.razm;
 ppy:=bt[i].Top+cross.razm;
 btcreate(form2); }
end;

Procedure tform2.Nomera;
var
 t1,t2:integer;
begin
 for t1:=1 to si do st[t1].Destroy;
 si:=0;
 if form4.CheckBox1.Checked then
  begin
   for t2:=0 to cross.stv do
    for t1:=0 to cross.stg do
     begin
      if (ord(cross.crswrd[t1,t2])>191)and((t1=0)or(ord(cross.crswrd[t1-1,t2])<192))and(ord(cross.crswrd[t1+1,t2])>191) then
       begin
        inc(si);
        if unit1.otgad then form6.zapolnenie(t1,t2,si,true);
        st[si]:=Tstatictext.Create(form2);
        st[si].Parent:=form2;
        st[si].Font.Color:=clWindowText;
        st[si].Color:=unit4.clr;
        st[si].Caption:=inttostr(si);
        st[si].AutoSize:=false;
        st[si].Height:=11;
        st[si].Width:=st[si].Width-4;
        st[si].Font.Size:=8;
        st[si].Top:=t2*cross.razm+2-form2.VertScrollBar.Position;
        if t1>0 then st[si].Left:=t1*cross.razm-st[si].Width-HorzScrollBar.Position else begin st[si].Color:=clbtnface;st[si].Left:=-HorzScrollBar.Position;end;
        if (ord(cross.crswrd[t1,t2])>191)and((t2=0)or(ord(cross.crswrd[t1,t2-1])<192))and(ord(cross.crswrd[t1,t2+1])>191) then if unit1.otgad then form6.zapolnenie(t1,t2,si,false);
       end else
      if (ord(cross.crswrd[t1,t2])>191)and((t2=0)or(ord(cross.crswrd[t1,t2-1])<192))and(ord(cross.crswrd[t1,t2+1])>191) then
       begin
        inc(si);
        if unit1.otgad then form6.zapolnenie(t1,t2,si,false);
        st[si]:=Tstatictext.Create(form2);
        st[si].Parent:=form2;
        st[si].Font.Color:=clWindowText;
        st[si].Color:=unit4.clr;
        st[si].Caption:=inttostr(si);
        st[si].AutoSize:=false;
        st[si].Height:=11;
        st[si].Width:=st[si].Width-4;
        st[si].Font.Size:=8;
        st[si].left:=t1*cross.razm+2-HorzScrollBar.Position;
        if t2>0 then st[si].top:=t2*cross.razm-st[si].Height-form2.VertScrollBar.Position else begin st[si].Color:=clbtnface;st[si].top:=-form2.VertScrollBar.Position;end;
       end;
     end;
  end;
end;

procedure tform2.print(var key:char);
var
 z:integer;
procedure focus(t1,t2:integer);
begin
 if (not hor)and(not vert) then
   if (ord(cross.crswrd[t1+1,t2])>191)and((ord(cross.crswrd[t1,t2+1])<192)or(ord(cross.crswrd[t1-1,t2])<192)) then hor:=true else vert:=true;
 if hor then
   if ord(cross.crswrd[t1+1,t2])>191 then bt[z+1].SetFocus;
 if vert then
   if ord(cross.crswrd[t1,t2+1])>191 then
    begin
     repeat
      inc(z);
     until (z=i)or(((bt[z].left+HorzScrollBar.Position) div cross.razm=t1)and((bt[z].top+VertScrollBar.Position) div cross.razm=t2+1));
     bt[z].SetFocus;
    end;
end;
{---}
begin
 z:=0;
 repeat
  inc(z);
 until bt[z].Focused;
 if (ord(key)>223)and(ord(key)<256) then key:=chr(ord(key)-32);
 if (ord(key)>191)and(ord(key)<224) then
  begin
   bt[z].Caption:=key;
   focus((bt[z].left+HorzScrollBar.Position) div cross.razm,(bt[z].top+VertScrollBar.Position) div cross.razm);
  end;
 if (key=#8) then bt[z].Caption:=' ';
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if unit1.canclose then
  begin
   action:=caHide;
   form1.N17.Enabled:=false;
  end else action:=canone;
end;

end.



