%��Ӧ�Ⱥ���
%���������Ӧ��
function Farm= AdaptFun(Farm,CD) 

%����Farm���ڵ�����R ������C
FarmSize=(size(Farm));
R=FarmSize(1);
C=FarmSize(2);


%ѭ������ÿһ��·���ľ��룬����ֵ�������һ��
for i=1:R
    distance=0;
    for j=1:C-1-1 
        distance=distance+CD(Farm(i,j),Farm(i,j+1));     
    end
    distance=distance+CD(Farm(i,C-1),Farm(i,1));
    Farm(i,C)=distance;
end