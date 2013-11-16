function lab07
    a = -5;
    b = 5;
    T = b-a;
    N = 200;
    dx = (b-a) / (N-1);
    x = a:dx:b;    
    
    [eps, u1] = getU1Eps(x);
    [delta, u2] = getU2Delta(x);

    U1 = fft(u1);
    U2 = fft(u2);   
    
    alpha = getAlpha(U1, U2, N, T, dx, delta, eps);
        
    H = zeros(1, N);
    for k = 1:N
      H(k) = dx / N;
      temp = 0;
      for m = 1:N
        temp = temp + ((exp(2*pi*1i*k*(m-1) / N) * conj(U2(m)) * U1(m)) ...
             / (abs(U2(m)).^2 * dx.^2 + alpha * (1 + (2*pi*(m-1) / T).^2)));
      end
      H(k) = H(k) * temp;
    end
    H2 = reflect_array(H); 
    plot(x, u1, 'b', x, u2, 'k', x, abs(H2), 'r');
    grid on;
    legend('Сигнал U1', 'Сигнал U2', 'Импульсный отклик');
    


