function lab03
    t = -5 : 0.01 : 5;
    
    T = 0.4;
    pulse = rect(t, T);
    
    A = 1;
    sigma = 5;
    gauss = gauss_signal(t, A, sigma);

    c1 = conv(pulse, pulse);
    c2 = conv(pulse, gauss);
    c3 = conv(gauss, gauss);
    
    a = subplot(3, 1, 1);
    plot(c1, 'b');
    grid on;
    title(a, 'Импульс - импульс');

    b = subplot(3, 1, 2);
    plot(c2, 'b');
    grid on;
    title(b, 'Импульс - гауссоида');

    c = subplot(3, 1, 3);
    plot(c3, 'b');
    grid on;
    title(c, 'Гауссоида - гауссоида');