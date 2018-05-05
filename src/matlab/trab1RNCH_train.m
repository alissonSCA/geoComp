function model = trab1RNCH_train(X,T)
    [model.w, X] = pca(X);
    [model.nC,~] = size(unique(T,'rows'));
    for i = 1:model.nC
        Xi = X(T(:,i)==1,1:2);
        model.F{i} = jarvis(Xi);                
    end
    %% Plot result
%     plotDataset2D(X,T);
    for i = 1:model.nC
        plotPolSimples(model.F{i});
    end
end