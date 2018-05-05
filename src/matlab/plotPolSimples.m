function plotPolSimples(P, idCF)
    if (nargin < 2)
        idCF = 1;
    end
    [N,~] = size(P);
    hold on;
    for i = 1:N
        p1 = P(i,:);
        if (i < N)
            p2 = P(i+1,:);
        else
            p2 = P(1,:);
        end
        plot([p1(1);p2(1)], [p1(2);p2(2)], 'ko-', 'LineWidth', 2);
    end
    if (idCF)
        plot(P(1,1), P(1,2),'ro','LineWidth', 2);
        plot(P(N,1), P(N,2),'bo','LineWidth', 2);
    end
end