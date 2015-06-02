
P_M = full([Kx/Epr*Ky , Miu-Kx/Epr*Kx ; Ky/Epr*Ky-Miu , -Ky/Epr*Kx ]);
Q_M = full([Kx/Miu*Ky , Epr-Kx/Miu*Kx ; Ky/Miu*Ky-Epr , -Ky/Miu*Kx ]);
% a/b*c = a*inv(b)*c the left side fomular caculate faster in matlab
OMEGA2 = P_M*Q_M;
[W_M , lam] = eig(OMEGA2); % the eigen vector and eigrn-value of the layer 
lam = sqrt(lam);
V_M = Q_M*W_M/lam ; 
X_M = diag(exp(diag(-lam*k0*Thickness)));  % Thickness is the layer thickness
A_layer = W_M\W + V_M\V0 ;
B_layer = W_M\W - V_M\V0 ;
S11_d = (A_layer - X_M*B_layer/A_layer*X_M*B_layer)\(X_M*B_layer/A_layer*X_M*A_layer-B_layer);
S12_d = (A_layer - X_M*B_layer/A_layer*X_M*B_layer)\X_M*(A_layer-B_layer/A_layer*B_layer);
S21_d = S12_d; S22_d = S11_d ; % calculate the scattering matrix
upd_smatrix;