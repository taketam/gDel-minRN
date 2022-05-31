function [outputArg1,outputArg2] = testGDLS(inputArg1,inputArg2)
%TESTGDLS この関数の概要をここに記述
%   詳細説明をここに記述
%changeCobraSolver('gurobi');
load('e_coli_core.mat');
model=e_coli_core;
targetMet=model.mets{39};
[model2,targetRID,extype] = modelSetting(model,targetMet);
%save('a.mat');return;
solution=GDLS(model2, model2.rxns{targetRID},'koType','genes')
%solution=GDLS(model2, model2.rxns{targetRID})
save('testGDLS.mat');
end

