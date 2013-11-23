function lab05
    a = -2;
    b = 2;
    A = 100;
    N = 100;
    sigma = 1;
    
    dt = (b - a) / N;
    t = a:dt:b;
    
    % ��� �������������
    tao = 0.0001;
    % ������� ������� �������
    B = 15;
    
    % ��������� ������ � ���������� �������
    u0 = gauss_signal(t, A, sigma);
    uNoise  = pulse_noise(5, N, A); 
    uRes   = u0 + uNoise;
    
    % ���-������ �������� ������ �����������
    BihBut = myfilter(uRes, @(F) 1./(1 + (sin(pi*B*tao)./sin(pi*F*tao)).^4), dt);
    % ���-������ ������� ������ �����������
    KihBut = myfilter(uRes, @(F) 1./(1 + (B./F).^8), dt);
    % ���-������ ������� ������ ������
    KihGauss = myfilter(uRes, @(F) 1-exp(-F.^2/(2*B*B)), dt);
    
    figure(1);    
    subplot(2, 2, 1);
    plot(t, u0, 'k', t, uRes, 'b');
    grid on;
    legend('��������� ������', '������ � ���������� �������');
    
    subplot(2, 2, 2);
    plot(t, u0, 'k', t, BihBut, 'b', t, uNoise, 'r');
    grid on;
    legend('��������� ������', '���-������ �����������', '���');
    
    subplot(2, 2, 3);
    plot(t, u0, 'k', t, KihBut, 'b', t, uNoise, 'r');
    grid on;
    legend('��������� ������', '���-������ �����������', '���');
    
    subplot(2, 2, 4);
    plot(t, u0, 'k', t, KihGauss, 'b', t, uNoise, 'r');
    grid on;
    legend('��������� ������', '���-������ ������', '���');
    
    % ��������� ������ � ��������� �������
    
    uRes = awgn(u0, 20, 'measured');
    uNoise = uRes - u0;
    % ���-������ �������� ������ �����������
    BihBut = myfilter(uRes, @(F) 1./(1 + (sin(pi*B*tao)./sin(pi*F*tao)).^4), dt);
    % ���-������ ������� ������ �����������
    KihBut = myfilter(uRes, @(F) 1./(1 + (B./F).^8), dt);
    % ���-������ ������� ������ ������
    KihGauss = myfilter(uRes, @(F) 1-exp(-F.^2/(2*B*B)), dt);
    
    figure(2);    
    subplot(2, 2, 1);
    plot(t, u0, 'k', t, uRes, 'b');
    grid on;
    legend('��������� ������', '������ � ���������� �������');
    
    subplot(2, 2, 2);
    plot(t, u0, 'k', t, BihBut, 'b', t, uNoise, 'r');
    grid on;
    legend('��������� ������', '���-������ �����������', '���');
    
    subplot(2, 2, 3);
    plot(t, u0, 'k', t, KihBut, 'b', t, uNoise, 'r');
    grid on;
    legend('��������� ������', '���-������ �����������', '���');
    
    subplot(2, 2, 4);
    plot(t, u0, 'k', t, KihGauss, 'b', t, uNoise, 'r');
    grid on;
    legend('��������� ������', '���-������ ������', '���');