figure;
[~,m] = size(X{1});
for j = 1:m
    subplot(m,1,j);hold on;
    for t = 1:length(X)
        scatter(X{t}(1:100:end,j),Y{t}(1:100:end),5,'filled');
    end
end