%选择函数     锦标赛选择方法，参数为2的竞赛规模
function  Farm= Selection(Farm,M)


%计算Farm现在的行数R ，列数C
FarmSize=(size(Farm));
R=FarmSize(1);
C=FarmSize(2);

difference=R-M;%现在种群规模与预设的种群规模的差

while difference>0
          
        %循环中实时计算Farm现在的行数R
        FarmSize=(size(Farm));
        R=FarmSize(1);
        
        Temp=randperm(R);%生成一个1到R随机序列
        a=Temp(1);%得到两个不重复的随机整数，并且范围在1—R之间
        b=Temp(2);%这两个整数将作为竞赛用的行号
        
        %比较适应度  距离越小适应度越高 
        if(Farm(a,C)>Farm(b,C))
            Farm(a,:)=[]; %删除第b行
        else
            Farm(b,:)=[]; %删除第a行
        end
        


         difference=difference-1;
    
end