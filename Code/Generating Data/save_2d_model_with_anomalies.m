function true_model = save_2d_model_with_anomalies(number_of_anomalies)
samples = 100;
%y = 2.5x +3;
for i = 1:samples
    x1(i) = 20*rand();
    y1(i) = 2.5*x1(i)+3;
    %add gaussian noise
    y1(i) = y1(i)+randn();
end
X{1} = x1';
Y{1} = y1';
%y = 3x +3;
for i = 1:samples
    x2(i) = 20*rand();
    y2(i) = 3*x2(i)+3;
    y2(i) = y2(i)+randn();%add gaussian noise
end
X{2} = x2';
Y{2} = y2';
%y = 3.5x +3;
for i = 1:samples
    x3(i) = 20*rand();
    y3(i) = 3.5*x3(i)+3;
    y3(i) = y3(i)+randn();%add gaussian noise
end
X{3} = x3';
Y{3} = y3';
%y = 3x +3.5;
for i = 1:samples
    x4(i) = 20*rand();
    y4(i) = 3*x4(i)+3.5;
    y4(i) = y4(i)+randn();%add gaussian noise
end
X{4} = x4';
Y{4} = y4';

% col = ['r','g','b','y'];
% figure;hold on;
% for i = 1:4
%     scatter(X{i}, Y{i},[], col(i), 'filled');
% end

%save('D:\Documents\University\Year 3\Individual Project\Code\Data\GeneratedData\SimilarData','X','Y');

%add anomolies
for j = 1:number_of_anomalies
    for i = 1:4
        X{i}(end+1,:) = 20*rand();
        Y{i}(end+1,:) = 0;
    end
end


% col = ['r','g','b','y'];
% figure;hold on;
% for i = 1:4
%     scatter(X{i}, Y{i},[], col(i), 'filled');
% end
save('D:\Documents\University\Year 3\Individual Project\Code\Data\GeneratedData\SimilarDataAndAnomolies','X','Y');
true_model = [2.5 3 3.5 3];
end