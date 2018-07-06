function [ out ] = LoadDataSetImages(path)
%Missing a lot of stuff, first get the size of the path, second create cell
%array yadayada yada

    a = dir(fullfile(path,'*.jpg'));
    n = numel(a);
    imageArray = cell(n,2);
    
    for i = 1:1:n
        [trash imageArray{i,1} trash] = fileparts(a(i).name);
        imageArray{i,2} = imread(fullfile(path,a(i).name));
    end
    
    out = imageArray;
end