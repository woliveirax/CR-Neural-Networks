[target input] = PrepareTargetForTraining('.\Resources\folha_3','.\Resources\leaf.xlsx',1);

net = feedforwardnet([20 10]);

% input = table2array(input);
% input = double(input);
% input = input';

net.trainFcn = 'traingdx';
net.layers{1}.transferFcn = 'hardlims';%'logsig';
net.layers{2}.transferFcn = 'hardlims';%'logsig';
% net.layers{3}.transferFcn = 'hardlims';%'logsig';
%net.layers{4}.transferFcn = 'logsig';%'logsig';

[net,tr] = train(net, input, target);

view(net);
disp(tr)

% COMPLETAR A RESTANTE CONFIGURACAO

net.divideFcn = '';%'dividerand';
%net.divideParam.trainRatio = 0.7;
%net.divideParam.valRatio = 0.15;
%net.divideParam.testRatio = 0.15;

out = sim(net, input);    

axis off;
plotconfusion(target, out); % Matriz de confusao

plotperf(tr);         % Grafico com o desempenho da rede nos 3 conjuntos

save('nn','net');




