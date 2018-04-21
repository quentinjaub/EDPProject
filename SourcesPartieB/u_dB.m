function DirichletBoundaryValue = u_dB(x,t)
%
% Fonction codant la valeur de la solution imposee sur la frontiere
% de Dirichlet. Ce code est fait pour etre appele sur un ou plusieurs
% points.
%
% Entrees :
%       X : matrice de points en lesquels f doit etre calculee.
%       Chaque ligne represente un point 2D; X a donc necessairement deux
%       colonnes.
%	T : instant en lequel la force est calculee (reel positif).
%
% Sortie :
%       DirichletBoundaryValue : vecteur colonne des valeurs de u_dB en les 
%	points definis par X. Si X contient N lignes, DirichletBoundaryValue 
%	est un vecteur de taille N*1.
%
% Source : J. Alberty, C. Carstensen and S. A. Funken  (1999)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exemple de reference : on impose la valeur 0 sur les deux cotes adjacents, la
% valeur 1 sur les deux autres
DirichletBoundaryValue =  zeros(size(x,1),1);
DirichletBoundaryValue(find(x(:,1)==0)) = 1;
DirichletBoundaryValue(find(x(:,2)==1)) = 1;
%
