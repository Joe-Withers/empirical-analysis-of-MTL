function [avg_err, standard_deviation] = meanSquaredErr(x,y,w)
    [~,T] = size(y);
    for t = 1:T % TODO: get rid of loop!
        [D,~] = size(y{t});
        err(t) = sum((x{t}*w(:,t) - y{t}).^2) / D;
    end
    avg_err = sum(err)/T;
    standard_deviation = 1; %todo!
end