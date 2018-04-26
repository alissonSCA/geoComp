clear; clc;
%%
X = -10:0.1:10;
Y = -10:0.1:10;
Z = zeros(numel(X), numel(Y));
for i = 1:numel(X)
    for j = 1:numel(Y)
        v = [X(i), Y(j)];
        Z(i,j) = anguloorientado(v);
    end
end
surfc(X,Y,Z);