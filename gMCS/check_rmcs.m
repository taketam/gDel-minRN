function [GR,PR,success] = check_rmcs(model2,rmcs,targetRID)
%CHECK_RMCS この関数の概要をここに記述
%   詳細説明をここに記述
%load('run_gMCS.mat');
%load('test_gMCS.mat');
s=size(rmcs,2);
n=size(model2.rxns,1);
model3=model2;
success=0;
for j=1:s
    j
    model2=model3;
    for i=1:n
        if rmcs(i,j)==0
            model3.lb(i)=0;
            model3.ub(i)=0;
        end
    end
    [GR ,PR] = rGRPRchecker(model3,targetRID)
    if GR>=0.001 && PR>=0.001
        success=1
        save('check_rmcs.mat');
        return;
    end
end
success
save('check_rmcs.mat');
return;
end

