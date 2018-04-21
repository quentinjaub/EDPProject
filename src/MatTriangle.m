function [MTA] = MatTriangle(X,Y)

% Construction de la matrice de raideur A
% A(i,j) = Integrale sur omega de grad(eta(i))'*grad(eta(j)) dx
% eta_k = Fonction de base des éléments finis
% Pour le triangle, eta_j(xk,yk) = kronecker(j,k)

MTA= zeros(3,3);
% Calcul de alpha
alpha = det([X(2)-X(1) , X(3)-X(1); Y(2)-Y(1), Y(3)-Y(1)]);
% Gradient de eta
grad_eta = zeros(2,3);
grad_eta(:,1)=1/alpha * [Y(2)-Y(3);X(3)-X(2)];
grad_eta(:,2)=1/alpha * [Y(3)-Y(1);X(1)-X(3)];
grad_eta(:,3)=1/alpha * [Y(1)-Y(2);X(2)-X(1)];

% MTA(i,j) +-= (alpha/2)*grad_eta(:,i)'*grad_eta(:,j)
for i = 1:3
  for j =1:3
      MTA(i,j) = (alpha/2)*grad_eta(:,i)'*grad_eta(:,j);
  end
end