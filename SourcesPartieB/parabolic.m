  
  close all;
  clear all;
  %Parametres
  eps=1;
  dt=0.01;
  t=0.01;
  T = 0.2;
  theta = 0.5;
  elements4=[];
  
  
  %% Calcul du maillage
  diric=load('dirichletB.dat');
  coor=load('coordinatesB.dat');
  neum=load('neumannB.dat');
  Triangles=load('elements3B.dat');
  n=size(coor,1);
  %% Calcul des matrices-vecteurs
  A = raideur_parab( coor, elements4 ,Triangles);
  b = SecondMembreParabolique(coor, elements4,Triangles,neum,diric,A,t);
  B = AssemblageB( coor, Triangles );
  u=zeros(n,1);
  ind=setdiff(1:n, diric); % Recupere les indices de points
                              % qui ne sont pas dans diric
  old_u=u;
 
  for i = 1:T/dt
    old_b=zeros(n,1);
    b(ind) = theta*dt*b(ind)+(1-theta)*dt*old_b(ind)+B(ind,ind)*old_u(ind)-eps*(1-theta)*dt*A(ind,ind)*old_u(ind);
    old_u=u;
    u(ind) = ((eps*theta*A(ind,ind)+B(ind,ind))\(theta*dt*b(ind) + (1-theta)*dt*old_b(ind) + B(ind,ind)*old_u(ind) - eps*(1-theta)*dt*A(ind,ind)*old_u(ind)));
  end
  show(Triangles,elements4,coor,u)
  