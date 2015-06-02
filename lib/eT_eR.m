k=[kiX;kiY;kiZ];
k=k/sqrt((k'*k));
if theta == 0
    aTE = [0;1;0];
else
   aTE = cross(k,[0;0;1]);
   aTE = aTE/sqrt(aTE'*aTE);
end
aTM = cross(aTE,k);
aTM = aTM/sqrt(aTM'*aTM);
pTE = pte/sqrt((abs(pte).^2+abs(ptm).^2));
pTM = ptm/sqrt((abs(pte).^2+abs(ptm).^2));
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