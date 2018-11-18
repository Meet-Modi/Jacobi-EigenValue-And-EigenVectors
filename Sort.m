function[EV, EV_1] = Sort(EV, EV_1)
    n = length(EV);
    for i = 1:n
        EigenValues(i) = EV(i,i);
    end
    for i = 1:n-1
        max = i;
        for j = (i + 1):n
            if(EigenValues(max) < EigenValues(j))
                max = j;
            end
        end
        temp = EigenValues(max);
        EigenValues(max) = EigenValues(i);
        EigenValues(i) = temp;
        EV_1(:,[max,i]) = EV_1(:,[i,max]);
        
    end
    for i = 1:n
        EV(i,i) = EigenValues(i);
    end
end