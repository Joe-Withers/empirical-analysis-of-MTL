%% OBJECTIVE
% argmin_W { sum_i^t (0.5 * norm (Y{i} - X{i}' * W(:, i))^2) 
%            + rho1 * norm(W*R, 'fro')^2 + rho2 * \|W\|_1}
%
%% Related papers
%
% [1] Zhou, J. Technical Report. http://www.public.asu.edu/~jzhou29/Software/SRMTL/CrisisEventProjectReport.pdf
%
function W = regMTL_approach(X,Y,lambda1,lambda2,last_model)
% addpath('../MALSAR/functions/Lasso/'); % load function
% addpath('../MALSAR/functions/SRMTL/'); % load function
% addpath('../MALSAR/utils/'); % load utilities

%rng('default');     % reset random generator.Available from Matlab 2011.
%opts.init = 0;      % guess start point from data. 
opts.init = 1;      % use last model
opts.W0 = last_model;
opts.tFlag = 1;     % terminate after relative objective value does not changes much.
opts.tol = 10^-5;   % tolerance. 
opts.maxIter = 500; % maximum iteration number of optimization.

task_num = length(X);
%%% There can be other choices of the R (for different structures).
%R = eye(task_num); % ridge penalty.
%R = zeros(t,t-1);H(1:(t+1):end)=1;H(2:(t+1):end)=-1; % order structure
R = eye (task_num) - ones (task_num) / task_num;  %regularized MTL penalty

[W funcVal] = Least_SRMTL(X, Y, R, lambda1, lambda2, opts);

%plot(funcVal)



