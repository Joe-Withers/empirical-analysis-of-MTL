function true_model = save_model_with_sparsity(s)
T=3;
model = (rand([10,T])/2+0.5)*10;

models = [zeros(s,T); model(s+1:end,:)];
m = length(models(:,1));
for i = 1:T
    models(:,i) = models(randperm(m),i);
end


%figure;imshow(NormaliseImage(model)*64,flip(parula,1));

%generate data
datapoints = 100;
for t = 1:T
    for i = 1:datapoints
        X{t}(i,:) = rand(1,m);
        Y{t}(i,1) = X{t}(i,:)*model(:,t);
        Y{t}(i,1) = Y{t}(i,1)+randn(size(Y{t}(i,1)));
    end
end
save('D:\Documents\University\Year 3\Individual Project\Code\Data\GeneratedData\nonSparse','X','Y');
%save('D:\Documents\University\Year 3\Individual Project\Code\Data\GeneratedData\nonSparse_model','model');
true_model = model;
end