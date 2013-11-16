function y = point_pulse(x, x0, A)
    for i = 1:length(x)
        if (x(i) == x0)
            y(i) = A;
        else
            y(i) = 0;
        end
    end
    