samples = 100;
n=10;
%y = 5x +2;
for i = 1:samples
    x1(i) = 20*rand();
    y1(i) = 5*x1(i)+2;
    %add gaussian noise
    y1(i) = y1(i)+n*randn();
end
X{1} = x1';
Y{1} = y1';
%y = 4x -2;
for i = 1:samples
    x2(i) = 20*rand();
    y2(i) = 4*x2(i)-2;
    y2(i) = y2(i)+n*randn();%add gaussian noise
end
X{2} = x2';
Y{2} = y2';
%y = -5x -2;
for i = 1:samples
    x3(i) = 20*rand();
    y3(i) = -5*x3(i)-2;
    y3(i) = y3(i)+n*randn();%add gaussian noise
end
X{3} = x3';
Y{3} = y3';

col = ['r','g','b','y'];
figure;hold on;
for i = 1:3
    scatter(X{i}, Y{i},[], col(i), 'filled');
end
xlabel('X');
ylabel('Y');
title('Data generated from negatively correlated tasks');

% save('D:\Documents\University\Year 3\Individual Project\Code\Data\GeneratedData\NegativeCorrelationData','X','Y');
