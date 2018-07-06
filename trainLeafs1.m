[target input] = PrepareTargetForTraining();

net = feedforwardnet();

[net,tr] = train(net, input', target);
view(net);
disp(tr)