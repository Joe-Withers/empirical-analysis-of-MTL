result_path = 'D:\Documents\University\Year 3\Individual Project\Code\Experiment Setting\Results\ToyData';
for i = 1:10
    %% plot for anomalies
    true_model = save_2d_model_with_anomalies(5*i);
    path = 'D:\Documents\University\Year 3\Individual Project\Code\';
    mtl = MultiTaskLearning('SimilarDataAndAnomolies');
    mtl.loadData('SimilarDataAndAnomolies');
    savedir = [path 'Experiment Setting\Results\ToyData\'];
    mtl.save_dir = savedir;
    
    mtl.findBestLambdas('STL',1,10);
    directory = dir([result_path,'\SimilarDataAndAnomolies_STL*.mat']);
    temp = load([directory.folder,'\',directory.name]);
    STL_anomalies(i) = mean(abs(true_model - temp.best_w));
    
    mtl.findBestLambdas('dirty',2,10);
    directory = dir([result_path,'\SimilarDataAndAnomolies_dirty*.mat']);
    temp = load([directory.folder,'\',directory.name]);
    dirty_anomalies(i) = mean(abs(true_model - temp.best_w));
    
    mtl.findBestLambdas('low_rank',1,10);
    directory = dir([result_path,'\SimilarDataAndAnomolies_low_rank*.mat']);
    temp = load([directory.folder,'\',directory.name]);
    low_rank_anomalies(i) = mean(abs(true_model - temp.best_w));
    
    mtl.findBestLambdas('regularized',2,10);
    directory = dir([result_path,'\SimilarDataAndAnomolies_regularized*.mat']);
    temp = load([directory.folder,'\',directory.name]);
    regularized_anomalies(i) = mean(abs(true_model - temp.best_w));
    
    mtl.findBestLambdas('lasso',2,10);
    directory = dir([result_path,'\SimilarDataAndAnomolies_lasso*.mat']);
    temp = load([directory.folder,'\',directory.name]);
    lasso_anomalies(i) = mean(abs(true_model - temp.best_w));
    
    mtl.findBestLambdas('L21',2,10);
    directory = dir([result_path,'\SimilarDataAndAnomolies_L21*.mat']);
    temp = load([directory.folder,'\',directory.name]);
    L21_anomalies(i) = mean(abs(true_model - temp.best_w));
end
figure;
plot(1:10,STL_anomalies);
hold on;
plot(1:10,dirty_anomalies);
plot(1:10,low_rank_anomalies);
plot(1:10,regularized_anomalies);
plot(1:10,lasso_anomalies);
plot(1:10,L21_anomalies);
