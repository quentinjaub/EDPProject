n=input( ' nmax > 5 : ');
fv=@(x) f(x);
nz = zeros(n,1);

for i = 3:n
  % % Calcul du maillage
  [coor,Triangles,elements4,diric,neum] = maillage_carre(i);
  i
  % % Calcul de A
  A = raideur_quadrangle( coor, elements4,Triangles );
  R=chol(A,'lower');
  nz(i) = length(nonzeros(R));
  
end
figure(1)
spy(A)
%Courbe nz = f(n)
figure(2)
plot(1:n,nz,'r')
title('Evolution du nombre d éléments  non nuls de A')