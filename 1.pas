uses graphABC;

var
  y: real; mashtX, mashtY, x0, y0, i1: integer;

var
  l: byte;

function vibor(var v: byte): byte;
begin
  writeln('Да - 1');
  writeln('Нет - 0');
  Write('Выберите вариант: ');
  readln(v);
  vibor := v;
end;

var
  l1: byte;

function viborp(var v: byte): byte;
begin
  textout(10, 130, 'Увеличить x - 1');
  textout(10, 150, 'Увеличить y - 2');
  textout(10, 170, 'Уменьшить x - 3');
  textout(10, 190, 'Уменьшить y - 4');
  textout(10, 220, 'Закончить - 0');
  textout(10, 250, 'Выберите вариант: ');
  readln(v);
  viborp := v;
end;

var
  n, i: integer; a, b, h, x, s, f, d: real;

function f0(var x: real): real;//основная
begin
  var f1: real;
  f1 := 1 * power(x, 3) + (0) * power(x, 2) + (5) * x + (11);
  f0 := f1;
end;

function f2(var x: real): real;//первообразная
begin
  var f3: real;
  f3 := 1 / 4 * power(x, 4) + 5 / 2 * power(x, 2) + 11 * x;
  f2 := f3;
end;

var
  m: integer;

function graf(var p, n1: integer; var s1, s2: real): real; //График
var
  i1, i, w, l, w1: integer; p1,e: real;
begin
  clearwindow;
  MaximizeWindow;
  x0 := windowwidth div 2;
  y0 := windowheight div 2;
  line(0, y0, windowwidth - 11, y0);
  line(x0, 0, x0, windowheight - 11);
  textout(x0 + 5, y0 + 5, '0');
  textout(windowwidth - 10, y0 - 20, 'x');
  textout(x0 + 5, 0, 'y');
  textout(10, 10, 'Найти площадь фигуры ограниченной кривой 1*x^3+(0)*x^2+(5)*x+(11)');
  for i := 1 to 100 do
  begin
    line(x0 + round(i * mashtX), y0 - 3, x0 + round(i * mashtX), y0 + 3);
    line(x0 - round(i * mashtX), y0 - 3, x0 - round(i * mashtX), y0 + 3);
    line(x0 - 3, y0 + round(i * mashtY), x0 + 3, y0 + round(i * mashtY));
    line(x0 - 3, y0 - round(i * mashtY), x0 + 3, y0 - round(i * mashtY));
    textout(x0 + round(i * mashtX), y0 + 10, inttostr(i));
    textout(x0 - round(i * mashtX), y0 + 5, inttostr(i));
    textout(x0 - 25, y0 - round(i * mashtY), inttostr(i));
    textout(x0 - 20, y0 + round(i * mashtY), inttostr(-i));
  end;
  setpencolor(clblue);
  line(x0 + round(s1 * mashtX), 0, x0 + round(s1 * mashtX), windowheight);
  setpencolor(clgreen);
  line(x0 + round(s2 * mashtX), 0, x0 + round(s2 * mashtX), windowheight);
  setpencolor(clblack);
  l := round((x0 + round(s2 * mashtX) - x0 - round(s1 * mashtX)) / n1);
  w := l;
  w1 := 0;
  p1:=(s2-s1)/n1;
  e := x;
  x := a;
  while x <= b do
begin
setpixel(x0 + round(x * mashtX), y0 - round(f0(x) * mashtY), clred);
if (x0 + round(s1 * mashtX)) = (x0 + round(x * mashtX)) then
begin
setpencolor(clRed);
e := x;
var p2:=p1/2+e;
Rectangle(x0 + round(s1 * mashtX), y0 - round(f0(p2) * mashtY), x0 + round(s1 * mashtX + (w + l)), y0);
end;
if (x0 + round(s1 * mashtX + l)) = (x0 + round(x * mashtX)) then
begin
setpencolor(clRed);
e := x;
var p2:=p1/2+e;
for var v := x0 + round(s1 * mashtX) to x0 + round(s2 * mashtX) do
Rectangle(x0 + round(s1 * mashtX + l), y0 - round(f0(p2) * mashtY), x0 + round(s1 * mashtX + (w + l)), y0);
l := l + w;
e := e + l;
inc(w1);
if (w1 + 1) = n1 then
begin
setpencolor(clBlack);
break;
end;
end;
x := x + 0.001;
end;

for i1 := -15000 to 15000 do //Линия
  begin
    x := 0.001 * i1;
    y := f0(x);
    setpixel(x0 + round(mashtX * x), y0 - round(mashtY * y), clRed);
    graf := p;   
  end;
  
end;
function masht: integer;//Маштабирование
begin
  textout(10, 100, 'Увеличить?');
  viborp(l1);
  case l1 of
    1:
      begin
        mashtX := mashtX + 10;
        graf(m, n, a, b);
        masht;
      end;
    2:
      begin
        mashtY := mashtY + 10;
        graf(m, n, a, b);
        masht;
      end;
    3:
      begin
        mashtY := mashtX - 10;
        graf(m, n, a, b);
        masht;
      end;
    4:
      begin
        mashtY := mashtY - 10;
        graf(m, n, a, b);
        masht;
      end;
    0:
      begin
        writeln('Ну ладно');
        exit();
      end;
  end;
  masht := 0
end;


begin
  writeln('Найти площадь фигуры ограниченной кривой 1*x^3+(0)*x^2+(5)*x+(11)');
  writeln('Введите пределы интегрирования a и b при a<b');
  readln(a, b);
  if (a > b) then begin writeln('a не может быть больше b'); exit(); end;
  writeln('Введите количество интервалов разбиения n');
  readln(n);
  h := (b - a) / n;
  x := a + h;
  for i := 0 to n - 1 do
  begin
    f := f0(x);
    S := S + f;
    x := x + h;
  end;
  S := (h * (f0(a) + f0(b))) / 2 + S;
  writeln('S= ', s);
  writeln('Вывести погрешность?');
  vibor(l);
  mashtX := 20;
  mashtY := 20;
  case l of
    1:
      begin
        d := abs((f2(b) - f2(a)) - S);
        writeln('Погрешность= ', d);
      end;
    0: 
      begin
        writeln('Ну и ладно');
      end;
  end;
  
  writeln('Вывести график функций?');
  vibor(l);
  case l of
    1:
      begin
        graf(m, n, a, b); 
      end;
    0: 
      begin
        writeln('Ну ладно');
        exit();
      end;
  end;
  masht;
end.