function H = reflect_array(P)
    K = length(P);
  
    if (mod(K,2) == 0) 
        K = K / 2;
    else
        K = fix(K/2);
        G = P(K + 1);
        for i = K+1:(length(P) - 1)
          P(i) = P(i+1);
        end
        P(length(P))=G;  
    end

    for i = 1:K
        temp = P(i);
        P(i) = P(K + i);
        P(K + i) = temp;  
    end
    H = P; 