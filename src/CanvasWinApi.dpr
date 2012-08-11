program CanvasWinApi;


// ������ 1
uses
  Windows,
  Messages;

// ������ 2
type
tfigur = record
t : integer;  // ��� ������
p : integer;  // ���� ��������
r : integer;  // ������
x : integer;  // ���������� �
y : integer;  //            �
lin:integer;  // ������� �����
end;

const maxf=10;               // �������� ����� �� ���������
      nr=50;                 // ��������� ������ ����������� �����

// ������ 3
var
HWindow:HWnd;                // ���������� ��� ������ � �����
Msg:TMsg;                    // �������� ������ ������ ���������
WC:TWndClass;                // ����� ����
F: array[1..maxf] of tfigur; // ������, ���������� ���������� � �������
i:integer;
m:integer;                   // �������� �������
n:integer;                   // ��������� �� ��������� � ������ ������
rect: TRect;                 // ����������, ���������� ���������� ������ ����



function KObr:tpoint;         // �������, ������������ ���������� ���� ������������ ���� ���������
var k:tpoint;
begin
 GetCursorPos(k);             // ��������� ���������� kursor � ������������ ����, ������������ ����
 ScreenToClient(HWindow,k);   // ��������� ���������� � ������� ��������� ������������ �����
 GetClientRect(Hwindow,rect); // ���������� � ���������� rect ������� ����

 // ����������� ����������� �� ������, ���� ������ ���� ����� �� ��������� ����� �� ����� ������� ������� �������� ������
 if k.X > rect.Right then k.X:=rect.Right-F[m].r;
 if k.Y > rect.Bottom then k.Y:=rect.Bottom-F[m].r;

 if k.X < 0 then k.X:=F[m].R;
 if k.Y < 0 then k.Y:=F[m].R;
result:=k;
end;


function WindowProc(HWindow: HWnd; Message: UINT; WParam, LParam:Longint):Longint; stdcall;   //�������, �������������� ��������� ��: Message
var
DC: HDC;           // ���������� - ����������
PS: TPaintStruct;  // ���������� ��� ����� ����������� � �������� ���������
pen,pen_tmp: HPEN; // ����������, ���������� ���������� �� ������� ��������


begin
result:=0;


case Message of
WM_PAINT :       //���������� ����������� ����
begin
// 2-1

// ��������� ����������� ��������� ����������
DC:= BeginPaint(HWindow,PS);

for i:=1 to n do    //���� ���������� ��� ���� �����
begin
//�������� ������� "��������"
if F[i].lin = 1 then
pen:=CreatePen(PS_SOLID,1,RGB($00,$00,$00))
else if F[i].lin = 2 then
pen:=CreatePen(PS_SOLID,2,RGB($00,$00,$00));

// ����� ������������ ������� � �������� � ���������� ����������� �������
pen_tmp:=SelectObject(DC,pen);
// ���������


 if F[i].t=1 then
 begin
 // �����������

