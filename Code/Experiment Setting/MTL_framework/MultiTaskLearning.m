classdef MultiTaskLearning < handle
    %UNTITLED9 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        model;
        dataname;
        feature_set_x;
        feature_set_y;
        feature_set_x_train;
        feature_set_y_train;
        feature_set_x_test;
        feature_set_y_test;
        fignum;
        save_dir;
        last_model;
        best_lambdas;
    end
    properties(Access = private)
        data_path = 'D:\Documents\University\Year 3\Individual Project\Code\Data\';
    end
    
    methods
        function obj = MultiTaskLearning(data_name)
            obj.dataname = data_name;
            obj.fignum = 1;
            obj.save_dir = 'D:\Documents\University\Year 3\Individual Project\Code\Experiment Setting\Results\Undefined\';
            obj.loadData(data_name);
        end
        
        function loadData(obj, data_name)
            obj.dataname = data_name;
            switch data_name %switch for loading in the specified data set
                case 'school_data'
                    data = load(strcat(obj.data_path,'SchoolData\SchoolDataFormatted\school'));
                case 'five_cities_china'
                    data = load(strcat(obj.data_path,'FiveCitiesChina\FiveCitiesChinaFormatted\FCC'));
                case 'five_cities_china_regionalPM'
                    data = load(strcat(obj.data_path,'FiveCitiesChina\FiveCitiesChinaFormatted\regional_PM'));
                case 'five_cities_china_cityPM'
                    data = load(strcat(obj.data_path,'FiveCitiesChina\FiveCitiesChinaFormatted\USPost_PM'));
                case 'parkinsons'
                    data = load(strcat(obj.data_path,'ParkinsonsTelemonitoring\ParkinsonsTelemonitoringFormatted\parkinsons'));
                case 'sarcos'
                    data = load(strcat(obj.data_path,'SARCOS\SARCOSFormatted\sarcos'));
                case 'student_performance_exams'
                    data = load(strcat(obj.data_path,'StudentPerformance\Formatted\t_exams'));
                case 'student_performance_schools'
                    data = load(strcat(obj.data_path,'StudentPerformance\Formatted\t_schools'));
                case 'tennis' 
                    data = load(strcat(obj.data_path,'TennisTournaments\Formatted\t_players'));                   
                case 'NegativeCorrelationData' 
                    data = load(strcat(obj.data_path,'GeneratedData\NegativeCorrelationData'));    
                case 'nonSparse' 
                    data = load(strcat(obj.data_path,'GeneratedData\nonSparse'));    
                case 'SimilarData' 
                    data = load(strcat(obj.data_path,'GeneratedData\SimilarData'));    
                case 'SimilarDataAndAnomolies' 
                    data = load(strcat(obj.data_path,'GeneratedData\SimilarDataAndAnomolies'));    
                case 'sparse30' 
                    data = load(strcat(obj.data_path,'GeneratedData\sparse30'));    
                case 'sparse60' 
                    data = load(strcat(obj.data_path,'GeneratedData\sparse60'));    
                case 'sparseMix' 
                    data = load(strcat(obj.data_path,'GeneratedData\sparseMix'));    
                case 'toy_data' 
                    data = load(strcat(obj.data_path,'GeneratedData\ToyData'));    
                case 'aaaa' 
                    data = load(strcat(obj.data_path,'GeneratedData\ToyData'));    
            end
            %full data set
            obj.feature_set_x = data.X;
            obj.feature_set_y = data.Y;
            %split training and testing data set
            for i = 1:length(data.X)
                xt = data.X{i};
                yt = data.Y{i};
                xt_train{i} = xt(1:floor(end*0.5),:); %change 0.9 for 90/10 split, 0.5 for 50/50 split
                yt_train{i} = yt(1:floor(end*0.5),:);
                xt_test{i} = xt(floor(end*0.5)+1:end,:);
                yt_test{i} = yt(floor(end*0.5)+1:end,:);
            end
            obj.feature_set_x_train = xt_train;
            obj.feature_set_y_train = yt_train;
            obj.feature_set_x_test = xt_test;
            obj.feature_set_y_test = yt_test;
        end
        
