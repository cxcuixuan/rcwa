k0 = 2*pi/lambda;
kiX = n0*sin(theta*pi/180)*cos(phi*pi/180);  % n0 is the index in reflection region
kiY = n0*sin(theta*pi/180)*sin(phi*pi/180); 
kiZ = n0*cos(theta*pi/180);
Nkx = -(orderNum(1)-1)/2:(orderNum(1)-1)/2;
Nky = -(orderNum(2)-1)/2:(orderNum(2)-1)/2;
kx = kiX - Nkx*2*pi/(k0*Lambda(1));
ky = kiY - Nky*2*pi/(k0*Lambda(2));
% for n = 1:orderNum(2)
%     for m = 1:orderNum(1)
%        KzR(count) = -conj(sqrt(n0^2-kx(m)^2-ky(n)^2)); % kz in reflection region
%        KzT(count) = conj(sqrt(nT^2-kx(m)^2-ky(n)^2)); % kz in transmission region. conj is for the exp(-jkz) form
%        Kz0(count) = conj(sqrt(1-kx(m)^2-ky(n)^2));    % the kz in gap layer
%        count = count +1;
%     end
% end
% count = 1 ;
% KzR = diag(KzR); % order: move x first [-1,-1] --> [0,-1]
% KzT = diag(KzT);
% Kz0 = diag(Kz0);
[Ky,Kx] = meshgrid(ky,kx);
Kx = diag(sparse(Kx(:))) ; Ky = diag(sparse(Ky(:))) ; 
KzR = -conj(sqrt(n0^2*I-Kx.^2-Ky.^2));
KzT = conj(sqrt(nT^2*I-Kx.^2-Ky.^2));
Kz0 = conj(sqrt(I-Kx.^2-Ky.^2));