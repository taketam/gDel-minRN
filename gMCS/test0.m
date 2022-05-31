function [outputArg1,outputArg2] = test0(inputArg1,inputArg2)
%TEST1 この関数の概要をここに記述
%   詳細説明をここに記述
load('smallExample2.mat');

N=[-1 1 -1 -1 0; 0 0 1 1 -1];
I=eye(5);
Ir=-I(:,2:5);
t=[0;0;0;0;-1];

Ndual=[N' I Ir t]

n_MCS=10;
max_len_MCS=7;
optional_inputs.timelimit=30;
optional_inputs.rxn_set={'r1';'r2'};

[MCSs, MCS_time]=calculateMCS(model,n_MCS,max_len_MCS,optional_inputs)


save('test0.mat');
end

