function lab04
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
    B = 10;
    
    % Гауссовый сигнал с импульсной помехой
    u0 = gauss_signal(t, A, sigma);
    uNoise  = pulse_noise(5, N, A); 
    uRes   = u0 + uNoise;
    
    % БИХ-фильтр низких частот Баттеруорта
    BihBut = myfilter(uRes, @(F) 1./(1 + (sin(pi*F*tao)./sin(pi*B*tao)).^4), dt);
    % КИХ-фильтр низких частот Баттеруорта
    KihBut = myfilter(uRes, @(F) 1./(1 + (F/B).^8), dt);
    % КИХ-фильтр низких частот Гаусса
    KihGauss = myfilter(uRes, @(F) exp(-F.^2/(2*B*B)), dt);
    
    figure(1);    
    subplot(2, 2, 1);
    plot(t, u0, 'k', t, uRes, 'b');
    grid on;
    legend('Идеальный сигнал', 'Сигнал с импульсной помехой');
    
    subplot(2, 2, 2);
    plot(t, u0, 'k', t, BihBut, 'b');
    grid on;
    legend('Идеальный сигнал', 'БИХ-фильтр Баттеруорта');
    
    subplot(2, 2, 3);
    plot(t, u0, 'k', t, KihBut, 'b');
    grid on;
    legend('Идеальный сигнал', 'КИХ-фильтр Баттеруорта');
    
    subplot(2, 2, 4);
    plot(t, u0, 'k', t, KihGauss, 'b');
    grid on;
    legend('Идеальный сигнал', 'КИХ-фильтр Гаусса');
    
    % Гауссовый сигнал с гауссовой помехой
    
    uRes = awgn(u0, 20, 'measured'); 
    % БИХ-фильтр низких частот Баттеруорта
    BihBut = myfilter(uRes, @(F) 1./(1 + (sin(pi*F*tao)./sin(pi*B*tao)).^4), dt);
    % КИХ-фильтр низких частот Баттеруорта
    KihBut = myfilter(uRes, @(F) 1./(1 + (F/B).^8), dt);
    % КИХ-фильтр низких частот Гаусса
    KihGauss = myfilter(uRes, @(F) exp(-F.^2/(2*B*B)), dt);
    
    figure(2);    
    subplot(2, 2, 1);
    plot(t, u0, 'k', t, uRes, 'b');
    grid on;
    legend('Идеальный сигнал', 'Сигнал с импульсной помехой');
    
    subplot(2, 2, 2);
    plot(t, u0, 'k', t, BihBut, 'b');
    grid on;
    legend('Идеальный сигнал', 'БИХ-фильтр Баттеруорта');
    
    subplot(2, 2, 3);
    plot(t, u0, 'k', t, KihBut, 'b');
    grid on;
    legend('Идеальный сигнал', 'КИХ-фильтр Баттеруорта');
    
    subplot(2, 2, 4);
    plot(t, u0, 'k', t, KihGauss, 'b');
    grid on;
    legend('Идеальный сигнал', 'КИХ-фильтр Гаусса');

    