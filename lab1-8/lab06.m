function lab06
    a = -2;
    b = 2;
    A = 100;
    N = 100;
    sigma = 1;
    
    dt = (b - a) / N;
    t = a:dt:b;
    
    u0 = gauss_signal(t, A, sigma);
    uNoise  = pulse_noise(5, N, A); 
    uRes   = u0 + uNoise;

    R1 = fft(uRes);
    R2 = fft(uNoise);
    H  = ((abs(R1).*abs(R1))-(abs(R2).*abs(R2)))./(abs(R1).*abs(R1));
    f  = ifft(R1.*H);
    
    subplot(1, 2, 1);
    plot(t, u0, 'k', t, uRes, 'b', t, f, 'r');
    grid on;
    legend('Идеальный сигнал', 'Зашумленный сигнал', 'Фильтр');
    
    uRes = awgn(u0, 20, 'measured'); 
    uNoise = uRes - u0;
        
    R1 = fft(uRes);
    R2 = fft(uNoise);
    H  = ((abs(R1).*abs(R1))-(abs(R2).*abs(R2)))./(abs(R1).*abs(R1));
    f  = ifft(R1.*H);
    
    subplot(1, 2, 2);
    plot(t, u0, 'k', t, uRes, 'b', t, f, 'r');
    grid on;
    legend('Идеальный сигнал', 'Зашумленный сигнал', 'Фильтр');
