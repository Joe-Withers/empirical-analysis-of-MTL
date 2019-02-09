%% OBJECTIVE
% argmin_W { sum_i^t (0.5 * norm (Y{i} - X{i}' * W(:, i))^2) 
%            + rho1 * \|W\|_1 + opts.rho_L2 * \|W\|_F^2}
%
%% Related papers
%
% [1] Tibshirani, J. Regression shrinkage and selection via
% the Lasso, Journal of the Royal Statistical Society. Series B 1996
%
function W = lasso_approach(X,Y,lambda1,lambda2,last_model)

%     addpath('../MALSAR/functions/Lasso/'); % load function
%     addpath('../MALSAR/utils/'); % load utilities

    %rng('default');     % reset random generator. Available from Matlab 2011.
%opts.init = 0;      % guess start point from data. 
opts.init = 1;      % use last model
opts.W0 = last_model;
opts.tFlag = 1;     % terminate after relative objective value does not changes much.
    opts.tol = 10^-5;   % tolerance. 
    opts.maxIter = 1500; % maximum iteration number of optimization.
    
    opts.rho_L2 = lambda2;

%     sparsity = zeros(length(lambda), 1);
%     log_lam  = log(lambda);

    [W funcVal] = Least_Lasso(X, Y, lambda1, opts);
    % set the solution as the next initial point. 
    % this gives better efficiency. 
%     opts.init = 1;
%     opts.W0 = W;
%     sparsity(i) = nnz(W);

    if 0
        % draw figure
        h = figure;
        plot(log_lam, sparsity);
        xlabel('log(\rho_1)')
        ylabel('Sparsity of Model (Non-Zero Elements in W)')
        title('Sparsity of Predictive Model when Changing Regularization Parameter');
        set(gca,'FontSize',12);
        print('-dpdf', '-r100', 'LeastLassoExp');
    end

end
