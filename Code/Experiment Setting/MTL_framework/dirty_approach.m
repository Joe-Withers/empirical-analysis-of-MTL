%% OBJECTIVE Function
% argmin_W ||X(P+Q) - Y||_F^2 + lambda1*||P||_{1,inf} + lambda2*||Q||_{1,1}
%  s.t. W = P + Q
%% Related papers
% [1] Jalali, A. and Ravikumar, P. and Sanghavi, S. and Ruan, C. A dirty
% model for multi-task learning, NIPS 2010.
function W = dirty_approach(X,Y,lambda1,lambda2,last_model)
% 
%     addpath('C:/Users/Joe/Documents/University/Year 3/Individual Project/Code/MALSAR1.1/MALSAR/functions/dirty/'); % load function
%     addpath('C:/Users/Joe/Documents/University/Year 3/Individual Project/Code/MALSAR1.1/MALSAR/c_files/prf_lbm/'); % load projection c libraries. 
%     addpath('C:/Users/Joe/Documents/University/Year 3/Individual Project/Code/MALSAR1.1/MALSAR/utils/'); % load utilities

%opts.init = 0;      % guess start point from data. 
opts.init = 1;      % use last model
opts.W0 = last_model;
opts.tFlag = 1;     % terminate after relative objective value does not changes much.
    opts.tol = 10^-4;   % tolerance. 
    opts.maxIter = 500; % maximum iteration number of optimization.


    rho_1 = lambda1;%   rho1: group sparsity regularization parameter
    rho_2 = lambda2;%   rho2: elementwise sparsity regularization parameter
    [W, funcVal, P, Q] = Least_Dirty(X, Y, rho_1, rho_2, opts);
 
    % draw figure
    if 0
        close;
        figure();
        subplot(3,1,1);
        imshow(1- (abs(P')~=0), 'InitialMagnification', 'fit');
        ylabel('P^T');
        title('Visualization Non-Zero Entries in Dirty Model');
        subplot(3,1,2);
        imshow(1- (abs(Q')~=0), 'InitialMagnification', 'fit')
        ylabel('Q^T');
        subplot(3,1,3);
        imshow(1- (abs(W')~=0), 'InitialMagnification', 'fit')
        ylabel('W^T');
        xlabel('Dimension')
    end
end
