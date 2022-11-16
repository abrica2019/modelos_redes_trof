% Octubre 2022
%
% MODELO CASCADA
% asigna a cada especie un valor aleatorio de [0,1], cada especie tiene una
% probabilidad P=2CS/(S-1) de consumir especies con valores inferiores a
% los suyos
%               probabilidad = 2*C*S/(S-1)
%
% CANIBALISMO: opcional:
% 
% ENTRADA
%   S : numero de especies
%   C : conectividad de la red (0,1)
%
% SALIDA
%   A : matriz de interacciones troficas
%     a_{ij}=1 sii j consume a i 
%     a_{ij}=0 sii j no consume a i
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %  
%
function [A]=mod_casc(S,C)
%
% values : arreglo de 1xS de los valores aleatorios en (0,1)
values = rand(1,S);
%
%matriz 
A=zeros(S,S);
%
p= 2*C*S/(S-1);                         % probabilidad
%
for j=1:S
    if rand(1) < p                      % probabilidad de enlace
        for i=1:S    
            if(values(i) < values(j))   % comparando los values para consumir
                A(i,j)=1;               % j consume a i
            end
        end
    end
end
%
% % descomentar en caso de eliminar canibalismo
% for i=1:S
%     A(i,i)=0;
% end
% %
end   % termina funcion
%
% N. Leticia Abrica J.
% Centro de Ciencias Matemáticas 
% UNAM, Campus Morelia
