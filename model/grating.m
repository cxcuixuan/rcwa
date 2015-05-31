Nx = 256 ; Ny = round(Nx*Lambda(2)/Lambda(1));
miu_1 = ones(Nx,Ny);
epr_1 = ones(Nx,Ny);
for n=1:Nx/2
    epr_1(n,:) = 11.9;
end
epr_2 = 11.9; miu_2 = 1;
thickness = [0.685 0.45] ;