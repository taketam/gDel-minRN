function [outputArg1,outputArg2] = gDel_minRN(model,targetMetID)
%GDEL_MINRN この関数の概要をここに記述
%   詳細説明をここに記述
load('calculateTMGRPR.mat','list0');
tic;
i=targetMetID;
maxloop=3;
maxSearch=3
s=sprintf('results/time%d.mat',targetMetID);
for j=1:maxSearch
    j
    GRLB=list0(i,1)*0.1;
    PRLB=list0(i,2)*0.05*j;
    [vg gr pr it success] = gDel_minRN_core(model,model.mets{i},maxloop,PRLB,GRLB,1);
    if success==1
        time=toc;
        save(s);
        return;
    end
end
time=toc;
save(s)
end

