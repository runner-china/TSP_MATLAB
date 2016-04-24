%修复重复位的函数
function value=Fix(p,Farm1,Farm2,p1,p2)
%从Farm1的i位开始探索



while 1
    
    value=Farm2(p);%肯定可以得到对等的值
    
    p=0;
    for i=p1:p2  %可能得到位置
         if Farm1(i)==value;
                p=i;
                break;%跳出for
         end   
    end
    if p==0
       break; 
    end

end
