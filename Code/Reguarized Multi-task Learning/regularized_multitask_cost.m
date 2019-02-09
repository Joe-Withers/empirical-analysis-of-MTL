function [avg_w, cost] = regularized_multitask_cost(x,y,w,p1,p2)
%% find cost
    T = length(x);
    % set slack variable
    for t = 1:T
        xt = x{t};
        yt = y{t};
        wt = w(t,:);
            a = ((wt * xt') - yt') * ((wt * xt') - yt')';
            e(t) = a;
    end
    sum_e = sum(e);    
    
    % sum of all models squared
    sum_w2 = norm(w,'fro')^2;
    
    % get mean model
    sum_w = sum(w);
    avg_w = sum_w/T;
    
    % sum of variance of all models
%     for t = 1:T
%         diff_w(t,:) = w(t,:) - avg_w;
%         diff_w2(t) = diff_w(t,:)*diff_w(t,:)';
%     end
    for t = 1:T
        diff_w2(t) = norm(w(t,:) - avg_w,2)^2;
    end
    
    sum_diff_w2 = sum(diff_w2);
    
    % find cost
    cost = sum_e + (p1*sum_w2) + (p2*sum_diff_w2);
end