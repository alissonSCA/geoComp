clear; clc;
%% Test angulo orientado
% X = -10:0.1:10;
% Y = -10:0.1:10;
% Z = zeros(numel(X), numel(Y));
% for i = 1:numel(X)
%     for j = 1:numel(Y)
%         v = [X(i), Y(j)];
%         Z(i,j) = anguloorientado(v);
%     end
% end
% surfc(X,Y,Z);
%% Test prod vet
x = rand(1,2);
y = rand(1,2);
v = prodvetorial([x,0], [y,0]);
hold on;
plot([x(1);0], [x(2);0], 'b-', 'LineWidth', 3);
plot([y(1);0], [y(2);0], 'r-', 'LineWidth', 3);
disp(v(3));

v = prodvetorial([y,0], [x,0]);
disp(v(3));

if (0)
    disp('if');
else
    disp('else');
end
