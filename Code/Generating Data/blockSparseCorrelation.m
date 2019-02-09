T=3;
model = (rand([10,T])/2+0.5)*10;

models30 = [zeros(3,T); model(4:end,:)];
m = length(models30(:,1));
for i = 1:T
    models30(:,i) = models30(randperm(m),i);
end

models60 = [zeros(6,T); model(7:end,:)];
m = length(models60(:,1));
for i = 1:T
    models60(:,i) = models60(randperm(m),i);
end

modelms(:,1) = model(:,1);
modelms(:,2) = [zeros(3,1); model(4:end,2)];
modelms(:,3) = [zeros(6,1); model(7:end,3)];
m = length(modelms(:,1));
for i = 1:T
    modelms(:,i) = modelms(randperm(m),i);
end
figure;imshow(imresize(NormaliseImage(modelms)*64,50,'nearest'),flip(parula,1));
% figure;imshow(NormaliseImage(models30)*64,flip(parula,1));
% figure;imshow(NormaliseImage(models60)*64,flip(parula,1));
% imshow(NormaliseImage(modelms)*64,flip(parula,1));
title('Task models with no forced sparsity');

%generate data
datapoints = 100;
for t = 1:T
    for i = 1:datapoints
        X{t}(i,:) = rand(1,m);
        Y{t}(i,1) = X{t}(i,:)*model(:,t);
        Y{t}(i,1) = Y{t}(i,1)+randn(size(Y{t}(i,1)));
    end
end
%save('D:\Documents\University\Year 3\Individual Project\Code\Data\GeneratedData\nonSparse','X','Y');
%save('D:\Documents\University\Year 3\Individual Project\Code\Data\GeneratedData\nonSparse_model','model');

for t = 1:T
    for i = 1:datapoints
        X{t}(i,:) = rand(1,m);
        Y{t}(i,1) = X{t}(i,:)*models30(:,t);
        Y{t}(i,1) = Y{t}(i,1)+randn(size(Y{t}(i,1)));
    end
end
%save('D:\Documents\University\Year 3\Individual Project\Code\Data\GeneratedData\sparse30','X','Y');
%save('D:\Documents\University\Year 3\Individual Project\Code\Data\GeneratedData\sparse30_model','models30');


for t = 1:T
    for i = 1:datapoints
        X{t}(i,:) = rand(1,m);
        Y{t}(i,1) = X{t}(i,:)*models60(:,t);
        Y{t}(i,1) = Y{t}(i,1)+randn(size(Y{t}(i,1)));
    end
end
%save('D:\Documents\University\Year 3\Individual Project\Code\Data\GeneratedData\sparse60','X','Y');
%save('D:\Documents\University\Year 3\Individual Project\Code\Data\GeneratedData\sparse60_model','models60');

for t = 1:T
    for i = 1:datapoints
        X{t}(i,:) = rand(1,m);
        Y{t}(i,1) = X{t}(i,:)*modelms(:,t);
        Y{t}(i,1) = Y{t}(i,1)+randn(size(Y{t}(i,1)));
    end
end
save('D:\Documents\University\Year 3\Individual Project\Code\Data\GeneratedData\sparseMix','X','Y');
save('D:\Documents\University\Year 3\Individual Project\Code\Data\GeneratedData\sparseMix_model','modelms');

