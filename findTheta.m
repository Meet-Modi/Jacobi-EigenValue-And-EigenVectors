function [theta] = findTheta(A)
[largest , row_ind , col_ind] = findLargestElement(A);

if(largest == 0)
    theta = 0;
else
    X = (2*A(row_ind,col_ind))/(A(row_ind,row_ind) - A(col_ind,col_ind));
    theta = atan(X)/2;
end