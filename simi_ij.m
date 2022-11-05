% octubre 2022
%
% similitud trofica entre par de especies (i,j)
%   : numero de depredadores y presas compartidas en común, 
%     dividido por el numero toal de depredadores y presas 
%     del par (i,j)
%
% ENTRADA
%   A  :  matriz de interacciones
%   i  :  especie i
%   j  :  especie j
%
% SALIDA
%   s_ij = valor de similitud trofica
%
%
function simi = simi_ij(A,i,j)
%
S=size(A,1);
%
pres_ij=0;   % contando las presas y depredadores en comun de i y j
depr_ij=0;
%
for k=1:S
    if (A(k,i)==1 && A(k,j)==1) % contando las k's que son presa de (i,j)
        pres_ij = pres_ij + 1;
    end
    if (A(i,k)==1 && A(j,k)==1) % contando las k's que son depredadores de (i,j)
        depr_ij= depr_ij + 1;
    end
end
%
G=digraph(A);
ki=indegree(G,i)+outdegree(G,i);
kj=indegree(G,j)+outdegree(G,j);
%
simi=(pres_ij + depr_ij)/(ki+kj);
%
end % fin de la funcion
%
% N. Leticia Abrica J.
% Centro de Ciencias Matemáticas 
% UNAM, Campus Morelia