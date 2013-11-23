function [delta, u] = getU2Delta(x)
    u = zeros(1, length(x));
    a = -1;
    b = 1;
    for i = 1:length(x)
        delta = a + (b-a).*rand(1);
        u(i) = exp(-(x(i).^2)) + delta*0.05;
    end