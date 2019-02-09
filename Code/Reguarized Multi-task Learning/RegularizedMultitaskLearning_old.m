clear;
%% load data
school_b = load('school_b');
x_full = school_b.x;
y_full = school_b.y;
school_indexes = school_b.task_indexes;
[T,~] = size(school_indexes);
[m,~] = size(x_full);
num_of_features_full = size(y_full);
%% get features for each task
for i = 1:T
    % splice data
    from = school_indexes(i);
    if(i < T)
        to = school_indexes(i+1)-1;
    else
        to = num_of_features_full;
    end
    x{i} = x_full(:,from:to);
    y{i} = y_full(from:to,:);
end
%% get individually learned models
%get models

for i = 1:T
    gamma = 0.5;
    w(i,:) = regularized_linear_regression(x{i},y{i},gamma);
end

%% problem 2.2
%set regularization parameters
lambda1 = 1;
lambda2 = 1;
% p1 = (1/T)*((lambda1*lambda2)/(lambda1+lambda2));
% p2 = (1/T)*((lambda1*lambda1)/(lambda1+lambda2));
p1 = 1;
p2 = 1;
change_in_w = 100;

%% learn models
while(change_in_w > 0.00005)
    %% find cost
    [avg_w, cost] = regularized_multitask_cost(x,y,w,p1,p2,T,m);
    % plots
    
    %% use gradient decent on e and w
    derivative = regularized_multitask_derivative(x,y,w,avg_w,T,m);
    %% check gradient
    gradient = regularized_multitask_real_gradient(x,y,w,p1,p2,T,m);
    %%
    alpha = 0.0001;    
    old_w = w;
    for t = 1:T
        w(t,:) = w(t,:) + alpha*derivative(t);
    end
    change_in_w = abs(norm(w) - norm(old_w))
end

