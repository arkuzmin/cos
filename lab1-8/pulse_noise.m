function u = pulse_noise(k, N, A)
    u = zeros(1, N + 1);
    for i = 1:k
        u(ceil(rand*N)) = rand*A;
    end 