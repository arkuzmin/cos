function y = myfilter(u, H, dt)
	N = length(u);
	df = dt*N;
	S = fft(u);
	F = [0:N/2+1 -N/2+1:-1]*df;
	y = ifft(S .* H(abs(F)));
end
