function [outputArg1,outputArg2] = test1(inputArg1,inputArg2)
%TEST1 この関数の概要をここに記述
%   詳細説明をここに記述
N=[-1 1 -1 -1 0; 0 0 1 1 -1];
I=eye(5);
Ir=-I(:,2:5);
t=[0;0;0;0;-1];

Ndual=[N' I Ir t]

n_MCS=10;
max_len_MCS=7;
optional_inputs.timelimit=30;

for i=1:5
    s=sprintf('m%d',i);
    model.mets{i}=s;
end
for i=1:12
    s=sprintf('r%d',i);
    model.rxns{i}=s;
    model.ub(i)=10;
    model.lb(i)=0;
    model.c(i)=0;
    %model.rev(i)=1;
end
model.lb(1)=-10;
model.lb(2)=-10;
model.c(12)=1;
model.S=Ndual;
%optional_inputs.rxn_set={'r1';'r2';'r3';'r4';'r5';'r6';'r7'};
[MCSs, MCS_time]=calculateMCS(model,n_MCS,max_len_MCS,optional_inputs)


save('test1.mat');
end

