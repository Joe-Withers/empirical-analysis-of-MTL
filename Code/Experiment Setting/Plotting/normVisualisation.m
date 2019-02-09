close all;
clear; 
clc;
cols = ['r','b','k','g','y','c','m','r','b','k'];

for p = 1:10
x = 0:0.01:1;
y = (1 - abs(x) .^ p).^(1/p);
plot(-x, y, cols(p));
hold on;
plot(x, -y, cols(p));
plot(x, y, cols(p));
plot(-x, -y, cols(p));
end
for i = 1:10
   h(i) = plot(NaN,NaN,cols(i)); 
end
legend(h, 'L1','L2','L3','L4','L5','L6','L7','L8','L9','L10')
axis square