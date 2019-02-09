function [ W ] = reg_STL( X, Y, gamma )
T = length(X);
for i = 1:T
    w(i,:) = regularized_linear_regression(X{i},Y{i},gamma);
end

W = w';

end

