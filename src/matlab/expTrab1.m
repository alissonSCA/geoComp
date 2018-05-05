clear; clc; close all;
%% Datasets
title_ds = {'wine','iris','simple class','glass'};
[X,t] = wine_dataset;
dataset{1}.X = X;
dataset{1}.t = t;
[X,t] = iris_dataset;
dataset{2}.X = X;
dataset{2}.t = t;
[X,t] = simpleclass_dataset;
dataset{3}.X = X;
dataset{3}.t = t;
[X,t] = glass_dataset;
dataset{4}.X = X;
dataset{4}.t = t;
%%
pM = 1;
alpha = 2;
for ds = 1:numel(dataset)    
    X = zscore(dataset{ds}.X');
    t = dataset{ds}.t';
    
    [Xl, Tl, Xt, Tt] = shuffle(X,t);

    model = trab1RNCH_train(Xl,Tl,pM,alpha);
    y = trab1RNCH_test(model,Xt);
    
    %% Get Accuracy
    [nT,~] = size(Tt);
    acc = 0;
    for i = 1:nT
        [~,iT] = max(Tt(i,:));
        [~,iY] = max(y(i,:));
        acc = acc + (iY == iT)/nT;
    end
    disp(acc);
    %% Plot result
    subplot(2,2,ds);
    hold on;
    title(strcat(title_ds{ds},' (', num2str(acc),')'));
    plotDataset2D(Xl*model.w,Tl);
    for i = 1:model.nC
        plotPolSimples(model.F{i});
    end    
end