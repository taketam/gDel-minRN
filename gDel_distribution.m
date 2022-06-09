function [outputArg1,outputArg2] = gDel_distribution()
%ANALYZERESULT この関数の概要をここに記述
%   詳細説明をここに記述
load('checkResult.mat');
load('iML1515.mat');
model=iML1515;
m=size(model.mets,1);
sum_gvalue=zeros(size(model.genes,1),1);
success_count=0;
for ii=1:m
    %for i=a:b
    ii
    s=sprintf('results/gDel-minRN%d.mat',ii);
    if exist(s)~=0
        load(s,'gvalue','success');
        if success==1
            %save('a.mat');
            sum_gvalue=sum_gvalue+cell2mat(gvalue(:,2));
            success_count=success_count+1;
        end
    end
end   
    


save('gDel_distribution.mat');


end

