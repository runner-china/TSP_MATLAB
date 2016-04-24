%交叉函数  部分匹配交叉算法(PMX)
function  Farm= Crossover(Farm,pc)



%计算Farm现在的行数R ，列数C
FarmSize=(size(Farm));
R=FarmSize(1);
C=FarmSize(2);



%随机生成一个交叉顺序表
CrossList=randperm(R);%生成一个1到R随机序列

%染色体按交叉顺序表进行两两交叉
for index=1:2:R
    if index==R %判断是否到了末尾，防止R是奇数的情况，则最后一个不交叉
        break;% 到了末尾退出整个for循环
    end
    %根据交叉概率，判断是否进行交叉
    if rand(1)>pc
%         %debug
%         fprintf('\n根据概率 不交叉\n');
%         %debug
        continue; %不交叉退出本次的循环
    end
    
    %随机生成两个交叉位点
    CrossPosition=randperm(C-1-2);%生成一个1到C-1随机序列
    %取这个列表的前两个表项中的数字作为交叉位点 p1 p2,保证p1<p2
    if CrossPosition(1)<CrossPosition(2)
    p1=CrossPosition(1)+1;
    p2=CrossPosition(2)+1;
    else
    p2=CrossPosition(1)+1;
    p1=CrossPosition(2)+1;   
    end
    
    

%     %debug
%     fprintf('进行交叉的两个位点：%.f,%.f\n',p1,p2);
%     %debug
    
    
    % 两个染色体进行交叉 
%     %debug
%     fprintf('进行交叉的两个染色体行号为：%.f,%.f\n',CrossList(index),CrossList(index+1));
%     for i=1:C-1
%         fprintf('%.f ',Farm(CrossList(index),i)) 
%     end
%     fprintf('\n');
%     for i=1:C-1
%         fprintf('%.f ',Farm(CrossList(index+1),i)) 
%     end
%     fprintf('\n');
%     %debug
    
    %初始化两个子染色体
    NewFarm1=zeros(1,C);
    NewFarm2=zeros(1,C);
    for i=1:C-1 %先拷贝父染色体
        NewFarm1(i)=Farm(CrossList(index),i);
        NewFarm2(i)=Farm(CrossList(index+1),i);
    end
    
    %交换中间位段
    p=p1;%p指示交换位
    for i=1:p2-p1+1  %循环交换
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
    
    %修补保持解的有效性
  for  i=p1:p2
    for j=1:p1-1  %寻找p1之前有没有重复的节点
        if NewFarm1(i)==NewFarm1(j)
           NewFarm1(j)=Fix(i,NewFarm1,NewFarm2,p1,p2);          
        end
        
        if NewFarm2(i)==NewFarm2(j)
           NewFarm2(j)=Fix(i,NewFarm2,NewFarm1,p1,p2);             
        end
        
    end
    
    for j=p2+1:C-1 %寻找p2之后有没有重复的节点
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
    
    %把交叉生成的子染色体加入到种群Farm
    Farm=[Farm;NewFarm1];%矩阵的合并
    Farm=[Farm;NewFarm2];%矩阵的合并
    
end

