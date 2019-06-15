% Universidade Federal de Mato Grosso
% Instituto de Engenharia
% Inteligência Artificial - 2016/2
%
% Função Octave/MATLAB que deve implementar o algoritmo A-estrela.
% A função deve receber uma matriz __M__ com estado inicial do quebra-cabeça 
% o apontador para a função heurística __h__ e devolver um nó de busca __n__
% com o estado objetivo. Para que seja possível reconstruir o caminho percorrido 
% até a solução,  cada nó produzido pelo algoritmo de busca deve conter uma 
% referência para o nó que o descobriu (i.e., nó visitado no passo anterior).
%
% Para executar o algoritmo para um estado S com heurística de hamming por exemplo pode-ser fazer:
% S = [1 1 3; 9 2 5; 7 8 6];
% node = astar(S, @hamming);
% 
% Extra: A variável __error__ deve ser utilizada para identificar jogos que não 
% possuem solução. 
%
% author: raonifst at gmail dot com

function [n, error] = astar(M, h)
	
	error = 0;

	%Cria uma fila de prioridades vazia
	q = PriorityQueue();
	
	% Estado objetivo 
	O = [1 2 3; 4 5 6; 7 8 9]; %Lembre-se de que seu programa deve parar quando um estado objetivo for alcançado.
	
	% Cria um novo nó __n__ com estado igual a matriz __M__ (estado inicial) e 
	% custo 0 (zero).
 	n = Node(M, 0);
	
  % O custo do nó n é dado por c(n) = f(n) + h(n.s). Obviamente, a prioridade é dada por c(n)
  p = n.f+h(n.State);
  
	% Insere o nó __n__ na fila de prioridades __q__. O custo deste nó 
	% é igual a n.f+g(n.State). __g__ é um apontador para função heurística
	% considerada
	q.insert(p, n);
	% Laço principal do algoritmo A-estrela - é interrompido quando a fila ficar vazia
	cost = 0;
  while (~q.isempty()),
      
      m = q.extractMin();
      
      if (isequal(m.State, O))
        n = m
        break
      end
      
      moves = legal_moves(m.State);
      cost = m.f + 1;
      for i=1:size(moves, 1),
        N = do_move(m.State, moves(i));
        k = Node(N, cost);
        p = k.f+h(k.State);
        k.Prev = m;
        q.insert(p, k);
        
      end      
	end
end
