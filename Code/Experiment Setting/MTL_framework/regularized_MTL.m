%% OBJECTIVE Function
% argmin_W ||X(P+Q) - Y||_F^2 + (lambda1/T)*||V||^2 + lambda2*||W0||^2
%  W = W0 + V
%% Related papers
% [1] Evgeniou, T. and Pontil, M. Regularized Multi-Task Learning
% model for multi-task learning, 2004.
function W = regularized_MTL(X,Y, lambda1,lambda2)

    addpath('C:\Users\Joe\Documents\University\Year 3\Individual Project\Code\Reguarized Multi-task Learning'); % load functions

    [W, funcVal, W0] = reg_MTL(X, Y, lambda1, lambda2);
    err = avgAbsErr(X,Y,W);

    % draw figure
    if 0
        
    end
end
