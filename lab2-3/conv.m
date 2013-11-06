function v = conv(u, h)
    Nu = length(u);
    Nh = length(h);    
    
    zu = zeros(Nu + Nh);
    zh = zeros(Nu + Nh);
    zu(1:Nu) = u;
    zh(1:Nh) = h;
    
    vu = fft(zu);
    vh = fft(zh);
    v = ifft(vu .* vh);
end