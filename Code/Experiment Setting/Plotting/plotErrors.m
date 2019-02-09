path = 'D:\Documents\University\Year 3\Individual Project\Code\Experiment Setting\Results';
%parkinson
parkinson_dirty = load('parkinsons_dirty_10-fold-iteration4');
parkinson_L21 = load('parkinsons_L21_10-fold-iteration4');
parkinson_lasso = load('parkinsons_lasso_10-fold-iteration4');
parkinson_low_rank = load('parkinsons_low_rank_10-fold-iteration4');
parkinson_regularized = load('parkinsons_regularized_10-fold-iteration4');
parkinson_STL = load('parkinsons_STL_10-fold-iteration4');

figure; 