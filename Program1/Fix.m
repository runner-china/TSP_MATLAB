%�޸��ظ�λ�ĺ���
function value=Fix(p,Farm1,Farm2,p1,p2)
%��Farm1��iλ��ʼ̽��



while 1
    
    value=Farm2(p);%�϶����Եõ��Եȵ�ֵ
    
    p=0;
    for i=p1:p2  %���ܵõ�λ��
         if Farm1(i)==value;
                p=i;
                break;%����for
         end   
    end
    if p==0
       break; 
    end

end
