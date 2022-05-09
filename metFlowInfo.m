function [substrates, products] = metFlowInfo(model,x,mid)

m=size(model.mets,1);
n=size(model.rxns,1);
pp=1;cc=1;

for i=1:n
    if model.S(mid,i)>0
        producing(pp,1)=i;
        pp=pp+1;
    elseif model.S(mid,i)<0
        consuming(cc,1)=i;
        cc=cc+1;
    end 
end
pp=pp-1;
cc=cc-1;

display('The producing reaction(s):')
for i=1:pp
    horzcat(model.rxns{producing(i,1)},':   (',mat2str(producing(i,1)),')  ',mat2str(x(producing(i,1))),': ',mat2str(model.S(mid,producing(i,1))))
end

display('The consuming reaction(s):')
for i=1:cc
    if abs(x(consuming(i,1)))>0.1
        horzcat(model.rxns{consuming(i,1)},':   (',mat2str(consuming(i,1)),')  ',mat2str(x(consuming(i,1))),': ',mat2str(model.S(mid,consuming(i,1))))
    end
end





save('metFlowInfo.mat');
end

