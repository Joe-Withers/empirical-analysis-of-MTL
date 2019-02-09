%first: maually imported .csv files
%% beijing dongsi
beijing_dongsi_table = [BeijingPM2010010120151231(:,7),BeijingPM2010010120151231(:,6),BeijingPM2010010120151231(:,11:14),BeijingPM2010010120151231(:,16:end)];

beijing_dongsi_array = table2array(beijing_dongsi_table);
beijing_dongsi_array(any(isnan(beijing_dongsi_array), 2), :) = [];
%% beijing donsihuan
beijing_dongsihuan_table = [BeijingPM2010010120151231(:,8),BeijingPM2010010120151231(:,6),BeijingPM2010010120151231(:,11:14),BeijingPM2010010120151231(:,16:end)];

beijing_dongsihuan_array = table2array(beijing_dongsihuan_table);
beijing_dongsihuan_array(any(isnan(beijing_dongsihuan_array), 2), :) = [];
%% beijing nongz
beijing_nongz_table = [BeijingPM2010010120151231(:,9),BeijingPM2010010120151231(:,6),BeijingPM2010010120151231(:,11:14),BeijingPM2010010120151231(:,16:end)];

beijing_nongz_array = table2array(beijing_nongz_table);
beijing_nongz_array(any(isnan(beijing_nongz_array), 2), :) = [];
%% chengdu caotangsi
chengdu_caotangsi_table = [ChengduPM2010010120151231(:,7),ChengduPM2010010120151231(:,6),ChengduPM2010010120151231(:,10:13),ChengduPM2010010120151231(:,15:end)];

chengdu_caotangsi_array = table2array(chengdu_caotangsi_table);
chengdu_caotangsi_array(any(isnan(chengdu_caotangsi_array), 2), :) = [];
%% chengdu
chengdu_shahepu_table = [ChengduPM2010010120151231(:,8),ChengduPM2010010120151231(:,6),ChengduPM2010010120151231(:,10:13),ChengduPM2010010120151231(:,15:end)];

chengdu_shahepu_array = table2array(chengdu_shahepu_table);
chengdu_shahepu_array(any(isnan(chengdu_shahepu_array), 2), :) = [];
%% guangzhou station
guangzhou_station_table = [GuangzhouPM2010010120151231(:,7),GuangzhouPM2010010120151231(:,6),GuangzhouPM2010010120151231(:,10:13),GuangzhouPM2010010120151231(:,15:end)];

guangzhou_station_array = table2array(guangzhou_station_table);
guangzhou_station_array(any(isnan(guangzhou_station_array), 2), :) = [];
%% guangzhou school
guangzhou_school_table = [GuangzhouPM2010010120151231(:,8),GuangzhouPM2010010120151231(:,6),GuangzhouPM2010010120151231(:,10:13),GuangzhouPM2010010120151231(:,15:end)];

guangzhou_school_array = table2array(guangzhou_school_table);
guangzhou_school_array(any(isnan(guangzhou_school_array), 2), :) = [];
%% shanghai jingan
shanghai_jingan_table = [ShanghaiPM2010010120151231(:,7),ShanghaiPM2010010120151231(:,6),ShanghaiPM2010010120151231(:,10:13),ShanghaiPM2010010120151231(:,15:end)];

shanghai_jingan_array = table2array(shanghai_jingan_table);
shanghai_jingan_array(any(isnan(shanghai_jingan_array), 2), :) = [];
%% shanghai xuhui
shanghai_xuhui_table = [ShanghaiPM2010010120151231(:,9),ShanghaiPM2010010120151231(:,6),ShanghaiPM2010010120151231(:,10:13),ShanghaiPM2010010120151231(:,15:end)];

shanghai_xuhui_array = table2array(shanghai_xuhui_table);
shanghai_xuhui_array(any(isnan(shanghai_xuhui_array), 2), :) = [];
%% shenyang thia
shenyang_thia_table = [ShenyangPM2010010120151231(:,7),ShenyangPM2010010120151231(:,6),ShenyangPM2010010120151231(:,10:13),ShenyangPM2010010120151231(:,15:end)];
shenyang_thia_var_names = shenyang_thia_table.Properties.VariableNames;

shenyang_thia_table.(shenyang_thia_var_names{8}) = grp2idx(shenyang_thia_table.(shenyang_thia_var_names{8}));
shenyang_thia_table.(shenyang_thia_var_names{9}) = grp2idx(shenyang_thia_table.(shenyang_thia_var_names{9}));

shenyang_thia_array = table2array(shenyang_thia_table);
shenyang_thia_array(any(isnan(shenyang_thia_array), 2), :) = [];
%% shenyang xiao
shenyang_xiao_table = [ShenyangPM2010010120151231(:,9),ShenyangPM2010010120151231(:,6),ShenyangPM2010010120151231(:,10:13),ShenyangPM2010010120151231(:,15:end)];
shenyang_xiao_var_names = shenyang_xiao_table.Properties.VariableNames;

shenyang_xiao_table.(shenyang_xiao_var_names{8}) = grp2idx(shenyang_xiao_table.(shenyang_xiao_var_names{8}));
shenyang_xiao_table.(shenyang_xiao_var_names{9}) = grp2idx(shenyang_xiao_table.(shenyang_xiao_var_names{9}));

shenyang_xiao_array = table2array(shenyang_xiao_table);
shenyang_xiao_array(any(isnan(shenyang_xiao_array), 2), :) = [];

%% process arrays

X{1} = beijing_dongsi_array(:,2:end);
Y{1} = beijing_dongsi_array(:,1);

X{2} = beijing_dongsihuan_array(:,2:end);
Y{2} = beijing_dongsihuan_array(:,1);

X{3} = beijing_nongz_array(:,2:end);
Y{3} = beijing_nongz_array(:,1);

X{4} = chengdu_caotangsi_array(:,2:end);
Y{4} = chengdu_caotangsi_array(:,1);

X{5} = chengdu_shahepu_array(:,2:end);
Y{5} = chengdu_shahepu_array(:,1);

X{6} = guangzhou_school_array(:,2:end);
Y{6} = guangzhou_school_array(:,1);

X{7} = guangzhou_station_array(:,2:end);
Y{7} = guangzhou_station_array(:,1);

X{8} = shanghai_jingan_array(:,2:end);
Y{8} = shanghai_jingan_array(:,1);

X{9} = shanghai_xuhui_array(:,2:end);
Y{9} = shanghai_xuhui_array(:,1);

X{10} = shenyang_thia_array(:,2:end);
Y{10} = shenyang_thia_array(:,1);

X{11} = shenyang_xiao_array(:,2:end);
Y{11} = shenyang_xiao_array(:,1);

save('D:\Documents\University\Year 3\Individual Project\Code\Data\FiveCitiesChina\FiveCitiesChinaFormatted\regional_PM','X','Y');
