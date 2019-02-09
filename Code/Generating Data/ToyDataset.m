clear all
%create models
m = 10;
T = 6;
model = 10*rand(m,1);
W = repmat(model, [1, T]);
unrelatedness = 2;
W = W + unrelatedness*randn(size(W));
figure;imshow(imresize(NormaliseImage(W)*64,50,'nearest'),flip(parula,1));
title('Tasks models from a gaussian distribution');
%sample data points and add noise
datapoints = 100;
for t = 1:T
    for i = 1:datapoints
        X{t}(i,:) = 10*rand(1,m);
        Y{t}(i,1) = X{t}(i,:)*W(:,t);
        Y{t}(i,1) = Y{t}(i,1)+randn(size(Y{t}(i,1)));
    end
end
save('D:\Documents\University\Year 3\Individual Project\Code\Data\GeneratedData\ToyData','X','Y');
save('D:\Documents\University\Year 3\Individual Project\Code\Data\GeneratedData\ToyData_model','W');
