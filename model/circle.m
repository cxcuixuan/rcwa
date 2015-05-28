% Part I Construct a circle unit structure
miu_1 = ones(1000);
epr_1 = 9*ones(1000);
Nx = 512 ; Ny = round(Nx*Lambda(2)/Lambda(1));
for m=1:1000
  for n=1:1000
    if (m-500)^2 + (n-500)^2 < 350^2
     epr_1(m,n) = 1;
    end
  end
end
thickness = 0.5 ;

% imagesc(epr); colorbar;  % image the epsilon distribution

 % Part II Construct the Bloch wave vector beta
 % This part has no use in RCWA
 
%  a=0:0.01:3.14;
% 
%  b=zeros(1,length(a));
%  beta=[a;b];   % (0,0) -> (3.14,0)
%  b=0.01:0.01:3.14;
%  a=ones(1,length(b))*3.14;
%  beta=[beta,[a;b]];  % (3.14,0) -> (3.14,3.14)
%  a=3.13:-0.01:0;
%  beta=[beta,[a;a]];  % (3.14,3.14) -> (0,0)
