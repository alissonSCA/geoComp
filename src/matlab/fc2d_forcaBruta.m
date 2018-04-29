function F = fc2d_forcaBruta(C)
    [N,~] = size(C);
    F = [];
    for i = 1:N
        if estaNoFeicho(C, i)
            F = [F;C(i,:)];
        end
    end
    F = ordenaFeicho(F);
end

function b = estaNoFeicho(C,ind)
    [N,~] = size(C);
    x = C(ind,:);
    b = 1;
    for i = 1:N
        for j = i+1:N
            for k = j+1:N
                if ((i == ind) || (j == ind) || (k == ind))
                    continue;
                end
                if pontoInterior(C([i,j,k],:), x)
                    b = 0;
                    return;
                end
            end
        end
    end
end

function Fs = ordenaFeicho(F)
    [N,~] = size(F);
    yMin = F(1,:);
    xBar = [0,0];
    for i = 1:N
        if (F(i,2) < yMin(2))
            yMin = F(i,:);
        end
        xBar = somavetorial(xBar, multescalar(1/N, F(i,:)));
    end
    
    ang = zeros(N,1);
    v1 = somavetorial(yMin, multescalar(-1, xBar));
    for i = 1:N
        v2 = somavetorial(F(i,:), multescalar(-1, xBar));
        ang(i) = angulo_ccw(v1, v2);
    end
    
    [~, ind] = sort(ang);
    Fs = F(ind, :);
end