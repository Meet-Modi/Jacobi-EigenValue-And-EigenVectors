function [result] = isDiagonal(A)
[row,col] = size(A);
cnt = 0;
for n1 = 1:row
    for n2 = 1:col
        if(n1~=n2)
            if(abs(A(n1,n2))>(10^-10))
                cnt = cnt + 1;
            end
        end
    end
end
if(cnt == 0)
    result = true;
else
    result = false;
end
    
            