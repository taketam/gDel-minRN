function [outputArg1,outputArg2] = test_MCS()
%EFMEXAMPLE この関数の概要をここに記述
%   詳細説明をここに記述
startcna(1);

%load('e_coli_core.mat');
%model=e_coli_core;
load('small.mat');

targetMet='m4'
[model2,targetRID,extype] = modelSetting(model,targetMet);
m=size(model2.mets,1);
n=size(model2.rxns,1);
g=size(model2.genes,1);
gr_id=find(model2.c);
cnap=CNAcobra2cna(model2);


T=zeros(1,n);
T(1,3)=1;
t=0;
D=zeros(2,n);
D(1,gr_id)=-1;
d(1,1)=-0.1;
D(2,targetRID)=-1;
d(2,1)=-0.1;
koCost=ones(n,1);
kiCost=ones(n,1);
maxSolutions=10;
maxCost=10;
timeLimit=1000;

[mcs, status, cmp_cnap, cmp_mcs, mcs_idx_cmp_full, obj] = ...
CNAMCSEnumerator2(cnap,T,t,D,d,koCost,kiCost,maxSolutions,maxCost)

save('test_MCS.mat');
return;


end

