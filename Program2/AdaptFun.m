%适应度函数
%距离就是适应度
function Farm= AdaptFun(Farm,CD) 

%计算Farm现在的行数R ，列数C
FarmSize=(size(Farm));
R=FarmSize(1);
C=FarmSize(2);


%循环计算每一行路径的距离，距离值放在最后一列
for i=1:R
    distance=0;
    for j=1:C-1-1 
        distance=distance+CD(Farm(i,j),Farm(i,j+1));     
    end
    distance=distance+CD(Farm(i,C-1),Farm(i,1));
    Farm(i,C)=distance;
end