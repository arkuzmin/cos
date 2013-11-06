function func
t = -1: 0.001: 1;
% частота дискретизации
Fd = 100; 
k = -Fd:1:Fd;
% временные отсчёты
tk = k / Fd; 
F = Fd / 2;

% Точечный импульс
x0 = 0;
A = 10;
u_pointpulse = point_pulse(tk, x0, A);

% Прямоугольный импульс
T = 0.4;
u_pulse = rect(tk, T);

% Гауссоида
A = 10;
sigma = 0.05;
u_gauss = gauss_signal(tk, A, sigma);

ur_pointpulse = recovery(u_pointpulse, t, k, F);
ur_pulse = recovery(u_pulse, t, k, F);
ur_gauss = recovery(u_gauss, t, k, F);

a = subplot(2, 2, 1);
plot(tk, u_pointpulse, 'b', t, ur_pointpulse, 'r');
grid on;
title(a, 'Точечный импульс');

b = subplot(2, 2, 2);
plot(tk, u_pulse, 'b', t, ur_pulse, 'r');
grid on;
title(b, 'Прямоугольный импульс');

c = subplot(2, 2, 3);
plot(tk, u_gauss, 'b', t, ur_gauss, 'r');
grid on;
title(c, 'Гауссоида');

