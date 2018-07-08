function [ out ] = LoadDataSetImages(path,optimization)
    a = dir(fullfile(path,'*.jpg'));
    n = numel(a);
    imageArray = cell(n,2);
    
    for i = 1:1:n
        [trash imageArray{i,1} trash] = fileparts(a(i).name);
        imageArray{i,1} = str2num(imageArray{i,1});
        
        image = imread(fullfile(path,a(i).name));

        switch optimization
            %converte para vector binario
            case 1
                 image = (image >= 255); %%devolve (true -> 1 ou false -> 0)
                 
             %deteção de margens a partir de multiplicação dos pixeis pela máscara de Sobel
            case 2
%                 sobel_v = [-1, -2, -1; 0, 0, 0; 1, 2, 1];
%                 sobel_h = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
%                 
%                 borda_v = conv2(double(image),sobel_v);
%                 borda_h = conv2(image,sobel_h);
%                 borda_v = borda_v(2:end-1,2:end-1);
%                 borda_h = borda_h(2:end-1,2:end-1);
%                 image = borda_v + borda_h;
        end        
        
        image = imresize(image,[500 500]);
        image = image(:)';
        
        imageArray{i,2} = image;
    end
    
    imageArray = cell2table(imageArray);
    out = imageArray;
end