%��Բ�ĺ�����(x0,y0)ΪԲ�ĵ�����
function  Circle(x0,y0)
alpha=0:pi/50:2*pi;%�Ƕ�[0,2*pi]
R=1.7;%�뾶
x=R*cos(alpha);
y=R*sin(alpha);

x=x+x0;
y=y+y0;

plot(x,y)
axis equal
axis([-100 100 -100 100])  %����ϵ��Χ
