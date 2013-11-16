function alpha = getAlpha(u1, u2, N, T, dx, delta, eps)
    dp = 0.0001;
    p = 0.01:dp:0.05;
    p0 = p;

    for i = 1:length(p)
        alpha = p(i);
        temp = 0;        
        gamma = dx / N;
        for j = 1:N
            temp = temp + ((abs(u2(j)).^2 * dx.^2 * abs(u1(j)).^2 * (1 + (2*pi*(j-1) / T).^2)) ...
                 / (abs(u2(j)).^2 * dx.^2 + alpha * (1 + (2*pi*(j-1) / T).^2)).^2 );
        end
        gamma = gamma * temp;
        
        temp = 0;
        beta = dx / N;
        for j = 1:N
            temp = temp + ((alpha.^2 * (1 + (2*pi*(j-1) / T).^2) * abs(u1(j)).^2) ...
                 / (abs(u2(j)).^2 * dx.^2 + alpha * (1 + (2*pi*(j-1) / T).^2)).^2 );
        end
        beta = beta * temp;
        
        p(i) = beta - (delta + eps * sqrt(gamma)).^2;
    end
    
    min = p(1);
    index = 1;
    for i = 2:length(p)
        if abs(p(i)) < abs(min)
            min = p(i);
            index = i;
        end
    end
    alpha = p0(index);