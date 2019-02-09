w_diff = true_w_toy - best_w;
[n,~] = size(w_diff);
w_T_diff = sum(abs(w_diff))/n;