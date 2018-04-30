function F = graham(C)
    [N,~] = size(C);
    %% Computa o baricentro dos pontos
    bar = [0,0];
    for i = 1:N
        bar = somavetorial(bar, multescalar(1/N, C(i,:)));
    end
    %% Ordena os pontos de acordo com o ângulo em relação ao baricentro
    ang = zeros(N,1);
    for i = 1:N
        v = somavetorial(C(i,:), multescalar(-1, bar));
        ang(i) = angulo_ccw(bar, v);
    end
    [~,ind] = sort(ang);
    F = C(ind,:);    
    %% Elimina pontos que não pertencem ao feicho
    remove = @(F,c) [F(1:c-1,:);F(c+1:end,:)];    
    c = 1;  
    naoTirou = 0;
    while(naoTirou < N)
        [nF,~] = size(F);
        p = c-1;
        if (p == 0)
            p = nF;
        end
        n = c + 1;
        if (n > nF)
            n = 1;
        end  
        aPol = areaOrientada(F);
        aTri = areaOrientada(F([p,c,n],:));
        if (aPol*aTri < 0)
            naoTirou = 0;
            F = remove(F,c);
            c = c - 1;
            if (c == 0)
                c = nF-1;
            end
        else
            naoTirou = naoTirou + 1;
            c = c+1;
            if (c > nF)
                c = 1;
            end
        end
    end
end


