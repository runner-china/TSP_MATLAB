%画圆的函数，(x0,y0)为圆心的坐标
function  Circle(x0,y0)
alpha=0:pi/50:2*pi;%角度[0,2*pi]
R=1.7;%半径
x=R*cos(alpha);
y=R*sin(alpha);

x=x+x0;
y=y+y0;

plot(x,y)
axis equal
axis([-100 100 -100 100])  %坐标系范围
