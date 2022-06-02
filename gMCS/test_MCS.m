function [outputArg1,outputArg2] = test_MCS()
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
%[cnap2,enzumes,genes,gpr_rules]=CNAgenerateGPRrules(cnap,model2.grRules,0);
%save('a.mat');


T=zeros(1,n);
T(1,n)=-1;
t=-1;
D=zeros(2,n);
D(1,gr_id)=-1;
d(1,1)=-0.1;
D(2,targetRID)=-1;
d(2,1)=-0.1;
notknockable=ones(1,n);
maxMCSnum=10;
maxMCSsize=10;

%T=[];
%D=[];
%[ gcnap, rmap, gmap, gkoCost, gkiCost, gT, gD, rType, sType, gpr_rules ] =... 
%CNAintegrateGPRrules(cnap,gpr_rules,koCost,kiCost,T,D,gkoCost,gkiCost)
%save('a.mat');return;

save('a.mat');
[mcs] = CNAMCSEnumerator(cnap,T,t,D,d,notknockable,maxMCSnum,maxMCSsize)
mcs=full(mcs)
save('test_MCS.mat');
return;


end

