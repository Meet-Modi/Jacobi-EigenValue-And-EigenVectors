function [A] = removeError(A)

[row,col] = size(A);
for n1 = 1 : row
    for n2 = 1 : col
        if(abs(A(n1,n2))<= 10^-5)
            A(n1,n2) = 0;
        end
    end
end
