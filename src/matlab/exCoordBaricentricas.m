function exCoordBaricentricas()
    clear; clc;
    %%
    P = geraPoligonoSimples(3);
    plotPolSimples(P);
    x = -1:0.02:1;    
    hold on;
    for x1 = x
        for x2 = x
            p = [x1, x2];
            [u,v,w] = coordenadasBaricentricas(P,p);
            plot(x1, x2, getColor(u,v,w));
        end
    end
end
function c = getColor(u,v,w)
    if (u > 0)
        if (v > 0)
            if (w > 0)
                c = 'r.';
            else
                c = 'g.';
            end
        else
            if (w > 0)
                c = 'y.';
            else
                c = 'm.';
            end
        end
    else
        if (v > 0)
            if (w > 0)
                c = 'c.';
            else
                c = 'b.';
            end
        else
            if (w > 0)
                c = 'k.';
            else
                c = 'NUNCA ENTRA AQUI';
            end
        end        
    end
end