result_path = 'D:\Documents\University\Year 3\Individual Project\Code\Experiment Setting\Results\ToyData';
for i = 1:10
    %% plot for anomalies
    true_model = save_model_with_sparsity(i-1);
    path = 'D:\Documents\University\Year 3\Individual Project\Code\';
    mtl = MultiTaskLearning('nonSparse');
    mtl.loadData('nonSparse');
    savedir = [path 'Experiment Setting\Results\ToyData\'];
    mtl.save_dir = savedir;
    
    mtl.findBestLambdas('STL',1,10);
    directory = dir([result_path,'\nonSparse_STL*.mat']);
    temp = load([directory.folder,'\',directory.name]);
    temp1 = abs(true_model - temp.best_w);
    STL_anomalies(i) = mean(temp1(:));
    
    mtl.findBestLambdas('dirty',2,10);
    directory = dir([result_path,'\nonSparse_dirty*.mat']);
    temp = load([directory.folder,'\',directory.name]);
    temp1 = abs(true_model - temp.best_w);
    dirty_anomalies(i) = mean(temp1(:));
    
    mtl.findBestLambdas('low_rank',1,10);
    directory = dir([result_path,'\nonSparse_low_rank*.mat']);
    temp = load([directory.folder,'\',directory.name]);
    temp1 = abs(true_model - temp.best_w);
    low_rank_anomalies(i) = mean(temp1(:));
    
    mtl.findBestLambdas('regularized',2,10);
    directory = dir([result_path,'\nonSparse_regularized*.mat']);
    temp = load([directory.folder,'\',directory.name]);
    temp1 = abs(true_model - temp.best_w);
    regularized_anomalies(i) = mean(temp1(:));
    
    mtl.findBestLambdas('lasso',2,10);
    directory = dir([result_path,'\nonSparse_lasso*.mat']);
    temp = load([directory.folder,'\',directory.name]);
    temp1 = abs(true_model - temp.best_w);
    lasso_anomalies(i) = mean(temp1(:));
    
    mtl.findBestLambdas('L21',2,10);
    directory = dir([result_path,'\nonSparse_L21*.mat']);
    temp = load([directory.folder,'\',directory.name]);
    temp1 = abs(true_model - temp.best_w);
    L21_anomalies(i) = mean(temp1(:));
end
figure;
plot(0:10:90,STL_anomalies);
hold on;
plot(0:10:90,dirty_anomalies);
plot(0:10:90,low_rank_anomalies);
plot(0:10:90,regularized_anomalies);
plot(0:10:90,lasso_anomalies);
plot(0:10:90,L21_anomalies);
xlabel('Model Sparsity (%)');
ylabel('Error');
title('Effect of sparsity on models error');
