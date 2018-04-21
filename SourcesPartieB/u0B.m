function InitialTimeValue = u0B(x)
%
% Fonction codant la valeur de la solution au temps initial t=0. Ce code est 
% fait pour etre appele sur un ou plusieurs points.
%
% Entrees :
%       X : matrice de points en lesquels f doit etre calculee.
%       Chaque ligne represente un point 2D; X a donc necessairement deux
%       colonnes.
%
% Sortie :
%       InitialTimeValue : vecteur colonne des valeurs de u0B en les 
%	points definis par X. Si X contient N lignes, DirichletBoundaryValue 
%	est un vecteur de taille N*1.
%
% Source : J. Alberty, C. Carstensen and S. A. Funken  (1999)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exemple de reference : la solution est hulle lorsque t=0
InitialTimeValue =  zeros(size(x,1),1);
%
