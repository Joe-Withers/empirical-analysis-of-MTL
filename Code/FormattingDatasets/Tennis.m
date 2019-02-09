tennis_table{1} = AusOpenmen2013;
tennis_table{2} = AusOpenwomen2013;
tennis_table{3} = FrenchOpenmen2013;
tennis_table{4} = FrenchOpenwomen2013;
tennis_table{5} = USOpenmen2013;
tennis_table{6} = USOpenwomen2013;
tennis_table{7} = Wimbledonmen2013;
tennis_table{8} = Wimbledonwomen2013;

for i = 1:8
    tennis_table{i}.Properties.VariableNames = tennis_table{1}.Properties.VariableNames;
end

full_table = [tennis_table{1};tennis_table{2};tennis_table{3};tennis_table{4};tennis_table{5};
    tennis_table{6};tennis_table{7};tennis_table{8}];

vars = full_table.Properties.VariableNames;
for j = [1,2]
    full_table.(vars{j}) = grp2idx(full_table.(vars{j}));
end

tennis_array = table2array(full_table);

full_array = [tennis_array(:,1),tennis_array(:,7:24),tennis_array(:,25:42),tennis_array(:,3);
    tennis_array(:,2),tennis_array(:,25:42),tennis_array(:,7:24),~tennis_array(:,3)];

for i = 1: max(full_array(:,1))
    task = full_array(full_array(:,1)==i, :);
    X{i} = task(:,2:end-1);
    Y{i} = task(:,end);
end
save('C:\Users\Joe\Documents\University\Year 3\Individual Project\Code\Data\TennisTournaments\Formatted\t_players','X','Y');


