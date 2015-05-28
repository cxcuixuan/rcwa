% Nx = 512 ; Ny = round(Nx*Lambda(2)/Lambda(1));
% miu_1 = ones(Nx,Ny);
% epr_1 = 6*ones(Nx,Ny);
% h = .5*sqrt(3)*Ny*.8;
% for n=1:Ny
%     if abs(n-Ny/2)<h/2
%       for m=1:Nx
%          if abs(m-Nx/2)<.4*Ny-(n-Ny/2+h/2)/sqrt(3)
%             epr_1(m,n) = 2;
%          end
%       end
%     end
% end
thickness = [0.03] ;
epr_1 = -28-1i; miu_1 = 1;