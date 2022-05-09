function [outputArg1,outputArg2] = checkResult(inputArg1,inputArg2)
%ANALYZERESULT この関数の概要をここに記述
%   詳細説明をここに記述
load('iML1515.mat');
model=iML1515;
m=size(model.mets,1);

for i=1:m
%for i=4:4
    i
    list2(i,1)=0;
    list2(i,2)=0;
    
    s=sprintf('results/gDel-minRN%d.mat',i);
    if exist(s)~=0
        load(s,'success');
        if success==1
            load(s,'gvalue');
            [GR,PR]=GRPRchecker(model,model.mets{i},gvalue);
            list2(i,1)=GR;
            list2(i,2)=PR;
        end
    end
end

load('calculateTMGRPR.mat','list0');
list3=horzcat(list0,list2);


save('checkResult.mat');


end

