program CanvasWinApi;


// Раздел 1
uses
  Windows,
  Messages;

// Раздел 2
type
tfigur = record
t : integer;  // Тип фигуры
p : integer;  // Угол поворота
r : integer;  // Радиус
x : integer;  // Координата Х
y : integer;  //            У
lin:integer;  // Толщина линии
end;

const maxf=10;               // Максимум фигур по умолчанию
      nr=50;                 // Начальный радиус создаваемых фигур

// Раздел 3
var
HWindow:HWnd;                // Переменная для работы с окном
Msg:TMsg;                    // Содержит данные работы программы
WC:TWndClass;                // Класс окна
F: array[1..maxf] of tfigur; // Массив, содержащий информацию о фигурах
i:integer;
m:integer;                   // Активный элемент
n:integer;                   // Последний из созданных в данный момент
rect: TRect;                 // Переменная, содержащая координаты границ окна



function KObr:tpoint;         // Функция, возвращающая координаты мыши относительно окна программы
var k:tpoint;
begin
 GetCursorPos(k);             // Связываем переменную kursor с координатами мыши, относительно окна
 ScreenToClient(HWindow,k);   // Переводим переменную в систему координат относительно формы
 GetClientRect(Hwindow,rect); // Записываем в переменную rect границы окна

 // Выставление ограничений на случай, если курсор мыши будет за пределами формы во время нажатия клавиши создания фигуры
 if k.X > rect.Right then k.X:=rect.Right-F[m].r;
 if k.Y > rect.Bottom then k.Y:=rect.Bottom-F[m].r;

 if k.X < 0 then k.X:=F[m].R;
 if k.Y < 0 then k.Y:=F[m].R;
result:=k;
end;


function WindowProc(HWindow: HWnd; Message: UINT; WParam, LParam:Longint):Longint; stdcall;   //функция, обрабатывающая сообщение ОС: Message
var
DC: HDC;           // Переменная - дескриптор
PS: TPaintStruct;  // Переменная для связи дескриптора с фунциями рисования
pen,pen_tmp: HPEN; // Переменные, содержащие информацию об объекте карандаш


begin
result:=0;


case Message of
WM_PAINT :       //Обработчик перерисовки окна
begin
// 2-1

// Получение дескриптора контекста устройства
DC:= BeginPaint(HWindow,PS);

for i:=1 to n do    //Цикл прорисовки для всех фигур
begin
//Создание объекта "карандаш"
if F[i].lin = 1 then
pen:=CreatePen(PS_SOLID,1,RGB($00,$00,$00))
else if F[i].lin = 2 then
pen:=CreatePen(PS_SOLID,2,RGB($00,$00,$00));

// Выбор сохраненного объекта в контекст и сохранение предыдущего объекта
pen_tmp:=SelectObject(DC,pen);
// Рисование


 if F[i].t=1 then
 begin
 // Треугольник

