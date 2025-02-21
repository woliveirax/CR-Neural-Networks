function [ images, imageStruct ] = LoadDataSetImages(path)
    %Obtem o array de quadrados
    type = 'square';
    tempPath = fullfile(path, type);  
    [ squares, tempSize ] = LoadImages(tempPath, type);
    maxSize = tempSize;
    
    %Obtem o array de circulos
    type = 'circle';
    tempPath = fullfile(path, type);    
    [ circles, tempSize ] = LoadImages(tempPath, type);
    if(tempSize > maxSize); maxSize = tempSize; end
    
    %Obtem o array de triangulos
    type = 'triangle';
    tempPath = fullfile(path, type);    
    [ triangles, tempSize ] = LoadImages(tempPath, type);
    if(tempSize > maxSize); maxSize = tempSize; end
    
    %Obtem o array de circulos
    type = 'star';
    tempPath = fullfile(path, type);
    [ stars, tempSize ] = LoadImages(tempPath, type);
    if(tempSize > maxSize); maxSize = tempSize; end
    
    %Prepara imagens
    imageStruct = [squares; circles; triangles; stars];
    [imageQuant, ~] = size(imageStruct);
    
    for i = 1 :1: imageQuant
        image = imageStruct{i,2};
        
        %Create blank matrix with max size to copy new image to
        [ imageX, imageY, imageZ] = size(image);
        blank = ones(maxSize,maxSize, imageZ)*255;
        for x = 1 : 1 : imageX
            for y = 1 : 1 : imageY
                for z = 1: 1 : imageZ
                    blank(x,y,z) = image(x,y,z);
                end
            end
        end
        blank = im2bw(blank);
        %imshow(blank);
        %drawnow;
        imageStruct{i,2} = uint8(blank(:)');
    end
    
    imageStruct = imageStruct';
    images = cell2table(imageStruct); %copia a transposta da estrutura de imagens
    images = images(2,:);             %copia somente as imagens da estrutura
    images = table2array(images);     %converte a tabela de imagens em array de imagens para passar como input
    
    %puts the input in the right format
    x = zeros(numel(images{1,1}),numel(images));
    for i = 1: 1 : numel(images)
        x(:,i) = images{1,i};
    end
    images = x;
    
    imageStruct = cell2table(imageStruct);
    imageStruct = imageStruct(1,:);
    imageStruct = table2array(imageStruct);
    msgbox('Imagens Carregadas!','Sucesso','help');
end

function [ imageArray, maxSize ] = LoadImages (tempPath, type)
files = dir(fullfile(tempPath,'*.png'));
nFiles = numel(files);
imageArray = [];
maxSize = 0;

if(nFiles == 0)
    return;
end

imageArray = cell(nFiles,2);

for i = 1:1:nFiles
    %indica tipo da imagem num campo da estrura
    imageArray{i,1} = type;
    
    %l� imagem do caminho tempPath + filename
    image = imread(fullfile(tempPath,files(i).name));
    
    [x, y, ~] = size(image);
    if(maxSize < x || maxSize < y)
        if x > y
            maxSize = x;
        else
            maxSize = y;
        end
    end
    
    imageArray{i,2} = image;
end

end
