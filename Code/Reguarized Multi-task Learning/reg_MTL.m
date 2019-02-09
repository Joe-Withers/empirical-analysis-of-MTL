function [ W, funcVal, W0] = reg_MTL( X, Y, lambda1, lambda2 )
%% get individually learned models
% gives a better starting point
T = length(X);
for i = 1:T
    gamma = 0.5;
    w(i,:) = regularized_linear_regression(X{i},Y{i},gamma);
end

%% problem 2.2
% p1 = (1/T)*((lambda1*lambda2)/(lambda1+lambda2));
% p2 = (1/T)*((lambda1*lambda1)/(lambda1+lambda2));
p1 = 1;
p2 = 1;

change_in_w = 100;

%% learn models with simple gradient descent
while(change_in_w > 0.00005)
    %% find cost
    [W0, funcVal] = regularized_multitask_cost(X,Y,w,p1,p2);
    % plots
    
    %% use gradient decent on e and w
    derivative = regularized_multitask_derivative(X,Y,w,W0);
    %% check gradient
    gradient = regularized_multitask_real_gradient(X,Y,w,p1,p2);
    %%
    alpha = 0.0001;    
    old_w = w;
    for t = 1:T
        w(t,:) = w(t,:) + alpha*derivative(t);
    end
    
    change_in_w = abs(norm(w) - norm(old_w));
end

W = w';

end

