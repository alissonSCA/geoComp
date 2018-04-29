clear; clc; close all;
%%
N = 15;
C = rand(N,2);
F = fc2d_forcaBruta(C);
hold on;
plot(C(:,1), C(:,2), 'b*');
plotPolSimples(F);