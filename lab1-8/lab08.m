function lab08
    a = -2;
    b = 2;
    A = 100;
    N = 1000;
    sigma = 1;
    k = 5;
    eps = 0.01;
    
    dx = (b - a) / (N*k - 1);
    x = a:dx:b;
    
    u0 = gauss_signal(x, A, sigma);
    uNoise  = pulse_noise(5, N*k - 1, A); 
    uRes   = u0 + uNoise;
    
    
    V_Mean = smoothing(uRes, N, @(F) mean(F), k, eps);
    V_Med = smoothing(uRes, N, @(F) builtin('_paren', sort(F), ceil(k/2)), k, eps);
    
    a = subplot(2, 1, 1);
    plot(x, uRes, 'b', x, V_Mean, 'r');
    grid on;
    legend('Зашумленный сигнал', 'Сглаженный сигнал (MEAN)');
    title(a, 'Сглаживание импульсных помех (MEAN)');
    
    b = subplot(2, 1, 2);
    plot(x, uRes, 'b', x, V_Med, 'r');
    grid on;
    legend('Зашумленный сигнал', 'Сглаженный сигнал (MED)');
    title(b, 'Сглаживание импульсных помех (MED)');
    
    
    