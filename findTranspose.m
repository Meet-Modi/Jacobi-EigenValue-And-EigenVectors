function [A] = findTranspose(A[1])

for n1 = 1:2
    for n2 = 1:2
        if(n1<n2)
            temp = A(n1,n2);
            A(n1,n2) = A(n2,n1);
            A(n2,n1) = temp;
        end
    end
end

            