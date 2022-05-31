function [outputArg1,outputArg2] = GDLS_all4(inputArg1,inputArg2)
%TESTGDLS この関数の概要をここに記述
%   詳細説明をここに記述
changeCobraSolver('gurobi');
load('iML1515.mat');
model=iML1515;
load('calculateTMGRPR.mat','list0');
m=size(iML1515.mets,1);
for i=1501:m
    i
    if list0(i,2)>=0.001
        tic;
        targetMet=model.mets{i};
        [model2,targetRID,extype] = modelSetting(model,targetMet);
        %save('a.mat');return;
        solution=GDLS(model2, model2.rxns{targetRID},'koType','genes',...
            'iterationLimit',252000,'timeLimit',3600,'minGrowth',0.001)
        %solution=GDLS(model2, model2.rxns{targetRID},'koType','rxns')
        time=toc;
        s=sprintf("results/GDLS_%d.mat",i);
        save(s);
    end
end
end

