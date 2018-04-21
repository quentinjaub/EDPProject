function Stress = gB(x,t)
%
% Code de la fonction apparaissant dans la condition de Neumann de l'EDP
% elliptique (on parle de tension en physique), qui determine la valeur de
% la derivee normale de la solution sur la frontiere de Neumann. Ce code est 
% fait pour etre appele sur un ou plusieurs points.
%
% Entrees :
%       X : matrice de points en lesquels g doit etre calculee.
%       Chaque ligne represente un point 2D; X a donc necessairement deux
%       colonnes.
%	T : instant en lequel la force est calculee (reel positif).
%
% Sortie :
%       Stress : vecteur colonne des valeurs de g en les points definis par X,
%	a l'instant T. 
%	Si X contient N lignes, Stress est un vecteur de taille N*1.
%
% Source : J. Alberty, C. Carstensen and S. A. Funken  (1999)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exemple de reference : g est la fonction constante egale a 0
Stress = zeros(size(x,1),1);
