function [ out ] = LoadDataSetImages(path)
    a = dir(fullfile(path,'*.jpg'));
    n = numel(a);
    imageArray = cell(n,2);
    
    for i = 1:1:n
        [trash imageArray{i,1} trash] = fileparts(a(i).name);
        imageArray{i,1} = str2num(imageArray{i,1});
        imageArray{i,2} = imread(fullfile(path,a(i).name));
    end
    
    out = imageArray;
end