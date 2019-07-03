function [target, input] = PrepareTargetForTraining(images, structure)
input = images;
target = zeros();

for i = 1 : 1 : numel(structure)   
    switch(structure{i})
        case 'square'
            target(1,i) = 1;
            
        case 'circle'
            target(2,i) = 1;
            
        case 'triangle'
            target(3,i) = 1;
            
        case 'star'
            target(4,i) = 1;
    end
end
target( all(~target,2),:)=[]; % remove linhas com tudo a zero(vazias)

end