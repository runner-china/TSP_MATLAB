%���溯��  ����ƥ�佻���㷨(PMX)
function  Farm= Crossover(Farm,pc)



%����Farm���ڵ�����R ������C
FarmSize=(size(Farm));
R=FarmSize(1);
C=FarmSize(2);



%�������һ������˳���
CrossList=randperm(R);%����һ��1��R�������

%Ⱦɫ�尴����˳��������������
for index=1:2:R
    if index==R %�ж��Ƿ���ĩβ����ֹR������������������һ��������
        break;% ����ĩβ�˳�����forѭ��
    end
    %���ݽ�����ʣ��ж��Ƿ���н���
    if rand(1)>pc
%         %debug
%         fprintf('\n���ݸ��� ������\n');
%         %debug
        continue; %�������˳����ε�ѭ��
    end
    
    %���������������λ��
    CrossPosition=randperm(C-1-2);%����һ��1��C-1�������
    %ȡ����б��ǰ���������е�������Ϊ����λ�� p1 p2,��֤p1<p2
    if CrossPosition(1)<CrossPosition(2)
    p1=CrossPosition(1)+1;
    p2=CrossPosition(2)+1;
    else
    p2=CrossPosition(1)+1;
    p1=CrossPosition(2)+1;   
    end
    
    

%     %debug
%     fprintf('���н��������λ�㣺%.f,%.f\n',p1,p2);
%     %debug
    
    
    % ����Ⱦɫ����н��� 
%     %debug
%     fprintf('���н��������Ⱦɫ���к�Ϊ��%.f,%.f\n',CrossList(index),CrossList(index+1));
%     for i=1:C-1
%         fprintf('%.f ',Farm(CrossList(index),i)) 
%     end
%     fprintf('\n');
%     for i=1:C-1
%         fprintf('%.f ',Farm(CrossList(index+1),i)) 
%     end
%     fprintf('\n');
%     %debug
    
    %��ʼ��������Ⱦɫ��
    NewFarm1=zeros(1,C);
    NewFarm2=zeros(1,C);
    for i=1:C-1 %�ȿ�����Ⱦɫ��
        NewFarm1(i)=Farm(CrossList(index),i);
        NewFarm2(i)=Farm(CrossList(index+1),i);
    end
    
    %�����м�λ��
    p=p1;%pָʾ����λ
    for i=1:p2-p1+1  %ѭ������
        t= NewFarm1(p);
        NewFarm1(p)=NewFarm2(p);
        NewFarm2(p)=t;
        p=p+1;
    end
    
%     %debug      
%      fprintf('\n-----------------\n');
%     for i=1:C-1
%         fprintf('%.f ',NewFarm1(i)) 
%     end
%     fprintf('\n');
%     for i=1:C-1
%         fprintf('%.f ',NewFarm2(i)) 
%     end
%     fprintf('\n');
%     %debug
%     
    
    %�޲����ֽ����Ч��
  for  i=p1:p2
    for j=1:p1-1  %Ѱ��p1֮ǰ��û���ظ��Ľڵ�
        if NewFarm1(i)==NewFarm1(j)
           NewFarm1(j)=Fix(i,NewFarm1,NewFarm2,p1,p2);          
        end
        
        if NewFarm2(i)==NewFarm2(j)
           NewFarm2(j)=Fix(i,NewFarm2,NewFarm1,p1,p2);             
        end
        
    end
    
    for j=p2+1:C-1 %Ѱ��p2֮����û���ظ��Ľڵ�
        if NewFarm1(i)==NewFarm1(j)
           NewFarm1(j)=Fix(i,NewFarm1,NewFarm2,p1,p2);          
        end
        
        if NewFarm2(i)==NewFarm2(j)
           NewFarm2(j)=Fix(i,NewFarm2,NewFarm1,p1,p2);             
        end
        
        
    end
  end 

%     %debug      
%     fprintf('\n-----------------\n');
%     for i=1:C-1
%         fprintf('%.f ',NewFarm1(i)) 
%     end
%     fprintf('\n');
%     for i=1:C-1
%         fprintf('%.f ',NewFarm2(i)) 
%     end
%     fprintf('\n');
%     %debug
    
    %�ѽ������ɵ���Ⱦɫ����뵽��ȺFarm
    Farm=[Farm;NewFarm1];%����ĺϲ�
    Farm=[Farm;NewFarm2];%����ĺϲ�
    
end

