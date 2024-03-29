% Universidade Federal de Mato Grosso
% Instituto de Engenharia
% Inteligência Artificial - 2016/2
%
% Script Octave/MATLAB que deve ser utilizado para testar a implementação da 
% parte principal do exercício.
% Este arquivo não deve ser alterado
%
% author: raonifst at gmail dot com

clear
clc

% Utilizado para comparar objetos - NAO APAGUE! %  
global id;
id = intmin;
% %

% Teste 1

m = astar([4 1 3; 9 2 5; 7 8 6], @manhattan)
% decomente esta linha para ver as movimentacoes
% reconstruct_path(m);
assert(m.eq(Node([1 2 3; 4 5 6; 7 8 9], 0)));
fprintf('Teste 1: OK\n');

% Teste 2
M = [9 1 3; 4 2 5; 7 8 6]; 
m = astar(M, @manhattan);
assert(m.eq(Node([1 2 3; 4 5 6; 7 8 9], 0)));
fprintf('Teste 2: OK\n');

% Teste 3
%M = [4 9 5; 3 8 6; 7 1 2];
%m = astar(M, @manhattan);
%assert(m.eq(Node([1 2 3; 4 5 6; 7 8 9], 0)));
%fprintf('Teste 3: OK\n');

% Teste 4
%M = [5 3 2; 7 6 4; 8 1 9];
%m = astar(M, @manhattan);
%assert(m.eq(Node([1 2 3; 4 5 6; 7 8 9], 0)));
%fprintf('Teste 4: OK\n');

% Teste 5
M = [4 6 7; 9 5 8; 2 1 3];
m = astar(M, @hamming);
assert(m.eq(Node([1 2 3; 4 5 6; 7 8 9], 0)));
fprintf('Teste 5: OK\n');

fprintf('Sua implementação está correta\n');
