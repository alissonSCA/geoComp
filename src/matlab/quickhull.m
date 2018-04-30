function F = quickhull(C)
    [N,~] = size(C);
    %% acha extremos
    a = C(1,:); %menor x
    b = C(1,:); %maior x
    for i = 1:N
        if (C(i,1) < a(1))
            a = C(i,:);
        end
        if (C(i,1) > b(1))
            b = C(i,:);
        end
    end
    %% Divide os conjuntos
%     plot([a(1);b(1)], [a(2);b(2)],'r-','LineWidth',2);    
    F1 = quickHull_aux(C,a,b);
    F2 = quickHull_aux(C,b,a);
    F = [F1;F2];
end

function F = quickHull_aux(C,a,b)
    [N,~] = size(C);
    if (N==0)
%         F = [a;b];
        F = b;
        return;
    end
    p = pontoMaxSentidoCCW(C,a,b);
    C1 = conjuntoEsqDe(C,a,p);
    C2 = conjuntoEsqDe(C,p,b);
    F = [quickHull_aux(C1,a,p); quickHull_aux(C2,p,b)];
end

function p = pontoMaxSentidoCCW(C,a,b)
    [N,~] = size(C);
    S = zeros(N,1);
    v1 = somavetorial(b, multescalar(-1,a));
    for i = 1:N        
        v2 = somavetorial(C(i,:), multescalar(-1,a));
        r = prodvetorial([v1,0], [v2,0]);
        S(i) = r(3);
    end
    [~,ind] = sort(S);
    p = C(ind(1),:);
end

function Ci = conjuntoEsqDe(C,a,b)
%     plot([a(1);b(1)], [a(2);b(2)],'g-','LineWidth',2);
    [N,~] = size(C);
    Ci = [];
    v1 = somavetorial(b, multescalar(-1,a));
    for i = 1:N        
        v2 = somavetorial(C(i,:), multescalar(-1,a));
        r = prodvetorial([v1,0], [v2,0]);
        if (r(3)<0)
            Ci = [Ci;C(i,:)];
        end
    end
end