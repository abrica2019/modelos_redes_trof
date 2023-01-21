% 
% funcion para calcular la proporcion de especies CANIBALES y OMNIVORAS 
%
% ENTRADA
%  A  : matriz de interacciones
%
% SALIDA
%  Cannib  :  numero de especies canibales (a_ii = 1)
%  Omniv   :  numero de especies omivoras (especies que consumen 2 o mas 
%             especies y tienen caminos troficos de diferentes longitudes)
%             aquí consideramos la direccion del enlace trofico en el
%             camino simple
%
function [propr_can,Cannib,propr_omn,Omniv]=can_omn2(A)
%
S=size(A,1);
G=digraph(A);
% 
% canibalismo:    propr_can=(1/S)*sum(diag(A));
Cannib=zeros(1,S);   % por 'memoria'
for i=1:S
    if A(i,i) == 1
        Cannib(i)=i;
    end
end
Cannib(Cannib == 0)=[];
propr_can=size(Cannib,2)/S;  % proporcion
%
% omnívoros:
% considerando solo especies T e I con k_in >=2
[~,tyTop,tyInter,tyBasal,~]=tipoTIBA(A);
%
pos1=[tyTop tyInter];
pos2=zeros(1,size(pos1,2));
for i=1:size(pos1,2)
    if indegree(G,pos1(i)) >= 2
        pos2(i)=pos1(i);
    end
end
pos2(pos2==0)=[];   % eliminando los ceros
%
% para cada i en pos2, si existe j1-B y j2-I (j2 diferente de i) tales 
% que i consume a j1 y j2 ... entonces i es omn
Omniv=zeros(1,size(pos2,2)); % 
for i=1:size(pos2,2)
    for j1=1:size(tyBasal,2)
        pathB=allpaths(G,tyBasal(j1),pos2(i));
        if isempty(pathB) == 0  % no vacio :)
            for j2=1:size(tyInter,2)
                if A(tyInter(j2),pos2(i)) == 1  
                    Omniv(i)=pos2(i);
                end
            end
        end
    end
end
% 
Omniv(Omniv == 0)=[];
propr_omn=size(Omniv,2)/S; % proporcion 
%
%
end   % fin de la función
%
% N. Leticia Abrica J.
% Centro de Ciencias Matemáticas 
% UNAM, Campus Morelia
