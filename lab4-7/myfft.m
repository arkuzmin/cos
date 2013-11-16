function v = myfft(u)
N = length(u);
G = zeros(1, N);
H = zeros(1, N);

for k = 1:N
    wn(k) = exp((-2*pi*1i*(k-1))/(N));
    
    for m = 1:N/2
        w(m) = exp((-2*pi*1i*(k-1)*(m-1))/(N/2));
        
        G(k) = G(k)+(w(m) * u(2*m-1));

        H(k) = H(k)+(w(m) * u(2*m));        
    end
    v(k) = G(k)+(wn(k)*H(k));
 end
