Q0 = [Kx*Ky , I-Kx^2 ; Ky*Ky-I , -Ky*Kx];
lamb0 = [diag(1i*Kz0) ; diag(1i*Kz0)];
invlamb0 = diag(1./lamb0);
V0 = Q0*invlamb0;

Qr = [Kx*Ky , diag(diag(n0^2-Kx^2)) ; diag(diag(Ky*Ky-n0^2)) , -Ky*Kx];
lamr = [diag(-1i*KzR) ; diag(-1i*KzR)];
invlamr = diag(1./lamr);
Vr = Qr*invlamr ;    % the reflection area
Ar = W + V0\Vr ; Br = W - V0\Vr ;

S11_r = -Ar\Br;
S12_r = 2*inv(Ar);
S21_r = 0.5*(Ar-Br/Ar*Br);
S22_r = Br/Ar;