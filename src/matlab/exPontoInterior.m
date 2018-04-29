clear; clc; close all;
%%
P = geraPoligonoSimples(7);
p1 = rand(1,2);
p2 = P(3,:);
p3 = 0.4*P(1,:) + 0.6*P(2,:);
hold on;
plotPolSimples(P);
plot(p1(1), p1(2),'r*', 'LineWidth', 3);
plot(p2(1), p2(2),'g*', 'LineWidth', 3);
plot(p3(1), p3(2),'b*', 'LineWidth', 3);
%%
if pontoInterior(P,p1)
    disp('p1 interior');
else
    disp('p1 exterior');
end

if pontoInterior(P,p2)
    disp('p2 interior');
else
    disp('p2 exterior');
end

if pontoInterior(P,p3)
    disp('p3 interior');
else
    disp('p3 exterior');
end