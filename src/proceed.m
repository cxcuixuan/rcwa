% warning off;
init; 
wavevector;
grating;
calLayer;

Q0 = [Kx*Ky , I-Kx^2 ; Ky*Ky-I , -Ky*Kx];
lamb0 = [diag(1i*Kz0) ; diag(1i*Kz0)];
invlamb0 = diag(1./lamb0);
V0 = Q0*invlamb0;

Qr = [Kx*Ky , diag(diag(n0^2-Kx^2)) ; diag(diag(Ky*Ky-n0^2)) , -Ky*Kx];
lamr = [diag(-1i*KzR) ; diag(-1i*KzR)];
invlamr = diag(1./lamr);
Vr = Qr*invlamr ;    % the reflection area
% A = W+V_h\V ; B = W - V_h\V ;
% sR = [-A\B 2*inv(A) ; 0.5*(A-B/A*B) B/A];
Ar = W + V0\Vr ; Br = W - V0\Vr ;

S11_r = -Ar\Br;
S12_r = 2*inv(Ar);
S21_r = 0.5*(Ar-Br/Ar*Br);
S22_r = Br/Ar;

% upd_smatrix;

for i = 1:layerNum ;
    if length(eval(['epr_' num2str(i)]))>1
        A = eval(['epr_' num2str(i)]) ;  % input the permittivity matrix to convmat.m
        convmat;
        Epr = C ;  % output the convolution matrix of the permittivity from convmat.m
        A = eval(['miu_' num2str(i)]) ;  % input the permeability matrix to convmat.m
        convmat;
        Miu = C ;  % output the convolution matrix of the permeability from convmat.m
        Thickness = thickness(i);
        omega2;
    else
        Thickness =  thickness(i);
        Kz = diag(conj(sqrt(eval(['epr_' num2str(i)])*eval(['epr_' num2str(i)])-diag(Kx.^2+Ky.^2))));
        P_M = full([Kx/eval(['epr_' num2str(i)])*Ky , I-Kx/eval(['epr_' num2str(i)])*Kx ; Ky/eval(['epr_' num2str(i)])*Ky-I , -Ky/eval(['epr_' num2str(i)])*Kx ]);
        Q_M = [Kx*Ky , diag(diag(eval(['epr_' num2str(i)])-Kx^2)) ; diag(diag(Ky*Ky-eval(['epr_' num2str(i)]))) , -Ky*Kx];
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
% 
Qt = [Kx*Ky , diag(diag(nT^2-Kx^2)) ; diag(diag(Ky*Ky-nT^2)) , -Ky*Kx];
lamt = [diag(1i*KzT) ; diag(1i*KzT)];
invlamt = diag(1./lamt);
Vt = Qt*invlamt ;    
% 
At = W+V0\Vt;
Bt = W-V0\Vt;
% 
% S11_d = Bt/At;
% S12_d = 0.5*(At-Bt/At*Bt);
% S21_d = 2*inv(At);
% S22_d = -At\Bt;
sT = [Bt/At,0.5*(At-Bt/At*Bt);2*inv(At),-At\Bt];
s = redcross(sG,sT);

k=[kiX;kiY;kiZ];
k=k/sqrt((k'*k));
if theta == 0
    aTE = [0;1;0];
else
   aTE = cross(k,[0;0;-1]);
   aTE = aTE/sqrt(aTE'*aTE);
end
aTM = cross(aTE,k);
aTM = aTM/sqrt(aTM'*aTM);
pInc = pTE*aTE + pTM*aTM;

eSrc = [pInc(1)*delta;pInc(2)*delta];
eRef = get_s(s,11)*eSrc;
eTrn = get_s(s,21)*eSrc;

rx = eRef(1:length(eRef)/2); ry = eRef(length(eRef)/2+1:length(eRef));
rz = -KzR\(Kx*rx+Ky*ry) ; 
r = real(-KzR/kiZ)*(abs(rx).^2+abs(ry).^2+abs(rz).^2);

tx = eTrn(1:length(eRef)/2); ty = eTrn(length(eRef)/2+1:length(eRef));
tz = -KzT\(Kx*tx+Ky*ty);
t = real(miuR*KzT/(miuT*kiZ))*(abs(tx).^2+abs(ty).^2+abs(tz).^2);

R=0;T=0;
for count = 1:length(t)
    R = R+r(count); 
    T = T+t(count);
end


% upd_smatrix;
% 
% r = Wr*S11_g*c_src;    
% t = Wt*S21_g*c_src;   % reflection and transmission in the x y modes
% t_r;
