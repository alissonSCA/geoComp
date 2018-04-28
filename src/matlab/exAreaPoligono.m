clear; clc;
%%
N = 5;
P = geraPoligonoSimples(N);
plotPolSimples(P);
disp(areaOrientada(P));