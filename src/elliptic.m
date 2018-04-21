

k=input('Maillage carre ou maillage fourni ? ( 0 ou 1) :');

if(k==0)
    n=input( ' n : ');
    % % Calcul du maillage
     [coor,Triangles,elements4,diric,neum] = maillage_carre(n);
     fv=@(x) f(x);

    % % Calcul de A
    A = raideur_quadrangle( coor, elements4,Triangles );
    b = SecondMembreQuadrangle(coor, elements4,neum,Triangles,diric,A);

    u=zeros(n*n,1);
    ind=setdiff(1:(n*n), diric);
    u(ind)=A(ind,ind)\b(ind);
    % Calcul de la solution
    %u=A\b;
    show(Triangles,elements4,coor,u)
    
else
    
%%%%%%%%%%%%%%%%%%% QUADRANGLES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    diric=load('dirichlet.dat');
    elements4=load('elements4.dat');
    neum=load('neumann.dat');
    coor=load('coordinates.dat');
    Triangles=load('elements3.dat');

    AQ = raideur_quadrangle( coor, elements4,Triangles )
    b = SecondMembreQuadrangle(coor, elements4,neum,Triangles,diric,AQ)
    n=size(coor,1);
    u=zeros(n,1);
    ind=setdiff(1:n, diric);
    u(ind)=AQ(ind,ind)\b(ind);
    show(Triangles,elements4,coor,u)
end


