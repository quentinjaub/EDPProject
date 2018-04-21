function [ MQ ] = raideur_quadrangle( coor, elements4 ,Triangles)

%nt : Nb quadragnles
[nt,~]=size(elements4);
% size(coor,1) : Nb Points
MQ=zeros(size(coor,1));

for it = 1:nt
    % Calcul Coordonnées des sommets du quadrangle
    %  Coordonnées des sommets du quadrangle i
    X=coor(elements4(it,:),1);
    Y=coor(elements4(it,:),2);
    % Calcul matrice MTA
    [MQA]=MatQuadrangle(X,Y);
    % MAJ de A
    for i = 1:4
        for j = 1:4
            MQ(elements4(it,i),elements4(it,j)) = MQ(elements4(it,i),elements4(it,j)) + MQA(i,j);
        end
    end
end

%%% Il faut prendre en compte les triangles
[n3,~]=size(Triangles);
for it = 1:n3
    % Calcul Coordonnées des sommets du triangle
    % Triangles(i,:) : Coordonnées des sommets du triangle i
    X=coor(Triangles(it,:),1);
    Y=coor(Triangles(it,:),2);
    % Calcul matrice MTA
    [MT]=MatTriangle(X,Y);
    % MAJ de A
    for i = 1:3
        for j = 1:3
            MQ(Triangles(it,i),Triangles(it,j)) = MQ(Triangles(it,i),Triangles(it,j)) + MT(i,j);
        end
    end
    
end


end

