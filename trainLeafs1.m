[target input] = PrepareTargetForTraining();

% test = zeros(99, 1000);
% test = test';

net = feedforwardnet();
input = table2array(input);
input = double(input);
input = input';

net.trainFcn = 'traingdx';

[net,tr] = train(net, input, target);

view(net);
disp(tr)

out = sim(net, input);

axis off;
plotconfusion(target, out); % Matriz de confusao

plotperf(tr);         % Grafico com o desempenho da rede nos 3 conjuntos