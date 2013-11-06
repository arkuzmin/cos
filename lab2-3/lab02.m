function lab02
    t = -10: 0.1: 10;
    signal = 2 % 1 - импульс, 2 - гауссоида
    
    if (signal == 1)
        T = 0.4;
        y = rect(t, T);
    else
        A = 1;
        sigma = 5;
        y = gauss_signal(t, A, sigma);
    end
    
    y_no_twins = NoTwins(y, t);
    
    tic;
    start = cputime;
    y_dft = dft(y);
    t1_dft = toc;
    
    tic;
    start = cputime;
    y_fft = myfft(y);
    t1_fft = toc;
    
    tic;
    y_no_twins_dft = dft(y_no_twins);
    t2_dft = toc;
    
    tic;
    y_no_twins_fft = myfft(y_no_twins);
    t2_fft = toc;
   
    plot(t, abs(y), 'r', t, abs(y_dft), 'b');%, t, abs(y_fft), 'b');
    grid on;
    if (signal == 1)
        %title(a, 'Прямоугольный импульс');
        disp('Прямоугольный импульс:');
    else
        %title(a, 'Гауссоида');
        disp('Гауссоида:');
    end
    
    disp(strcat('Время ДПФ =  ' , num2str(t1_dft), ' c'));
    disp(strcat('Время БПФ =  ' , num2str(t1_fft), ' c'));
    %disp(strcat('Время ДПФ =  ' , num2str(t2_dft), ' c'));
    %disp(strcat('Время БПФ =  ' , num2str(t2_fft), ' c'));
    