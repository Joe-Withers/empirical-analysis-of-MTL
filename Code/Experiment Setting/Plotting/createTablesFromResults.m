results_path = 'D:\Documents\University\Year 3\Individual Project\Code\Experiment Setting\Results\';
data{1} = 'FiveCitiesChinaCityPM\five_cities_china_cityPM';
data{2} = 'FiveCitiesChinaRegionalPM\five_cities_china_regionalPM';
data{3} = 'FiveCitiesChinaWeather\five_cities_china';
data{4} = 'Parkinsons\parkinsons';
data{5} = 'SARCOS\sarcos';
data{6} = 'SchoolData\school_data';
data{7} = 'StudentPerformanceExams\student_performance_exams';
data{8} = 'StudentPerformanceSchools\student_performance_schools';
methods{1} = '_dirty';
methods{2} = '_L21';
methods{3} = '_lasso';
methods{4} = '_low_rank';
methods{5} = '_regularized';
methods{6} = '_STL';
for d = 1:length(data)
    for m = 1:length(methods)
        directory = dir([results_path, data{d}, methods{m},'*.mat']);
        results(m,d) = load([directory.folder,'\', directory.name]);
        error(m,d) = results(m,d).error;
        time_to_optimise(m,d) = results(m,d).time_to_optimise;
        time_to_learn(m,d) = results(m,d).time_to_learn;
    end
end
error = round(error,4);
time_to_optimise = round(time_to_optimise,4);
time_to_learn = round(time_to_learn*100,4);

for d = 1:length(data)
    min_err = min(error(:,d));
    min_tto = min(time_to_optimise(1:5,d));
    min_ttl = min(time_to_learn(1:5,d));
    for m = 1:length(methods)
        error(m,d) = ((error(m,d)-min_err)/min_err)*100;
        time_to_optimise(m,d) = ((time_to_optimise(m,d)-min_tto)/min_tto)*100;
        time_to_learn(m,d) = ((time_to_learn(m,d)-min_ttl)/min_ttl)*100;
    end
end
'e'