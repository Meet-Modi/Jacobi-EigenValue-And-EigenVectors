function [largest,row_index,col_index] = findLargestElement(A)
[row,col] = size(A);
largest = abs(A(1,2));
row_index = 1;
col_index = 2;
for n1 = 1 : row
    for n2 = n1+1: col
        if( n1 ~= n2)            
            if(abs(A(n1,n2))>=largest)
                largest = abs(A(n1,n2));
                row_index = n1;
                col_index = n2;
            end
        end    
    end
end