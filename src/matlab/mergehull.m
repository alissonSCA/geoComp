function F = mergehull(C)
    [N,~] = size(C);
    [~,ind] = sort(C(:,1));
    C = C(ind,:);
    [H,h] = mergehull_rec(C,1,N);
    F = C(H,:);


%     pc = floor(N/2);
%     C1 = C(1:pc,:);
%     C2 = C(pc+1:end, :);
%     F1 = jarvis(C1);
%     H1 = getHtmp(C,F1);
%     [h1,~] = size(H1);
%     F2 = jarvis(C2);
%     H2 = getHtmp(C,F2);
%     [h2,~] = size(H2);
% %     plotPolSimples(F1);
% %     plotPolSimples(F2);
%     
%     [H,h] = juntaHull(C,H1,h1,H2,h2);
%     plotPolSimples(C(H,:));


end

function H = getHtmp(C,F)
    [N,~] = size(C);
    [nF,~] = size(F);
    H = zeros(nF,1);    
    for i = 1:nF
        for j = 1:N
            if ((C(j,1) == F(i,1)) && (C(j,2) == F(i,2)))
                H(i) = j;
                break;
            end
        end
    end
end


function [H,h] = mergehull_rec(C,p,r)
    if (r - p <= 2)
%         F = jarvis(C(p:r,:));
%         H = getHtmp(C,F);
%         [h,~] = size(H);        
        if (p == r)
            h = 1;
            H = p;
        else
            if (r - p == 1)
                h = 2;
                H = [p;r];
            else
                h = 3;                
                if (areaOrientada(C(p:r,:)) > 0)
                    H = (p:r)';
                else
                    H = (r:-1:p)';
                end
            end
        end
    else
        q = floor((p+r)/2);
        [H1,h1] = mergehull_rec(C,p,q);
        [H2,h2] = mergehull_rec(C,q+1,r);
        [H,h] = juntaHull(C,H1,h1,H2,h2);
    end
end

%% Encontrar tangente inferior e superior
function [H,h] = juntaHull(C,H1,h1,H2,h2)
    [i1,j1] = tangenteInferior(C,H1,h1,H2,h2);
    [i2,j2] = tangenteSuperior(C,H1,h1,H2,h2);
    
%     H = [H1(getSeq(1,i1,h1));H2(getSeq(j1,j2,h2));H1(getSeq(i2,h1,h1))];
    H = [H1(getSeq(i2,i1,h1));H2(getSeq(j1,j2,h2))];
    [h,~] = size(H);
end

function S = getSeq(o,d,s)
    if (o <= d)
        S = o:d;
    else
        S = [o:s,1:d];
    end
end

%% Tangente Inferior

function [i,j] = tangenteInferior(C,H1,h1,H2,h2)
    % acha o ponto de H1 mais a direita
    i = 1;
    for k = 1:h1
        if (C(H1(k),1) > C(H1(i),1))
            i = k;
        end
    end
    % acha o ponto de H2 mais a esquerda
    j = 1;
    for k = 1:h2
        if (C(H2(k),1) < C(H2(j),1))
            j = k;
        end
    end    
    %
    while (1)
        b = naoEhTangenteI(C,H1,h1,H2,h2,i,j);
        if (b==0)
            break;
        end
        while(b == 1)
            i = i - 1;
            if (i < 1)
                i = h1;
            end
            b = naoEhTangenteI(C,H1,h1,H2,h2,i,j);
        end
        while(b == 2)
            j = j + 1;
            if (j > h2)
                j = 1;
            end
            b = naoEhTangenteI(C,H1,h1,H2,h2,i,j);
        end
    end
end

function b = naoEhTangenteI(C,H1,h1,H2,h2,i,j)
    pi = C(H1(i),:);
    pj = C(H2(j),:);
    if (i > 1)
        p1 = C(H1(i-1),:);
    else
        p1 = C(H1(h1),:);
    end
    if (j < h2)
        p2 = C(H2(j+1),:);
    else
        p2 = C(H2(1),:);
    end
    %%
    if (areaOrientada([p1;pi;pj]) < 0)
        b = 1;
    else
        if (areaOrientada([pi;pj;p2]) < 0)
            b = 2;
        else
            b = 0;
        end
    end
end

%% Tangente Superior

function [i,j] = tangenteSuperior(C,H1,h1,H2,h2)
    % acha o ponto de H1 mais a direita
    i = 1;
    for k = 1:h1
        if (C(H1(k),1) > C(H1(i),1))
            i = k;
        end
    end
    % acha o ponto de H2 mais a esquerda
    j = 1;
    for k = 1:h2
        if (C(H2(k),1) < C(H2(j),1))
            j = k;
        end
    end    
    %
    while (1)
        b = naoEhTangenteS(C,H1,h1,H2,h2,i,j);
        if (b==0)
            break;
        end
        while(b == 1)
            i = i + 1;
            if (i > h1)
                i = 1;
            end
            b = naoEhTangenteS(C,H1,h1,H2,h2,i,j);
        end
        while(b == 2)
            j = j - 1;
            if (j < 1)
                j = h2;
            end
            b = naoEhTangenteS(C,H1,h1,H2,h2,i,j);
        end
    end
end

function b = naoEhTangenteS(C,H1,h1,H2,h2,i,j)
    pi = C(H1(i),:);
    pj = C(H2(j),:);
    if (i < h1)
        p1 = C(H1(i+1),:);
    else
        p1 = C(H1(1),:);
    end
    if (j > 1)
        p2 = C(H2(j-1),:);
    else
        p2 = C(H2(h2),:);
    end
    %%
    if (areaOrientada([p1;pi;pj]) > 0)
        b = 1;
    else
        if (areaOrientada([pi;pj;p2]) > 0)
            b = 2;
        else
            b = 0;
        end
    end
end








