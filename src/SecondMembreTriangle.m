% Calcul du second membre
function [b] = SecondMembreTriangle(coor, Triangles,diric,A)


[nt,~] = size(Triangles);
b=zeros(size(coor,1),1);
for i = 1 : nt
    X=coor(Triangles(i,:),1);
    Y=coor(Triangles(i,:),2);
    xg=sum(X)/3;
    yg=sum(Y)/3;
    alpha = det([X(2)-X(1) , X(3)-X(1); Y(2)-Y(1), Y(3)-Y(1)]);
    for j = 1 : 3
        % Pour chaque sommet du triangle
        % Triangles(i,j) : Indice du jeme sommet du triangle i
        b(Triangles(i,j))=b(Triangles(i,j))+(alpha/6)* f([xg,yg]);
    end
end

for i = 1:size(coor,1)
    if (~isequal(ismember(diric,i),zeros(length(diric),1)))
            % Sommet dans diric
            for k = 1:size(A,1)
                b(i)=b(i)-A(i,k)*u_d([coor(i,1), coor(i,2)]);
            end
    end
end


end
    
