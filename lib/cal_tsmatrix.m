Qt = [Kx*Ky , diag(diag(nT^2-Kx^2)) ; diag(diag(Ky*Ky-nT^2)) , -Ky*Kx];
lamt = [diag(1i*KzT) ; diag(1i*KzT)];
invlamt = diag(1./lamt);
Vt = Qt*invlamt ;    

At = W+V0\Vt;
Bt = W-V0\Vt;

sT = [Bt/At,0.5*(At-Bt/At*Bt);2*inv(At),-At\Bt];
s = redcross(sG,sT);