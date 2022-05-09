function [outputArg1,outputArg2] = forIML1515v4()
%example2 calculates the gene deletion strategy for growth coupling
%for biotin in iML1515.
%
% Apr. 23, 2021  Takeyuki TAMURA
%
load('iML1515.mat');
model=iML1515;
m=size(model.mets,1);
for i=1609:1877
%for i=1500:m
    model=iML1515;
    [gr pr it success]=gDel_minRN(model,model.mets{i},5,0.1,0.1,i);
end

save('forEcoliCore.mat');
end

