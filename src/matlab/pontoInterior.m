function ehInterior = pontoInterior(P,p)
    [N,~] = size(P);
    xMax = getXMax(P);
%     L = [p(1), xMax + 1];
    L = [xMax + 1, p(2)];
    ehInterior = 0;
    qtdInt = 0;
    for i = 1:N
        p1 = P(i,:);
        if (i < N)
            p2 = P(i+1,:);
        else
            p2 = P(1,:);
        end
        
        % p pertence ao segmento p1p2
        if (abs(areaOrientada([p1;p;p2])) < 1e-6)
            ehInterior = 1;
            return;
        end          
        
        if intersepta([p,0], [L,0], [p1,0], [p2,0])
            qtdInt = qtdInt + 1;
            % Casos especiais
            if (p2(2) == p(2))
                if (p1(2) >= p2(2))
                    qtdInt = qtdInt - 1;
                end                    
            end
            if (p1(2) == p(2))
                if (p1(2) <= p2(2))
                    qtdInt = qtdInt - 1;
                end
            end
            % Fim dos casos especiais (Cáp. 02, pág. 17, Fig. 2.10)
        end             
        
    end
    if (ehInterior == 0)
        ehInterior = mod(qtdInt, 2);
    end
end

function xMax = getXMax(P)
    [N,~] = size(P);
    xMax = P(1,1);
    for i = 2:N
        if (P(i,1) > xMax)
            xMax = P(i,1);
        end
    end
end