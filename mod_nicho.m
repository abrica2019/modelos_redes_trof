% Octubre 2022
%
% MODELO NICHO 
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% ENTRADA
%   S     : numero de especies
%   C     : conectividad
%
% SALIDA(s)
%       A       : matriz de interacciones
% % %   nicho   : vector que corresponde al valor de nicho de cada especie
% % %   cent    : vector que corresponde al valor de centros de cada especie
% % %   x       : valor de distribución beta B(alpha,beta) con alpha=1 
% % %             y beta=alpha/2C - alpha 
% % %   interv  : vector que corresponde a los valores del intervalo, con
% % %             interv=x*ni
% 
function [A,nicho,cent,interv,x]=mod_nicho(S,C) 
%
alpha=1;
beta = (alpha/(2*C))-alpha;
A=zeros(S,S);            % matriz de interacciones
x=betarnd(alpha,beta);   % x en B(alpha,beta)
nicho=rand(1,S);         % valor aleatorio (0,1)
%
% intervalos ri's de c/especie
interv = zeros(1,S);   
for i=1:S
    interv(i)= x * nicho(i);    %  r_i < n_i
end
%
% centros ci : numero aleatorio entre ri/2 y min(ni, 1-ri/2)
cent = zeros(1,S);
for i=1:S
    ai=interv(i)/2;
    bi=min(nicho(i), 1-interv(i)/2);
    %
    cent(i)= ai + (bi-ai)*rand(1); 
end
%
% haciendo la matriz A
for i=1:S
    for j=1:S
        if (cent(i)-interv(i)/2 <= nicho(j)) && (nicho(j) <= cent(i)+interv(i)/2)
            A(j,i)=1;     % i come a las j's en el intervalo de i
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