path = 'D:\Documents\University\Year 3\Individual Project\Code\';
mtl = MultiTaskLearning('toy_data');
mtl.fignum = 1;

%% toy data
% mtl.loadData('NegativeCorrelationData');
% savedir = [path 'Experiment Setting\Results\ToyData\'];
% mtl.save_fig_dir = savedir;
% 
% mtl.findBestLambdas('STL',1,10);
% mtl.findBestLambdas('dirty',2,10);
% mtl.findBestLambdas('low_rank',1,10);
% mtl.findBestLambdas('regularized',2,10);
% mtl.findBestLambdas('lasso',2,10);
% mtl.findBestLambdas('L21',2,10);
% 
% %% toy data
% mtl.loadData('nonSparse');
% savedir = [path 'Experiment Setting\Results\ToyData\'];
% mtl.save_fig_dir = savedir;
% 
% mtl.findBestLambdas('STL',1,10);
% mtl.findBestLambdas('dirty',2,10);
% mtl.findBestLambdas('low_rank',1,10);
% mtl.findBestLambdas('regularized',2,10);
% mtl.findBestLambdas('lasso',2,10);
% mtl.findBestLambdas('L21',2,10);
% 
% %% toy data
% mtl.loadData('SimilarData');
% savedir = [path 'Experiment Setting\Results\ToyData\'];
% mtl.save_fig_dir = savedir;
% 
% mtl.findBestLambdas('STL',1,10);
% mtl.findBestLambdas('dirty',2,10);
% mtl.findBestLambdas('low_rank',1,10);
% mtl.findBestLambdas('regularized',2,10);
% mtl.findBestLambdas('lasso',2,10);
% mtl.findBestLambdas('L21',2,10);
% 
% %% toy data
% mtl.loadData('SimilarDataAndAnomolies');
% savedir = [path 'Experiment Setting\Results\ToyData\'];
% mtl.save_fig_dir = savedir;
% 
% mtl.findBestLambdas('STL',1,10);
% mtl.findBestLambdas('dirty',2,10);
% mtl.findBestLambdas('low_rank',1,10);
% mtl.findBestLambdas('regularized',2,10);
% mtl.findBestLambdas('lasso',2,10);
% mtl.findBestLambdas('L21',2,10);

%% toy data
mtl.loadData('sparse30');
savedir = [path 'Experiment Setting\Results\ToyData\'];
mtl.save_fig_dir = savedir;

mtl.findBestLambdas('STL',1,10);
mtl.findBestLambdas('dirty',2,10);
mtl.findBestLambdas('low_rank',1,10);
mtl.findBestLambdas('regularized',2,10);
mtl.findBestLambdas('lasso',2,10);
mtl.findBestLambdas('L21',2,10);
%% toy data
mtl.loadData('sparse60');
savedir = [path 'Experiment Setting\Results\ToyData\'];
mtl.save_fig_dir = savedir;

mtl.findBestLambdas('STL',1,10);
mtl.findBestLambdas('dirty',2,10);
mtl.findBestLambdas('low_rank',1,10);
mtl.findBestLambdas('regularized',2,10);
mtl.findBestLambdas('lasso',2,10);
mtl.findBestLambdas('L21',2,10);
%% toy data
mtl.loadData('sparseMix');
savedir = [path 'Experiment Setting\Results\ToyData\'];
mtl.save_fig_dir = savedir;

mtl.findBestLambdas('STL',1,10);
mtl.findBestLambdas('dirty',2,10);
mtl.findBestLambdas('low_rank',1,10);
mtl.findBestLambdas('regularized',2,10);
mtl.findBestLambdas('lasso',2,10);
mtl.findBestLambdas('L21',2,10);
%% toy data
mtl.loadData('toy_data');
savedir = [path 'Experiment Setting\Results\ToyData\'];
mtl.save_fig_dir = savedir;

mtl.findBestLambdas('STL',1,10);
mtl.findBestLambdas('dirty',2,10);
mtl.findBestLambdas('low_rank',1,10);
mtl.findBestLambdas('regularized',2,10);
mtl.findBestLambdas('lasso',2,10);
mtl.findBestLambdas('L21',2,10);