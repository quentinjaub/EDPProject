function [ MBT ] = ComputeMBT(X,Y)

alpha=det([X(2)-X(1), X(3)-X(1) ; Y(2)-Y(1), Y(3)-Y(1)]);

MBT=(alpha/24)*(ones(3,3)+eye(3,3));

end

