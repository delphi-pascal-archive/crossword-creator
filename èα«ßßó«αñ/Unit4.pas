unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ExtCtrls, Buttons;

type
  TForm4 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    SpinEdit2: TSpinEdit;
    Button4: TButton;
    ComboBox1: TComboBox;
    Label3: TLabel;
    CheckBox1: TCheckBox;
    Panel1: TPanel;
    ColorDialog1: TColorDialog;
    Button3: TBitBtn;
    StaticText1: TStaticText;
    BitBtn1: TBitBtn;
    CheckBox2: TCheckBox;
    procedure SpinEdit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Panel1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  buttonsize,fontsize,stbuttonsize,stfontsize:integer;
  stfont:tfont;
  clr:tcolor;

implementation
uses
 unit2,unit1;
{$R *.dfm}


procedure TForm4.SpinEdit1Change(Sender: TObject);
begin
 Button3.Height:=spinedit1.Value;
 Button3.Width:=spinedit1.Value;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
 if unit1.otgad then CheckBox1.Enabled:=false else CheckBox1.Enabled:=true;
 if checkbox1.Checked then statictext1.Show else statictext1.Hide;
 fontsize:=SpinEdit2.Value;
 buttonsize:=SpinEdit1.Value;
 if Left+Width>=screen.Width then
  Left:=screen.Width-Width;
 if top+Height>=screen.Height then
  top:=screen.Height-Height;
 if form2.AutoSize then CheckBox2.Checked:=true else CheckBox2.Checked:=false;
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
 unit1.canclose:=true;
 if CheckBox2.Checked then form2.AutoSize:=true else form2.AutoSize:=false;
 clr:=panel1.Color;
 Form4.Close;
 FORM2.Close;
 form2.Show;
 form2.Primen(form2.PaintBox1);
 form2.Nomera;
 unit1.canclose:=false;
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
 SpinEdit2.Value:=fontsize;
 SpinEdit1.Value:=buttonsize;
 form4.Close
end;

procedure TForm4.SpinEdit2Change(Sender: TObject);
begin
 button3.Font.Size:=SpinEdit2.Value
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
 panel1.Color:=clsilver;
 clr:=clsilver;
 stbuttonsize:=20;
 stfontsize:=12;
 stfont:=button1.Font;
 combobox1.Items:=screen.Fonts;
 combobox1.Text:=stfont.Name
end;

procedure TForm4.Button4Click(Sender: TObject);
begin
 button3.Font.Color:=clWindowText;
 SpinEdit1.Value:=stbuttonsize;
 SpinEdit2.Value:=stfontsize;
 //combobox1.Text:=stfont.Name;
 combobox1.ItemIndex:=combobox1.Items.IndexOf(stfont.Name);
 button3.Font.Name:=combobox1.Items.Strings[combobox1.ItemIndex];
 panel1.Color:=clsilver;
end;

procedure TForm4.FormActivate(Sender: TObject);
begin
 // form2.Timer1.Enabled:=true
end;

procedure TForm4.ComboBox1Change(Sender: TObject);
begin  
 button3.Font.Name:=combobox1.Items.Strings[combobox1.ItemIndex];
end;

procedure TForm4.Button3Click(Sender: TObject);
begin
button3.Hide;
button3.Show;
end;

procedure TForm4.FormKeyPress(Sender: TObject; var Key: Char);
begin
if (ord(key)>223)and(ord(key)<256) then key:=chr(ord(key)-32);
 if (ord(key)>191)and(ord(key)<255) then button3.Caption:=key;
end;

procedure TForm4.Panel1Click(Sender: TObject);
begin
 if ColorDialog1.Execute then
  panel1.Color:= ColorDialog1.Color;
end;

procedure TForm4.BitBtn1Click(Sender: TObject);
begin
 if ColorDialog1.Execute then
  Button3.Font.Color:= ColorDialog1.Color;
end;

procedure TForm4.CheckBox1Click(Sender: TObject);
begin
 if checkbox1.Checked then statictext1.Show else statictext1.Hide
end;

end.
