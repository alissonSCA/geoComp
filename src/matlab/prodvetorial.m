function v = prodvetorial(x, y)
    %PRODUTO VETORIAL
    % x e y são vetores de R3
    v = zeros(1,3);
    v(1) = x(2)*y(3) - x(3)*y(2);
    v(2) = x(3)*y(1) - x(1)*y(3);
    v(3) = x(1)*y(2) - x(2)*y(1);
end