function [ B ] = AssemblageB( coor, Triangles )

%nt : Nb Triangles
[nt,~]=size(Triangles);
% size(coor,1) : Nb Points
B=zeros(size(coor,1));

for it = 1:nt
    % Calcul Coordonnées des sommets du triangle
    % Triangles(i,:) : Coordonnées des sommets du triangle i
    X=coor(Triangles(it,:),1);
    Y=coor(Triangles(it,:),2);
    % Calcul matrice MTA
    [MT]=ComputeMBT(X,Y);
    % MAJ de A
    for i = 1:3
        for j = 1:3
            B(Triangles(it,i),Triangles(it,j)) = B(Triangles(it,i),Triangles(it,j)) + MT(i,j);
        end
    end
    
end
