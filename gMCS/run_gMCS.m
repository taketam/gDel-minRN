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
for i=1:n
    if i>size(model2.grRules,1)
        model2.grRules{i}='';
    elseif isempty(model2.grRules{i})==1
        model2.grRules{i}='';
    end
end
model2.grRules{n}='g_dummy';
model2.genes{g+1}='g_dummy';
g=g+1;
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

koCost=ones(n,1);
kiCost=ones(n,1);
maxSolutions=10;
maxCost=100;
gkoCost=ones(g,1);
%gkiCost=ones(g,1);
for i=1:g
   gkiCost(i,1)=NaN;
end
%gkiC
[rmcs, full_mcs, full_cnap, cmp_mcs, cmp_cnap, mcs_idx_cmp_full, status, obj] = ...
    CNAgeneMCSEnumerator2(cnap2,T,t,D,d,koCost,kiCost,maxSolutions,maxCost,...
    gkoCost,gkiCost,gpr_rules)

list=cellstr(full_cnap.reacID);
list2=full(full_mcs);

for j=1:size(full_mcs,2)
    for i=1:g
        s=sprintf('GP-(%s',model2.genes{i});
        f=find(contains(list,s));
        gvalue{i,1}=model2.genes{i};
        gvalue{i,j+1}=list2(f,j);
        if isempty(f)==1
            save('a.mat');
            s1=sprintf('%s',model2.genes{i});
            f1=find(contains(list,s1));
            s2=sprintf('GP-',model2.genes{i});
            f2=find(contains(list,s2));
            f3=intersect(f1,f2);
            gvalue{i,j+1}=list2(f3,j);
        end

    end
end
save('run_gMCS.mat');
return;


end

