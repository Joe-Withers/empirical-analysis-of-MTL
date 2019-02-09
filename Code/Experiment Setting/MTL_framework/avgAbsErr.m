function [avg_err, standard_deviation] = avgAbsErr(x,y,w)
    [~,T] = size(y);
    for t = 1:T % TODO: get rid of loop!
        [D,~] = size(y{t});
        err(t) = sum(abs(x{t}*w(:,t) - y{t})) / D;
    end
    avg_err = sum(err)/T;
    standard_deviation = 1; %todo!
end