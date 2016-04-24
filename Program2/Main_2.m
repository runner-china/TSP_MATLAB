clear %�������
clc %����
close all %�ر�ͼ��
format short g ;%�ı���ʾ��ʽ����ʹ��Ĭ�ϵĿ�ѧ�������ĸ�ʽ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%�������岿��
%�ο����÷���1  N=10 D=40
%�ο����÷���2  N=20 D=150
%�ο����÷���3  N=50 D=200
timer=0.1;%��ʱ��
N=20;%���еĸ���
D=150;%��������
DC=D;%����������
M=200;%Ԥ����Ⱥ��ģ 
pc=0.8;%�������
pm=0.05;%�������


%����һ���������RM RandMetrix  
RM= rand(N,2).*200-100;%���ɵ�����ֵ��-100��+100֮��

%����ʼ�Ľڵ�N��
for i=1:N
        Circle(RM(i,1),RM(i,2));
        hold on;        
end
disp=['������ɽڵ�����' num2str(N)];
title(disp,'fontsize',15,'Color','b');
pause(timer);

%���ɴ��۾���CD
CD=zeros(N);
for i=1:N
    for j=1:N
        CD(i,j)=Distance(RM(i,1),RM(i,2),RM(j,1),RM(j,2));
        
    end   
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%��ʼ����ȺFarm������������ɷ���
Temp2=zeros(M,1);%1�����ڴ�ž���
Temp1=zeros(M,N);%N�����ڴ��·��
for index=1:M %ѭ��M��
Temp1(index,:)=randperm(N);%����һ��1��N�������
end
% ��Ⱥ��ģMΪ����  ���еĸ���N+1Ϊ���� ,���һ�з���Ӧ��
Farm=[Temp1,Temp2];%����ĺϲ�

while 1    %ѭ����1  ��ʼ��ʶ��
% %debug
% FarmSize=(size(Farm));
% R=FarmSize(1);
% fprintf('\n��%.f�ε�����ʼ����Ⱥ�ĸ���%.f\n',D-DC+1,R);
% %debug
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%������Ⱥ������ÿ���������Ӧ��
Farm=AdaptFun(Farm,CD);%������Ӧ�Ⱥ���AdaptFun��������Ӧ��

        %�������  ������ʼ����ÿ�ε�����
        result=min(Farm(:,N+1));%�������еĵ�N+1����Ѱ����Сֵ
        [r,c]=find(Farm(:,N+1)==result);%Ѱ�Ҵ����Сֵ�Ķ�Ӧ�к�
        %�滭·��
        %r���ܳ��ֶ���������ж���⣩����r(1)
        Paint(D,DC,timer,Farm,r(1),RM);
          
        
        


if DC==0  %������������ﵽ��Ԥ��ֵ
    %������ ������·��������·���Ĵ���

    
    break;%��ô����ѭ����1
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ѡ��
Farm=Selection(Farm,M);
% %debug
% FarmSize=(size(Farm));
% R=FarmSize(1);
% fprintf('\nѡ�������������Ⱥ�ĸ���%.f\n',R);
% 
% 
%     result=min(Farm(:,N+1));%�������еĵ�N+1����Ѱ����Сֵ
%     fprintf('\n����·���Ĵ���:\n %.1f',result);
% %debug

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%����
Farm=Crossover(Farm,pc);
% %debug
% FarmSize=(size(Farm));
% R=FarmSize(1);
% fprintf('\n���������������Ⱥ�ĸ���%.f\n',R);
% %debug

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%����
Farm=Mutation(Farm,pm);
% %debug
% FarmSize=(size(Farm));
% R=FarmSize(1);
% fprintf('\n��%.f�ε�����������Ⱥ�ĸ���%.f\n',D-DC+1,R);
% %debug

DC=DC-1; %����������
%������ת����������Ⱥ����һ��
end    %ѭ����1  ������ʶ��

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
msgbox('�����������', 'YYM');



