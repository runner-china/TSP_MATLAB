%���캯��  �Ի������㷨
function  Farm=Mutation(Farm,pm)

%����Farm���ڵ�����R ������C
FarmSize=(size(Farm));
R=FarmSize(1);
C=FarmSize(2);

for index=1:R
    
    %���ݱ�����ʣ��ж��Ƿ���б���
    if rand(1)>pm
%         %debug
%         fprintf('\n���ݸ��� ������\n');
%         %debug
        continue; %�������˳����ε�ѭ��
    end
    
    pos=randperm(C-1);%����һ��1��C-1�������
    % pos(1) �� pos(2) ���жԻ�����
    temp=Farm(index,pos(1));
    Farm(index,pos(1))=Farm(index,pos(2));
    Farm(index,pos(2))=temp;
end
