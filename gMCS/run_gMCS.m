function [rmcs, full_mcs, full_cnap, model2, targetRID] = run_gMCS(model,targetMet)
startcna(1);
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
glc_id=find(contains(model2.rxns,'EX_glc'));
cnap=CNAcobra2cna(model2);
[cnap2,enzymes,genes,gpr_rules]=CNAgenerateGPRrules(cnap,model2.grRules,0);

T=zeros(1,n);
T(1,n)=-1;
t=-1;
D=zeros(2,n);
D(1,gr_id)=-1;
d(1,1)=-0.1;
D(2,targetRID)=-1;
d(2,1)=-0.1;

notknockable=ones(1,n)
maxMCSnum=10;
maxMCSsize=10;
reac_off=[];
time_limit=10;
default_flux_limit=1000;

[mcs, gene_idx] = ...
CNAgeneMCSEnumerator(cnap,T,t,D,d,notknockable,maxMCSnum,maxMCSsize,reac_off,...
time_limit,default_flux_limit,enzymes);
time=toc
%list=cellstr(full_cnap.reacID);
%list2=full(full_mcs);

%for i=1:g
%   save('a.mat');
%   s=sprintf('GP-(%s',model2.genes{i});
%   f=find(contains(list,s));
%   gvalue{i,1}=model2.genes{i};
%   gvalue{i,2}=list2(f);
%end


save('run_gMCS.mat');
return;


end

