function w = regularized_linear_regression(x,y,gamma)
%linear regression
[~,n] = size(x);
I = eye(n);
w = (((x' * x) + gamma * I)^(-1))*(x' * y);
%Ew = ((1/2) * ((y - (w * x')')' * (y - (w * x')'))) + ((gamma / 2) * (w * w'));
end