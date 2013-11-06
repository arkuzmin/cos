% Теорема Котельникова
function ur = recovery(u, t, k, F)
    ur = zeros(size(t));
    for i = 1 : length(k)
        ur = ur + u(i) * mysinc(pi*(2*F*t - k(i)));
    end