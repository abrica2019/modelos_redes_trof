% OCTUBRE 2022
% 
% funcion para calcular la proporcion de especies CANIBALES y OMNIVORAS 
%
% ENTRADA
%  A  : matriz de interacciones
%
% SALIDA
%  Cannib  :  numero de especies canibales (a_ii = 1)
%  Omniv   :  numero de especies omivoras (especies que consumen mas 
%             de dos especies, pero no a su propia especie)
%
function [Cannib, Omniv]=can_omn(A)
%
S=size(A,1);
% 
% canibalismo:
Cannib=(1/S)*sum(diag(A));
%
% omnívoros:
% contando especies que "consume dos o mas especies" y al menos 
% consumen a una especie basal e intermedia:
%
[numtipo,tyTop,tyInter,tyBasal,~]=tipoTIBA(A);
%
tops_om=0;
inter_om=0;
%
% para Tops, contando cuantas son omnivoras
for i=1:numtipo(1)  
    % basales
    ba=0;
    for j1=1:numtipo(3)
        if A(tyBasal(j1),tyTop(i)) == 1
            ba=ba+1;
        end
    end
    % intermedias
    in=0;
    for j2=1:numtipo(2)
        if A(tyInter(j2),tyTop(i)) == 1
            in=in+1;
        end
    end
    %
    if ba >= 1 && in >= 1
        tops_om=tops_om+1;
    end
end
%
% para Intermedias, contando cuantas son omnivoras
for i=1:numtipo(2)  
    % basales
    bai=0;
    for j1=1:numtipo(3)
        if A(tyBasal(j1),tyInter(i)) == 1
            bai=bai+1;
        end
    end
    % intermedias
    ini=0;
    for j=1:numtipo(2)
        if (A(tyInter(j),tyInter(i)) == 1) && (tyInter(j) ~= tyInter(i))
            ini=ini+1;
        end
    end
    %
    if bai >= 1 && ini >= 1
        inter_om=inter_om+1;
    end
end
%
% total
Omniv=(1/S)*(tops_om+inter_om);
%
end   % fin de la función
%
% N. Leticia Abrica J.
% Centro de Ciencias Matemáticas 
% UNAM, Campus Morelia