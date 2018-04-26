function alpha = angulo( x, y )
%ANGULO Operação elementar para computar o ângulo entre dois vetores x e y
    alpha = acos( prodescalar(x,y)/(norma(x)*norma(y)) );
end

