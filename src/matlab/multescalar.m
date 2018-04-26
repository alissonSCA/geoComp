function v = multescalar(l,x)
    n = numel(x);
    v = zeros(1,n);
    for i = 1:n
        v(i) = l*x(i);
    end
end