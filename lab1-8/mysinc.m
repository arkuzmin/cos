function y = mysinc(x)
    for i = 1:length(x)
        if (x(i) == 0)
            y(i) = 1;
        else
            y(i) = sin(x(i)) / x(i);
        end
    end