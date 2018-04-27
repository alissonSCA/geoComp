clear; clc; close all;
%% Intersecção de segmentos (cap. 2, pág. 8)
%       determinar se os segmentos AB e CD se interseptam
%       usaremos o sinal do produto vetorial 
hold on;
A = rand(1,2); plot(A(1),A(2),'ro','LineWidth',2);
B = rand(1,2); plot(B(1),B(2),'bo','LineWidth',2);
C = rand(1,2); plot(C(1),C(2),'go','LineWidth',2);
D = rand(1,2); plot(D(1),D(2),'yo','LineWidth',2);

plot([A(1);B(1)],[A(2);B(2)],'k-','LineWidth',2);
plot([C(1);D(1)],[C(2);D(2)],'k-','LineWidth',2);
%% solução
v11 = somavetorial(B, multescalar(-1, A)); % v11 = B - A (vetor AB)
v12 = somavetorial(C, multescalar(-1, A)); % v12 = C - A (vetor AC)
v13 = somavetorial(D, multescalar(-1, A)); % v13 = D - A (vetor AD)

v21 = somavetorial(D, multescalar(-1, C)); % v21 = D - C (vetor CD)
v22 = somavetorial(A, multescalar(-1, C)); % v22 = C - A (vetor CA)
v23 = somavetorial(B, multescalar(-1, C)); % v23 = D - A (vetor CB)

r1 = prodvetorial([v11,0], [v12,0]);
r2 = prodvetorial([v11,0], [v13,0]);
r3 = prodvetorial([v21,0], [v22,0]);
r4 = prodvetorial([v21,0], [v23,0]);

if ((r1(3)*r2(3)<0) && (r3(3)*r4(3)<0))
    disp('intersepta');
else
    disp('não intersepta');
end