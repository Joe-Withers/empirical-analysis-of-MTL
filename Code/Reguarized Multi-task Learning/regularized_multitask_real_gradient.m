function gradient = regularized_multitask_real_gradient(x,y,w,p1,p2)
[~, init_cost] = regularized_multitask_cost(x,y,w,p1,p2);
change = 1e-6;
for i = 1:100
        new_w = w;
        new_w(i)=new_w(i)+change;
        [~,cost] = regularized_multitask_cost(x,y,new_w,p1,p2);
        current_gradient(i) = (cost - init_cost) / change;
   
% change task i by small amount, get gradient
end
gradient = current_gradient;