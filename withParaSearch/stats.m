function [outputArg1,outputArg2] = stats(a)

load('checkResult.mat');
m=size(list3,1);
count1=0;
count2=0;
for i=1:m
    if list3(i,2)>0.01
        count1=count1+1;
        if (list3(i,3)>= (list3(i,1)/a))&&(list3(i,4)>= (list3(i,2)/a))
            count2=count2+1;
        end
    end
end
count2/count1

save('stats.mat');

end

