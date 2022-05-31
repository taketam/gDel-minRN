function [outputArg1,outputArg2] = gDelDistribution(inputArg1,inputArg2)

load('iML1515.mat');
load('trim1515result2.mat','table','m');
j=1;

for i=1:m
    i
   if ((table(i,5)>=0.001) && (table(i,6)>=0.001))
      delTable(j,1)=table(i,9);
      j=j+1;
      tm{j,1}=iML1515.mets{i};
      tm{j,2}=i;
   end
end
j=j-1;
[B,I]=sort(delTable(:,1));
save('gDelDistibution.mat');
end

