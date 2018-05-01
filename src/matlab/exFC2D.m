clear; clc; close all;
%%
N = 30;
C = rand(N,2);
hold on;
plot(C(:,1), C(:,2), 'b*');
%%
F = mergehull(C);%quickhull(C);%graham(C);%jarvis(C);%fc2d_forcaBruta(C);
plotPolSimples(F);