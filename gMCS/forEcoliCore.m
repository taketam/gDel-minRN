function [outputArg1,outputArg2] = forEcoliCore(inputArg1,inputArg2)
load('targetMetList.mat');
load('e_coli_core.mat');
model=e_coli_core;
tn=size(targetMetList,1);
for i=1:tn
    [rmcs, full_mcs, full_cnap, model2, targetRID] = run_gMCS(model,targetMetList{i,1});    
    [GR(i,1),PR(i,1),success(i,1)] = check_rmcs(model2,rmcs,targetRID);
end
save('forEcoliCore.mat');
end

