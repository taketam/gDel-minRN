function [outputArg1,outputArg2] = run_gDel_minRN(i)
load('iML1515.mat');
model=iML1515;
gDel_minRN(model,model.mets{i},5,0.1,0.1,i);
end

