clc; clear; close all;
% ---- 1 Input Data ----
data = input("Enter data bits [1 0 1 0 1 1 0]: ");
data(data==0) = -1;           
SF = 8;                         
spread_data = repelem(data, SF);
% ---- 2 PN Sequence ----
pn = randi([0 1], 1, length(spread_data));
pn(pn==0) = -1;
% ---- 3 Spread Signal ----
spread_sig = spread_data .* pn;
% ---- 4 DSSS Modulated Signal ----
t = 0:0.01:2*pi;carrier = sin(t);
dsss = kron(spread_sig, carrier);   
% ---- 5 PLOTS ----
figure;
subplot(4,1,1); stairs(data); title("Original Data"); ylim([-1.5 1.5]);
subplot(4,1,2); stairs(pn); title("PN Sequence"); ylim([-1.5 1.5]);
subplot(4,1,3); stairs(spread_sig); title("Spread Signal"); ylim([-1.5 1.5]);
subplot(4,1,4); plot(dsss); title("DSSS Output Signal");
