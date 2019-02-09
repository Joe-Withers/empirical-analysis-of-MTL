%first: maually imported .csv files
%% beijing
beijing_table = [BeijingPM2010010120151231(:,10),BeijingPM2010010120151231(:,6),BeijingPM2010010120151231(:,11:14),BeijingPM2010010120151231(:,16:end)];

beijing_array = table2array(beijing_table);
beijing_array(any(isnan(beijing_array), 2), :) = [];
%% chengdu
chengdu_table = [BeijingPM2010010120151231(:,9),BeijingPM2010010120151231(:,6),ChengduPM2010010120151231(:,10:13),ChengduPM2010010120151231(:,15:end)];

chengdu_array = table2array(chengdu_table);
chengdu_array(any(isnan(chengdu_array), 2), :) = [];
%% guangzhou
guangzhou_table = [BeijingPM2010010120151231(:,9),BeijingPM2010010120151231(:,6),GuangzhouPM2010010120151231(:,10:13),GuangzhouPM2010010120151231(:,15:end)];

guangzhou_array = table2array(guangzhou_table);
guangzhou_array(any(isnan(guangzhou_array), 2), :) = [];
%% shanghai
shanghai_table = [BeijingPM2010010120151231(:,8),BeijingPM2010010120151231(:,6),ShanghaiPM2010010120151231(:,10:13),ShanghaiPM2010010120151231(:,15:end)];

shanghai_array = table2array(shanghai_table);
shanghai_array(any(isnan(shanghai_array), 2), :) = [];
%% shenyang
shenyang_table = [BeijingPM2010010120151231(:,8),BeijingPM2010010120151231(:,6),ShenyangPM2010010120151231(:,10:13),ShenyangPM2010010120151231(:,15:end)];
shenyang_var_names = shenyang_table.Properties.VariableNames;

shenyang_table.(shenyang_var_names{8}) = grp2idx(shenyang_table.(shenyang_var_names{8}));
shenyang_table.(shenyang_var_names{9}) = grp2idx(shenyang_table.(shenyang_var_names{9}));

shenyang_array = table2array(shenyang_table);
shenyang_array(any(isnan(shenyang_array), 2), :) = [];

%% process arrays

X{1} = beijing_array(:,2:end);
Y{1} = beijing_array(:,1);
X{2} = chengdu_array(:,2:end);
Y{2} = chengdu_array(:,1);
X{3} = guangzhou_array(:,2:end);
Y{3} = guangzhou_array(:,1);
X{4} = shanghai_array(:,2:end);
Y{4} = shanghai_array(:,1);
X{5} = shenyang_array(:,2:end);
Y{5} = shenyang_array(:,1);

save('D:\Documents\University\Year 3\Individual Project\Code\Data\FiveCitiesChina\FiveCitiesChinaFormatted\USPost_PM','X','Y');
