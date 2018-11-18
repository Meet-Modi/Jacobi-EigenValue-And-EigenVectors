function [multiplied_matrix] = matrixMultiply(A,B)

[row_A,col_A] = size(A);
[row_B,col_B] = size(B);

multiplied_matrix = zeros(row_A,col_B);

if(col_A == row_B)
    for n1 = 1:row_A
        for n2 = 1:col_B
             for k = 1:col_A
                multiplied_matrix(n1,n2) = multiplied_matrix(n1,n2) + double(A(n1,k))*double(B(k,n2));
             end
        end
    end
end
