function PrepareTargetForTrainingOfSpecies()
%MAKETARGET Summary of this function goes here
%   Detailed explanation goes here
% function PrepareTargetForTraining()

%%Obter info
dataImages = LoadDataSetImages('.\Resources\folha_1');
dataClassifications = ReadLeafExcelData('.\Resources\leaf.xlsx');

input = dataImages(:,2);

%%Para não realocar memória em cada ciclo:
num = numel(input);
target = zeros(num,num);%alocar previamente memória, para máximo possível de targets resultantes, com postrior eliminação de linhas vazias

tab_species = cell(1,numel(input)); %criar previamente memória, para máximo possível de especies
tab_species{1,numel(input)}=[];

%%Função:
%species_count = 1;

for i = 1:numel(input)
    id = dataImages{i,1};
    specie_found = 0;
    %         specie = [];
    
    for j = 1:numel(dataClassifications(:,1)) %obtem especie a partir de id
        in = dataClassifications{j,1}
        if( in == id )
            specie = dataClassifications(j,2);
            break;
        end
        
    end
%     
%     if(isempty(specie))
%         continue;
%     end
    
    if(i==1)
        species_count = 1;
        tab_species(1,species_count) =  specie; %adiciona 1 especie para comparacao.
        target(1,1) = 1;
        continue;
    end
    
    for k = 1 : species_count % procuro         
        if(strcmpi(tab_species{1,k},specie{1,1}))
            target(k,i) = 1;
            specie_found = 1;
            break;
        end
    end
    
    if(specie_found == 0)
        species_count = species_count + 1;
        tab_species(1,species_count) = specie;
        target(species_count,i) = 1;
    end
    
end

target( all(~target,2),:)=[]; % remove linhas com tudo a zero(vazias)
end