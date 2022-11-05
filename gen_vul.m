% octubre 2022
%
% generalidad y vulnerabilidad por especie
% generalidad y vulnerabilidad: desviación estandar SD
% 
% ENTRADA:
%   A : matriz de interacciones
%
% SALIDA
%   GenSD  :  desviacion estandar de la generalidad de las especies
%   VulSD  :  desviacion estandar de la vulneralidad de las especies
%   gen_i  :  arreglo del valor generalidad de cada especie i
%   vul_i  :  arreglo del valor vulnerabilidad de cada especie i
%
%
% generalidad y vulnerabilidad de cada especie
% gen_i = 1/(L/S) * Sum_j (a_ji)  --> suma de entradas de i-esima columna
%       = 1/(L/S) * indegree(i) 
%
% vul_i = 1/(L/S) * Sum_j (a_ij)  --> suma de entradas de i-esima renglon
%       = 1/(L/S) * outdegree(i)
%
%
function [GenSD, VulSD, gen_i, vul_i] = gen_vul(A)
%
% haciendo el digrafo de A
S=size(A,1);
G=digraph(A);
L=sum(sum(A));
%
gen_i=zeros(1,S);
vul_i=zeros(1,S);
% generalidad (gen) y vulnerabilidad (vul) de cada especie
for k=1:S
    gen_i(k)=1/(L/S) * indegree(G,k);
    vul_i(k)=1/(L/S) * outdegree(G,k);
end
%
% desviacion estandar
GenSD = std(gen_i);
VulSD = std(vul_i);
%
end % fin de la funcion
%
% N. Leticia Abrica J.
% Centro de Ciencias Matemáticas 
% UNAM, Campus Morelia