function [GR ,PR] = rGRPRchecker(model,targetRID)

options=cplexoptimset('cplex');
options.mip.tolerances.integrality=10^(-12);

m=size(model.mets,1);
n=size(model.rxns,1);
g=size(model.genes,1);
gid=find(model.c);
pid=targetRID;
model2=model;
[opt0.x, opt0.f, opt0.stat, opt0.output] = ...
    cplexlp(-model.c, [],[], model.S, zeros(m,1),model.lb, model.ub);
[opt0.x(gid) opt0.x(pid)]

GR0=-opt0.f;
model2.lb(gid)=GR0;
model2.ub(gid)=GR0;
model2.c(gid)=0;
model2.c(pid)=1;
[opt1.x, opt1.f, opt1.stat, opt1.output] = ...
    cplexlp(model2.c, [],[], model.S, zeros(m,1),model2.lb, model2.ub);
GR=opt1.x(gid) 
PR=opt1.x(pid)

save('rGRPRchecker.mat');
return;
end

