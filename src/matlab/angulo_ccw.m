function alpha = angulo_ccw(u,v)
    r = prodvetorial([u,0], [v,0]);
    if (r(3) >= 0)
        alpha = angulo(u,v);
    else
        alpha = 2*pi - angulo(u,v);
    end
end