function  Paint(D,DC,timer,Farm,row,RM)

%计算Farm现在的行数R ，列数C
FarmSize=(size(Farm));
R=FarmSize(1);
C=FarmSize(2);

hold off; %换一个画面
%画初始的节点N个
for i=1:C-1
        Circle(RM(i,1),RM(i,2));
        hold on;%让下次画图保持上一个画面          
end

%绘画路径线段
Px=[0,0];%存放第1个，第2个点的x轴坐标
Py=[0,0];%存放第1个，第2个点的y轴坐标
for i=1:C-1-1
    Px(1)=RM(Farm(row,i),1);
    Px(2)=RM(Farm(row,i+1),1);
    Py(1)=RM(Farm(row,i),2);
    Py(2)=RM(Farm(row,i+1),2);
    plot(Px,Py,'-r'); %画两个点之间的线段
    hold on; %保持画面
end 
    Px(1)=RM(Farm(row,C-1),1);
    Px(2)=RM(Farm(row,1),1);
    Py(1)=RM(Farm(row,C-1),2);
    Py(2)=RM(Farm(row,1),2);
    plot(Px,Py,'-r'); %画两个点之间的线段
    hold on; %保持画面
    
%标题设置
 if D==DC
   disp=['随机生成的路径' '当前路径长度为：' num2str(round(Farm(row,C)))];
   title(disp,'fontsize',15,'Color','b');
 else
   disp=['第' num2str(D-DC) '/' num2str(D) '次迭代    ' '当前最优路径长度为：' num2str(round(Farm(row,C)))];
   title(disp,'fontsize',15,'Color','b');  
 end
 pause(timer);%计时器，停顿时间

