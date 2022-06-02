function [outputArg1,outputArg2] = test_gMCS()
%EFMEXAMPLE この関数の概要をここに記述
%   詳細説明をここに記述
startcna(1);

%load('e_coli_core.mat');
%model=e_coli_core;
load('small0.mat');

targetMet='m4'
[model2,targetRID,extype] = modelSetting(model,targetMet);
m=size(model2.mets,1);
n=size(model2.rxns,1);
g=size(model2.genes,1);
model2.rxns{n+1}='r_dummy';
model2.grRules{n+1}='';
model2.rxnNames{n+1}='r_dummy';
model2.S=horzcat(model2.S,zeros(m,1));
model2.lb(n+1)=0;
model2.ub(n+1)=1000;
model2.c(n+1)=0;
model2.rev(n+1)=0;
n=n+1;

gr_id=find(model2.c);
cnap=CNAcobra2cna(model2);
[cnap2,enzumes,genes,gpr_rules]=CNAgenerateGPRrules(cnap,model2.grRules,0);
save('a.mat');


T=zeros(1,n);
T(1,n)=-1;
t=-1;
D=zeros(2,n);
D(1,gr_id)=-1;
d(1,1)=-0.1;
D(2,targetRID)=-1;
d(2,1)=-0.1;
rkoCost=ones(n,1);
rkiCost=ones(n,1);
%koCost=rkoCost;
%kiCost=rkiCost;
gkoCost=ones(g,1);
gkiCost=ones(g,1);
maxSolutions=100;
maxCost=100;
timeLimit=1200;

%T=[];
%D=[];
%[ gcnap, rmap, gmap, gkoCost, gkiCost, gT, gD, rType, sType, gpr_rules ] =... 
%CNAintegrateGPRrules(cnap,gpr_rules,koCost,kiCost,T,D,gkoCost,gkiCost)
%save('a.mat');return;


[rmcs, full_mcs, full_cnap, cmp_mcs, cmp_cnap, mcs_idx_cmp_full, status, obj] = ...
CNAgeneMCSEnumerator2(cnap,T,t,D,d,rkoCost,rkiCost,maxSolutions,maxCost,...
    gkoCost,gkiCost,gpr_rules)
full(full_mcs)
rmcs
save('test_gMCS.mat');
return;


end

