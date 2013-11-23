function lab05
    a = -2;
    b = 2;
    A = 100;
    N = 100;
    sigma = 1;
    
    dt = (b - a) / N;
    t = a:dt:b;
    
    % шаг дискретизации
    tao = 0.0001;
    % частота отсечки фильтра
    B = 15;
    
    % Гауссовый сигнал с импульсной помехой
    u0 = gauss_signal(t, A, sigma);
    uNoise  = pulse_noise(5, N, A); 
    uRes   = u0 + uNoise;
    
    % БИХ-фильтр выскоких частот Баттеруорта
    BihBut = myfilter(uRes, @(F) 1./(1 + (sin(pi*B*tao)./sin(pi*F*tao)).^4), dt);
    % КИХ-фильтр высоких частот Баттеруорта
    KihBut = myfilter(uRes, @(F) 1./(1 + (B./F).^8), dt);
    % КИХ-фильтр высоких частот Гаусса
    KihGauss = myfilter(uRes, @(F) 1-exp(-F.^2/(2*B*B)), dt);
    
    figure(1);    
    subplot(2, 2, 1);
    plot(t, u0, 'k', t, uRes, 'b');
    grid on;
    legend('Идеальный сигнал', 'Сигнал с импульсной помехой');
    
    subplot(2, 2, 2);
    plot(t, u0, 'k', t, BihBut, 'b', t, uNoise, 'r');
    grid on;
    legend('Идеальный сигнал', 'БИХ-фильтр Баттеруорта', 'Шум');
    
    subplot(2, 2, 3);
    plot(t, u0, 'k', t, KihBut, 'b', t, uNoise, 'r');
    grid on;
    legend('Идеальный сигнал', 'КИХ-фильтр Баттеруорта', 'Шум');
    
    subplot(2, 2, 4);
    plot(t, u0, 'k', t, KihGauss, 'b', t, uNoise, 'r');
    grid on;
    legend('Идеальный сигнал', 'КИХ-фильтр Гаусса', 'Шум');
    
    % Гауссовый сигнал с гауссовой помехой
    
    uRes = awgn(u0, 20, 'measured');
    uNoise = uRes - u0;
    % БИХ-фильтр выскоких частот Баттеруорта
    BihBut = myfilter(uRes, @(F) 1./(1 + (sin(pi*B*tao)./sin(pi*F*tao)).^4), dt);
    % КИХ-фильтр высоких частот Баттеруорта
    KihBut = myfilter(uRes, @(F) 1./(1 + (B./F).^8), dt);
    % КИХ-фильтр высоких частот Гаусса
    KihGauss = myfilter(uRes, @(F) 1-exp(-F.^2/(2*B*B)), dt);
    
    figure(2);    
    subplot(2, 2, 1);
    plot(t, u0, 'k', t, uRes, 'b');
    grid on;
    legend('Идеальный сигнал', 'Сигнал с импульсной помехой');
    
    subplot(2, 2, 2);
    plot(t, u0, 'k', t, BihBut, 'b', t, uNoise, 'r');
    grid on;
    legend('Идеальный сигнал', 'БИХ-фильтр Баттеруорта', 'Шум');
    
    subplot(2, 2, 3);
    plot(t, u0, 'k', t, KihBut, 'b', t, uNoise, 'r');
    grid on;
    legend('Идеальный сигнал', 'КИХ-фильтр Баттеруорта', 'Шум');
    
    subplot(2, 2, 4);
    plot(t, u0, 'k', t, KihGauss, 'b', t, uNoise, 'r');
    grid on;
    legend('Идеальный сигнал', 'КИХ-фильтр Гаусса', 'Шум');