EprL = zeros(Np*Nq,Np*Nq,layerNum);
for i = 1:layerNum ;
    if length(eval(['epr_' num2str(i)]))>1
        A = eval(['epr_' num2str(i)]) ;  % output the convolution matrix of the permittivity from convmat.m
        convmat;
        EprL(:,:,i) = C ;
    else
        EprL(:,:,i) = eval(['epr_' num2str(i)]) + EprL(:,:,i); % for slab layer
    end
end