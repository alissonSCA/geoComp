function P = geraPoligonoSimples(N)
    ehPolSimples = 0;
    while (~ehPolSimples)
        ehPolSimples = 1;
        P = rand(N,2);
        for i = 1:N
            p1 = P(i,:);
            if (i < N)
                p2 = P(i+1,:);
            else
                p2 = P(1,:);
            end
            
            for j = i+1:N
                p3 = P(j,:);
                if (j < N)
                    p4 = P(j+1,:);
                else
                    p4 = P(1,:);
                end         
                if intersepta(p1, p2, p3, p4)
                    ehPolSimples = 0;
                    break;
                end
            end
        end
    end
end