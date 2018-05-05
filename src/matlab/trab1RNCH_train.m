function model = trab1RNCH_train(X,T, pM, alpha)
    if (nargin < 3)
        pM = 0;
    end
    [model.w, X] = pca(X);
    [model.nC,~] = size(unique(T,'rows'));
    for i = 1:model.nC
        Xi = X(T(:,i)==1,1:2);
        model.F{i} = jarvis(Xi);  
        %% Poda
        if (pM == 1)
            model.F{i} = poda1(model.F{i},Xi, alpha);
        end
        if (pM == 2)
            model.F{i} = poda2(model.F{i},Xi, alpha);
        end            
    end
end

function Fp = poda1(F, X, alpha)
    [N,~] = size(X);
    [nF,~] = size(F);
    %% Computa o baricentro de X
    b = zeros(1,2);
    for i = 1:N
        b = multescalar(1/N, somavetorial(b, X(i,:)));
    end
    %% Computa distâncias de F para o baricentro
    D = pdist2(b,F);
    mD = mean(D);
    sD = std(D);
    Fp = [];
    for i = 1:nF
        if (D(i) <= (mD + alpha*sD))
            Fp = [Fp;F(i,:)];
        end               
    end
end

function Fp = poda2(F, X, alpha)
    [N,~] = size(X);
    [nF,~] = size(F);
    Fp = F(1,:);
    iAnt = 1;
    for i = 1:nF
%         iAnt = i - 1;
%         if (iAnt == 0)
%             iAnt = nF;
%         end
        iProx = i+1;
        if (iProx > nF)
            iProx = 1;
        end
        v1 = somavetorial(F(iProx,:), multescalar(-1, F(iAnt,:)));
        qtd = zeros(1,2);
        for j = 1:N
            v2 = somavetorial(X(j,:), multescalar(-1, F(iAnt,:)));
            r = prodvetorial([v1,0], [v2,0]);
            if (r(3) > 0)
                qtd(1) = qtd(1) + 1;
            else
                qtd(2) = qtd(2) + 1;
            end
        end
        if ~((qtd(1) > alpha*(N-3)) || (qtd(2) > alpha*(N-3)))
            Fp = [Fp;F(i,:)];
            iAnt = i;
        end
    end
end