%         function model = learnModel(obj, MTL_method, lambdas)
%             %user defines lambdas to learn model with
%             model = obj.learnModel_withXY(MTL_method, obj.feature_set_x, obj.feature_set_y, lambdas);
%         end
        
        function findBestLambdas(obj, MTL_method, num_of_lambdas, cross_val_split)
            for i = 1:num_of_lambdas
                lambda_search_space{i} = [1e-5,1e-4,1e-3,1e-2,1e-1,1e0,1e1,1e2,1e3,1e4,1e5];%first iteration lambda
            end
            iterations = 2;%number of iterations - refer to doc
            lambda_search_space_size = 10;%number of lambda values to search at each iteration
            %obj.last_model - used for starting point for optmisation
            obj.last_model = obj.learnModel_withXY('STL', obj.feature_set_x_train, obj.feature_set_y_train, {0.5});
                        
            tic;
            %% find optmial lambda values
            for s = 1:iterations
                %reset error
                error = [];
                lambda_combinations = 1;
                for j = 1:num_of_lambdas
                    lambda_combinations = lambda_combinations*length(lambda_search_space{j});
                end
                %different lambda values
                for i = 1:lambda_combinations
                    cnt{1} = mod((i-1),length(lambda_search_space{1}))+1;%current lambda 1 index
                    cnt{2} = floor((i-1)/length(lambda_search_space{1}))+1;%current lambda 2 index. Note: only handles maximum of 2 lambda values, extend with cnt{3} etc.
                    for j = 1:num_of_lambdas
                        lambda{j} = lambda_search_space{j}(cnt{j});%set current lambda values being used
                    end
                    %trains on some data, tests on rest of data (does 10 times to cover different partitions)
                    error(cnt{1},cnt{2}) = obj.cross_validation(MTL_method, cross_val_split, lambda, obj.feature_set_x_train, obj.feature_set_y_train);
                end
                %% plot and save figures
                if 1
                    fig_name = strcat(obj.save_dir, obj.dataname, '_', MTL_method, '_', num2str(cross_val_split), '-fold-iteration', num2str(s));
                    if(s > 1)
                        obj.plotError(error,lambda_search_space,fig_name,num_of_lambdas);
                    else
                        obj.plotErrorLogAxis(error,lambda_search_space,fig_name,num_of_lambdas);
                    end
                end
                %% set lambda search space for next iteration
                lambda_search_space = obj.get_next_lambda_search_space(error, lambda_search_space, num_of_lambdas, lambda_search_space_size);
            end
            time_to_optimise = toc;%time to find optimal lambda values
            
            tic;
            %% learn model with optimal lambda values on whole of training set
            obj.model = obj.learnModel_withXY(MTL_method, obj.feature_set_x_train, obj.feature_set_y_train, obj.best_lambdas);
            time_to_learn = toc;
            error = obj.testSetError();
            best_w = obj.model;
            best_lambdas = obj.best_lambdas;
            save(strcat(obj.save_dir, obj.dataname, '_', MTL_method, '_', num2str(cross_val_split), '-fold-iteration', num2str(s)),'error','best_w','best_lambdas','time_to_optimise','time_to_learn');
        end
        
        function terr = testSetError(obj)
            x = obj.feature_set_x_test;
            y = obj.feature_set_y_test;
            w = obj.model;
            terr = meanSquaredErr(x,y,w);
        end
     
    end

    methods(Access = private)
        
        function mean_err = cross_validation(obj, MTL_method, split, lambda, X, Y)
            for iter = 1:split
                [train_x, test_x, train_y, test_y] = obj.splitTrainAndTest(X,Y,iter,split);
                w = obj.learnModel_withXY(MTL_method, train_x, train_y, lambda);
                obj.last_model = w;
                [avg_err(iter),~] = meanSquaredErr(test_x, test_y, w);
            end
            mean_err = sum(avg_err)/split;
        end
        
        function [train_x, test_x, train_y, test_y] = splitTrainAndTest(obj,X,Y,iter,split)
            T = length(X);
            for t = 1:T
                [n,~] = size(X{t});
                chunk_size = floor(n/split);
                s = ((iter-1)*chunk_size);
                e = ((iter)*chunk_size);
                
                train_x{t} = cat(1, X{t}(1:s ,:) ,X{t}(e+1:end ,:));
                train_y{t} = cat(1, Y{t}(1:s ,:) ,Y{t}(e+1:end ,:));
                
                test_x{t} =  X{t}(s+1:e ,:);
                test_y{t} =  Y{t}(s+1:e ,:);
            end
        end
        
        function model = learnModel_withXY(obj, MTL_method, X, Y, lambda)
            switch MTL_method
                case 'STL'
                    model = regularized_STL(X,Y,lambda{1});
                case 'dirty'
                    model = dirty_approach(X,Y,lambda{1},lambda{2},obj.last_model);
                case 'regularized'
                    %model = regularized_MTL(X,Y,lambda{1},lambda{2}); %JW implementation
                    model = regMTL_approach(X,Y,lambda{1},lambda{2},obj.last_model); %malsar implementation
                case 'lasso'
                    model = lasso_approach(X,Y,lambda{1},lambda{2},obj.last_model);
                case 'L21'
                    model = L21_approach(X,Y,lambda{1},lambda{2},obj.last_model);
                case 'low_rank'
                    model = low_rank_approach(X,Y,lambda{1},obj.last_model);
            end
        end
        
        function lambda_search_space = get_next_lambda_search_space(obj, error, prev_lambda_search_space, num_of_lambdas, lambdas_search_space_size)
            %find min position
            minpos=find(error == min(error(:)));
            %convert to min indexes
            lambda_idx{1} = mod(minpos-1,length(prev_lambda_search_space{1}))+1;
            if(num_of_lambdas>1)
                lambda_idx{2} = ceil(minpos/length(prev_lambda_search_space{2}));     
            end
            %find next lambda search range
            for i = 1:num_of_lambdas
                obj.best_lambdas{i} = prev_lambda_search_space{i}(lambda_idx{i});%update objects current best known lambda values
                next_min_lambda{i} = prev_lambda_search_space{i}(max(1,lambda_idx{i}-1));
                next_max_lambda{i} = prev_lambda_search_space{i}(min(length(prev_lambda_search_space{i}),lambda_idx{i}+1));
                % set new lambda search space (based on best values from last iteration)
                step = ((next_max_lambda{i}-next_min_lambda{i})/lambdas_search_space_size);
                lambda_search_space{i} = next_min_lambda{i}:step:next_max_lambda{i};
            end
        end
        
        function plotErrorLogAxis(obj,error,lambda_search_space,fig_name,num_of_lambdas)
            h = figure(obj.fignum);
            %line plot for 1 lambda, surface plot for 2 lambdas
            if num_of_lambdas == 1
                plot(log10(lambda_search_space{1}),error(:,1));
                xlabel('log(\lambda_1)')
                ylabel('Mean Squared Error')
                title({'Error over all data points in all tasks when Changing the'; 'Regularization Parameter'});
            elseif num_of_lambdas == 2
                surf(log10(lambda_search_space{1}),log10(lambda_search_space{2}),error);
                xlabel('log(\lambda_1)')
                ylabel('log(\lambda_2)')
                zlabel('Mean Squared Error')
                title({'Error over all data points in all tasks when Changing the'; 'Regularization Parameters'});                   
            end
            savefig(h, fig_name);
        end
        
        function plotError(obj,error,lambda_search_space,fig_name,num_of_lambdas)
            h = figure(obj.fignum);
            %line plot for 1 lambda, surface plot for 2 lambdas
            if num_of_lambdas == 1
                plot(lambda_search_space{1},error(:,1));
                xlabel('\lambda_1')
                ylabel('Mean Squared Error')
                title({'Error over all data points in all tasks when Changing the'; 'Regularization Parameter'});
            elseif num_of_lambdas == 2
                surf(lambda_search_space{1},lambda_search_space{2},error);
                xlabel('\lambda_1')
                ylabel('\lambda_2')
                zlabel('Mean Squared Error')
                title({'Error over all data points in all tasks when Changing the'; 'Regularization Parameters'});                   
            end
            savefig(h, fig_name);
        end
        
%         function t_err = compareModels(obj, w1, w2, x, y)
%             T = length(x);
%             for t = 1:T
%                 [D,~] = size(y{t});
%                 abs_w1_err = abs(x{t}*w1(:,t) - y{t});
%                 abs_w2_err = abs(x{t}*w2(:,t) - y{t});
%                 err_diff = abs_w1_err - abs_w2_err;
%                 t_err(t) = sum(err_diff) / D;
%             end
%         end
        
    end
end

