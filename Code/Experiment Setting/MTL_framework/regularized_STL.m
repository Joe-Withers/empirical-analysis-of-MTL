%% OBJECTIVE Function
% argmin_W ||X(P+Q) - Y||^2 + (gamma)*||W||^2
%% Related papers
% It's basic regularized linear regression done individually for each task
function W = regularized_STL(X,Y,gamma)

    %addpath('C:\Users\Joe\Documents\University\Year 3\Individual Project\Code\Reguarized STL Linear Regression'); % load functions

    W = reg_STL(X, Y, gamma);
        
    %draw error
    if 0
        close;
        figure();
        subplot(1,1,1);
        hold on;
        plot(1:gamma_iter, err);
    end
    

    % draw figure
    if 0
        
    end
end
