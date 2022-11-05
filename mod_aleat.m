% Octubre 2022
%
% MODELO ALEATORIO
%
% cualqier link entre especies ocurre con la misma probabilidad (p) 
%   p = C
%
% CONDICION
% sin canibalismo
%
% ENTRADA
%  S     : numero de especies
%  C     : conectividad
%
% SALIDA 
% A : matriz de interacciones troficas
%     a_{ij}=1 sii j consume a i 
%     a_{ij}=0 sii j no consume a i
%
function [A]=mod_aleat(S,C)
%
A=zeros(S,S);   % matriz de interacciones
prob=C;         % probabilidad de conectar dos especies
%
% haciendo los links en orden
for i=1:S
    for j=1:S
        p = rand(1);
        if p < prob
            A(i,j)=1;
        end
    end
end
%
% eliminado canibalismo 
for i=1:S
    A(i,i)=0;
end
%
end   % termina funcion
%
% N. Leticia Abrica J.
% Centro de Ciencias Matemáticas 
% UNAM, Campus Morelia