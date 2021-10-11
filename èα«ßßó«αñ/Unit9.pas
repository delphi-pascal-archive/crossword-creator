unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin;

type
  TForm9 = class(TForm)
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    SpinEdit2: TSpinEdit;
    Button1: TButton;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation
 uses unit1, unit2;
{$R *.dfm}

procedure TForm9.FormShow(Sender: TObject);
var
 t1,t2:integer;
begin
 if Left+Width>=screen.Width then
  Left:=screen.Width-Width;
 if top+Height>=screen.Height then
  top:=screen.Height-Height;
if unit2.i>1 then
begin
 t1:=-1;t2:=0;
 repeat
  if t1=cross.stg then begin inc(t2);t1:=0;end;
  inc(t1);
 until ord(cross.crswrd[t1,t2])>191;
 spinedit2.MinValue:=0-t2;
 t1:=0;t2:=-1;
 repeat
  if t2=cross.stv then begin inc(t1);t2:=0;end;
  inc(t2);
 until ord(cross.crswrd[t1,t2])>191;
 spinedit1.MinValue:=(0-t1);
 spinedit1.Value:=spinedit1.MinValue+1;
 spinedit2.Value:=spinedit2.MinValue+1
end else //form9.Close
end;

procedure TForm9.Button2Click(Sender: TObject);
begin
form9.Close
end;

procedure TForm9.Button1Click(Sender: TObject);
begin
 form9.Close;
 form2.crsmeshenie;

end;

end.
