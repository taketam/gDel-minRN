function [outputArg1,outputArg2] = possibleList(inputArg1,inputArg2)
load('iML1515.mat');
load('trim1515result2.mat','table');
m=size(iML1515.mets,1);
j=1;
for i=1:m
    [i j]
    if ((table(i,5)>0.01)&&(table(i,6)>0.01))
        possibleList{j,1}=iML1515.metNames{i};
        possibleList{j,2}=table(i,5);      
        possibleList{j,3}=table(i,6);
        possibleList{j,4}=table(i,9);
        j=j+1;
    end
end
writecell(possibleList,'list_iML1515.csv');
save('possibleList.mat');
end

