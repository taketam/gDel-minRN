function [outputArg1,outputArg2] = gvalueMaker(model)
%GVALUEMAKER この関数の概要をここに記述
%   詳細説明をここに記述
ng=size(model.genes,1);
for i=1:ng
gvalue{i,1}=model.genes{i};
gvalue{i,2}=1;
end
save('gvalueMaker.mat');

end

