% octubre 2022
%
% SIMILITUD MAXIMA
%   MxSim : promedio de la similitud más grande de todas las especies
%   MxSim = 1/S * Sum_{i=1}^{S} max_{i diferente j} s_{ij}
%
% ENTRADA
%   A  :  matriz de interacciones
%
% SALIDA
%   MaxSim : valor de maxima similitud
%   simi   : matriz de entradas simi_ij
%
function [MaxSim, sim] = simi_Max(A)
%
% haciendo el digrafo de A
S=size(A,1);
G=digraph(A);
%
sim=zeros(S,S);   % al final debe ser tirngular superior por la cuestion simetrica
%
for i=1:S
    for j=1:S
        if (i ~= j)
            sim(i,j)=simi_ij(A,i,j);
        end
    end
end
% arreglos de maximos por renglon
simM=max(sim,[],2);
%
MaxSim=(1/S)*sum(simM);
% sim=triu(sim)   % no triangular!!!!
%
end % fin de la funcion
%
% N. Leticia Abrica J.
% Centro de Ciencias Matemáticas 
% UNAM, Campus Morelia