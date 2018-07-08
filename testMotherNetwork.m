load('motherNeuralNetwork.mat');
%save a;
[target x] = PrepareTargetForTraining('.\Resources\folha_3','.\Resources\leaf.xlsx',1);

%x = table2cell(input);

%outfolhas1 = a.net(x);

%b = table2cell(x);


out = net(x);