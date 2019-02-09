%manually load data in
parkinsons_table = [parkinsonsupdrs(:,1),parkinsonsupdrs(:,5:end)];

parkinsons_array = table2array(parkinsons_table);
parkinsons_array(any(isnan(parkinsons_array), 2), :) = [];

for i = 1: max(parkinsons_array(:,1))
    task = parkinsons_array(parkinsons_array(:,1)==i, :);
    X{i} = task(:,4:end);
    Y{i} = task(:,2);
end
save('C:\Users\Joe\Documents\University\Year 3\Individual Project\Code\Data\ParkinsonsTelemonitoring\ParkinsonsTelemonitoringFormatted\parkinsons','X','Y');
