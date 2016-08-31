clear all; close all; clc

%%
[settings, params] = load_settings_params();
file_names = dir(fullfile(settings.path2data_phonemes, '*.mat'));
num_potential_units = length(file_names);
if settings.units == 0
    settings.units = 1:num_potential_units;
end

%%
for seed = 1:50
    params.seed = seed;
    file_name = get_file_name_curr_run(settings, params);
    load(fullfile(settings.path2output, file_name), 'results')
    acc(seed) = results.accuracy;
    chance_level = results.chance_level;
    clear 'results'
end

%%
mean(acc)
chance_level
% std(acc)
% %%
% % D011 uniform
% acc_all(1, 1) = 0.0795;
% % D011 freq
% acc_all(1, 2) = 0.0409;
% % 466 uniform
% acc_all(2, 1) = 0.0773;
% % 466 freq
% acc_all(2, 2) = 0.0841;
% 
% %%
% figure;set(gcf, 'color', [1 1 1])
% barweb(acc_all, zeros(2), [], {'Patient D011', 'Patient 466'})
% legend({'Uniform priors', 'Phoneme-frequency priors'}, 'location', 'NorthEastOutside')
% line([0,4], [chance_level, chance_level], 'LineStyle', '--', 'color', 'k')