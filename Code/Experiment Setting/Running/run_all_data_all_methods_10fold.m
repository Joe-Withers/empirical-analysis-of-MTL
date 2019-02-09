path = 'D:\Documents\University\Year 3\Individual Project\Code\';
mtl = MultiTaskLearning('sarcos');

%% five cities china city PM
mtl.loadData('five_cities_china_cityPM');
savedir = [path 'Experiment Setting\Results\FiveCitiesChinaCityPM\'];
mtl.save_dir = savedir;

mtl.findBestLambdas('STL',1,10);
mtl.findBestLambdas('dirty',2,10);
mtl.findBestLambdas('low_rank',1,10);
mtl.findBestLambdas('regularized',2,10);
mtl.findBestLambdas('lasso',2,10);
mtl.findBestLambdas('L21',2,10);

%% five cities china regional PM
mtl.loadData('five_cities_china_regionalPM');
savedir = [path 'Experiment Setting\Results\FiveCitiesChinaRegionalPM\'];
mtl.save_dir = savedir;

mtl.findBestLambdas('STL',1,10);
mtl.findBestLambdas('dirty',2,10);
mtl.findBestLambdas('low_rank',1,10);
mtl.findBestLambdas('regularized',2,10);
mtl.findBestLambdas('lasso',2,10);
mtl.findBestLambdas('L21',2,10);
%% parkinsons
mtl.loadData('parkinsons');
savedir = [path 'Experiment Setting\Results\Parkinsons\'];
mtl.save_dir = savedir;

mtl.findBestLambdas('STL',1,10);
mtl.findBestLambdas('dirty',2,10);
mtl.findBestLambdas('low_rank',1,10);
mtl.findBestLambdas('regularized',2,10);
mtl.findBestLambdas('lasso',2,10);
mtl.findBestLambdas('L21',2,10);
% 
%% school data
mtl.loadData('school_data');
savedir = [path 'Experiment Setting\Results\SchoolData\'];
mtl.save_dir = savedir;

mtl.findBestLambdas('STL',1,10);
mtl.findBestLambdas('dirty',2,10);
mtl.findBestLambdas('low_rank',1,10);
mtl.findBestLambdas('regularized',2,10);
mtl.findBestLambdas('lasso',2,10);
mtl.findBestLambdas('L21',2,10);

%% student performance exams
mtl.loadData('student_performance_exams');
savedir = [path 'Experiment Setting\Results\StudentPerformanceExams\'];
mtl.save_dir = savedir;

mtl.findBestLambdas('STL',1,10);
mtl.findBestLambdas('dirty',2,10);
mtl.findBestLambdas('low_rank',1,10);
mtl.findBestLambdas('regularized',2,10);
mtl.findBestLambdas('lasso',2,10);
mtl.findBestLambdas('L21',2,10);

%% student performance schools
mtl.loadData('student_performance_schools');
savedir = [path 'Experiment Setting\Results\StudentPerformanceSchools\'];
mtl.save_dir = savedir;

mtl.findBestLambdas('STL',1,10);
mtl.findBestLambdas('dirty',2,10);
mtl.findBestLambdas('low_rank',1,10);
mtl.findBestLambdas('regularized',2,10);
mtl.findBestLambdas('lasso',2,10);
mtl.findBestLambdas('L21',2,10);

%% sarcos
mtl.loadData('sarcos');
savedir = [path 'Experiment Setting\Results\SARCOS\'];
mtl.save_dir = savedir;

mtl.findBestLambdas('STL',1,10);
mtl.findBestLambdas('dirty',2,10);
mtl.findBestLambdas('low_rank',1,10);
mtl.findBestLambdas('regularized',2,10);
mtl.findBestLambdas('lasso',2,10);
mtl.findBestLambdas('L21',2,10);

%% five cities china
mtl.loadData('five_cities_china');
savedir = [path 'Experiment Setting\Results\FiveCitiesChinaWeather\'];
mtl.save_dir = savedir;

mtl.findBestLambdas('STL',1,10);
mtl.findBestLambdas('dirty',2,10);
mtl.findBestLambdas('low_rank',1,10);
mtl.findBestLambdas('regularized',2,10);
mtl.findBestLambdas('lasso',2,10);
mtl.findBestLambdas('L21',2,10);

