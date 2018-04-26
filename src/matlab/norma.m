function val = norma(x)
    n = numel(x);
    val = 0;
    for i = 1:n
        val = val + x(i)^2;
    end
    val = sqrt(val);
end