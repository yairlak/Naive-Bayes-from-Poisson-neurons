clear all; close all; clc

%%
for seed = 1:50
    params.seed = seed;
    main_naive_bayes_classification
end