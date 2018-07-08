[target input] = PrepareTargetForTraining('.\Resources\folha_manual','.\Resources\leaf.xlsx',1);

net = feedforwardnet(10);

% input = table2array(input);
% input = double(input);
% input = input';

net.trainFcn = 'traingdx';
net.layers{1}.transferFcn = 'tansig';%'hardlim';
% net.layers{2}.transferFcn = 'hardlim';%'logsig';
% net.layers{3}.transferFcn = 'hardlim';%'logsig';
% net.layers{4}.transferFcn = 'logsig';%'logsig';

net.trainParam.epochs = 500;

%net.divideFcn = '';
net.divideParam.trainRatio = 0.7;
net.divideParam.valRatio = 0.15;
net.divideParam.testRatio = 0.15;



[net,tr] = train(net, input, target);

% view(net);
% disp(tr)

% COMPLETAR A RESTANTE CONFIGURACAO


out = sim(net, input);    

% axis off;
% plotconfusion(target, out); % Matriz de confusao

% plotperf(tr);         % Grafico com o desempenho da rede nos 3 conjuntos

save('nn','net');

r=0;
for i=1:size(out,2)               % Para cada classificacao  
  [a b] = max(out(:,i));          %b guarda a linha onde encontrou valor mais alto da saida obtida
  [c d] = max(target(:,i));  %d guarda a linha onde encontrou valor mais alto da saida desejada
  if b == d                       % se estao na mesma linha, a classificacao foi correta (incrementa 1)
      r = r+1;
  end
end

precision = r/size(out,2)*100;
fprintf('Precisao total %f\n', precision)


