miuR = 1 ; miuT = 1;
epsR = n0^2 ; epsT = nT^2;
kx = zeros(1,orderNum(1)); ky = zeros(1,orderNum(2)); % construct the kx, ky vector frame
W = eye(2*orderNum(1)*orderNum(2));
I = eye(orderNum(1)*orderNum(2));
count = 1 ;
p = -(orderNum(1)-1)/2:(orderNum(1)-1)/2;
q = -(orderNum(2)-1)/2:(orderNum(2)-1)/2;
Np = orderNum(1) ; Nq = orderNum(2);

delta = zeros(orderNum(1)*orderNum(2),1);
delta((length(delta)+1)/2) = 1 ;

% eInc = eInc/sqrt(eInc'*eInc);
% cInc = [eInc(1);eInc(2)];