MoveToEx(DC,round(F[i].R*cos((90-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((90-F[i].p)*(pi/180))),nil);
LineTo(DC,round(F[i].R*cos((210-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((210-F[i].p)*(pi/180))));
LineTo(DC,round(F[i].R*cos((330-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((330-F[i].p)*(pi/180))));
LineTo(DC,round(F[i].R*cos((90-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((90-F[i].p)*(pi/180))));
 end;
 if F[i].t=2 then
 begin
 //�������������
MoveToEx(DC,round(F[i].R*cos((0-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((0-F[i].p)*(pi/180))),nil);
LineTo(DC,round(F[i].R*cos((60-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((60-F[i].p)*(pi/180))));
LineTo(DC,round(F[i].R*cos((120-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((120-F[i].p)*(pi/180))));
LineTo(DC,round(F[i].R*cos((180-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((180-F[i].p)*(pi/180))));
LineTo(DC,round(F[i].R*cos((240-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((240-F[i].p)*(pi/180))));
LineTo(DC,round(F[i].R*cos((300-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((300-F[i].p)*(pi/180))));
LineTo(DC,round(F[i].R*cos((0-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((360-F[i].p)*(pi/180))));
 end;
 if F[i].t=3 then
 begin
 // ������������
MoveToEx(DC,round(F[i].R*cos((0-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((0-F[i].p)*(pi/180))),nil);
LineTo(DC,round(F[i].R*cos((60-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((60-F[i].p)*(pi/180))));
LineTo(DC,round(F[i].R*cos((120-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((120-F[i].p)*(pi/180))));
LineTo(DC,round(F[i].R*cos((180-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((180-F[i].p)*(pi/180))));
LineTo(DC,round(F[i].R*cos((270-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((270-F[i].p)*(pi/180))));
LineTo(DC,round(F[i].R*cos((0-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((360-F[i].p)*(pi/180))));
end;

//�������������� ��������
SelectObject(DC,pen_tmp);

end;



//������������ ���������
EndPaint(DC,ps);

end;

WM_LBUTTONDOWN :          // ���������� ������� ����� ������ ����
begin
//2-2


F[m].x:=loword(lparam);   // ���������� ������� ��������� X
F[m].y:=hiword(lparam);   // ���������� ������� ��������� Y

GetClientRect(HWindow,rect);         // ������������ ������� ����� ����
InvalidateRect(Hwindow,@rect,true);  // ��������� ������� ����������
UpdateWindow(HWindow);               // ���������� ����
end;
WM_KEYDOWN :      // ���������� ������� �������
begin
Case wparam of
81:               // 81 = q �������� ������������
  begin
  F[m].lin:=1;    // ������������� ������� ��������, ������� ��� ������� ����� �������� ������� 1 �������
  if n<maxf then  // ��������� ������������ ���-�� �����, ���� �� ������ ��������� �����������
  n:=n+1
  else n:=maxf;
  m:=n;           // ������ ��������� ������� �������
  F[m].t:=1;      // ������������ ��� ������, ��� ���������� ������������
  F[m].R:=nr;     // ������������� ��������� ������

  F[m].x:=KObr.X; // ����������� ����������� ������ ������ ������� ���������� ����
  F[m].y:=KObr.Y;
  F[m].lin:=2;    // ������ ������� �������� ������ 2 �������
  end;

69 :              // 69 = e �������� ��������������, ��� ����� ��, ��� ��� ������������ (�� ����������� �������� ���� ������)
  begin
  F[m].lin:=1;
  if n<maxf then
  n:=n+1
  else n:=maxf;
  m:=n;
  F[m].t:=2;
  F[m].R:=nr;
  F[m].x:=KObr.X;
  F[m].y:=KObr.Y;
  F[m].lin:=2;
  end;

87 :              // 87 = w  �������� �������������, ��� ����������
   begin
   F[m].lin:=1;
   if n<maxf then
   n:=n+1
   else n:=maxf;
   m:=n;
   F[m].t:=3;
   F[m].R:=nr;
   F[m].x:=KObr.X;
   F[m].y:=KObr.Y;
   F[m].lin:=2;
   end;


VK_UP :                         // ������� �������� ������ �� ������� ������� �� ������� ������� �����
  F[m].p:=F[m].p+10;
VK_DOWN :                       // ������� ������ ������� �������, �� ������� ������� ����
  F[m].p:=F[m].p-10;

90 : if F[m].R < 200 then       // z = ���������� �������� ������
 F[m].R:=F[m].R+5;

88 : if F[m].R > 20 then        // x = ����������
 F[m].R:=F[m].R-5;

37 :                            // 37 = ������� �����, ������ �������� ������, ������� �� ����� ����� �������

  if m > 1 then
  begin
  F[m].lin:=1;
  m:=m-1;
  F[m].lin:=2;
  end;

39 :                            // 39 = ������� ������, ������ �������� ������, ������� �� ����� ����� �������
    if m < n then               // �������� �� �� ��� �������� ������ �� ����������
    begin
    F[m].lin:=1;
    m:=m+1;
    F[m].lin:=2;
    end;

VK_DELETE :                     // �������� �������� ������

   if m > 0 then                // ���� �� ����� ���� �������� ������, ��������� ���
     begin
     F[m].t:=0;                 // ������� �������� ������ ���������, ������� ���������
     F[m].lin:=1;
     for i:=m to n do           // �������� ������, �������� ������ �� ����� �������� ������
     F[i]:=F[i+1];
     n:=n-1;                    // ������� ��������� �������
     m:=n;                      // ������ ����� �� ����� ��������� ��������
     if m > 0 then F[m].lin:=2; // ������ ��������� �� �����, ��������� ��������
     end;
end;





GetClientRect(HWindow,rect);         // ������������ ������� ����� ����
InvalidateRect(Hwindow,@rect,true);  // ��������� ������� ����������
UpdateWindow(HWindow);               // ���������� ����
end;

WM_DESTROY :
 PostQuitMessage(0);                 // �������� ��������� windows � ����������� ����
else
  result := DefWindowProc(HWindow, Message, WParam, LParam);  // ������������ ��������� �� ���������
end;
end;



begin
// ������ 4

WC.lpszClassName :='WinApiClass';                // ��� ������ ����
WC.lpfnWndProc   :=@WindowProc;                  // ����� ������� ���������
WC.style         :=CS_VREDRAW;                   // ����� ����
WC.hInstance     :=hInstance;                    // ������������� ���������, �������������� ����� ����
WC.hIcon         :=0;                            // �����������, ��������� � �����
WC.hCursor       :=0;                            // ������
WC.hbrBackground :=1;                            // ��� ����
WC.lpszMenuName  :=nil;                          // ����, ��������� � �����
WC.cbClsExtra    :=0;                            // ���-�� �������������� ������, �������������� � ������
WC.cbWndExtra    :=0;                            // ���-�� �������������� ������, �������������� � ����

RegisterClass(wc);                               // ����������� ������ ����

// ������ 5
hWindow:=CreateWindowEx(WS_EX_WINDOWEDGE,    // ����� ����
                        'WinApiClass',       // ��� ������ ����
                        '��������',          // ��� ���� (caption)
                        WS_VISIBLE or
                        WS_OVERLAPPEDWINDOW, // ��������� ����� ���� - ���� ������, ���� ����� �������� ������
                                             // ����������� ������ ������, ����������� � ��������� ����.
                        CW_USEDEFAULT, 0,    // ��������� ����
                        CW_USEDEFAULT, 0,    // ������, ������
                        0, 0,                // �������������� ���������
                        hInstance,           // ������������� ��������� ��������� ����
                        nil);                // ������ ���������

ShowWindow(Hwindow,CmdShow);                 // ���������� ����
UpdateWindow(HWindow);                       // �������� ����


//������ 6
while GetMessage(Msg, 0, 0, 0) do begin      // ���� �� ��������� ��������� � ������
TranslateMessage(Msg);                       // ��p������ ���������� WM_KeyDown � ���, �������� Windows � � ���p������ ���������� ��������� � ���p��� �p�������� ������.
DispatchMessage(Msg);                        // ��p����� � Msg ��������� ������� ������� ����.
end;

end.
