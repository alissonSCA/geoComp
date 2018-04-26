function alpha = pseudoangulo( x, y )
%ANGULO Operação elementar para computar o ângulo entre dois vetores x e y
    alpha = 1 - prodescalar(x,y)/(norma(x)*norma(y));
end

