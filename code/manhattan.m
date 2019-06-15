% Universidade Federal de Mato Grosso
% Instituto de Engenharia
% Inteligência Artificial - 2016/2
%
% Função Octave/MATLAB que deve implementar a heurística de manhattan.
% A funçao deve receber uma matriz __State__ representando um estado 
% qualquer do jogo e deve calcular a soma das distâncias (horizontal e 
% vertical) de cada célula deste estado para a posição que ela deveria 
% ocupar no estado objetivo.
%
% author: raonifst at gmail dot com

function dist = manhattan(State)
  dist = 0;
  H = [1:3;4:6;7:9]; % matriz-objetivo
  
  for k=1:(size(State).^2)-1
    % para cada valor i da matriz Satate é retornado a sua posição i(linha) e j(coluna)
    [i,j] = find(State==k); 
    
    % retorna as posições de cada elemento da matriz-objetivo
    [ii,jj] = find(H==k); 
    
    % o cálculo da distancia é feito através da diferença entre as posições 
    % da matriz dada com a matriz objetiva  
    dist = abs(i-ii)+abs(j-jj) + dist; 
  end
	
end