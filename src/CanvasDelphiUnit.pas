unit CanvasDelphiUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFigur = record
  x,y,R,t,p:integer;
  lin: integer;
  end;
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  const Max_f=10;
  var
  t:integer;
  i:integer;
  Form1: TForm1;
  F:array[1..Max_f] of TFigur;
  n,m:integer;

implementation

{$R *.dfm}


procedure TForm1.FormCreate(Sender: TObject);

begin
for i:=1 to Max_F do
F[i].t:=0;
N:=0;
M:=0;
t:=1;

end;

Procedure Draw(fg:Tfigur);

begin

if Fg.t=4 then
Form1.Canvas.Pen.Color:= RGB(208,212,200);
 if Fg.t=1 then
 begin
 //треугольник
Form1.Canvas.MoveTo(round(F[i].R*cos((90-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((90-F[i].p)*(pi/180))));
Form1.Canvas.LineTo(round(F[i].R*cos((210-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((210-F[i].p)*(pi/180))));
Form1.Canvas.LineTo(round(F[i].R*cos((330-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((330-F[i].p)*(pi/180))));
Form1.Canvas.LineTo(round(F[i].R*cos((90-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((90-F[i].p)*(pi/180))));
 end;
 if Fg.t=2 then
 begin
 //шестиугольник
Form1.Canvas.MoveTo(round(F[i].R*cos((0-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((0-F[i].p)*(pi/180))));
Form1.Canvas.LineTo(round(F[i].R*cos((60-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((60-F[i].p)*(pi/180))));
Form1.Canvas.LineTo(round(F[i].R*cos((120-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((120-F[i].p)*(pi/180))));
Form1.Canvas.LineTo(round(F[i].R*cos((180-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((180-F[i].p)*(pi/180))));
Form1.Canvas.LineTo(round(F[i].R*cos((240-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((240-F[i].p)*(pi/180))));
Form1.Canvas.LineTo(round(F[i].R*cos((300-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((300-F[i].p)*(pi/180))));
Form1.Canvas.LineTo(round(F[i].R*cos((0-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((360-F[i].p)*(pi/180))));
 end;
 if Fg.t=3 then
 begin
 //пятиугольник
Form1.Canvas.MoveTo(round(F[i].R*cos((0-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((0-F[i].p)*(pi/180))));
Form1.Canvas.LineTo(round(F[i].R*cos((60-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((60-F[i].p)*(pi/180))));
Form1.Canvas.LineTo(round(F[i].R*cos((120-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((120-F[i].p)*(pi/180))));
Form1.Canvas.LineTo(round(F[i].R*cos((180-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((180-F[i].p)*(pi/180))));
Form1.Canvas.LineTo(round(F[i].R*cos((270-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((270-F[i].p)*(pi/180))));
Form1.Canvas.LineTo(round(F[i].R*cos((0-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((360-F[i].p)*(pi/180))));


 end;
end;
 procedure TForm1.FormPaint(Sender: TObject);
 begin
 for i:=1 to Max_f do
  begin
  if F[i].t <> 0 then
  Draw(F[i]);

  end;
end;
procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=85 then //u = povorot
  F[m].p:=F[m].p+5;

 if key=90 then // z = zoom
  if F[m].R < 400
  then  F[m].R:=F[m].R+10;

 if key=88 then //x = otdalenie
  if F[m].R > 10
  then F[m].R:=F[m].R-10;

 if key=87 then //w -treugol`nik
  begin

   F[m]:=F[n];

   if n<10 then
   n:=n+1
   else n:=10;

   m:=n;
   F[m].t:=1;

   F[m].R:=Random(30)+50;
   F[m].x:=Random(Form1.Width-200)+100;
   F[m].y:=Random(Form1.Height-150)+100;

   end;

 if key=81 then //q - 6ugol`nik
  begin
   F[m]:=F[n];
   if n<10 then
   n:=n+1
   else n:=10;
   m:=n;
   F[m].t:=2;
   F[m].R:=Random(30)+50;
   F[m].x:=Random(Form1.Width-200)+100;
   F[m].y:=Random(Form1.Height-150)+100;
   F[m].lin:=Form1.Canvas.Pen.Width+1;
  end;
 if key=69 then //e - 5ugol`nik
   begin
   F[m]:=F[n];
   if n<10 then
   n:=n+1
   else n:=10;
   m:=n;
   F[m].t:=3;
   F[m].R:=Random(30)+50;
   F[m].x:=Random(Form1.Width-200)+100;
   F[m].y:=Random(Form1.Height-150)+100;
   F[m].lin:=Form1.Canvas.Pen.Width+1;
   end;
 if key=37 then
  begin
  if n > 1 then
  m:=m-1;
  end;
 if key=39 then
  begin
  if m+1 <= n then
  m:=m+1;
  end;
Form1.Repaint;
end;
procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if Button = mbleft then
  begin
  F[m].x:=x;
  F[m].y:=y;
  end;
Form1.Repaint;
end;

end.
