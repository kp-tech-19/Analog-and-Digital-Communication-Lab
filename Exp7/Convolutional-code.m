clc; clear; close all;
% ---- 1 INPUT(Rate 1/2, Constraint length K=3) ----
bits = input('Enter input bits (e.g. [1 0 1 1 0]): ');
g1 = [1 1 1];g2 = [1 0 1];K = 3;                      
memory = zeros(1, K-1);encoded = [];               
disp("---- Convolutional Encoding ----");
for i = 1:length(bits)
    % 1Current input bit
    u = bits(i);
    % 2Create current window [u mem1 mem2]
    current = [u memory];
    % 3Output bits = XOR with generator polynomials
    out1 = mod(sum(g1 .* current), 2);
    out2 = mod(sum(g2 .* current), 2);
    % 4Append encoded bits
    encoded = [encoded out1 out2];
    % 5Update shift register
    memory = [u memory(1:end-1)];
end
% ---- 2 OUTPUTS ----
disp("Input Bits:");disp(bits);
disp("Encoded Bits (Rate 1/2):");disp(encoded);
