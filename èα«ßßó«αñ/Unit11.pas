unit Unit11;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Buttons, Spin, ExtCtrls;

type
  TForm11 = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;


implementation
uses unit1,unit2,unit5,unit6,unit10,unit12;
{$R *.dfm}



procedure TForm11.FormShow(Sender: TObject);
begin
 form1.Enabled:=false;
 form2.Enabled:=false;
 form5.Enabled:=false;
 form6.Enabled:=false;
 form10.Enabled:=false;
 if Left+Width>=screen.Width then
  Left:=screen.Width-Width;
 if top+Height>=screen.Height then
  top:=screen.Height-Height;
end;

procedure TForm11.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if unit12.f11canclose then
 begin
  action:=cahide;
  form1.Enabled:=true;
  form2.Enabled:=true;
  form5.Enabled:=true;
  form6.Enabled:=true;
  form10.Enabled:=true;
 end else action:=canone;
end;

end.
