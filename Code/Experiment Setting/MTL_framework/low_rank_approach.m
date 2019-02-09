%% OBJECTIVE
% argmin_W { sum_i^t (0.5 * norm (Y{i} - X{i}' * W(:, i))^2) 
%            + rho1 \|W\|_*}
%  where \|W\|_* = sum(svd(W, 0)) is the trace norm
%
%% Related papers
%
% [1] Ji, S. and Ye, J. An Accelerated Gradient Method for Trace Norm Minimization, ICML 2009
%
function W = low_rank_approach(X,Y,lambda1,last_model)

    %addpath('../MALSAR/functions/low_rank/'); % load function
    %addpath('../MALSAR/utils/'); % load utilities

%opts.init = 0;      % guess start point from data. 
opts.init = 1;      % use last model
opts.W0 = last_model;
opts.tFlag = 1;     % terminate after relative objective value does not changes much.
    opts.tol = 10^-5;   % tolerance. 
    opts.maxIter = 1500; % maximum iteration number of optimization.

    rho_1 = lambda1;%   rho1: group sparsity regularization parameter
    [W, funcVal] = Least_Trace(X, Y, rho_1, opts);
 
    if 0
        % draw figure
        figure;
        plot(log_lam, tn_val);
        xlabel('log(\rho_1)')
        ylabel('Trace Norm of Model (Sum of Singular Values of W)')
        title('Trace Norm of Predictive Model when Changing Regularization Parameter');
        set(gca,'FontSize',12);
        print('-dpdf', '-r100', 'LeastTraceExp');

        figure;
        plot(log_lam, rk_val);
        xlabel('log(\rho_1)')
        ylabel('Rank of Model')
        title('Rank of Predictive Model when Changing Regularization Parameter');
        set(gca,'FontSize',12);
        print('-dpdf', '-r100', 'LeastTraceExp_2');
    end
end

