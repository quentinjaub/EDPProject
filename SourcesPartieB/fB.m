function VolumeForce = fB(x,t)
% 
% Code de la fonction f apparaissant dans l'EDP parabolique (au sens physique,
% il s'agit d'une force volumique). Ce code est fait pour etre appele sur un
% ou plusieurs points.
%
% Entrees :
%	X : matrice de points en lesquels fB doit etre calculee.
%	Chaque ligne represente un point 2D; X a donc necessairement deux
%	colonnes.
%	T : instant en lequel la force est calculee (reel positif).
%
% Sortie :
%	VolumeForce : vecteur colonne des valeurs de fB en les points definis
%	par X. Si X contient N lignes, f est un vecteur de taille N*1 contenant
%	les valeurs calculees a l'instant T.
%
% Source : J. Alberty, C. Carstensen and S. A. Funken  (1999)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exemple choisi : f est la fonction constante egale a 0
VolumeForce = zeros(size(x,1),1);
%
