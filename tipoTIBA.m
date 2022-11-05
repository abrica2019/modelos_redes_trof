% Octubre 2022
% 
% ENTRADA:
%   A : matriz de interacciones
%
% SALIDA:
%   numtipo : arreglo de 1X4, da el numero de especies T,I,B y A
%   tyTop   : arreglo de las especies que son Top
%   tyInter : arreglo de las especies que son Intermedias 
%   tyBasal : arreglo de las especies que son Basales
%   tyAis   : arreglo de las especies que son Aisladas
%
function [numtipo,tyTop,tyInter,tyBasal,tyAis] = tipoTIBA(A)
%
S=size(A,1);         % numero de especies
numtipo=zeros(1,4);  
% 
tyTop=[];     % arreglo para especies superiores
tyInter=[];   %             "         intermedias
tyBasal=[];   %             "         basales
tyAis=[];     %             "         aisladas
%
G=digraph(A);         % haciendo el digrafo de A
outd=outdegree(G);    % calculando los grados de salida
intd=indegree(G);     % calculando los grados de entrada
%
% contando tipos de especies
for j=1:S
    if (outd(j) == 0 && intd(j) > 0)       % contando especies superior : T
        numtipo(1,1) = numtipo(1,1) + 1;
        tyTop=[tyTop j];
    elseif (outd(j) > 0 && intd(j) > 0)    % especie intermedia: I
        numtipo(1,2) = numtipo(1,2) + 1;
        tyInter=[tyInter j];
    elseif (outd(j) > 0 && intd(j) == 0)   % especie basal: B
        numtipo(1,3) = numtipo(1,3) + 1;
        tyBasal=[tyBasal j];
    elseif (outd(j) == 0 && intd(j) == 0)  % especie aislada: A
        numtipo(1,4)=numtipo(1,4) + 1;
        tyAis=[tyAis j];
    end
end
%
end % fin de la funcion
%
% N. Leticia Abrica J.
% Centro de Ciencias Matemáticas 
% UNAM, Campus Morelia