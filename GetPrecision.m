function precision = GetPrecision(target,out)
resultado = 0;
for i=1:size(out,2)          % Para cada classificacao  
  [~, o] = max(out(:,i));     % b guarda a linha onde encontrou valor mais alto da saida obtida
  [~, t] = max(target(:,i));  % d guarda a linha onde encontrou valor mais alto da saida desejada
  if o == t                   % se o output estiver na mesma linha que o target, a classificacao foi correta (incrementa 1)
      resultado = resultado+1;
  end
end

precision = (resultado/size(out,2)) * 100;
