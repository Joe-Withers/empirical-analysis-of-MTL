%% OBJECTIVE
% argmin_W { sum_i^t (0.5 * norm (Y{i} - X{i}' * W(:, i))^2) 
%            + rho1 * \|W\|_{2,1} + opts.rho_L2 * \|W\|_F^2}
%
%% Related papers
%
% [1] Evgeniou, A. and Pontil, M. Multi-task feature learning, NIPS 2007.
% [2] Liu, J. and Ye, J. Efficient L1/Lq Norm Regularization, Technical
% Report, 2010.
%
function W = L21_approach(X,Y,lambda1,lambda2,last_model)

% addpath('../MALSAR/functions/joint_feature_learning/'); % load function
% addpath('../MALSAR/utils/'); % load utilities

d = size(X{1}, 2);  % dimensionality.

%rng('default');     % reset random generator. Available from Matlab 2011.
%opts.init = 0;      % guess start point from data. 
opts.init = 1;      % use last model
opts.W0 = last_model;
opts.tFlag = 1;     % terminate after relative objective value does not changes much.
opts.tol = 10^-5;   % tolerance. 
opts.maxIter = 1000; % maximum iteration number of optimization.

opts.rho_L2 = lambda2;

% sparsity = zeros(length(lambda), 1);
% log_lam  = log(lambda);

    [W funcVal] = Least_L21(X, Y, lambda1, opts);
    % set the solution as the next initial point. 
    % this gives better efficiency. 
%     opts.init = 1;
%     opts.W0 = W;
%     sparsity(i) = nnz(sum(W,2 )==0)/d;

if 0
    % draw figure
    h = figure;
    plot(log_lam, sparsity);
    xlabel('log(\rho_1)')
    ylabel('Row Sparsity of Model (Percentage of All-Zero Columns)')
    title('Row Sparsity of Predictive Model when Changing Regularization Parameter');
    set(gca,'FontSize',12);
    print('-dpdf', '-r100', 'LeastL21Exp');
end
end