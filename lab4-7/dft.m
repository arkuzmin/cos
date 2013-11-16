function v  = dft(u)
    N = length(u);
    v = zeros(1, N);
    M = zeros(1,N);
    for k = 1:N
        for n = 1:N
          v(k) = v(k) + u(n) * exp( -2 * pi * 1i * (k-1) * (n-1) / N)*(-1)^(n-1);
        end
    end