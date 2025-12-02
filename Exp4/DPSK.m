clc; clear; close all;
%1 parameters 
T = 1;N = 8;fc = 5;fs = 100;df = 3;
t = 0:1/fs:T-1/fs;td = 0:1/fs:N*T-1/fs;
b = [1 0 1 0 1 1 0 1];   
d = zeros(1,N);
d(1) = b(1);
% 2differential encoding
for i = 2:N
    d(i) = xor(~d(i-1), b(i));  
end
% 3modulation
dpsk = [];
for i = 1:N
    f = fc + df * (2*d(i)-1); % +df for 1, -df for 0
    s = cos(2*pi*f*t);
    dpsk = [dpsk s];
end
% 4plots
figure;
subplot(3,1,1);stairs(0:N-1,b,'LineWidth',2); ylim([-0.5 1.5]);title('Input Bits');
subplot(3,1,2);stairs(0:N-1,d,'LineWidth',2); ylim([-0.5 1.5]);title('Differential Bits');
subplot(3,1,3);plot(td,dpsk,'LineWidth',1.5);title('DPSK Signal'); xlabel('Time');