MoveToEx(DC,round(F[i].R*cos((90-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((90-F[i].p)*(pi/180))),nil);
LineTo(DC,round(F[i].R*cos((210-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((210-F[i].p)*(pi/180))));
LineTo(DC,round(F[i].R*cos((330-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((330-F[i].p)*(pi/180))));
LineTo(DC,round(F[i].R*cos((90-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((90-F[i].p)*(pi/180))));
 end;
 if F[i].t=2 then
 begin
 //Шестиугольник
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
 // Пятиугольник
MoveToEx(DC,round(F[i].R*cos((0-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((0-F[i].p)*(pi/180))),nil);
LineTo(DC,round(F[i].R*cos((60-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((60-F[i].p)*(pi/180))));
LineTo(DC,round(F[i].R*cos((120-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((120-F[i].p)*(pi/180))));
LineTo(DC,round(F[i].R*cos((180-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((180-F[i].p)*(pi/180))));
LineTo(DC,round(F[i].R*cos((270-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((270-F[i].p)*(pi/180))));
LineTo(DC,round(F[i].R*cos((0-F[i].p)*(pi/180)))+F[i].x,F[i].y-round(F[i].R*sin((360-F[i].p)*(pi/180))));
end;

//Восстановление объектов
SelectObject(DC,pen_tmp);

end;



//Освобождение контекста
EndPaint(DC,ps);

end;

WM_LBUTTONDOWN :          // Обработчик нажатия левой кнопки мыши
begin
//2-2


F[m].x:=loword(lparam);   // Присвоение текущих координат X
F[m].y:=hiword(lparam);   // Присвоение текущих координат Y

GetClientRect(HWindow,rect);         // Формирование рабочей части окна
InvalidateRect(Hwindow,@rect,true);  // Получение области обновления
UpdateWindow(HWindow);               // Обновление окна
end;
WM_KEYDOWN :      // Обработчик нажатия клавиши
begin
Case wparam of
81:               // 81 = q Создание треугольника
  begin
  F[m].lin:=1;    // Устанавливаем толщину элемента, который был активен перед нажатием клавиши 1 пиксель
  if n<maxf then  // Добавляем максимальное кол-во фигур, если их меньше предельно допустимого
  n:=n+1
  else n:=maxf;
  m:=n;           // Делаем последний элемент текущим
  F[m].t:=1;      // Устанавливем тип фигуры, для прорисовки треугольника
  F[m].R:=nr;     // Устанавливаем начальный радиус

  F[m].x:=KObr.X; // Присваиваем координатам центры фигуры текущие координаты мыши
  F[m].y:=KObr.Y;
  F[m].lin:=2;    // Ставим толщину активной фигуры 2 пикселя
  end;

69 :              // 69 = e Создание шестиугольника, код такой же, как для треугольника (за исключением свойства типа фигуры)
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

87 :              // 87 = w  Создание пятиугольника, код аналогичен
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


VK_UP :                         // Поворот активной фигуры по часовой стрелке по нажатию стрелки вверх
  F[m].p:=F[m].p+10;
VK_DOWN :                       // Поворот против часовой стрелке, по нажатию стрелки вниз
  F[m].p:=F[m].p-10;

90 : if F[m].R < 200 then       // z = Увеличение активной фигуры
 F[m].R:=F[m].R+5;

88 : if F[m].R > 20 then        // x = Уменьшение
 F[m].R:=F[m].R-5;

37 :                            // 37 = Стрелка влево, делает активной фигуру, стоящую по счету перед текущей

  if m > 1 then
  begin
  F[m].lin:=1;
  m:=m-1;
  F[m].lin:=2;
  end;

39 :                            // 39 = Стрелка вправо, делает активной фигуру, стоящую по счету после текущей
    if m < n then               // Проверка на то что активная фигура не последнияя
    begin
    F[m].lin:=1;
    m:=m+1;
    F[m].lin:=2;
    end;

VK_DELETE :                     // Удаление активной фигуры

   if m > 0 then                // Если на форме есть активная фигура, выполнять код
     begin
     F[m].t:=0;                 // Убираем активную фигуру невидимой, убираем выделение
     F[m].lin:=1;
     for i:=m to n do           // Сдвигаем массив, устраняя пробел на месте активной фигуры
     F[i]:=F[i+1];
     n:=n-1;                    // Убираем последний элемент
     m:=n;                      // Ставим фокус на новом последнем элементе
     if m > 0 then F[m].lin:=2; // Ставим выделение на новом, ненулевом элементе
     end;
end;





GetClientRect(HWindow,rect);         // Формирование рабочей части окна
InvalidateRect(Hwindow,@rect,true);  // Получение области обновления
UpdateWindow(HWindow);               // Обновление окна
end;

WM_DESTROY :
 PostQuitMessage(0);                 // Отправка сообщения windows о уничтожении окна
else
  result := DefWindowProc(HWindow, Message, WParam, LParam);  // Обрабатываем сообщение по умолчанию
end;
end;



begin
// Раздел 4

WC.lpszClassName :='WinApiClass';                // Имя класса окна
WC.lpfnWndProc   :=@WindowProc;                  // Адрес оконной процедуры
WC.style         :=CS_VREDRAW;                   // Стиль окна
WC.hInstance     :=hInstance;                    // Идентификатор программы, регистрирующий класс окна
WC.hIcon         :=0;                            // Пиктограмма, связанная с окном
WC.hCursor       :=0;                            // Курсор
WC.hbrBackground :=1;                            // Фон окна
WC.lpszMenuName  :=nil;                          // Меню, связанное с окном
WC.cbClsExtra    :=0;                            // Кол-во дополнительных данных, присоединяемых к классу
WC.cbWndExtra    :=0;                            // Кол-во дополнительных данных, присоединяемых к окну

RegisterClass(wc);                               // регистрация класса окна

// Раздел 5
hWindow:=CreateWindowEx(WS_EX_WINDOWEDGE,    // Стиль окна
                        'WinApiClass',       // Имя класса окна
                        'Редактор',          // Имя окна (caption)
                        WS_VISIBLE or
                        WS_OVERLAPPEDWINDOW, // Параметры стиля окна - окно видимо, окно имеет комплекс флагов
                                             // позволяющих менять размер, сворачивать и закрывать окно.
                        CW_USEDEFAULT, 0,    // Положение окна
                        CW_USEDEFAULT, 0,    // Ширина, высота
                        0, 0,                // Неиспользуемые параметры
                        hInstance,           // Идентификатор программы создающей окно
                        nil);                // Пустой указатель

ShowWindow(Hwindow,CmdShow);                 // Отобразить окно
UpdateWindow(HWindow);                       // Обновить окно


//раздел 6
while GetMessage(Msg, 0, 0, 0) do begin      // Пока не считается сообщение о выходе
TranslateMessage(Msg);                       // Пеpеводит комбинацию WM_KeyDown в код, понятный Windows в и напpавляет символьное сообщение в очеpедь пpикладной задачи.
DispatchMessage(Msg);                        // Пеpедает в Msg сообщение оконной функции окна.
end;

end.
