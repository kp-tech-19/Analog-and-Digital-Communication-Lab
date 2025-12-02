clc; clear; close all;
data = input("Enter data bits [1 0 1 0 1 0 1 0]: ");
data(data==0) = -1;
Fs = 1000;Tb = 0.1;t = 0:1/Fs:Tb;
frequencies = [2000 2500 3000 3500]; % 4 hop freqs
hop = randi([1 4], 1, length(data)); % hop pattern
fsss = [];
for i = 1:length(data)
    fc = frequencies(hop(i));
    carrier = sin(2*pi*fc*t);
    fsss = [fsss data(i)*carrier];
end
figure;
subplot(3,1,1); stairs(data); title("Input Data");
subplot(3,1,2); stairs(hop); title("Hop Pattern");
subplot(3,1,3); plot(fsss); title("FHSS Signal");
