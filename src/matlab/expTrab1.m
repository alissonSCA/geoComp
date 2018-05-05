clear; clc; close all;
%%
[X,t] = glass_dataset;%wine_dataset;%iris_dataset;%simpleclass_dataset;%
X = zscore(X');
t = t';%t(1,:)';
[Xl, Tl, Xt, Tt] = shuffle(X,t);

model = trab1RNCH_train(Xl,Tl);
y = trab1RNCH_test(model,Xt);

[nT,~] = size(Tt);
acc = 0;
for i = 1:nT
    [~,iT] = max(Tt(i,:));
    [~,iY] = max(y(i,:));
    acc = acc + (iY == iT)/nT;
    if (iY ~= iT)
        disp([i iT iY]);
    end
end
disp(acc);

Xtt = Xt*model.w;
plotDataset2D(Xtt,Tt);

% [w, Xl] = pca(Xl);
% Xl1 = Xl(Tl==1,1:2);
% Xl2 = Xl(Tl==0,1:2);
% F1 = mergehull(Xl1);
% F2 = mergehull(Xl2);
% %%
% hold on;
% plot(Xl1(:,1),Xl1(:,2),'ro');
% plot(Xl2(:,1),Xl2(:,2),'bo');
% plotPolSimples(F1,0);
% plotPolSimples(F2,0);
% Xt = Xt*w;
% Xt1 = Xt(Tt==1,1:2);
% Xt2 = Xt(Tt==0,1:2);
% plot(Xt1(:,1),Xt1(:,2),'r*');
% plot(Xt2(:,1),Xt2(:,2),'b*');