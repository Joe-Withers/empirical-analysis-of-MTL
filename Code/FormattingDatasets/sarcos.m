%manually load data in
sarcos_array = [sarcos_inv;sarcos_inv_test];
 
sarcos_array(any(isnan(sarcos_array), 2), :) = [];

for i = 1:7
    X{i} = sarcos_array(:,1:21);
    Y{i} = sarcos_array(:,21+i);
end
save('C:\Users\Joe\Documents\University\Year 3\Individual Project\Code\Data\SARCOS\SARCOSFormatted\sarcos','X','Y');
