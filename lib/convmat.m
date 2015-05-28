% Construct the Convolution Matrices for Materials
[Nx,Ny] = size(A);
A = fftshift(fftn(A))/(Nx*Ny);  % compute fourier coefficinets of A.
C=zeros(Np*Nq); % convolution matrix size
p0 = 1 + floor(Nx/2);  % fftshift move the zero-order harmonic to the center of the matrix
q0 = 1 + floor(Ny/2);  % these two lines used to get to the center of A
row = 1 ; col = 1 ; % initialize row and col

for rowq = 1:Nq 
    for rowp = 1:Np % scanning the row in the way of (-1, -1) (0, -1) ...
          for Q = 1:Nq % % scanning the col in the way of (-1, -1) (0, -1) ...
            for P = 1:Np
                C(row,col)=A(p0+p(rowp)-p(P),q0+q(rowq)-q(Q));  % get the A(p-p', q-q')
                col = col + 1;
            end
          end
        col = 1;
        row = row + 1; % move next step
    end
end
% imagesc(abs(C)); % image the matrix
