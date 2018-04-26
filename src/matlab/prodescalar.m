function val = prodescalar(x,y)
    n = numel(x);
    val = 0;
    for i = 1:n
        val = val + x(i)*y(i);
    end
end