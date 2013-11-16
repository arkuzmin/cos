function [eps, u] = getU1Eps(x)
    u = zeros(1, length(x));
    a = -1;
    b = 1;
    for i = 1:length(x)
        eps = a + (b-a).*rand(1);
        u(i) = exp(-(x(i).^2)/2) + eps*0.05;
    end