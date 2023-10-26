% actualizacion .... OCTUBRE 2023
%
% funcion para calcular la proporcion de especies CANIBALES y OMNIVORAS 
%
% ENTRADA
%  A  : matriz de interacciones
%
% SALIDA
%  Cannib     :  proporcion de de especies canibales (a_ii = 1)
%  sp_cannib  :  arreglos de las especies canibales
%  Omniv      :  proporcion de especies omnivoras 
%  sp_omniv   :  arreglos de las especies omnivoras
%
function [Cannib,sp_cannib,Omniv,sp_omniv]=can_omn(A)
%
S=size(A,1);
% 
% canibalismo:    Caniib=(1/S)*sum(diag(A));
Cannib=0;               % proporcion
sp_cannib=zeros(1,S);   % las especies
%
for i=1:S
    if A(i,i) == 1
        Cannib=Cannib+1;
        sp_cannib(i)=i; 
    end
end
Cannib=(1/S)*Cannib;
sp_cannib(sp_cannib==0)=[];
%
% omnivoros:
%
% % % % % % % % % % % % % % % % % % % % % % % % % % 
% filtro 1y2: especies I-T con Kin >= 2
% % % % % % % % % % % % % % % % % % % % % % % % % % 
%
% notemos que las especies I-T con k_in >=2 son aquellas para
% las cuales la suma de su columna correspondiente es >=2
%
omniv1=zeros(1,S);
for i=1:S
    if sum(A(:,i)) >= 2
        omniv1(i)=i;
    end
end
omniv1(omniv1==0)=[];
%
%
% % % % % % % % % % % % % % % % % % % % % % % % % % 
% filtro 3: existe especie B e I que son comidas por las posibles omniv
% % % % % % % % % % % % % % % % % % % % % % % % % % 
%
% notando si las posibles omniv's comen basales
%
[~,~,tyInter,tyBasal,~]=tipoTIBA(A);
%
sp_omniv1=zeros(1,size(omniv1,2));
for i=1:size(omniv1,2)
    for j=1:size(tyBasal,2)
        if A(tyBasal(j),omniv1(i)) == 1
            sp_omniv1(i)=omniv1(i);
        end
    end
end
sp_omniv1(sp_omniv1==0)=[];    
%
% notando ahora si éstas omniv's comen intermedias (sin canibalismo)
sp_omniv=zeros(1,size(sp_omniv1,2));
for i=1:size(sp_omniv,2)
    for j=1:size(tyInter,2)
        if tyInter(j) ~= sp_omniv1(i)
            if A(tyInter(j),sp_omniv1(i)) == 1
                sp_omniv(i)=sp_omniv1(i);
            end
        end
    end
end
sp_omniv(sp_omniv==0)=[]; % y estas son las especies omnivoras
%
% y la proporcion es:
Omniv=(1/S)*size(sp_omniv,2);
% 
%
%
end   % fin de la función
%
% N. Leticia Abrica J.
% Centro de Ciencias Matemáticas 
% UNAM, Campus Morelia