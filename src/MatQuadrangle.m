function [ MQA ] = MatQuadrangle( X,Y )

% X et Y : Coordonnées des sommets du quadrilatere

alpha=(X(2)-X(1))*(Y(4)-Y(1))-(X(4)-X(1))*(Y(2)-Y(1));

% Inverse de J'*J ( Symetrique )
det_Jt_t = ( (X(4)-X(1))^2 + (Y(4)-Y(1))^2 ) * ( (X(2)-X(1))^2 + (Y(2)-Y(1))^2 ) ;
det_Jt_t = det_Jt_t -((X(2)-X(1))*(X(4)-X(1))+(Y(2)-Y(1))*(Y(4)-Y(1)))*((X(2)-X(1))*(X(4)-X(1))+(Y(2)-Y(1))*(Y(4)-Y(1)));


inv_Jt_J=(1/(det_Jt_t)) * [ (X(4)-X(1))^2 + (Y(4)-Y(1))^2 ,-((X(2)-X(1))*(X(4)-X(1))+(Y(2)-Y(1))*(Y(4)-Y(1))) ;
                    -((X(2)-X(1))*(X(4)-X(1))+(Y(2)-Y(1))*(Y(4)-Y(1))), (X(2)-X(1))^2 + (Y(2)-Y(1))^2 ];

                
% Matrice associée à un quadrangle
% Calcul à la main
% Cette matrice est symetrique
MQA=zeros(4,4);
MQA(1,1) = (alpha/6)*(2*inv_Jt_J(1,1)+3*inv_Jt_J(2,1)+2*inv_Jt_J(2,2));
MQA(1,4) = (alpha/6)*(inv_Jt_J(1,1) -2*inv_Jt_J(2,2));
MQA(4,1)=MQA(1,4);
MQA(1,2) =(alpha/6)*( -2*inv_Jt_J(1,1) +inv_Jt_J(2,2) );
MQA(2,1)=MQA(1,2);
MQA(1,3)=(alpha/6)*( -inv_Jt_J(1,1)-3*inv_Jt_J(2,1)-inv_Jt_J(2,2) );
MQA(3,1)=MQA(1,3);
MQA(2,2) = (alpha/6)*(2*inv_Jt_J(1,1) -3*inv_Jt_J(1,2)+2*inv_Jt_J(2,2));
MQA(2,4) = (alpha/6)*(-inv_Jt_J(1,1)+3*inv_Jt_J(2,1)-inv_Jt_J(2,2));
MQA(4,2)=MQA(2,4);
MQA(2,3) = (alpha/6)*(inv_Jt_J(1,1)-2*inv_Jt_J(2,2));
MQA(3,2)=MQA(2,3);
MQA(3,3) = (alpha/6)*(2*inv_Jt_J(1,1)+3*inv_Jt_J(2,1)+2*inv_Jt_J(2,2));
MQA(3,4) = (alpha/6)*(-2*inv_Jt_J(1,1)+inv_Jt_J(2,2));
MQA(4,3)=MQA(3,4);
MQA(4,4) = (alpha/6)*(2*inv_Jt_J(1,1)-3*inv_Jt_J(2,1)+2*inv_Jt_J(2,2));

