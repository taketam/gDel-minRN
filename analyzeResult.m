function [outputArg1,outputArg2] = analyzeResult(inputArg1,inputArg2)
%ANALYZERESULT この関数の概要をここに記述
%   詳細説明をここに記述
load('iML1515.mat');
model=iML1515;
m=size(model.mets,1);

for i=1:m
    i
    s=sprintf('results/gDel-minRN%d.mat',i);
    gr=0; pr=0; it=0; optPre.stat=-1; optPre.f=0;
    load(s,'gr', 'pr','targetMet','it','optPre');
    if (it~=0) && (it~=6)
        list(i,1)=-optPre.f;
        list(i,2)=gr;
        list(i,3)=pr;
    end    
end


save('analyzeResult.mat');


end

