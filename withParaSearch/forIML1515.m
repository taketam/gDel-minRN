function [outputArg1,outputArg2] = forIML1515()
%example2 calculates the gene deletion strategy for growth coupling
%for biotin in iML1515.
%
% Apr. 23, 2021  Takeyuki TAMURA
%
load('iML1515.mat');
model=iML1515;
m=size(model.mets,1);
for i=1:500
%for i=1:m
    model=iML1515;
    gDel_minRN(model,i);
end
end

