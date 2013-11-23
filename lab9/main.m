% Load image
I = im2double(imread('source.bmp'));
figure(3); imshow(I); title('�������� �����������');

noise_mean = 0;
noise_var = 0.0001;
estimated_nsr = noise_var / var(I(:));

%PSF
% ���� ����� 25
% �������� ����� 50
PSF = fspecial('motion', 50, 25);
I = edgetaper(I, PSF);
J = deconvwnr(I, PSF, estimated_nsr);

figure(4); 
imshow(J); 
title('���������');