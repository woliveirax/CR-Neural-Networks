function [target,input] = PrepareTargetForTraining()
%MAKETARGET Summary of this function goes here
%   Detailed explanation goes here
% function PrepareTargetForTraining()
    
    dataImages = LoadDataSetImages('.\Resources\folha_1');
    dataClassifications = ReadLeafExcelData('.\Resources\leaf.xlsx');
    
    input = dataImages(:,2);
    
    for i = 1:numel(input)
        col = zeros(numel(input),1);
        id = dataImages{i,1};
        
        for j = 1:numel(dataClassifications)
            in = dataClassifications{j,1};
            
            if( in == id )
                specie = dataClassifications(j,2);
                break;
            end
        end
        
        for j = 1:numel(dataClassifications)
            leaf_count = 1;
            if(strcmpi(dataClassifications{j,2},specie))
                col(i,1)= 1;
                break;
            end
            leaf_count = leaf_count + 1; 
        end
  
        target(:,i) = col(:,1);
        
    end

    
end

