function A = areaOrientada(P)
    [N,~] = size(P);
    O = rand(1,2);%[0,0];   
    A = 0;
    for i = 1:N
        p1 = P(i,:);
        if (i < N)
            p2 = P(i+1,:);
        else
            p2 = P(1,:);
        end
        v1 = somavetorial(p1, multescalar(-1, O));
        v2 = somavetorial(p2, multescalar(-1, O));
        r = prodvetorial([v1,0], [v2,0]);
        A = A + r(3);
    end
    A = A/2;
end