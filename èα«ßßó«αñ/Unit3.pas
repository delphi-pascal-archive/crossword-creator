unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin;

type
  TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  c:char;
implementation
uses unit1,Unit2, Unit5, Unit6, unit7;
{$R *.dfm}

procedure TForm3.Button2Click(Sender: TObject);
begin
 form3.Close
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
 form1.N2.Enabled:=false;
 form2.Close;
 form2.Show;FORM2.OnCreate(FORM2);
 if not unit1.otgad then
 begin
  form5.show;form5.OnCreate(form5);
  form1.BitBtn1.Visible:=true;
  form1.BitBtn2.Visible:=true;
  form1.BitBtn3.Visible:=true;
  form1.N12.Enabled:=true;
  form1.N13.Enabled:=true;
  form1.N14.Enabled:=true;
  form1.N15.Enabled:=true;
  form1.N16.Enabled:=true;
 end else form1.N9.Enabled:=false;
 form1.N5.Enabled:=true;
 form1.N11.Enabled:=true;
 form1.N7.Enabled:=true;
 //form6.show;
 q:=true;
 if Form3.Showing then begin unit2.ppx:=0;unit2.ppy:=0; form2.btcreate(form2); end;
 form3.Close;
end;

procedure TForm3.FormActivate(Sender: TObject);
begin
 //form2.Timer1.Enabled:=true
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 form1.Enabled:=true;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
 if Left+Width>=screen.Width then
  Left:=screen.Width-Width;
 if top+Height>=screen.Height then
  top:=screen.Height-Height;
end;

end.
