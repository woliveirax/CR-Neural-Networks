function [ out ] = LoadDataSetImages(path)
    a = dir(fullfile(path,'*.jpg'));
    n = numel(a);
    imageArray = cell(n,2);
    
    for i = 1:1:n
        [trash imageArray{i,1} trash] = fileparts(a(i).name);
        imageArray{i,1} = str2num(imageArray{i,1});
        
        image = imread(fullfile(path,a(i).name));
        image = imresize(image,[500 500]);
        image = image(:)';
        
        imageArray{i,2} = image;
    end
    
    imageArray = cell2table(imageArray);
    out = imageArray;
end