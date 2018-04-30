function F = jarvis(C)
    [N,~] = size(C);
    %% localizar ponto extremo
    %   usaremos aqui a menor componente y
    %   o desempate será a maior componente x
    %   mais abaixo e mais a direita
    p1 = C(1,:);
    for i = 2:N
        if (C(i,2) < p1(2))
            p1 = C(i,:);
        else
            if (C(i,2) == p1(2))
                if (C(i,1) > p1(1))
                    p1 = C(i,:);
                end
            end
        end
    end
    %% Monta o feicho a partir de p1
    F = p1;
    p = p1;
    v1 = [1,0];
    fc = 0; %feicho completo = falso
    while (~fc)
        ang = zeros(N,1);
        for i = 1:N
            v2 = somavetorial(C(i,:), multescalar(-1, p));
            ang(i) = angulo_ccw(v1, v2);
        end
        [~,ind] = sort(ang);
        v1 = somavetorial(C(ind(1),:), multescalar(-1, p));
        p = C(ind(1),:);
        if ((p1(1) == p(1)) && (p1(2) == p(2)))
            fc = 1;
        else
            F = [F;p];
        end        
    end
end