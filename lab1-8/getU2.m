function u = getU2(x)
    u = zeros(1, length(x));
    for i = 1:length(x)
        u(i) = exp(-(x(i).^2));
    end