clc; clear all; close all;

f = 1000;       
fs = 64000;        
A = 10;          
step = input("Enter step size:"); %(Normal-1;Slopeover-0.25;Granular-4)

t = 0:1/fs:1/f;
x = A * sin(2*pi*f*t);

approx = zeros(1, length(x));
bits = zeros(1, length(x));

for i = 1:length(x)-1
    if approx(i) < x(i)
        bits(i) = 1;
        approx(i+1) = approx(i) + step;
    else
        bits(i) = 0;
        approx(i+1) = approx(i) - step;
    end
end

subplot(2,1,1);
plot(t, x, 'b'); hold on;
stairs(t, approx, 'r');
title('Original and Approximated Signal');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Original','Approximation');

subplot(2,1,2);
stairs(t, bits);
title('Delta Modulated Bits');
xlabel('Time (s)');
ylabel('Bit Value');
ylim([-0.1 1.1]);
