%ѡ����     ������ѡ�񷽷�������Ϊ2�ľ�����ģ
function  Farm= Selection(Farm,M)


%����Farm���ڵ�����R ������C
FarmSize=(size(Farm));
R=FarmSize(1);
C=FarmSize(2);

difference=R-M;%������Ⱥ��ģ��Ԥ�����Ⱥ��ģ�Ĳ�

while difference>0
          
        %ѭ����ʵʱ����Farm���ڵ�����R
        FarmSize=(size(Farm));
        R=FarmSize(1);
        
        Temp=randperm(R);%����һ��1��R�������
        a=Temp(1);%�õ��������ظ���������������ҷ�Χ��1��R֮��
        b=Temp(2);%��������������Ϊ�����õ��к�
        
        %�Ƚ���Ӧ��  ����ԽС��Ӧ��Խ�� 
        if(Farm(a,C)>Farm(b,C))
            Farm(a,:)=[]; %ɾ����b��
        else
            Farm(b,:)=[]; %ɾ����a��
        end
        


         difference=difference-1;
    
end