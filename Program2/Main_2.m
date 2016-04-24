clear %清理变量
clc %清屏
close all %关闭图像
format short g ;%改变显示格式，不使用默认的科学计数法的格式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%参数定义部分
%参考设置方案1  N=10 D=40
%参考设置方案2  N=20 D=150
%参考设置方案3  N=50 D=200
timer=0.1;%定时器
N=20;%城市的个数
D=150;%迭代次数
DC=D;%迭代计数器
M=200;%预设种群规模 
pc=0.8;%交叉概率
pm=0.05;%变异概率


%生成一个随机矩阵RM RandMetrix  
RM= rand(N,2).*200-100;%生成的坐标值在-100至+100之间

%画初始的节点N个
for i=1:N
        Circle(RM(i,1),RM(i,2));
        hold on;        
end
disp=['随机生成节点数：' num2str(N)];
title(disp,'fontsize',15,'Color','b');
pause(timer);

%生成代价矩阵CD
CD=zeros(N);
for i=1:N
    for j=1:N
        CD(i,j)=Distance(RM(i,1),RM(i,2),RM(j,1),RM(j,2));
        
    end   
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%初始化种群Farm，采用随机生成方法
Temp2=zeros(M,1);%1列用于存放距离
Temp1=zeros(M,N);%N列用于存放路径
for index=1:M %循环M次
Temp1(index,:)=randperm(N);%生成一个1到N随机序列
end
% 种群规模M为行数  城市的个数N+1为列数 ,最后一列放适应度
Farm=[Temp1,Temp2];%矩阵的合并

while 1    %循环体1  开始标识符
% %debug
% FarmSize=(size(Farm));
% R=FarmSize(1);
% fprintf('\n第%.f次迭代开始，种群的个数%.f\n',D-DC+1,R);
% %debug
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%评价种群，计算每个个体的适应度
Farm=AdaptFun(Farm,CD);%调用适应度函数AdaptFun，生成适应度

        %界面输出  包括初始化后、每次迭代后
        result=min(Farm(:,N+1));%在所有行的第N+1列中寻找最小值
        [r,c]=find(Farm(:,N+1)==result);%寻找存放最小值的对应行号
        %绘画路径
        %r可能出现多行情况（有多个解），故r(1)
        Paint(D,DC,timer,Farm,r(1),RM);
          
        
        


if DC==0  %如果迭代次数达到了预设值
    %输出结果 ：最优路径、最优路径的代价

    
    break;%那么跳出循环体1
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%选择
Farm=Selection(Farm,M);
% %debug
% FarmSize=(size(Farm));
% R=FarmSize(1);
% fprintf('\n选择操作结束，种群的个数%.f\n',R);
% 
% 
%     result=min(Farm(:,N+1));%在所有行的第N+1列中寻找最小值
%     fprintf('\n最优路径的代价:\n %.1f',result);
% %debug

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%交叉
Farm=Crossover(Farm,pc);
% %debug
% FarmSize=(size(Farm));
% R=FarmSize(1);
% fprintf('\n交叉操作结束，种群的个数%.f\n',R);
% %debug

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%变异
Farm=Mutation(Farm,pm);
% %debug
% FarmSize=(size(Farm));
% R=FarmSize(1);
% fprintf('\n第%.f次迭代结束，种群的个数%.f\n',D-DC+1,R);
% %debug

DC=DC-1; %迭代计数器
%重新跳转到“评价种群”这一步
end    %循环体1  结束标识符

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
msgbox('程序运行完毕', 'YYM');



