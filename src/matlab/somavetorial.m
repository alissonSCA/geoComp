function v = somavetorial(x,y)
    n = numel(x);
    v = zeros(1,n);
    for i = 1:n
        v(i) = x(i) + y(i);
    end
end