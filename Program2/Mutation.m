%变异函数  对换变异算法
function  Farm=Mutation(Farm,pm)

%计算Farm现在的行数R ，列数C
FarmSize=(size(Farm));
R=FarmSize(1);
C=FarmSize(2);

for index=1:R
    
    %根据变异概率，判断是否进行变异
    if rand(1)>pm
%         %debug
%         fprintf('\n根据概率 不变异\n');
%         %debug
        continue; %不变异退出本次的循环
    end
    
    pos=randperm(C-1);%生成一个1到C-1随机序列
    % pos(1) 与 pos(2) 进行对换变异
    temp=Farm(index,pos(1));
    Farm(index,pos(1))=Farm(index,pos(2));
    Farm(index,pos(2))=temp;
end
