function V = smoothing(U, N, smth, k, eps)
    for i = 1:N    
        tmp = smth(U(i*k - k + 1 : i*k));
        for j = i*k - k + 1 : i*k
            if abs(U(j) - tmp) < eps
                V(j) = U(j);
            else
                V(j) = tmp;
            end
        end
    end