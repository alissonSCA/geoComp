function alpha = anguloorientado(x)
    u = [1,0];
    if(x(2) >= 0)
        alpha = angulo(u,x); %pode trocar "angulo" por "pseudoangulo"
    else
        alpha = -angulo(u,x); %pode trocar "angulo" por "pseudoangulo"
    end
end