function [outputArg1,outputArg2] = analyzeResult(inputArg1,inputArg2)

load('iML1515.mat');
model=iML1515;
load('calculateTMGRPR.mat','list0');
m=size(iML1515.mets,1);
for i=1:m
    i
    if list0(i,2)>=0.001
        s=sprintf('results/GDLS_%d.mat',i);
        if exist(s)~=0
            load(s);
            table(i,1)=solution.biomass;
            table(i,2)=solution.minTargetProd;
            table(i,3)=solution.maxTargetProd;
            table(i,4)=size(solution.KOs,1);
            table(i,5)=time;
        else
            table(i,1)=0;
            table(i,2)=0;
            table(i,3)=0;
            table(i,4)=0;
            table(i,5)=0;
        end
    end
    save('analyzeResult.mat');
end

