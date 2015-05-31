S11_g = zeros(length(W)) ; S12_g = W; 
S21_g = S12_g ; S22_g = S11_g ;
for i = 1:layerNum ;
    if length(eval(['epr_' num2str(i)]))>1
        Epr = EprL(:,:,i) ;  % output the convolution matrix of the permittivity from convmat.m
        Miu = eye(Np*Nq) ;  % output the convolution matrix of the permeability from convmat.m
        Thickness = thickness(i);
        omega2;
    else
        Thickness =  thickness(i);
        Epr = EprL(1,1,i);
        Kz = diag(conj(sqrt(Epr*Epr-diag(Kx.^2+Ky.^2))));
        P_M = full([Kx/Epr*Ky , I-Kx/Epr*Kx ; Ky/Epr*Ky-I , -Ky/Epr*Kx ]);
        Q_M = [Kx*Ky , diag(diag(Epr-Kx^2)) ; diag(diag(Ky*Ky-Epr)) , -Ky*Kx];
%         lam = [diag(1i*Kz) ; diag(1i*Kz)];
%         invlam = diag(1./lam);
%         V_M = Q_M*invlam ;
%         X_M = diag(exp(-lam*k0*Thickness));
%         A_layer = W + V_M\V0 ;
%         B_layer = W - V_M\V0 ;
        OMEGA2 = P_M*Q_M;
        [W_M,lam] = eig(OMEGA2); % the eigen vector and eigrn-value of the layer 
        lam = sqrt(lam);
        V_M = Q_M*W_M/lam ; 
        X_M = diag(exp(diag(-lam*k0*Thickness)));  % Thickness is the layer thickness
        A_layer = inv(W_M) + V_M\V0 ;
        B_layer = inv(W_M) - V_M\V0 ;
        S11_d = (A_layer - X_M*B_layer/A_layer*X_M*B_layer)\(X_M*B_layer/A_layer*X_M*A_layer-B_layer);
        S12_d = (A_layer - X_M*B_layer/A_layer*X_M*B_layer)\X_M*(A_layer-B_layer/A_layer*B_layer);
        S21_d = S12_d; S22_d = S11_d ; % calculate the scattering matrix
        upd_smatrix;
    end
end
sG = redcross([S11_r,S12_r;S21_r,S22_r],[S11_g,S12_g;S21_g,S22_g]);