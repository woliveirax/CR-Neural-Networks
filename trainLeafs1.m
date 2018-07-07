[target input] = PrepareTargetForTraining();

net = feedforwardnet();
input = table2array(input);
input = double(input);
input = input';

net.trainFcn = 'traingdx';

[net,tr] = train(net, input, target);

view(net);
disp(tr)

out = sim(net, input);
    %%ADD EPOCHS
axis off;
plotconfusion(target, out); % Matriz de confusao

plotperf(tr);         % Grafico com o desempenho da rede nos 3 conjuntos