unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm5 = class(TForm)
    ListBox1: TListBox;
    ListBox2: TListBox;
    RadioGroup1: TRadioGroup;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure ListBox1DblClick(Sender: TObject);
    procedure ListBox2DblClick(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure slovoz;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
{  nvslova,nhslova:integer;
  hslova,vslova,hwords,vwords:array[0..255] of string;
 }

implementation
 uses unit1,Unit2,unit6;
{$R *.dfm}

procedure TForm5.RadioGroup1Click(Sender: TObject);
begin
 form2.SetFocus
end;

procedure TForm5.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
 listbox1.Height:=LIstbox2.Height;
end;

procedure TForm5.ListBox1DblClick(Sender: TObject);
var
 i:integer;
begin
 form6.Caption:=listbox1.Items.Strings[listbox1.itemindex];
 for i:=1 to cross.nhslova do
  if cross.hslova[i]=copy(ListBox1.Items.Strings[listbox1.itemindex],pos(' ',ListBox1.Items.Strings[listbox1.itemindex])+1,length(ListBox1.Items.Strings[listbox1.itemindex])) then
   begin
    form6.Memo1.Font.Size:=14;
    form6.Memo1.ReadOnly:=false;
    form6.Memo1.Lines.Strings[0]:=cross.hwords[i];
    unit6.hi:=i;
    unit6.vi:=0;
   end;
 form6.Show;
end;

procedure TForm5.ListBox2DblClick(Sender: TObject);
var
 i:integer;
begin
 form6.Caption:=listbox2.Items.Strings[listbox2.itemindex];
 for i:=1 to cross.nvslova do
  if cross.vslova[i]=copy(ListBox2.Items.Strings[listbox2.itemindex],pos(' ',ListBox2.Items.Strings[listbox2.itemindex])+1,length(ListBox2.Items.Strings[listbox2.itemindex])) then
   begin
    form6.Memo1.Font.Size:=14;
    form6.Memo1.ReadOnly:=false;
    form6.Memo1.Lines.Strings[0]:=cross.vwords[i];
    unit6.vi:=i;
    unit6.hi:=0;
   end;
 form6.Show;
end;

procedure TForm5.ListBox1Click(Sender: TObject);
begin
 listbox2.ItemIndex:=-1
end;

procedure TForm5.ListBox2Click(Sender: TObject);
begin
 listbox1.ItemIndex:=-1
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
 if not unit2.opens then
 begin
  cross.nhslova:=0;
  cross.nvslova:=0;
 end;
 listbox1.Clear;
 listbox2.Clear;
end;

procedure tform5.slovoz;
var
 i,i1,i2:integer;
 ch:boolean;
begin
// if cross.nhslova<listbox1.Items.Count then
// repeat
  if cross.nhslova=listbox1.Items.Count then
   begin
    for i:=1 to cross.nhslova do
     begin
      ch:=true;
      for i1:=0 to ListBox1.Items.count-1 do
       if cross.hslova[i]=copy(ListBox1.Items.Strings[i1],pos(' ',ListBox1.Items.Strings[i1])+1,length(ListBox1.Items.Strings[i1])) then ch:=false;
      if ch then
        for i1:=0 to ListBox1.Items.count-1 do
         begin
          ch:=true;
          for i2:=1 to cross.nhslova do
           if (i2<>i)and(cross.hslova[i2]=copy(ListBox1.Items.Strings[i1],pos(' ',ListBox1.Items.Strings[i1])+1,length(ListBox1.Items.Strings[i1]))) then ch:=false;
          if ch then cross.hslova[i]:=copy(ListBox1.Items.Strings[i1],pos(' ',ListBox1.Items.Strings[i1])+1,length(ListBox1.Items.Strings[i1]));
         end;
     end;
   end;

  if cross.nhslova<listbox1.Items.Count then
   begin
    for i1:=0 to ListBox1.Items.count-1 do
     begin
      ch:=true;
      for i:=1 to cross.nhslova do
       if cross.hslova[i]=copy(ListBox1.Items.Strings[i1],pos(' ',ListBox1.Items.Strings[i1])+1,length(ListBox1.Items.Strings[i1])) then ch:=false;
      if ch then
       begin
        inc(cross.nhslova);
        cross.hslova[cross.nhslova]:=copy(ListBox1.Items.Strings[i1],pos(' ',ListBox1.Items.Strings[i1])+1,length(ListBox1.Items.Strings[i1]));
       end;
     end;
   end;
 form2.Nomera;
  {if cross.nhslova>listbox1.Items.Count then
   begin
     for i:=1 to cross.nhslova do
     begin
      ch:=true;
      for i1:=0 to ListBox1.Items.count-1 do
       if cross.hslova[i]=copy(ListBox1.Items.Strings[i1],pos(' ',ListBox1.Items.Strings[i1])+1,length(ListBox1.Items.Strings[i1])) then ch:=false;
      if ch then
       begin
        for i1:=i to cross.nhslova-1 do
         begin
          cross.hslova[i1]:=cross.hslova[i1+1];
          cross.hwords[i1]:=cross.hwords[i1+1];
         end;
        dec(cross.nhslova);
       end;
     end;
   end; }
// until listbox1.Items.Count>=cross.nhslova;



//repeat
  if cross.nvslova=listbox2.Items.Count then
   begin
    for i:=1 to cross.nvslova do
     begin
      ch:=true;
      for i1:=0 to ListBox2.Items.count-1 do
       if cross.vslova[i]=copy(ListBox2.Items.Strings[i1],pos(' ',ListBox2.Items.Strings[i1])+1,length(ListBox2.Items.Strings[i1])) then ch:=false;
      if ch then
        for i1:=0 to ListBox2.Items.count-1 do
         begin
          ch:=true;
          for i2:=1 to cross.nvslova do
           if (i2<>i)and(cross.vslova[i2]=copy(ListBox2.Items.Strings[i1],pos(' ',ListBox2.Items.Strings[i1])+1,length(ListBox2.Items.Strings[i1]))) then ch:=false;
          if ch then cross.vslova[i]:=copy(ListBox2.Items.Strings[i1],pos(' ',ListBox2.Items.Strings[i1])+1,length(ListBox2.Items.Strings[i1]));
         end;
     end;
   end;

  if cross.nvslova<listbox2.Items.Count then
   begin
    for i1:=0 to ListBox2.Items.count-1 do
     begin
      ch:=true;
      for i:=1 to cross.nvslova do
       if cross.vslova[i]=copy(ListBox2.Items.Strings[i1],pos(' ',ListBox2.Items.Strings[i1])+1,length(ListBox2.Items.Strings[i1])) then ch:=false;
      if ch then
       begin
        inc(cross.nvslova);
        cross.vslova[cross.nvslova]:=copy(ListBox2.Items.Strings[i1],pos(' ',ListBox2.Items.Strings[i1])+1,length(ListBox2.Items.Strings[i1]));
       end
     end;
   end;
// until listbox2.Items.Count=cross.nvslova;


{ch:=true;
      for t2x:=1 to unit5.cross.nhslova do if unit5.hslova[t2x]=s then ch:=false;
      if ch then
      if copy(s,1,length(s)-1)=unit5.hslova[unit5.cross.nhslova] then unit5.hslova[unit5.cross.nhslova]:=s
      else
       begin
        inc(unit5.cross.nhslova);
        unit5.hslova[unit5.cross.nhslova]:=s;
       end;

ch:=true;
      for t2x:=1 to unit5.cross.nvslova do if unit5.vslova[t2x]=s then ch:=false;
      if ch then
      if copy(s,1,length(s)-1)=unit5.vslova[unit5.cross.nvslova] then unit5.vslova[unit5.cross.nvslova]:=s
      else
       begin
        inc(unit5.cross.nvslova);
        unit5.vslova[unit5.cross.nvslova]:=s;
       end;

 if unit5.cross.nhslova>form5.ListBox1.Items.Count then
  begin
   for t2x:=1 to unit5.cross.nhslova do
    begin
     ch:=true;
     for t1x:=0 to form5.ListBox1.Items.Count-1 do
      if unit5.hslova[t2x]=copy(form5.ListBox1.Items.Strings[t1x],pos(' ',form5.ListBox1.Items.Strings[t1x])+1,length(form5.ListBox1.Items.Strings[t1x])) then ch:=false;
     if ch then
      begin for tt:=t2x to unit5.cross.nhslova-1 do
       begin
        unit5.hslova[tt]:=unit5.hslova[tt+1]; unit5.hwords[tt]:=unit5.hwords[tt+1];
       end;

      end;
    end;
   unit5.hslova[unit5.cross.nhslova]:='';
   unit5.hwords[unit5.cross.nhslova]:='';
   unit5.cross.nhslova:=unit5.cross.nhslova-1;
  end;

 if unit5.cross.nvslova>form5.ListBox2.Items.Count then
  begin
   for t2x:=1 to unit5.cross.nvslova do

     ch:=true;
     for t1x:=0 to form5.ListBox2.Items.Count-1 do
      if inttostr(t1x+1)+'. '+unit5.vslova[t2x]=form5.ListBox2.Items.Strings[t1x] then ch:=false;
     if ch then begin for tt:=t2x to unit5.cross.nvslova-1 do begin unit5.vslova[tt]:=unit5.vslova[tt+1]; unit5.vwords[tt]:=unit5.vwords[tt+1]; end;

    unit5.vslova[unit5.cross.nvslova]:='';
    unit5.vwords[unit5.cross.nvslova]:='';
    unit5.cross.nvslova:=unit5.cross.nvslova-1; end;
   end; }
end;

procedure TForm5.FormShow(Sender: TObject);
begin
 if Left+Width>=screen.Width then
  Left:=screen.Width-Width;
 if top+Height>=screen.Height then
  top:=screen.Height-Height;
end;

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if unit1.canclose then action:=caHide else action:=canone;
end;

end.
