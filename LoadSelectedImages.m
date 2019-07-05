function [ images, files ] = LoadSelectedImages(files, path)
files = cellstr(files);
nFiles = numel(files);

imageArray = [];
maxSize = 0;

if(nFiles == 0)
    return;
end

imageArray = cell(nFiles,1);
for i = 1:1:nFiles
    %lê imagem do caminho tempPath + filename
    image = imread(fullfile(path,files{i}));
    
    [x, y, ~] = size(image);
    if(maxSize < x || maxSize < y)
        if x > y
            maxSize = x;
        else
            maxSize = y;
        end
    end
    
    imageArray{i} = image;
end

%Handle image, [ setup size and yada yada yada ]
[imageQuant, ~] = size(imageArray);
imageStruct = cell(1,imageQuant);
for i = 1 :1: imageQuant
    image = imageArray{i};
    
    %Create blank matrix with max size to copy new image to
    [ imageX, imageY, imageZ] = size(image);
    blank = ones(maxSize, maxSize, imageZ)*255;
    for x = 1 : 1 : imageX
        for y = 1 : 1 : imageY
            for z = 1: 1 : imageZ
                blank(x,y,z) = image(x,y,z);
            end
        end
    end
    blank = im2bw(blank);
    imageStruct{i} = uint8(blank(:)');
end

images = cell2table(imageStruct); %copia as imagens

%puts the input in the right format
x = zeros(numel(images{1,1}),numel(images));
for i = 1: 1 : numel(images)
    x(:,i) = images{1,i};
end
images = x;

end


