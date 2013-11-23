function lab04
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
    B = 10;
    
    % ��������� ������ � ���������� �������
    u0 = gauss_signal(t, A, sigma);
    uNoise  = pulse_noise(5, N, A); 
    uRes   = u0 + uNoise;
    
    % ���-������ ������ ������ �����������
    BihBut = myfilter(uRes, @(F) 1./(1 + (sin(pi*F*tao)./sin(pi*B*tao)).^4), dt);
    % ���-������ ������ ������ �����������
    KihBut = myfilter(uRes, @(F) 1./(1 + (F/B).^8), dt);
    % ���-������ ������ ������ ������
    KihGauss = myfilter(uRes, @(F) exp(-F.^2/(2*B*B)), dt);
    
    figure(1);    
    subplot(2, 2, 1);
    plot(t, u0, 'k', t, uRes, 'b');
    grid on;
    legend('��������� ������', '������ � ���������� �������');
    
    subplot(2, 2, 2);
    plot(t, u0, 'k', t, BihBut, 'b');
    grid on;
    legend('��������� ������', '���-������ �����������');
    
    subplot(2, 2, 3);
    plot(t, u0, 'k', t, KihBut, 'b');
    grid on;
    legend('��������� ������', '���-������ �����������');
    
    subplot(2, 2, 4);
    plot(t, u0, 'k', t, KihGauss, 'b');
    grid on;
    legend('��������� ������', '���-������ ������');
    
    % ��������� ������ � ��������� �������
    
    uRes = awgn(u0, 20, 'measured'); 
    % ���-������ ������ ������ �����������
    BihBut = myfilter(uRes, @(F) 1./(1 + (sin(pi*F*tao)./sin(pi*B*tao)).^4), dt);
    % ���-������ ������ ������ �����������
    KihBut = myfilter(uRes, @(F) 1./(1 + (F/B).^8), dt);
    % ���-������ ������ ������ ������
    KihGauss = myfilter(uRes, @(F) exp(-F.^2/(2*B*B)), dt);
    
    figure(2);    
    subplot(2, 2, 1);
    plot(t, u0, 'k', t, uRes, 'b');
    grid on;
    legend('��������� ������', '������ � ���������� �������');
    
    subplot(2, 2, 2);
    plot(t, u0, 'k', t, BihBut, 'b');
    grid on;
    legend('��������� ������', '���-������ �����������');
    
    subplot(2, 2, 3);
    plot(t, u0, 'k', t, KihBut, 'b');
    grid on;
    legend('��������� ������', '���-������ �����������');
    
    subplot(2, 2, 4);
    plot(t, u0, 'k', t, KihGauss, 'b');
    grid on;
    legend('��������� ������', '���-������ ������');

    