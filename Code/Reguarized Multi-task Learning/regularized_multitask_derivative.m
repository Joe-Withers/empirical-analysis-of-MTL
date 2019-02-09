function partial_derivative = regularized_multitask_derivative(x,y,w,avg_w)
    T = length(x);
    [~,m] = size(x{1});
    partial_derivative_1 = zeros(T,m);
    partial_derivative_2 = zeros(T,m);
    partial_derivative_3 = zeros(T,m);
	%find gradient

    %find partial derivative for first part with respect to task i
    for i = 1:T
        xt = x{i};
        yt = y{i};
        partial_derivative_1(i,:) = 2*((w(i,:) * xt')-yt')*xt;
     end

    partial_derivative_2(:,:) = 2*(w);

    partial_derivative_3 = (w-repmat(avg_w,[T,1]));
    partial_derivative_3 = 2*(repmat((sum(partial_derivative_3)*-1/T),[T,1]) + partial_derivative_3);
    
    
    partial_derivative = partial_derivative_1 + partial_derivative_2 + partial_derivative_3;
end