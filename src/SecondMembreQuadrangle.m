% Calcul du second membre
function [b] = SecondMembreQuadrangle(coor, elements4,neumann,Triangles,diric,A)


[nt,~] = size(elements4);
b=zeros(size(coor,1),1);
for i = 1 : nt
    X=coor(elements4(i,:),1);
    Y=coor(elements4(i,:),2);
    xg=sum(X)/4;
    yg=sum(Y)/4;
    alpha=(X(2)-X(1))*(Y(4)-Y(1))-(X(4)-X(1))*(Y(2)-Y(1));
    for j = 1 : 4
        % Pour chaque sommet du quadrangle
        % elements4(i,j) : Indice du jeme sommet du quadrangle i
        b(elements4(i,j))=b(elements4(i,j))+(alpha/4)* f([xg,yg]);
    end
end

[n3,~]=size(Triangles);
for i = 1 : n3
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

%%%%%%%%%%%% CONDITIONS AUX LIMITES %%%%%%%%%%%%%%%%%%%%%%%%%%
% Conditions de dirichlet
if(~isempty(diric))
    for i = 1:size(coor,1)
        if (~isequal(ismember(diric,i),zeros(length(diric),1)))
                % Sommet dans diric
                for k = 1:size(A,1)
                    b(i)=b(i)-A(i,k)*u_d([coor(i,1), coor(i,2)]);
                end
        end
    end
end

        %On regarde si ce sommet se trouve dans neumann
if(~isempty(neumann))
    for i = 1:size(coor,1)
        if (~isequal(ismember(neumann(:,1),i),zeros(length(neumann(:,1)),1)))
            % Point dans neumann
            %-> On cherche la ligne ou se trouve le point
            ind=find(ismember(neumann(1,:),i)~=0,1);
            xm=sum(coor(neumann(ind,:),1))/2;
            ym=sum(coor(neumann(ind,:),2))/2;
            b(i)=b(i)+(sqrt(xm^2+ym^2)/2)*g([xm,ym]);
        end
    end
end
end


    