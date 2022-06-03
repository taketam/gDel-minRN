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
model2.rxnNames{n+1}='r_dummy';
model2.S=horzcat(model2.S,zeros(m,1));
model2.lb(n+1)=0;
model2.ub(n+1)=1000;
model2.c(n+1)=0;
model2.rev(n+1)=0;
n=n+1;
flag=0;
for i=1:n
    if i>size(model2.grRules,1)
        model2.grRules{i}='';
    elseif isempty(model2.grRules{i})==1
        model2.grRules{i}='';
    end
end
model2.grRules{n}='g_dummy';
model.genes{g+1}='g_dummy';
g=g+1;

gr_id=find(model2.c);
cnap=CNAcobra2cna(model2);

[cnap2,enzymes,genes,gpr_rules]=CNAgenerateGPRrules(cnap,model2.grRules,0);
save('a.mat');


T=zeros(1,n);
T(1,n)=-1;
t=-1;
D=zeros(2,n);
D(1,gr_id)=-1;
d(1,1)=-0.1;
D(2,targetRID)=-1;
d(2,1)=-0.1;
%notknockable=ones(1,g)
%maxMCSnum=10;
%maxMCSsize=10;
%reac_off=[];
%time_limit=10;
%default_flux_limit=1000;
koCost=ones(n,1);
kiCost=ones(n,1);
maxSolutions=10;
maxCost=100;
gkoCost=ones(g,1);
gkiCost=ones(g,1);
%save('a.mat');return;

save('a.mat');
[rmcs, full_mcs, full_cnap, cmp_mcs, cmp_cnap, mcs_idx_cmp_full, status, obj] = ...
CNAgeneMCSEnumerator2(cnap2,T,t,D,d,koCost,kiCost,maxSolutions,maxCost,...
                 gkoCost,gkiCost,gpr_rules)
  
save('test_gMCS.mat');
return;


end

