function  Paint(D,DC,timer,Farm,row,RM)

%����Farm���ڵ�����R ������C
FarmSize=(size(Farm));
R=FarmSize(1);
C=FarmSize(2);

hold off; %��һ������
%����ʼ�Ľڵ�N��
for i=1:C-1
        Circle(RM(i,1),RM(i,2));
        hold on;%���´λ�ͼ������һ������          
end

%�滭·���߶�
Px=[0,0];%��ŵ�1������2�����x������
Py=[0,0];%��ŵ�1������2�����y������
for i=1:C-1-1
    Px(1)=RM(Farm(row,i),1);
    Px(2)=RM(Farm(row,i+1),1);
    Py(1)=RM(Farm(row,i),2);
    Py(2)=RM(Farm(row,i+1),2);
    plot(Px,Py,'-r'); %��������֮����߶�
    hold on; %���ֻ���
end 
    Px(1)=RM(Farm(row,C-1),1);
    Px(2)=RM(Farm(row,1),1);
    Py(1)=RM(Farm(row,C-1),2);
    Py(2)=RM(Farm(row,1),2);
    plot(Px,Py,'-r'); %��������֮����߶�
    hold on; %���ֻ���
    
%��������
 if D==DC
   disp=['������ɵ�·��' '��ǰ·������Ϊ��' num2str(round(Farm(row,C)))];
   title(disp,'fontsize',15,'Color','b');
 else
   disp=['��' num2str(D-DC) '/' num2str(D) '�ε���    ' '��ǰ����·������Ϊ��' num2str(round(Farm(row,C)))];
   title(disp,'fontsize',15,'Color','b');  
 end
 pause(timer);%��ʱ����ͣ��ʱ��

