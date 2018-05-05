function y = trab1RNCH_test(model,X)
    X = X*model.w;
    [N,~] = size(X);
    y = zeros(N,model.nC);
    for i = 1:N
        xi = X(i,1:2);
        D = zeros(model.nC,1);
        for j = 1:model.nC
            D(j) = getDistance(model.F{j},xi);
        end
        [~,ind] = min(D);
        y(i,ind) = 1;
    end
end

function dMin = getDistance(F,x)
    if pontoInterior(F,x)
        dMin = 0;
        return;
    end
    [nF,~] = size(F);
    dMin = inf;
    for i = 2:nF
        v1 = somavetorial(x, multescalar(-1, F(i-1,:))); 
        v2 = somavetorial(F(i,:), multescalar(-1, F(i-1,:)));
        v3 = somavetorial(x, multescalar(-1, F(i,:)));
        if (angulo(v1,v2) > pi/2)
            d = norma(v1);
        else
            if (angulo(multescalar(-1,v2), v3) > pi/2)
                d = norma(v3);
            else
                d = 2*abs(areaOrientada([F(i-1:i,:);x]))/norma(v2);
            end
        end
        if (d < dMin)
            dMin = d;
        end
    end
end