function v = gauss_signal(x, A, sigma)
    v = A * exp(-x .^ 2 ./ sigma .^ 2);